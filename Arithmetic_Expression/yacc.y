%{
#include<stdio.h>
#include<stdlib.h>
%}

%token DIGIT NL

%%
S : E NL {printf("VALID EXPRESSION\n");return 1;}
;
E : E '+' T { }
| T
;
T : T '-' FF { }
| FF
;
FF : FF '/' FFF { }
|FFF;
FFF : FFF '*' F { }
|F
;
F : '(' E ')' { }
|DIGIT
;
%%

int yyerror(char *msg)
{
printf("The Expression Is Invalid");
exit(0);
}

main()
{
printf("Enter The Expression : ");
yyparse();
}

