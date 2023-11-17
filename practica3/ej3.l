/*
 * Fichero .l del ejercicio 3 de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242)y Nerea Salamero Labara (NIP: 820632)
 */
%{
	#include "y.tab.h"
%}
%%
"x"	{return(X);}
"y"	{return(Y);}
"z"	{return(Z);}

\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
