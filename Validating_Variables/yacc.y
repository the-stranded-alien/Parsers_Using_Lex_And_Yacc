%{
#include<stdio.h>
#include<stdlib.h>
%}

%token DIGIT LETTER
%%

stmt:A
;
A: LETTER B
;
B: LETTER B
| DIGIT B
| LETTER
| DIGIT
 ;
%%

int yyerror(char *msg)
{
printf("Invalid Variable\n");
exit(0);
}

int main(){
printf("\nEnter String : ");
yyparse();
printf("Valid Variable\n");
exit(0);
}

