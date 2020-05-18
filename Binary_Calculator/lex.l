%{ 
#include "y.tab.h"
#include<math.h>
extern int yylval;
int num;
int power = 0;
int base = 2;
int result = 0; 
int curDig;
%} 
  
%% 
1(0|1)* { num = atoi(yytext); 
          while(num > 0)
          {          
           curDig = num % 10;
	   result += curDig * pow(base,power);
           power += 1;
           num /= 10;
          } 
	  yylval = result;
	  power = 0;
	  result = 0;
	  return BINNUM;        
        }  
[ \t] {;} 
\n {return NL;} 
. {return yytext[0];} 
%% 
  
int yywrap()
{
return 1;
}
