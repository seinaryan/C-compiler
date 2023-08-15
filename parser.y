%{
	#include <ctype.h>
	#include <stdio.h>

int token_id = 0;
int yylex(void);
void yyerror(const char *s);



%}



%token NUMBER
%token IDENTIFIER
%token PRINT
%token IF
%token WHILE


%%
Program: StatementList
	;
StatementList: StatementList Statement
	| 
	;
Statement : PrintStatement 
	| AssignmentStatement 
	| IfStatement
	| WhileStatement
	;
	
PrintStatement : PRINT Expression ';'
	{
		printf("Print statement\n");
	}
	;
AssignmentStatement : IDENTIFIER '=' Expression ';'
	{
		printf("Assignment statement\n");
	}
	;

IfStatement : IF '(' Expression ')' Statement
	;
WhileStatement : WHILE '(' Expression ')' Statement
	;
Expression : Expression '+' Term
	| Expression '-' Term
	| Term
	{
		printf("Expression formed\n");

	}
	;
Term : Term '*' Factor
	| Term '/' Factor
	| Factor
	;
Factor : '(' Expression ')'
	| NUMBER
	| IDENTIFIER
	;
%%

#include "lex.yy.c"

void yyerror(const char *s) {
	printf("Error: %s\n", s);
}
