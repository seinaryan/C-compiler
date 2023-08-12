# COMPILER

## Lexical Analysis

* KEYWORD if|else|while|for|print
* IDENTIFIER [a-zA-Z][a-zA-Z0-9]*
* OPERATOR [-+*/]
* DIGIT [0-9]+
* WHITE_SPACE [ \t \n]

## Syntax Analysis

* Program -> StatementList
* StatementList -> Statement StatementList | Statement
* Statement -> PrintStatement | AssignmentStatement | IfStatement | WhileStatement | ForStatement
* PrintStatement -> print ( Expression ) ;
* AssignmentStatement -> Identifier = Expression ;
* IfStatement -> if ( Expression ) { StatementList } else { StatementList }
* WhileStatement -> while ( Expression ) { StatementList }
* ForStatement -> for ( AssignmentStatement ; Expression ; AssignmentStatement ) { StatementList }
* Expression -> Expression operator Expression | ( Expression ) | Identifier | Number
* Operator -> + | - | * | /
