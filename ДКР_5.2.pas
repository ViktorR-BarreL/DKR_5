{Assign(m, 'c:\маленбкий файл.txt'); 12 чисел
  Assign(m, 'c:\файл поболбше.txt'); 50 чисел
  Assign(m, 'c:\ваще болбшой файл жесь.txt'); 200 чисел} 

program DKR_5;

Uses CRT;

type
  mas = array [1..1000] of integer;

var
  m, out: text;
  ch: integer;


procedure SortCount;
var
  arr: array[-100..100] of integer; //arr[i] - количество чисел i в массиве
  i, j, x: integer;
begin
  Assign(m, 'c:\маленбкий файл.txt');
  Reset(m);
  Writeln('Исходный массив: ');
  for i := -100 to 100 do   
    arr[i] := 0;
  while not eof(m) do 
  begin
    readln(m, x);
    write(x, ' ');
    inc(arr[x]);
  end;
  Assign(out, 'c:\output.txt');
  ReWrite(out);
  Writeln;
  Writeln('Отсортированный массив: ');
  if ch = 1 then
  begin
    for i := -100 to 100 do
      for j := 1 to arr[i] do
      begin
        writeln(out, i);
        print(i);
      end;
  end;
  
  if ch = 2 then
  begin
    for i := 100 downto -100 do
      for j := 1 to arr[i] do
      begin
        writeln(out, i);
        print(i);
      end;
  end;
  writeln;
  writeln;
  writeln('Отсортированные данные записаны в c:\output.txt');
  close(out);
  close(m);
end;

procedure Sliv(var a: mas; p, q: integer);
var
  r, i, j, k: integer;
  b: mas;
begin
  r := (p + q) div 2;
  i := p;
  j := r + 1;
  for k := p to q do
    if (i <= r) and ((j > q) or (a[i] < a[j])) then
    
    begin
      b[k] := a[i];
      i := i + 1;
    end
    else
    begin
      b[k] := a[j];
      j := j + 1;
    end;
  for k := p to q do
    a[k] := b[k];
end;

procedure Sort(var a: mas; p, q: integer);
begin
  if p < q then 
  begin
    Sort(a, p, (p + q) div 2);
    Sort(a, (p + q) div 2 + 1, q);
    Sliv(a, p, q);
  end;
end;

procedure MergeSort;
var
  a: mas;
  n, i, x: integer;
  m, inp: text;

begin
  clrscr;
  Writeln('Исходный массив: ');
  Assign(m, 'c:\маленбкий файл.txt');
  Reset(m);
  n := 0;
  repeat
    readln(m, x);
    inc(n);
  until eof(m);
  Reset(m);
  for i := 1 to n do
  begin
    readln(m, a[i]);
    print(a[i]);
  end;
  close(m);
  writeln;
  Sort(a, 1, N);
  writeln('Отсортированный массив:');
  Assign(out, 'c:\output.txt');
  ReWrite(out);
  if ch = 1 then
  begin
    for i := 1 to n do
    begin
      Writeln(out, a[i]);
      print(a[i]);
    end;
  end;
  if ch = 2 then
  begin
    for i := n downto 1 do
    begin
      Writeln(out, a[i]);
      print(a[i]);
    end;
  end;
  writeln;
  writeln;
  writeln('Отсортированные данные записаны в c:\output.txt');
  close(out);
end;

begin
  repeat
    ClrScr;
    Writeln('1. Сортировка подсчетом');
    Writeln('2. Сортировка слиянием');
    Writeln('3. Выход');
    Write('Выберите пункт: ');
    Readln(ch);
    case ch of
      1:
        begin
          clrscr; 
          Writeln('1. Отсортировать по возрастанию');
          Writeln('2. Отсортировать по убыванию');
          Write('Выберите пункт: ');
          Readln(ch);
          case ch of 
            1:
              begin
                ClrScr;
                SortCount;
                Readln;
              end;
            
            2:
              begin;
                ClrScr;
                SortCount;
                Readln;
              end;
          end;
        end;
      
      2:
        begin
          clrscr; 
          Writeln('1. Отсортировать по возрастанию');
          Writeln('2. Отсортировать по убыванию');
          Write('Выберите пункт: ');
          Readln(ch);
          case ch of 
            1:
              begin
                ClrScr;
                MergeSort;
                Readln;
              end;
            
            2:
              begin;
                ClrScr;
                MergeSort;
                Readln;
              end;
          end;
        end;
      
      3: exit;
    end;
  until ch = 3;
end.