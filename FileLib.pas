unit FileLib;

interface

uses crt;

type Student = record
  Name: string[10];
  Mark: string[3]
end;

procedure FileMenu;

implementation

procedure MakeFile;
Var ch: char; Ok: boolean;
Filename: string[12];
StudFile: file of Student;
FlowStud: Student;
begin
Ok:=True;
writeln('Введите имя файла:');
readln(Filename);
assign(Studfile,Filename);
rewrite(StudFile);
with FlowStud do
    while Ok do begin
      GotoXY(30,10); writeln('Finish? yes/no');
      GotoXY(30,11); readln(ch);
      GotoXY(30,1); writeln(ch);
      if(ch = 'y') then begin
        Ok:=False; close(StudFile); 
        end
      else begin
        
        GoToXY(30,20); writeln('Student name:');
        GoToXY(30,21); readln(name);
        GoToXY(30,22); writeln('Student mark:');
        GoToXY(30,23); readln(mark);
        write(StudFile,FlowStud);
      end;
    end;  
end;

procedure ViewFile;
Var k: integer; ch: char;
FileName: string[12];
StudFile: file of Student;
FlowStud: Student;
begin
  k:=3;
  writeln('Введите имя:');
  readln(FileName);
  assign(StudFile,FileName);
  reset(StudFile);
  with FlowStud do
    while not EOF(StudFile) do Begin
      k:=k+1;
      read(StudFile,FlowStud);
      GoToXY(1,k); write(Name);
      GoToXY(13,k); write(':',Mark);
    end;
  close(StudFile);
end;

procedure AddFile;
Var ch: char; Ok: boolean;
NewName,Filename: string[12];
NewFile,StudFile: file of Student;
FlowStud: Student;
begin
Ok:=True;
writeln('Введите имя файла:');
readln(Filename);
assign(Studfile,Filename);
reset(StudFile);
NewName:='aaa.txt';
assign(NewFile,NewName);
rewrite(NewFile);

while not EOF(StudFile) do begin
  read(StudFile,FlowStud);
  write(NewFile,FlowStud);
end;

with FlowStud do
    while Ok do begin
      GotoXY(30,10); writeln('Finish? yes/no');
      GotoXY(30,11); readln(ch);
      GotoXY(30,1); writeln(ch);
      if(ch = 'y') then begin GoToXY(30,10); writeln('work');
        Ok:=False; close(NewFile); 
        end
      else begin
        
        GoToXY(30,20); writeln('Student name:');
        GoToXY(30,21); readln(name);
        GoToXY(30,22); writeln('Student mark:');
        GoToXY(30,23); readln(mark);
        write(NewFile,FlowStud);
      end;
    end;
    close(StudFile);
    erase(StudFile);
    rename(NewFile,FileName);
end;

procedure wait;
begin
  repeat
  until keyPressed;
  while keyPressed do
    readKey;
end;

procedure FileMenu;
var
  OK: boolean;
  mode: integer;
begin
  OK := true;
  while OK do
  begin
    ClrScr;
    writeln('операции с файлами');
     writeln('1 - Создать файл');
    writeln('2 - Посмотреть файл');
    writeln('3 - Добавить файл');
    writeln('режим: ');
    readln(Mode);
    clearline;
    clrscr;
    case Mode of
      0: OK := false;
      1: 
        begin
         MakeFile;
        end;
      2:
        begin
         ViewFile;
         Wait;
        end;
      3: begin
        AddFile;
      end;

    else begin
        writeln('ошибка. повторите ввод.');
        delay(1000);
      end;
    end;
  end;
end;
Begin
  
end.