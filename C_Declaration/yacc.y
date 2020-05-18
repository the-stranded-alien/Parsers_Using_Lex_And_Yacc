%{
#include<stdio.h>
#include<stdlib.h>
%}

%token ID BUILTIN SC NL COMMA

%%
start:BUILTIN varlist SC NL {printf("Valid C Declaration\n"); exit(0);}
|
varlist:varlist COMMA ID|ID;
%%

int yyerror(char *msg)
{
printf("Invalid C Declaration\n");
exit(0);
}

int main(){
printf("Enter The String : ");
yyparse();
}

