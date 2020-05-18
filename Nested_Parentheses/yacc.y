%{
#include<stdio.h>
#include<stdlib.h>
%}
%token CHAR NUMBER ID NL
%left '+'
%left '*'
%%
Stmt : E NL { printf("INPUT ACCEPTED\n"); exit(0); }
;

E : E '+' T
|T
;
T : T '*' F
|F
;
F : '(' E ')'
|NUMBER
|CHAR
;
%%

main()
{
printf("Enter The Expression : \n");
yyparse();
}
 
