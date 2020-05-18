%{
#include<stdio.h> 
#include<stdlib.h>
%}

%token BINNUM NL
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%% 
ArithmeticExpression: E {printf("\nDecimal Value = %d\n\n", $$); exit(0);}
; 
E : E '+' E {$$=$1+$3;} 
|E'-'E {$$=$1-$3;} 
|E'*'E {$$=$1*$3;} 
|E'/'E {$$=$1/$3;} 
|E'%'E {$$=$1%$3;} 
|'('E')' {$$=$2;} 
| BINNUM {$$=$1;} 
;   
%% 

int yyerror(char *msg)
{
printf("\nThe Expression Is Invalid\n\n");
exit(0);
}

int main()
{
printf("\nEnter The Expression : ");
yyparse();
} 
  


