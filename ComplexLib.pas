Unit ComplexLib;

Interface
uses Crt;
type Complex=record
  Re,Im:real;
end;

procedure Add(u, v: Complex; var w: Complex);
procedure Mult(u, v: complex; var w: complex);
procedure Zero(var z: Complex);
procedure One(var z: Complex);
procedure Inv(z: Complex; var w: Complex);
procedure Divis(u, v: Complex; var w: Complex);
procedure Prod(a: real; z: Complex; var w: Complex);
function Module(z: Complex): real;
procedure Output(z: complex);
procedure Input(var z: Complex);
procedure sin(a: complex; var z: complex);
procedure cos(a: complex; var z: complex);
procedure ComplexMenu;

implementation

procedure Output(z: complex);
begin
  write(z.Re :0 :2);
  if z.Im = 1 then write(' + ', 'i')
  else if z.Im = -1 then write(' - ', 'i')
  else if z.Im > 0 then write(' + ', z.Im :0 :2, 'i')
  else if z.Im < 0 then write(' - ', abs(z.Im) :0 :2, 'i');
end;

procedure Input(var z: Complex);
begin
  write('Действительная часть: '); readln(z.Re);
  write('Введите мнимую часть: '); readln(z.Im);
  write('Ваше число: '); 
  Output(z);
  writeln();
end;

procedure Add(u, v: Complex; var w: Complex);
begin
  w.Re := u.Re + v.Re;
  w.Im := u.Im + v.Im;
end;

procedure Mult(u, v: complex; var w: complex);
begin
  w.Re := u.Re * v.Re - u.Im * v.Im;
  w.im := u.Re * v.Im + u.Im * v.Re;
end;

procedure Zero(var z: Complex);
begin
  z.Re := 0; z.Im := 0;
end;

procedure One(var z: Complex);
begin
  z.Re := 1; z.Im := 0;
end;

procedure Inv(z: Complex; var w: Complex);
var
  q: real;
begin
  if(z.Im <> 0) and (z.Re <> 0) then//не равно <>
  begin
    q := sqr(z.Re) + sqr(z.Im);
    w.Re := z.Re / q;
    w.Im := -z.Im / q;
  end
  else Zero(w);
end;

procedure Divis(u, v: Complex; var w: Complex);
var
  z: Complex;
begin
  Inv(v, z);
  Mult(u, z, w);
end;

procedure Prod(a: real; z: Complex; var w: Complex);
begin
  w.Re := a * z.Re;
  w.Im := a * z.Im;
end;

function Module(z: Complex): real;
begin
  Module := sqrt(sqr(z.Re) + sqr(z.Im));
end;

procedure sin(a: complex; var z: complex);
const
  eps = 0.00000001;
var
  p, m: complex;
  k: integer;
begin
  k := 0; one(p); one(z);
  mult(a, p, p); mult(a, z, z); mult(a, a, m);
  while Module(p) >= eps do
  begin
    k := k + 1;
    mult(p, m, p);
    prod((-1)/(2*k+1)/(2*k),p,  p);
    add(z, p, z);
  end;
end;

procedure cos(a: complex; var z: complex);
const
  eps = 0.00000001;
var
  p, m: complex;
  k: integer;
begin
  k := 0; one(p); one(z);
  mult(a, p, p); mult(a, z, z); mult(a, a, m);
  while Module(p) >= eps do
  begin
    k := k + 1;
    mult(p, m, p);
    prod((-1)/(2*k-1)/(2*k),p,  p);
    add(z, p, z);
  end;
end;

  procedure Wait;
begin
  repeat until keyPressed;;
  while keyPressed do ReadKey;
end;



procedure ComplexMenu;
var
  Mode: integer;
  OK: boolean;
  u, v, w, z, p: Complex;
  a, b, eps: real;
begin
  OK := true;
  while OK do
  begin
    ClrScr;
    writeln('операции с комплексными числами');
    writeln('Вывберите число:');
    writeln('1)Сложение двух комлексных чисел');
    writeln('2)Умножение двух комплексных чисел');
    writeln('3)Деление двух комплексных чисел');
    writeln('4)Умножение на скаляр');
    writeln('5)Модуль');
    writeln('6)Синус');
    writeln('7)Косинус');
    writeln('0)Выход');
     writeln('режим: ');
     readln(Mode);
    clrscr;
    case Mode of
    0: OK := false;
    1: begin
    writeln('1е число');Input(u);writeln('2е число'); Input(v);
    Add(u, v, w);
    write('('); Output(u); write(') + ');
    write('('); Output(v); write(') = ');
    Output(w);
    writeln();
    Wait;
   end;
2: begin
    writeln('1е число');Input(u);writeln('2е число'); Input(v);
    Mult(u, v, w);
    write('('); Output(u); write(') * ');
    write('('); Output(v); write(') = ');
    Output(w);
    writeln();
    Wait;
   end;
3: begin
    writeln('1е число');Input(u); writeln('2е число');Input(v);
    Divis(u, v, w);
    write('('); Output(u); write(') / ');
    write('('); Output(v); write(') = ');
    Output(w);
    writeln();
    Wait;
   end;
4: begin
    writeln('Число:');Input(u);
    write('Введите скалярынй множитель: ');
    readln(a);
    write(a, ' * ', '('); Output(u); write(') = ');
    Prod(a, u, w);
    Output(w);
    writeln();
    Wait;
   end;
5: begin
    repeat
    writeln('Число меньше 1:'); input(z);
    b := Module(z);
    writeln('Текущее значение |z|: ', b);
    if (b >= 1) then 
    writeln('|z| должен быть меньше 1, поэтому уменьшите коэффициенты');
    until b < 1;
    writeln();
    Wait;
   end;
6: begin
     writeln('Число:');Input(u);
    sin(u, w);
    Output(w);
    writeln();
    Wait;
   end;
7: begin
  writeln('Число:');Input(u);
    cos(u, w);
    Output(w);
    writeln();
    Wait;
  end;
    else begin
        GoToXY(30, 20);
        writeln('ошибка. повторите ввод.');
        delay(1000);
      end;
    end;
end;
end;







end.   