/*
 * Fichero .l para el ejercicio 2.2. de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242) y Nerea Salamero Labara (NIP: 820632).
 */
%{
	#include <math.h>
	#include <stdio.h>
	int bas = 0;
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%token SEMICOLON SEMICOLONB B ASIGNACION
%%

calclist : /* nada */
	| calclist exp SEMICOLON EOL { printf("=%d\n", $2); }
	| calclist B ASIGNACION exp EOL { 
						int aux = $4; 
						if(aux >= 2 && aux <= 10) {
							bas = aux;
						}
						else {
							printf("\nsintax error\n");
							return 1;
						}
					 }
	| calclist exp SEMICOLONB EOL	{
						int numero = $2;
						int solucion = 0;
						int potdiez = 1;
						while (numero != 0) {
							solucion = solucion + numero%bas * potdiez;
							numero = numero / bas;
							potdiez = potdiez * 10;
						}
						printf("=%d\n", solucion);
					}
	;
exp : 	factor 
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
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

