%{
#include "y.tab.h"
extern int yylval;
%}

alpha [A-Za-z]
digit [0-9]

%%

{digit}+ return NUMBER;
{alpha}+ return CHAR;
\n {return NL;}
. {return yytext[0];}

%%

int yywrap()
{
return 1;
}
