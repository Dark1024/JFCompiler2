/* --------------------------Usercode Section------------------------ */
   
import java_cup.runtime.*;
import java.util.*;
      
%%
   
/* -----------------Options and Declarations Section----------------- */
   
/* 
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java. 
*/
%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
    
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup

/*
	Para que reconozca el lenguaje unicode y para que no diferencie
	mayus y minus.
*/
%ignorecase
%unicode
%state LEXERRORSTATE
  
/*
  Declarations
   
  Code between %{ and %}, both of which must be at the beginning of a
  line, will be copied letter to letter into the lexer class source.
  Here you declare member variables and functions that are used inside
  scanner actions.  
*/
%{   
    
    /*private Symbol symbol(int tokenType) {
        return new Symbol(tokenType, yytext());
    }*/

    public Symbol symbol( int tokenType) {
        /*System.out.println("Se obtuvo el token " + sym.terminal_name( tokenType )+ " \"" + yytext() + "\"" );*/
         /*return new Symbol( tokenType, yychar,yychar + yytext().length(), yytext() );*/
         return new Symbol( tokenType, yyline, yycolumn, yytext() );
    }
%}
   

/*
  Macro Declarations
  
  These declarations are regular expressions that will be used latter
  in the Lexical Rules Section.  
*/
   
LETRA	= [a-zA-Z_]
DIGITO	= [0-9]
MAS		= "+"
MENOS           = "-"
MULTIPLICACION	= "*"
DIVISION	= "/"
IGUAL           = "="
DIFERENTE	= "<>"
MENORQUE	= "<"
MAYORQUE	= ">"
MAYORIGUAL	= ">="
MENORIGUAL	= "<="

/*Palabras reservadas para OPERADORES logicos*/
AND	= "and"
OR	= "or"
NOT	= "not"
IN	= "in"

/* Palabras reservadas para OPERADORES de multiplicacion*/
MOD	= "mod"
DIV	= "div"

/*TIPOS primitivos*/ 
BOOLEAN	= "boolean"
INTEGER	= "integer"
STRING	= "string"
CHAR	= "char"
FLOAT   = "float"

/*CICLOS*/
IF	= "if"
ELSE	= "else"
WHILE	= "while" 
FOR	= "for"
TO	= "to" 
LOOP    = "loop"
ENDIF   = "endif"
SWITCH  = "switch"
ENDSWITCH = "endSwitch"
CASE    = "case"
BREAK   = "break"
DEFAULT = "default"


/*Otras palabras reservadas*/
BEGIN	  = "begin" 
PROCEDURE = "procedure"   
PROGRAM   = "create"
FUNCTION  = "function" 
RETURN    = "return"
END	  = "end"
VAR	  = "declare"
READ      = "read"
WRITE     ="write"


/*CARACTERES*/
ASIGNACION= ":="  
COMA	 = ","
PUNTO	 = "."   
PUNTOCOMA= ";"   
DOSPUNTOS= ":"   
PARIZQ	= "("   
PARDER	= ")"     
LLAIZQ	= "{"
LLADER	= "}"
COMILLAS= "'"
TRUE	= "true"
FALSE	= "false"
ENDLOOP = "endloop"

/*ESPACIOS*/
FINLINEA	= \r|\n|\r\n|\t
ESPACIOS	= {FINLINEA} | [ \t\f]| " "

/*NUMERO,CONSTANTES Y CHAR*/
NUM	= {DIGITO}+
NUMFLOAT = {DIGITO}+[\.]{DIGITO}+
T_CHAR	= {COMILLAS}.{COMILLAS}
T_STRING ={COMILLAS}[^'\r|\n|\r\n|\t]*{COMILLAS}
COMENTARIO={LLAIZQ}[^}]*{LLADER}


/*IDENTIFICADOR*/
ID	= {LETRA}({LETRA}|{DIGITO})*
   
%%
/* ------------------------Lexical Rules Section---------------------- */
   
/*
   This section contains regular expressions and actions, i.e. Java
   code, that will be executed when the scanner matches the associated
   regular expression. */
   
   /* YYINITIAL is the state at which the lexer begins scanning.  So
   these regular expressions will only be matched if the scanner is in
   the start state YYINITIAL. */
   
<YYINITIAL> {
   
    /*NUMERO*/
	{NUM}				{return symbol(sym.NUM);}
	
	/*PALABRAS RESERVADAS*/
	{BEGIN}				{return symbol(sym.BEGIN);}
	{END}				{return symbol(sym.END);}
	{FUNCTION}			{return symbol(sym.FUNCTION);}
        {RETURN}                        {return symbol(sym.RETURN);}
	{PROCEDURE}			{return symbol(sym.PROCEDURE);}
	{PROGRAM}			{return symbol(sym.PROGRAM);}
	{VAR}				{return symbol(sym.VAR);}
	{TRUE}				{return symbol(sym.TRUE);}
	{FALSE}				{return symbol(sym.FALSE);}
	{READ}				{return symbol(sym.READ);}
	{WRITE}				{return symbol(sym.WRITE);}
	
	
	/*SIMBOLOS ESPECIALES*/
	{ASIGNACION}                    {return symbol(sym.ASIGNACION);}
	{COMA}				{return symbol(sym.COMA);}
	{PUNTO}				{return symbol(sym.PUNTO);}
	{PUNTOCOMA}			{return symbol(sym.PUNTOCOMA);}
	{DOSPUNTOS}			{return symbol(sym.DOSPUNTOS);}
	{PARIZQ}			{return symbol(sym.PARIZQ);}
	{PARDER}			{return symbol(sym.PARDER);}
	
	/*OPERADORES*/
	{MAS}				{return symbol(sym.MAS);}
	{MENOS}				{return symbol(sym.MENOS);}
	{MULTIPLICACION}                {return symbol(sym.MULTIPLICACION);}
	{DIVISION}			{return symbol(sym.DIVISION);}
	{DIV}				{return symbol(sym.DIV);}
	{MOD}				{return symbol(sym.MOD);}
	
	{IGUAL}				{return symbol(sym.IGUAL);}
	{DIFERENTE}			{return symbol(sym.DIFERENTE);}
	{MAYORQUE}			{return symbol(sym.MAYORQUE);}
	{MENORQUE}			{return symbol(sym.MENORQUE);}
	{MAYORIGUAL}                    {return symbol(sym.MAYORIGUAL);}
	{MENORIGUAL}                    {return symbol(sym.MENORIGUAL);}
	{IN}				{return symbol(sym.IN);}
	
	{AND}				{return symbol(sym.AND);}
	{OR}				{return symbol(sym.OR);}
	{NOT}				{return symbol(sym.NOT);}
		
	/*TIPOS PRIMITIVOS*/	
	{INTEGER}			{return symbol(sym.INTEGER);}
	{CHAR}				{return symbol(sym.CHAR);}
	{STRING}			{return symbol(sym.STRING);}
	{BOOLEAN}			{return symbol(sym.BOOLEAN);}
        {FLOAT}                         {return symbol(sym.FLOAT);}
		
	/*CICLOS Y BLOQUES DE DECISION*/
	{WHILE}				{return symbol(sym.WHILE);}
	{IF}				{return symbol(sym.IF);}
	{ELSE}				{return symbol(sym.ELSE);}
	{FOR}				{return symbol(sym.FOR);}
	{TO}				{return symbol(sym.TO);}
        {LOOP}                          {return symbol(sym.LOOP);}
	{ENDLOOP}                       {return symbol(sym.ENDLOOP);}
        {ENDIF}                         {return symbol(sym.ENDIF);}
        {SWITCH}                        {return symbol(sym.SWITCH);}
        {ENDSWITCH}                     {return symbol(sym.SWITCH);}
        {CASE}                          {return symbol(sym.CASE);}
        {BREAK}                         {return symbol(sym.BREAK);}
        {DEFAULT}                       {return symbol(sym.DEFAULT);} 

	/*IDENTIFICADOR*/
	{ID}				{return symbol(sym.ID);}
	
	/*ESPACIOS EN BLANCO*/
	{ESPACIOS}			{}/*Hace nada*/
	
	/*CHAR*/
	{T_CHAR}			{return symbol(sym.T_CHAR);}
	

	/**/
	
	{T_STRING}                      {return symbol(sym.T_STRING);}
        {COMENTARIO}                    {/*System.out.print(yytext());*/}
	.				{yybegin(LEXERRORSTATE);System.err.println("Error Léxico en la línea "+(yyline+1)+", en la columna "+(yycolumn+1)+". No se esperaba el símbolo: '"+yytext()+"'");}
        <<EOF>>                         {return symbol(sym.EOF);}
	
}

<LEXERRORSTATE>
{
    {ESPACIOS}          {yybegin(YYINITIAL);}
     .                  {}
}

