progra prueba2;

var
 cantidad,cont:integer;
 function Fibonacci(valor:integer):integer;
 begin
      if valor = 1 then
           fibonacci:= 1;
      if valor=0 then  
                fibonacci:=0;
       if valor>=2 then
                Fibonacci:=(Fibonacci(valor-1) + Fibonacci(valor-2));
 end;
 begin
 ClrScr;
 write('cantidad de valores: ');
read(cantidad);
 for cont:=1 to cantidad do
 write('resultado:', fibonacci );
ReadKey;
end
