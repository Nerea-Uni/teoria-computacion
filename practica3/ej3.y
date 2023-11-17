/*
 * Fichero .y del ejercicio 3 de la práctica 3 de Teoría de la Computación.
 * Autores: Diego Lasheras Blasco (NIP: 815242)y Nerea Salamero Labara (NIP: 820632)
 */
%{
	#include <stdio.h>
%}
%token X Y Z EOL
%start inicio
%%
inicio: /* nada */
	| inicio c X s EOL
	;
s:	/* nada */
	| c X s
	;
b:	X c Y
	| X c
	;
c:	X b X
	| Z
	;
%%
int yyerror(char* s) {
	printf("\n%s\n", s);
	return 0;
}
int main() {
	yyparse();
}
