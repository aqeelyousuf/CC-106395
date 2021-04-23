 **Mini C#**
 **106395**

Project Members
63127 | Syed Shahroz Hasan
63448 | Aqeel Yousuf

# Project Description
This project is on Mini C#.In this we have made Parser using React and lexical Analyser using Flex

# Language Description
Mini-C is a very simple C-like programming language designed for education purposes (for software that can be used by students to learn about program compilation).

It has if statements, loops (while), variables, arithmetic (+, -, *, /, %), comparison (==, !=, <, >, <=, >=), logical (!, &&, ||) operators, string concatenation.

It does not have “main” function for entry point like in C or Java, all code on “top-level” (similarly to Python, JavaScript) is executed as if it was inside of C/Java main.

Currently it does not support user-defined functions

# Example Code:
```
println("Hello world!");

print("please Enter Your name: ");
string name = readLine();

print("Please Enter Your Age: ");
int age = readInt();

if (age < 10) {
 println("Sorry, you aren`t old enough to learn about compilers");
 exit();
}

println("Hello " + name);
int n = 10;
int sum = 0;
int i = 1;

while (i <= n) {
 sum = sum + i;
 i = i + 1;
}

println("The Sum of the first " + toString(n) +
 " natural numbers: " + toString(sum));

double pi = 3.141592;
int r = 5;
double area = pi * (r * r);
println("Area of a circle with radius " + toString(r) + ": " +
 toString(area));

int desiredCount = 20;

println("First " + toString(desiredCount) + " prime numbers:");

int num = 2;
int count = 0;

while (count < desiredCount) {
 bool isPrime = true;
 int j = 1;
 while (j < num / 2) {
 if (j != 1 && num % j == 0) {
 isPrime = false;
 break;
 } else
 j = j + 1;
 }
 if (isPrime) {
 print(toString(num));
 if (count < desiredCount - 1)
 print(toString(", "));
 count = count + 1;
 }
 num = num + 1;
}

```
# Lexical Specification:
Statement
program = statement*

statement = block | SEMI | assignment | declaration | if | while | 'break' SEMI | 'continue' SEMI | 'exit' '(' ')' SEMI | 'print' parExpression SEMI | 'println' parExpression SEMI

block = '{' statement* '}'

Expressions
expression = literal | ID | ('!' | '-') expression | expression ('*' | '/' | '%') expression | expression ('+' | '-') expression | expression ('<' | '>' | '<=' | '>=') expression | expression ('==' | '!=') expression | expression ('&&') expression | expression ('||') expression | parExpression | 'readInt' '(' ')' | 'readDouble' '(' ')' | 'readLine' '(' ')' | 'toString' parExpression

parExpression = '(' expression ')'

assignment = ID assignmentOp expression SEMI

declaration = type ID (assignmentOp expression)? SEMI

if = 'if' parExpression statement ('else' statement)?

while = 'while' parExpression statement

assignmentOp = '='

Types, Literals, Semi, ID, Digit, Letter,Char, WhiteSpace Characters
statement = block | SEMI | assigtype = 'int' | 'double' | 'bool' | 'string'

literal = IntegerLiteral | FloatingPointLiteral | StringLiteral | BooleanLiteral

IntegerLiteral = DIGIT+ FloatingPointLiteral = DIGIT+ '.' DIGIT+ StringLiteral = '"' (CHAR | '"')* '"' BooleanLiteral = 'true' | 'false'

SEMI = ';'

ID = (LETTER | '') (LETTER | DIGIT | '')*

DIGIT = '0' | ... | '9'

LETTER = 'a' | ... | 'z' | 'A' | ... | 'Z'

CHAR = <unicode character, as in Java>

Whitespace characters (' ', '\t', '\r', '\n') are skipped outside of tokens.

Language Context Free Grammar (CFG)
The Grammar description using EBNF.

• 'x' — terminal symbol.

• x? – zero or one occurrences of x.

• x* – zero or more occurrences of x.

• x+ – one or more occurrences of x.

• x | y – alternative (x or y).

• () – group, for example (x | y) z (x y)?
