
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

int comment_depth = 0;  

%}


%x STATE_SINGLE_COMMENT
%x STATE_MULTI_COMMENT

/* Regular Expressions definitions */

ALPHANUMERIC    [a-zA-Z0-9_]
NUMBER          [0-9]
TYPEID          [A-Z]{ALPHANUMERIC}*
OBJECTID        [a-z]{ALPHANUMERIC}*
DARROW          =>
LE              <=
ASSIGN          <-

SINGLE_COMMENT         "--".*
WHITESPACE  [ \f\r\t\v\n]+ 

%%
		/* ------------------------------- COMMENTS  ------------------------------- */	

"(*"                        {
                                comment_depth++;
                                BEGIN(STATE_SINGLE_COMMENT);
                            }

<STATE_SINGLE_COMMENT>"(*"               {   comment_depth++; }

<STATE_SINGLE_COMMENT>.                  {}

<STATE_SINGLE_COMMENT>\n                 {   curr_lineno++; }

<STATE_SINGLE_COMMENT>"*)"               {
                                comment_depth--;
                                if (comment_depth == 0) {
                                    BEGIN(INITIAL);
                                }
                            }

<STATE_SINGLE_COMMENT><<EOF>>            {
                                BEGIN(INITIAL);
                                return ERROR;
	                        }

"*)"                        {
                                BEGIN(INITIAL);
                                return ERROR;
	                        }

"--"                        {   BEGIN(STATE_MULTI_COMMENT); }

<STATE_MULTI_COMMENT>.      {}

<STATE_MULTI_COMMENT>\n     {
                                curr_lineno++;
                                BEGIN(INITIAL);
                            }
                                

		/* ------------------------------- IDENTIFIERS AND OPERATORS  ------------------------------- */	
			    
{TYPEID}        {
                    cool_yylval.symbol = stringtable.add_string(yytext);
                    return (TYPEID);
	            }
{OBJECTID}      {
                    cool_yylval.symbol = stringtable.add_string(yytext);
                    return (OBJECTID);
	            }

{NUMBER}+       { 
                    cool_yylval.symbol = inttable.add_string(yytext);
                    return INT_CONST; 
                }


{DARROW}		{   return DARROW; }
{LE}            {   return LE;     }
{ASSIGN}        {   return ASSIGN; }
"+"             {   return '+';    }
"/"             {   return '/';    }
"-"             {   return '-';    }
"*"             {   return '*';    }
"="             {   return '=';    }
"<"             {   return '<';    }
"."             {   return '.';    }
"~"             {   return '~';    }
","             {   return ',';    }
";"             {   return ';';    }
":"             {   return ':';    }
"("             {   return '(';    }
")"             {   return ')';    }
"@"             {   return '@';    }
"{"             {   return '{';    }
"}"             {   return '}';    }

		/* ------------------------------- STRINGS  ------------------------------- */	




		/* ------------------------------- MISC  ------------------------------- */		    

{WHITESPACE}    {}        
\n              { curr_lineno++; }
.               { printf("unexpected char: %s\n", yytext); }

%%

