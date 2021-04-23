%option noyywrap

%{
  int yylineno = 1;
%}

LETTER [a-zA-Z]
DIGIT [0-9]

RESERVED_KEYWORD if|else|while|continue|break|int|double|bool|string|true|false
RESERVED_IDENTIFIER exit|print|println|toString|readInt|readDouble|readLine

%%

exit|print|println|toString|readInt|readDouble|readLine|if|else|while|continue|break|int|double|bool|string {return LanguageKeyword;}
true|false {return Bool;}
[a-zA-Z_][a-zA-Z0-9_]* {return Identifier;}
\".*\" {return String;}
[0-9]+ {return Integar;}
[0-9]+"."[0-9]+ {return Floating;}
"=" {return Assignment;}
"+"|"-"|"*"|"/"|"%" {return ArithmeticOp;}
"!"|"&&"|"||" {return LogicalOp;}
"=="|"!="|"<"|">"|"<="|">=" {return ComparisonOp;}
"(" {return OpenParanthesis;}
")" {return CloseParanthesis;}
"{" {return OpenCurlyBracket;}
"}" {return CloseCurlyBracket;}
";" {return Terminator;}
%%
