%{
#include<stdio.h>
#include<stdlib.h>
int count=0;
%}

%token IF RELOP S NUMBER ID NL

%%

stmt: if_stmt NL { printf("Number Of Nested If Statements = %d\n", count); exit(0); }
;

if_stmt : IF '(' cond ')' '{' if_stmt '}' { count++; }
          |S
;

cond: x RELOP x 
;

x:ID | NUMBER
;

%%

int yyerror(char *msg)
{
printf("The Statement Is Invalid\n");
exit(0);
}

main()
{
printf("Enter The Statement\n");
yyparse();
}
