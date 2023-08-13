%{
	//jsandalsndalskndlasndl
	#include<stdio.h>
%}

KEYWORD if|else|while|for
IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
OPERATOR [-+*/]
DIGIT [0-9]+
WHITE_SPACE [ \t \n]


%%	

{KEYWORD}		{	printf("%s is a keyword\n", yytext);}
{IDENTIFIER} 	{	printf("%s is an identifier\n", yytext);}
{OPERATOR}		{	printf("%s is an operator\n", yytext);}
{DIGIT}			{	printf("%s is a digit\n", yytext);}
{WHITE_SPACE}	{	/*Do nothing*/}
[$]				{	printf("End of line\n"); return 0;}
.	 			{	printf("%s is an invalid character\n", yytext); return 0;}
%%

int yywrap(){
	return 1;}
int main(){
	printf("Enter the expression: ");
	yylex();
	return 0;
}

	 