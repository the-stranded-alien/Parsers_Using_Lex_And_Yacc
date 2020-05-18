%{
#include "y.tab.h"
%}

digit [0-9]

%%
{digit}+ return DIGIT;
\n {return NL;}
. {return yytext[0];}
%%

int yywrap()
{
return 1;
}


