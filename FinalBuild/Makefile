all: RASM3Driver.o String1.a String2.a barnett_12Feb20.a
	gcc -g -o RASM3 RASM3Driver.o String1.a String2.a barnett_12Feb20.a

RASM3Driver.o : RASM3Driver.s
	as -g -o RASM3Driver.o RASM3Driver.s

