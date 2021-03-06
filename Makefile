all: watcompiler run

watcompiler: watcompiler.c watcompiler.l watcompiler.y watcompiler.h asmgen.c asmgen.h
	bison -d watcompiler.y
	flex -o watcompiler.lex.c watcompiler.l
	gcc -Wall watcompiler.c watcompiler.tab.c watcompiler.lex.c asmgen.c -o $@ -g

clean:
	rm watcompiler.tab.c watcompiler.lex.c watcompiler.tab.h

run:
	./watcompiler test.in
	gcc test.s -o test.wat -ggdb
	./test.wat
