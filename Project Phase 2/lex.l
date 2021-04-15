%option noyywrap

%{
#define Identifier 1
#define LanguageKeyword 2
#define String 3
#define Integer 4
#define Floating 5
#define Assignment 6
#define ArithmeticOp 7
#define LogicalOp 8
#define ComparisonOp 9
#define OpenParanthesis 10
#define CloseParanthesis 11
#define OpenCurlyBracket 12
#define CloseCurlyBracket 13
#define Terminator 14
#define Bool 15
%}

%%
exit|print|println|toString|readInt|readDouble|readLine|if|else|while|continue|break|int|double|bool|string printf("%d | %s", LanguageKeyword, yytext);
true|false printf("%d | %s", Bool, yytext);
[a-zA-Z_][a-zA-Z0-9_]* printf("%d | %s", Identifier, yytext);
\".*\" printf("%d | %s", String, yytext);
[0-9]+ printf("%d | %s", Integer, yytext);
[0-9]+"."[0-9]+ printf("%d | %s", Floating, yytext);
"=" printf("%d | %s", Assignment, yytext);
"+"|"-"|"*"|"/"|"%" printf("%d | %s", ArithmeticOp, yytext);
"!"|"&&"|"||" printf("%d | %s", LogicalOp, yytext);
"=="|"!="|"<"|">"|"<="|">=" printf("%d | %s", ComparisonOp, yytext);
"(" printf("%d | %s", OpenParanthesis, yytext);
")" printf("%d | %s", CloseParanthesis, yytext);
"{" printf("%d | %s", OpenCurlyBracket, yytext);
"}" printf("%d | %s", CloseCurlyBracket, yytext);
";" printf("%d | %s", Terminator, yytext);
%%

int main() {
  yylex();
}