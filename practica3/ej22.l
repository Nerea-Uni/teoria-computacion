/*
 * Fichero .l para el ejercicio 2.2. de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242) y Nerea Salamero Labara (NIP: 820632).
 */
%{
	#include "y.tab.h"
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
";"	{return(SEMICOLON);}
";b"	{return(SEMICOLONB);}
"b"	{return(B);}
"="	{return(ASIGNACION);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
