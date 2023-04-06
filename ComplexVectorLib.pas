unit ComplexVectorLib;

interface

uses crt,ComplexLib,vect;

const
  nCV = 3;

type
  Cvector = array[1..n] of Complex;

procedure inputCV(var x: Cvector);
procedure outputCV(var x: Cvector);
procedure wait;
procedure menuComplVect;

implementation

procedure inputCV(var x: Cvector);
begin
  var i: integer;
  writeln('введите координаты вектора ');
  for i := 1 to nCV do
    Input(x[i]);
  writeln;
  write('ваш вектор: ( ');
  for i := 1 to nCV do begin
    output(x[i]);write( '   ');
    end;
  write(')');
  writeln();
end;

procedure outputCV(var x: Cvector);
begin
  var i: integer;
  write('ваш вектор: ( ');
  for i := 1 to nCV do begin
    output(x[i]); write( '   ');
    end;
  write(')');
  writeln();
end;

procedure addCV(a, b: Cvector; var c: Cvector);
begin
  var i: integer;
  for i := 1 to nCV do
    Add(a[i],b[i],c[i]);
end;



procedure ProdCV(a, b: Cvector; var c: Cvector);//векторное произведение   
 var a1,a2,a3,a4,a5,a6:Complex;
begin
  Mult(a[2],b[3],a1); Mult(a[3],b[2],a2); Mult(a[3],b[1],a3); Mult(a[1],b[3],a4); Mult(a[1],b[2],a5);Mult(a[2],b[1],a6);
  prod(-1,a2,a2);prod(-1,a4,a4);prod(-1,a6,a6);
  add(a1,a2,c[1]);
  add(a3,a4,c[2]);
  add(a5,a6,c[3]);
end;

function scalProdCV(a, b: Cvector): Complex;//скалярное произведение
var
  s: complex; i: integer;
begin
  for i := 1 to nCV do
   mult(a[i],b[i],a[i]);
   add(s,a[i],s);
  scalProdCV := s;
end;

function mixProdCV(a, b, c: Cvector): Complex;//смешаное
var
  x: Cvector;
begin
  ProdCV(b, c, x);
  mixProdCV := scalProdCV(a, x);
end;

//function modulVectCV(a: Cvector): real;
//begin
   // modulVect := sqrt(sqr(a[1])+sqr(a[2])+sqr(a[3]));
//end;

var
  A, B: Cvector;
  C: Cvector;
  R: Complex;

procedure wait;
begin
  repeat
  until keyPressed;
  while keyPressed do
    readKey;
end;

procedure menuComplVect;
var
  Mode: integer;
  OK: boolean;
begin
  OK := true;
  while OK do
  begin
    ClrScr;
    writeln('операции с комплексными векторами');
    writeln('укажите режим');
     writeln('1 - сложение');
    writeln('2 - векторное произведение');
    writeln('3 - скалярное произведение');
    writeln('4 - смешанное произведение');
    //writeln('5 - модуль');
    writeln('0 - назад');
    writeln('режим: ');
    readln(Mode);
    clearline;
    clrscr;
    case Mode of
      0: OK := false;
      1: 
        begin
          inputCV(A);
          writeln();
          inputCV(B);
          writeln();
          addCV(A, B, C);
          write('сумма: '); outputCV(C);
          wait;
        end;
      2:
        begin
          inputCV(A);
          writeln();
          inputCV(B);
          writeln();
          ProdCV(A, B, C);
          write('векторное произведение: '); outputCV(C);
          wait;
        end;
      3:
        begin
          inputCV(A);
          writeln();
          inputCV(B);
          writeln();
          R := scalProdCV(A, B);
          write('скалярное произведение: '); output(R);
          wait;
        end;
      4:
        begin
          inputCV(A);
          writeln();
          inputCV(B);
          writeln();
          inputCV(C);
          writeln();
          R := mixProdCV(A, B, C);
          write('смешанное произведение: '); output(R);
          wait;
        end;
    else begin
        writeln('ошибка. повторите ввод.');
        delay(1000);
      end;
    end;
  end;
end;

begin

End. 