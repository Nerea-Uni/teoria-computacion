/* 
 * Fichero .l para el ejercicio 2.3. de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242) y Nerea Salamero Labara (NIP: 820632).
 */
%{
	#include <math.h>
	#include "y.tab.h"
%}
%%
"+"		{return(ADD);}
"-"		{return(SUB);}
"*"		{return(MUL);}
"/"		{return(DIV);}
"("		{return(OP);}
")"		{return(CP);}
"acum"		{return(ACU);}
":="		{return(ASIGNA);}
[0-9]+		{yylval = atoi(yytext); return(NUMBER);}
\n		{return(EOL);}
[ \t]		{/* ignorar espacios */}
.		{return(yytext[0]); /* caracter inesperado */}
%%
