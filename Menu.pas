uses ComplexLib, crt,MatrixLib,vect,ComplexVectorLib,StackLib,FileLib;
procedure MenuComplex;
var u, v, w, z, p: Complex;
  a, b, eps: real;
  flag: boolean;
  mode:integer;
begin
flag:=true;
while flag do begin
ClrScr;
writeln('Вывберите число:');
writeln('1) ComplexLib');
writeln('2) MatrixLib');
writeln('3) vect');
writeln('4) ComplVect');
writeln('5) StackLib');
writeln('7) FileLib');
writeln('0) Выход');
readln(mode);
case mode of
1: begin
    ComplexMenu;
end;
2: begin
  MatrixMenu;
end;
3: begin
  menuVect;
end;
4: begin
  menuComplVect;
end;
5: begin
  StackMenu;
end;
7: begin
  FileMenu;
end;
0: begin
    flag:=false;
   end;
 else begin  writeln('Ошибка!!!'); end;
end;
end;
end;


begin
crt.ClrScr;
MenuComplex;
end.