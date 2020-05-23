%{
int yylex();
void yyerror(const char *s);
%}
%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>
%}

%union
{ double p; }
%token<p>NUM
%token SIN COS TAN LOG SQRT SQUARE CUBE

%left '+''-'
%left '*''/'
%left '^'
%nonassoc uminu
%type<p>exp

%%
ss:exp {printf("\tANSWER = %g\n", $1);}
;
exp: exp'+'exp {$$=$1+$3;}
|exp'-'exp {$$=$1-$3;}
|exp'*'exp {$$=$1*$3;}
|exp'/'exp { if($3==0) {printf("\n\tDivided By Zero."); exit(0);} else {$$=$1/$3;}}
|'-'exp {$$=-$2;}
|'('exp')' {$$=$2;}
|SIN'('exp')' {$$=sin($3);}
|COS'('exp')' {$$=cos($3);}
|TAN'('exp')' {$$=tan($3);}
|LOG'('exp')' {$$=log($3);}
|exp'^'exp {$$=pow($1,$3);}
|SQRT'('exp')' {$$=sqrt($3);}
|SQUARE'('exp')' {$$=$3*$3;}
|CUBE'('exp')' {$$=$3*$3*$3;}
|NUM
;
%%


void yyerror(const char *s)
{
printf("\n\tSyntax Error");
exit(0);
}

int main()
{
do
{
printf("\n\tEnter Expression : ");
yyparse();
}
while(1);
}
