all: RASM3Driver.o String_equals.o String_equalsIgnoreCase.o String_substring_1.o String_substring_2.o String_Length.o String_indexOf_1.o String_indexOf_2.o String_indexOf_3.o String_lastIndexOf_1.o String_lastIndexOf_2.o String_lastIndexOf_3.o barnett_12Feb20.a 
	ld -o RASM3Driver RASM3Driver.o String_equals.o String_equalsIgnoreCase.o String_substring_1.o String_substring_2.o String_Length.o String_indexOf_1.o String_indexOf_2.o String_indexOf_3.o String_lastIndexOf_1.o String_lastIndexOf_2.o String_lastIndexOf_3.o barnett_12Feb20.a

String_equals.o : String_equals.s
	as -g -o String_equals.o String_equals.s

String_equalsIgnoreCase.o : String_equalsIgnoreCase.s
	as -g -o String_equalsIgnoreCase.o String_equalsIgnoreCase.s

String_substring_1.o : String_substring_1.s
	as -g -o String_substring_1.o String_substring_1.s

String_substring_2.o : String_substring_2.s
	as -g -o String_substring_2.o String_substring_2.s

String_Length.o : String_Length.s
	as -g -o String_Length.o String_Length.s

String_indexOf_1.o : String_indexOf_1.s
	as -g -o String_indexOf_1.o String_indexOf_1.s

String_indexOf_2.o : String_indexOf_2.s
	as -g -o String_indexOf_2.o String_indexOf_2.s

String_indexOf_3.o : String_indexOf_3.s
	as -g -o String_indexOf_3.o String_indexOf_3.s

String_lastIndexOf_1.o : String_lastIndexOf_1.s
	as -g -o String_lastIndexOf_1.o String_lastIndexOf_1.s

String_lastIndexOf_2.o : String_lastIndexOf_2.s
	as -g -o String_lastIndexOf_2.o String_lastIndexOf_2.s

String_lastIndexOf_3.o : String_lastIndexOf_3.s
	as -g -o String_lastIndexOf_3.o String_lastIndexOf_3.s


