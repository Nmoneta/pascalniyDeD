unit vect;

interface

uses crt;

const
  n = 3;

type
  vector = array[1..n] of real;

procedure inputVect(var x: vector);
procedure outputVect(var x: vector);
procedure inputReal(var x: real);
procedure outputReal(var x: real);
procedure wait;
procedure menuVect;

implementation

procedure inputVect(var x: vector);
begin
  var i: integer;
  writeln('введите координаты вектора ');
  for i := 1 to n do
    read(x[i]);
  readln;
  write('ваш вектор: ( ');
  for i := 1 to n do
    write( x[i], ' ');
  write(')');
  writeln();
end;

procedure outputVect(var x: vector);
begin
  var i: integer;
  write('ваш вектор: ( ');
  for i := 1 to n do
    write( x[i], ' ');
  write(')');
  writeln();
end;

procedure inputReal(var x: real);
begin
  write('ведите скаляр: ');
  read(x);
end;

procedure outputReal(var x: real);
begin
  write(x);
end;

procedure addVect(a, b: vector; var c: vector);
begin
  var i: integer;
  for i := 1 to n do
    c[i] := a[i] + b[i];
end;

procedure subVect(a, b: vector; var c: vector);
begin
  var i: integer;
  for i := 1 to n do
    c[i] := a[i] - b[i];
end;

procedure multVect(a, b: vector; var c: vector);
begin
  var i: integer;
  for i := 1 to n do
    c[i] := a[i] * b[i];
end;

procedure divisVect(a, b: vector; var c: vector);
begin
  var i: integer;
  for i := 1 to n do
    c[i] := a[i] / b[i];
end;

procedure skalVect(a: vector; b: real; var c: vector);
begin
  var i: integer;
  for i := 1 to n do
    c[i] := a[i] * b;
end;

procedure vectProd(a, b: vector; var c: vector);
begin
  c[1] := a[2] * b[3] - a[3] * b[2];
  c[2] := a[3] * b[1] - a[1] * b[3];
  c[3] := a[1] * b[2] - a[2] * b[1];
end;

function scalProd(a, b: vector): real;
var
  s: real; i: integer;
begin
  for i := 1 to n do
    s := s + a[i] * b[i];
  scalProd := s;
end;

function mixProd(a, b, c: vector): real;
var
  x: vector;
begin
  vectProd(b, c, x);
  mixProd := scalProd(a, x);
end;

function modulVect(a: vector): real;
begin
  modulVect := sqrt(sqr(a[1])+sqr(a[2])+sqr(a[3]));
end;

var
  A, B: vector;
  C: vector;
  R: real;

procedure wait;
begin
  repeat
  until keyPressed;
  while keyPressed do
    readKey;
end;

procedure menuVect;
var
  Mode: integer;
  OK: boolean;
begin
  OK := true;
  while OK do
  begin
    ClrScr;
    writeln('операции с векторами');
    writeln('укажите режим');
     writeln('1 - сложение');
    writeln('2 - разность');
    writeln('3 - скаляр ');
    writeln('4 - векторное произведение');
    writeln('5 - скалярное произведение');
    writeln('6 - смешанное произведение');
    writeln('7 - модуль');
    writeln('0 - назад');
    writeln('режим: ');
    readln(Mode);
    clearline;
    clrscr;
    case Mode of
      0: OK := false;
      1: 
        begin
          inputVect(A);
          writeln();
          inputVect(B);
          writeln();
          addVect(A, B, C);
          write('сумма: '); outputVect(C);
          wait;
        end;
      2:
        begin
          inputVect(A);
          writeln();
          inputVect(B);
          writeln();
          subVect(A, B, C);
          write('разность: '); outputVect(C);
          wait;
        end;
      3:
        begin
          inputVect(A);
          writeln();
          readln(R);
          writeln();
          skalVect(A, R, C);
          write('скаляр: '); outputVect(C);
          wait;
        end;
      4:
        begin
          inputVect(A);
          writeln();
          inputVect(B);
          writeln();
          vectProd(A, B, C);
          write('векторное произведение: '); outputVect(C);
          wait;
        end;
      5:
        begin
          inputVect(A);
          writeln();
          inputVect(B);
          writeln();
          R := scalProd(A, B);
          write('скалярное произведение: '); outputReal(R);
          wait;
        end;
      6:
        begin
          inputVect(A);
          writeln();
          inputVect(B);
          writeln();
          inputVect(C);
          writeln();
          R := mixProd(A, B, C);
          write('смешанное произведение: '); outputReal(R);
          wait;
        end;
      7:
        begin
          inputVect(A);
          writeln();
          R :=  modulVect(A);
          write('модуль: '); outputReal(R);
          wait;
        end;
    else begin
        GoToXY(30, 20);
        writeln('ошибка. повторите ввод.');
        delay(1000);
      end;
    end;
  end;
end;

begin

End. 