flexFile = lexical-analysis.l
bisonFile = parser.y
main = main

run: a.out
	clear
	@./a.out | python tester.py

a.out: y.tab.o lex.yy.o ${main}.o
	g++ lex.yy.o y.tab.o ${main}.c -lfl

y.tab.o: ${bisonFile}
	yacc -dtv ${bisonFile}
	g++ -c y.tab.c

lex.yy.o: ${flexFile}
	flex ${flexFile}
	g++ -c lex.yy.c

{main}.o: ${main}.c
	g++ -c ${main}.c

clean:
	rm lex.yy.c lex.yy.o y.tab.c y.tab.h y.output y.tab.o a.out ${main}.o
