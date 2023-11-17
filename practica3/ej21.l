/*
 * Fichero .l para el ejercicio 2.1. de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242) y Nerea Salamero Labara (NIP: 820632).
 */
%{
	#include <math.h>
	#include "y.tab.h"
	int mod = 10;
%}
%x modulo
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
"b="	{BEGIN(modulo);}
<modulo>[0-9]+	{
			int num = atoi(yytext);
			
			if (num >= 2 && num <= 10) {
				mod = num;
			}
			else{
				return(yytext[0]);
			}
			num = 0;
		}
<modulo>\n	{BEGIN(INITIAL);}
[0-9]+"b"	{
			yylval = atoi(yytext);
			int i = 0;
			int res = 0;
			int comp = 0;
			while (yylval != 0) {
				comp = yylval % 10;
				if(comp < 0 || comp > mod - 1){
					return (yytext[0]);
				}
				res = res + comp * (pow(mod,i));
				yylval = yylval / 10;
				i++;
			}
			yylval = res;
			return (NUMBER);
		}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
