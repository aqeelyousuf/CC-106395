%{
  #include <stdio.h>
%}

%start program

%token LanguageKeyword
%token Identifier
%token Integer
%token Floating
%token String
%token ArithmeticOp
%token ComparisonOp
%token LogicalOp
%token AssignmentOp
%token OpenParanthesis
%token CloseParanthesis
%token OpenCurlyBracket
%token CloseCurlyBracket;
%token Terminator
%token Bool

%right '+' '-' '*' '/' '%' '='
 
%left "&&" "||" '!' '<' '>' "<=" ">=" "==" "!="

%nonassoc "else"

%%

program:
  /* epsilon */
| statement program
;

statement:
  block
| Terminatior
| Assignment
| declaration
| if
| while
| "break" Terminator
| "continue" Terminator
| "exit" OpenParanthesis CloseParanthesis Terminator
| "print" parExpression Terminator
| "println" parExpression Terminator
;

block:
  OpenCurlyBracket program CloseCurlyBracket
;

expression:
  literal
| Identifier
| '!' expression
| '-' expression
| expression '+' expression
| expression '-' expression
| expression '*' expression
| expression '/' expression
| expression '%' expression
| expression '<' expression
| expression '>' expression
| expression "<=" expression
| expression ">=" expression
| expression "==" expression
| expression "!=" expression
| expression "&&" expression
| expression "||" expression
| parExpression
| "readInt" OpenParanthesis CloseParanthesis
| "readDouble" OpenParanthesis CloseParanthesis
| "readLine" OpenParanthesis CloseParanthesis
| "toString" parExpression
;

parExpression:
  OpenParanthesis expression CloseParanthesis
;

assignment:
  Identifier Assignment expression Terminator
;

declarationOne:
  /* epsilon */
| Assignment expression
;

declaration:
  type Identifier declarationOne Terminator
;

ifOne:
  /* epsilon */
| "else" statement
;

if:
  "if" parExpression statement ifOne
;

while:
  "while" parExpression statement
;

type:
  "int"
| "double"
| "bool"
| "string"
;

Bool:
  "true"
| "false"
;

literal:
  Interger
| Floating
| String
| Bool
;

%%

#include "lex.yy.c"

void main()
{
  if (!yyparse())
    printf("\Parser Sucessfully Completed\n");
  else
    printf("\n Error Occured in parser\n");
}

yyerror(char *s)
{
	printf("line %d : %s %s\n", yylineno, s, yytext );
}   
