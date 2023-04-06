unit MatrixLib;

Interface
uses ComplexLib,crt;

const nMatr=2;
type Matrix= array[1..nMatr,1..nMatr] of Complex;
var a,b:Matrix;
i,j:integer;
norm,alpha: real;

procedure InputMatrix(var a:Matrix);
procedure OutputMatrix(var a:Matrix);
procedure AddMatrix(a,b:Matrix;var c:Matrix);
procedure MultMatrix(a,b:Matrix;var c:Matrix);
procedure ProdMatrix(a:Matrix; alpha:real; Var b:Matrix);
function NormMatrix(a:Matrix):real;
procedure exp(a: Matrix; var c: Matrix);
procedure OneMatrix(var E:Matrix);
procedure ZeroMatrix(var E:Matrix);
procedure MatrixMenu;

implementation

procedure InputMatrix(var a:Matrix);
var i,j:integer;
begin
  for i:=1 to nMatr do
    for j:=1 to nMatr do Input(a[i,j]);
end;

procedure OutputMatrix(var a:Matrix);
var i,j:integer;

begin
  ClrScr;
  writeln('Результат:');
  for i:=1 to nMatr do
  for j:=1 to nMatr do begin
   GoToXY(i*20,j*2);
  Output(a[i,j]);
  end
end;

function NormMatrix(a: Matrix): real;
var
  i, j: integer;
  s, z: real;
begin
  z := 0;
  for i := 1 to nMatr do
  begin
    s := 0;
    for j := 1 to nMatr do
      s := s + module(a[i, j]);
    if s > z then z := s;
  end;
  NormMatrix := z;
end;

procedure AddMatrix(a,b:Matrix;var c:Matrix);
var i,j: integer;
begin
for i:=1 to nMatr do
  for j:=1 to nMatr do Add(a[i,j],b[i,j],c[i,j]);
end;

procedure MultMatrix(a,b: Matrix; var c: Matrix);
var k,i,j: integer; s,p: Complex;
begin
  for i:= 1 to nMatr do
    for j:=1 to nMatr do
    begin
      Zero(s);
      for k:=1 to nMatr do
      begin
        Mult(a[i,k],b[k,j],p);
        Add(s,p,s);
      end;
      c[i,j]:=s;
    end;
end;

procedure exp(a: Matrix; var c: Matrix);
const
  eps = 0.00000001;
var
  p: Matrix;
  k: integer;
begin
  k := 0;
  oneMatrix(p);
  oneMatrix(c);
  while NormMatrix(p) >= eps do
  begin
    k := k + 1;
    MultMatrix(p, a, p);
    prodMatrix(p, 1 / k, p);
    AddMatrix(c, p, c);
  end;
end;

procedure ProdMatrix(a:Matrix; alpha:real; Var b:Matrix);
var i,j:integer;
begin
  OneMatrix(b);
  for i:=1 to nMatr do 
    for j:=1 to nMatr do Prod(alpha,a[i,j],b[i,j]);
end;

procedure OneMatrix(var E:Matrix);
  var i,j:integer;
  begin
    for i:=1 to nMatr do
      for j:=1 to nMatr do One(E[i,j]);
  end;
  
procedure ZeroMatrix(var E:Matrix);
  var i,j:integer;
  begin
    for i:=1 to nMatr do
      for j:=1 to nMatr do Zero(E[i,j]);
  end;
  
  procedure Wait;
begin
  repeat until keyPressed;;
  while keyPressed do ReadKey;
end;
  
 procedure  MatrixMenu;
 var Om:boolean;
 Mode: integer;
 u, v, w, z, p: Matrix;
  a, b, eps: real;
 begin
   Om := true;
  while Om do
  begin
    ClrScr;
    writeln('операции с комплексными матрицами');
    writeln('Введите число:');
    writeln('1 - сложение');
    writeln('2 - умножение');
    writeln('3 - умножение на число');
     writeln('4 - Норма матрицы');
     writeln('5 - Экспонента');
    writeln('0 - назад');
    writeln('режим: ');
    readln(Mode);
    clrscr;
 case Mode of
   1:begin
     writeln('Введите первую матрицу:');
     InputMatrix(u); writeln(' ');
     writeln('Введите вторую матрицу:');
     InputMatrix(v);writeln(' ');
     AddMatrix(u,v,w);
     OutputMatrix(w);
     Wait;
   end;
   2: begin
     writeln('Введите первую матрицу:');
     InputMatrix(u); writeln(' ');
     writeln('Введите вторую матрицу:');
     InputMatrix(v);
     MultMatrix(u,v,w);
     OutputMatrix(w);
     Wait;
   end;
   3: begin
     writeln('Введите первую матрицу:');
     InputMatrix(u); writeln(' ');
     writeln('Введите множитель');
     readln(alpha);
     ProdMatrix(u,alpha,w);
     OutputMatrix(w);
     Wait;
   end;
   4: begin
      writeln('Введите первую матрицу');
      inputMatrix(u); writeln(' ');
       writeln(' Норма вашей матрицы:');
       norm:=NormMatrix(u);
       writeln(norm);
       Wait;
   end;
   5: begin
      writeln('Введите первую матрицу');
      inputMatrix(u); writeln(' ');
      writeln('Экспонента:');
      exp(u,w);
      OutputMatrix(w);
      Wait;
   end;
   0: begin
     Om:=false;
   end;
   
 end;
 
 end;
 
end;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end.