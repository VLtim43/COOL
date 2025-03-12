
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

#define yylval cool_yylval
#define yylex  cool_yylex

#define MAX_STR_CONST 1025
#define YY_NO_UNPUT  

extern FILE *fin;


#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; 
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

%}

/* Regular Expressions definitions */

ALPHANUMERIC    [a-zA-Z0-9_]
NUMBER          [0-9]
TYPEID          [A-Z]{ALPHANUMERIC}*
OBJECTID        [a-z]{ALPHANUMERIC}*

%%

{NUMBER}+ 		{ 
    				cool_yylval.symbol = inttable.add_string(yytext);
   					 return INT_CONST; 
				}

\n				{ curr_lineno++; } /* We increase the line counter */
.               { printf("unexpected char: %s\n", yytext); }


%%
