/* 
 * Fichero .y para el ejercicio 2.3. de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242) y Nerea Salamero Labara (NIP: 820632).
 */
%{
	#include <math.h>
	#include <stdio.h>
	int acum = 0;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token ACU ASIGNA
%%

calclist : /* nada */
	| calclist ACU ASIGNA exp EOL { acum = $4; }
	| calclist ACU EOL { printf("=%d\n", acum); }
	| calclist exp EOL { printf("=%d\n", $2); }
	;
exp : 	factor 
	| ACU ADD exp { $$ = acum + $3; }
	| ACU SUB exp { $$ = acum - $3; }
	| ACU MUL exp { $$ = acum * $3; }
	| ACU DIV exp { $$ = acum / $3; }
	| exp ADD ACU { $$ = $1 + acum; }
	| exp SUB ACU { $$ = $1 - acum; }
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factor MUL ACU { $$ = $1 * acum; }
		| factor DIV ACU { $$ = $1 / acum; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL ACU { $$ = $1 * acum; }
		| factorsimple DIV ACU { $$ = $1 / acum; }
		| factorsimple
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER 
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
int main() {
  yyparse();
}

