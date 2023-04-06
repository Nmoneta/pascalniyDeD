unit StackLib;

Interface
uses Crt;
type Ptr=^Stac;
  Stac = record
  Inf: integer;
  Next: Ptr;
end;

Type PtrQ = ^Queu;
  Queu = record 
    Inf: integer;
    Next: PtrQ;
  end;

Var Por, Kor: Ptr;
  Left,Right: PtrQ;
  Values: integer;

procedure MakeStack(Var Top:ptr);
procedure AddStack(Kor: ptr; Var Top:ptr);
procedure VievStack(Top: ptr);
procedure ReverseStack(top, kon: Ptr; var top1, kon1: Ptr);
 procedure MakeQueue(Var Top,left:ptrq);
procedure StackMenu;

implementation
 procedure MakeStack(Var Top:ptr);
  Var Ok: boolean;
  Begin
   Top:= Nil;Ok :=True;
  while Ok do Begin
    write('Введите число: '); readln(Values);
    if (Values = 999) then Ok := False
    else begin 
      new(Kor);
      Kor^.Next :=Top;
      Kor^.Inf := Values;
      Top :=Kor;
    end;
  end;
 end;
 
 procedure AddStack(Kor: ptr; Var Top:ptr);
   Var Ok: boolean;
  Begin
    Ok :=True;
  while Ok do Begin
    write('Введите число: '); readln(Values);
    if (Values = 999) then Ok := False
    else begin 
      new(Kor);
      Kor^.Next :=Top;
      Kor^.Inf := Values;
      Top :=Kor;
    end;
  end;
 end;
 
 procedure DeleteStack(Tor: ptr);
  Begin
  while tor <> nil do Begin
    tor^.inf := 0;
    tor := tor^.next
  end;
 end;
 
 procedure ReverseStack(top, kon: Ptr; var top1, kon1: Ptr);
begin
  Crt.ClrScr; 
  kon:=top; top1:=nil;
  while kon <> Nil do begin
    New(kon1);
    kon1^.Next:=top1;
    kon1^.Inf:=kon^.Inf;
    top1 := kon1;
    kon:=kon^.Next;
  end;
end;
 
 procedure VievStack(Top: ptr);
 Var Kor: Ptr;
 begin
   Kor:= Top;
   while Kor <> Nil do
   begin
     writeln(Kor^.Inf);
     kor := Kor^.Next
   end;
 end;
 
 procedure MakeQueue(Var Top,left:ptrq);
 Var Ok: boolean;Values: integer;
 Begin
   Ok := True;
   write('Введите число: '); readln(Values);
   New(Top);
   if Values=999 then begin Ok:=False; Top^.Next:=Nil;
   end;
   Top^.inf := Values; Right:= Top; Left:= Top;
   while Ok do Begin
    write('Введите число: '); readln(Values);
    if (Values = 999) then begin
    Ok := False; Top^.next:=Nil;
    end
    else begin
      new(Top);
      Right^.Next := Top;
      Top^.Inf := Values;
      right := Top;
    end;
    end;
   end;
   
 procedure StackQueue(top:ptr;Var top1,left:ptrq);
 var ok:boolean; kop,right: ptrq;
 begin
 new(top1);
 Top1^.inf := top^.inf; Right:= Top1; Left:= Top1;
 top := top^.next;
 while top <> Nil do begin
  new(top1);
  Right^.Next := Top1;
  Top1^.Inf := top^.inf;
  Right := Top1;
  top := top^.next;
 end;
 end;
 
 procedure QueueStack(top, left: Ptrq; Var top1: ptr);
 var kor: Ptrq; kor1: Ptr;
 begin
 kor:=left; top1 := nil;
 while kor <> Nil do begin
    new(Kor1);
    Kor1^.Next := Top1;
    Kor1^.Inf := Kor^.inf;
    Top1 := Kor1;
    Kor := kor^.Next;
    
 end;
 end;
 
 procedure AddQueue(top: ptrq);
 Var Ok: boolean;Values: integer;
 Begin
   Ok := True;
   Right:= Top; Left:= Top;
   while Ok do Begin
    write('Введите число: '); readln(Values);
    if (Values = 999) then begin
    Ok := False; Top^.next:=Nil;
    end
    else begin
      new(Top);
      Right^.Next := Top;
      Top^.Inf := Values;
      right := Top;
    end;
    end;
   end;
   
procedure DeleteQueue(Top: ptrq; left:ptrq);
 Var Kor: Ptrq;
 begin
   Kor:= Left;
   while Kor <> Nil do
   begin
     Kor^.Inf := 0;
     kor := Kor^.Next;
   end;
 end;   
procedure VievQueue(Top: ptrq; left:ptrq);
 Var Kor: Ptrq;
 begin
   Kor:= Left;
   while Kor <> Nil do
   begin
     writeln(Kor^.Inf);
     kor := Kor^.Next;
   end;
 end;
   
  procedure Wait;
begin
  repeat until keyPressed;;
  while keyPressed do ReadKey;
end;
  
 procedure StackMenu;
 var Om:boolean;
 Mode: integer;
 a,b,a1,a2,b1,b2: Ptr;
 c,r,l,l2: PtrQ;
 Begin
   Om := true;
  while Om do
  begin
    ClrScr;
    writeln('Операции с стэками и очередями');
    writeln('Введите число:');
    writeln('1 - Создать стэк');
    writeln('2 - Добавить элемент в стэк');
    writeln('3 - Посмотереть');
    writeln('4 - Перевернутоь стэк');
    writeln('5 - Стек -> Очередь');
    writeln('6 - Удалить Стэк');
    writeln('7 - Создать очередь');
    writeln('8 - Добавить элемент в очередь');
    writeln('9 - Посмотреть очередь');
    writeln('10 - Очередь -> Стек');
    writeln('11 - Перевернуть очередь');
    writeln('12 - Удалить очередь');
    writeln('0 - назад');
    writeln('режим: ');
    readln(Mode);
    clrscr;
    
    case Mode of
    0: Om := false;
    1: begin
      MakeStack(a);
      Wait;
    end;
    2: begin
      AddStack(a,a);
      Wait;
    end;
    3: begin
      VievStack(a);
      Wait;
    end;
    4: begin
      ReverseStack(a,b,a,b);

    end;
    5: begin
      StackQueue(a,c,l);
    end;
    6: begin
      DeleteStack(a);
    end;
    7: begin
      MakeQueue(c,l);
      Wait;
    end;
    8: begin
      AddQueue(c);
      Wait;
      end;
    9: begin
      VievQueue(c,l);
      Wait;
    end;
    10: begin
      QueueStack(c,l,a);
      ReverseStack(a,b,a,b);
    end;
    11: begin
      QueueStack(c,l,a);
      StackQueue(a,c,l);
    end;
    12: begin
      DeleteQueue(c,l);
    end;
    else begin
        GoToXY(30, 20);
        writeln('ERROR!!! Повторите ввод.');
        delay(1000);
      end;
 
end;
end;
end;
End.