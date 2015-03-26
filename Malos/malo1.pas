program malo1;

var
   opcion   : char;
 Procedure PROG1;
  var
      base, potencia  : integer;
      cont, resultado : integer;
   begin
      resultado:=1;{Inicializo variable "resultado"}      
clrscr; {Limpiamos pantalla}
      writeln('Base y potencia: '); {Salida en Pantalla}
      readln(base,potencia); {Entrada desde el teclado}
      for cont:=1 to potencia do
         begin            resultado:=resultado*base;{evalua resultado}
         end
      writeln(base,'^',potencia,'=',resultado); {Mostramos resultado de la forma "Base^Potencia=Resultado"}
      readkey;{Esperamos una tecla para finalizar}
   end; 
Procedure PROG2;
   {
   Descripcion: Determina el area de un triangulo dada la base y altura
   www.mis-algoritmos.com   }
   var
      base, altura   : integer;
      area        : real;
   begin      clrscr; {Limpiamos pantalla}
      writeln('base y altura: ');{Salida en pantalla}
      readln(base,altura);{Entrada desde el teclado}
      area:=(base*altura)/2;{evaluamos altura}
      writeln('Area: ',area:0:2);{Salida en pantalla}      readkey; {Esperamos una tecla para finalizar}
   end;
 
Procedure PROG3;
   {   Descripcion: Determina el area de un circulo dado el radio
   www.mis-algoritmos.com
   }
   const
      PI=3.141583; {Declaramos PI como constante}   var
      radio:integer;
   begin
      clrscr; {Limpiamos la pantalla}
      writeln('Radio: '); {Salida en pantalla}      readln(radio);{Entrada desde el teclado}
      writeln('Area: ',PI*radio*radio:0:2); {Salida en pantalla y evalua resultado}
      readkey; {Esperamos una tecla para finalizar}   
   end;
 Procedure PROG4;
   {
   Descripcion: Dice si una palabra es palindroma.
   www.mis-algoritmos.com
   }   var
      palabra     : string;
      cont     : integer;
      palindromo  : boolean;
   begin      clrscr; {Limpiamos pantalla}
      Write('Palabra: ');
      readln(palabra); {Entrada desde el teclado}
      cont:=1; {Inicializamos el contador}
      while cont<=length(palabra) div 2 do  {Ciclo hasta la mitad de la cadena}         begin
            if palabra[cont]=palabra[length(palabra)-(cont-1)] then
            {Coomparamos si la ultima letra conincide con la primera y
            asi sucesivamente hasta llegar al centro}
                  begin                     palindromo:=true;
                     {Si son iguales, bandera en true}
                  end
               else
                  begin                     palindromo:=false;
                     {Si encuentra una diferencia, bandera en false}
                     cont:=length(palabra) div 2;{Break}
                  end;
            cont:=cont+1;{Incrementamos contador en uno}         end;
      if palindromo=true then{Mostramos una salida legible por el usuario}
               writeln('Si es Palindromo')
            else
            writeln('No es palindromo');      readkey;{Esperamos una tecla para finalizar}
   end;
 
Procedure PROG5;
   {   Descripcion: Evalua la cantidad de ocurrencias de las letras en una palabra
   www.mis-algoritmos.com
   }
   var
      letras      : array [1..256] of integer;      cont     : integer;
      enunciado   : string;
   begin
      clrscr;{Limpiamos pantalla}
      for cont:=1 to 255 do{Rellenamos vector de 255 con ceros}         begin
            letras[cont]:=0;
         end;
      readln(enunciado); {Leemos enunciado}
      for cont:=1 to length(enunciado) do         begin
            {Sumamos en 1 si encontramos una letra en tal posicion}
            letras[ord(enunciado[cont])]:=letras[ord(enunciado[cont])]+1;
         end;
         for cont:=1 to 255 do
         begin
            {Si la posicion de es mayor a cero en su contenido mostramos la
            letra que le corresponde y la cantidad de veces que la encotramos}
            if letras[cont]>0 then               writeln('Letra ',chr(cont),' :',letras[cont]);
         end;
      readkey;{Esperamos una tecla para finalizar}
   end;
 Procedure PROG6;
   {
   Descripcion: Determina el salario semanal de un trabajador dada la hora
   dada la tarifa por horas y horas trabajadas. La jornada es de 8 horas y las
   horas extras se pagan doble.   www.mis-algoritmos.com
   }
   var
      salario           : real;
      tarifa_por_hora      : real;      horas_trabajadas  : real;
   begin
      clrscr;{Limpiamos pantalla}
      write('Tarifa por hora: ');{Salida en pantalla}
      readln(tarifa_por_hora);{Entrada desde el teclado}      write('Horas trabajadas: ');{Salida en pantalla}
      readln(horas_trabajadas);{Entrada desde el teclado}
      if horas_trabajadas>8 then
            {Evalua salario si trabajo mas de 8 horas}
            salario:=(8*tarifa_por_hora)+(2*(horas_trabajadas-8)*tarifa_por_hora)         else
            {Evalua salario si trabajo menos de 8 horas}
            salario:=horas_trabajadas*tarifa_por_hora;
      writeln('Salario: ',salario:0:2);{Muestra el salario en pantalla}
      readkey;{Espera una tecla para finalizar}    end;
 
procedure PROG7;
   {
   Descripcion: Dado el precio de un articulo y la cantidad de articulos,   determinar el subtotal, iva y total.
   www.mis-algoritmos.com
   }
   var
      precio, iva, costo,  subtotal, total   : real;      cantidad                   : integer;
   begin
      clrscr;{Limpiamos pantalla}
      write('Precio; ');{Salida en pantalla}
      readln(precio);{Entrada desde el teclado}      write('Cantidad: ');{Salida en pantalla}
      readln(cantidad);{Entrada desde el teclado}
      iva:=precio*0.15;{Evaluam iva 15%}
      costo:=precio+iva;{Agrega iva al precio}
      subtotal:=precio*cantidad;{Evaluamos subtotal}      iva:=cantidad*iva;{Evalua iva total a cobrar}
      total:=costo*cantidad;{Evalua el total de la compra}
      writeln;{Espacio en blanco (Enter)}
      writeln('Subtotal: ',subtotal:0:2);{Salida en pantalla}
      writeln('I.V.A.: ',iva:0:2);{Salida en pantalla}      writeln('Total: ',total:0:2);{Salida en pantalla}
      readkey;{Esperamos una tecla para finalizar}
   end;
 
Procedure PROG8;   var
      x1,x2,y1,y2    : integer;
      cantidad    : integer;
      cont        : integer;
   procedure dibuja(x1,y1,x2,y2:integer);      {Procedimiento que dibuja un marco en las coordenadas dadas}
      var
         cont  : integer;
      begin
                  {Dibujando desde X1 a X2 en Y1}
         for cont:=x1 to x2 do
            begin
               gotoXY(cont,y1);{Posiciona cursor}
               write('Ã‚Â°');{Dibuja caracter}               delay(10);{Retarda la ejecucion}
            end;{Fin del FOR}
   
         {Dibujando desde Y1 a Y2 en X2}
         for cont:=y1 to y2 do            begin
               gotoXY(x2,cont);{Posiciona cursor}
               write('Ã‚Â°');{Dibuja caracter}
               delay(10);{Retarda la ejecucion}
            end;{Fin del FOR}   
         {Dibujando desde X2 a X1 en Y2}
         for cont:=x2 downto x1 do
            begin
               gotoXY(cont,y2);{Posiciona cursor}               write('Ã‚Â°');{Dibuja caracter}
               delay(10);{Retarda la ejecucion}
            end;{Fin del FOR}
   
         {Dibujando desde Y2 a Y1 en X1}         for cont:=y2 downto y1 do
            begin
               gotoXY(x1,cont);{Posiciona cursor}
               write('Ã‚Â°');{Dibuja caracter}
               delay(10);{Retarda la ejecucion}            end;{fin del FOR}
   
      end;{Fin del procedimiento}
   
   begin{Inicia programa principal}      clrscr;{Limpiamos pantalla}
      write('Cantidad de marcos: ');{Salida en pantalla}
      readln(cantidad);{Entrada desde el teclado}
      clrscr;{Limpia pantalla}
      for cont:=1 to cantidad do         {
            Pide y dibuja los marcos
         }
         begin
            gotoxy(70,1);            write('X1: ');
            readln(x1);
   
            gotoxy(70,2);
            write('Y1: ');            readln(y1);
   
            gotoxy(70,4);
            write('X2: ');
            readln(x2);   
            gotoxy(70,5);
            write('Y2: ');
            readln(y2);
               gotoxy(70,1);write('       ');
            gotoxy(70,2);write('       ');
            gotoxy(70,4);write('       ');
            gotoxy(70,5);write('       ');
               dibuja(x1,y1,x2,y2); 
         end;
      readkey;
   end;
      case opcion of            '1': PROG1;
            '2': PROG2;
            '3': PROG3;
            '4': PROG4;
            '5': PROG5;            '6': PROG6;
            '7': PROG7;
            '8': PROG8;
         end;
   until opcion='9';end.



