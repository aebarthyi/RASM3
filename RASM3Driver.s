@*****************************************************************************
@Group: Rasm 16|Andrew Barth-Yi|Alex Au|
@Program: RASM3Driver.s
@Class:   CS 3B
@Lab:     RASM3
@Date:    October 23, 2020
@Purpose:
@	Demonstrate external string manipulation functions 
@*****************************************************************************

.equ 	KBSIZE, 512 	@ Keyboard input size max

	.data

kbBuf:	.skip	KBSIZE		@ Keyboard buffer

str1:	.skip	KBSIZE		@ first string storage
str2:	.skip	KBSIZE		@ second string storage
str3:	.skip	KBSIZE		@ third string storage

char:	.byte	0		@ character storage

true:	.asciz	"TRUE"		@string for true
false:	.asciz	"FALSE"		@string for false
test:	.asciz	"TRUE"		@fix for prompt 10	

szTop: 	.asciz 	"Group: Rasm 16|Andrew Barth-Yi|Alex Au|\nClass: CS 3B\nLab: RASM3\nDate: 10/23/2020\n\n"	@ title card	
szEmp:	.skip 512
szMsgS: .asciz	"                " @16 byte string for intasc

szMsg1:	.asciz	"Enter three strings\n1: "	@input prompts
szMsg2:	.asciz	"2: "				@input prompts
szMsg3:	.asciz	"3: "				@input prompts

szMsg1.1: .asciz "1. The first  string length is: "	 @output for first string
szMsg1.2: .asciz "   The second string length is: "      @output for second string
szMsg1.3: .asciz "   The third  string length is: "	 @output for third string

szMsg2.1: .asciz "2. String equals 1 and 3 = "	 		@output for prompt #2

szMsg3.1: .asciz "3. String equals 1 and 1 = "	 		@output for prompt #3

szMsg4.1: .asciz "4. String equals ignore case 1 and 3 = "	@output for prompt #4

szMsg5.1: .asciz "5. String equals ignore case 1 and 2 = "	@output for prompt #5

szMsg6.1: .asciz "6. Calling string copy for string 1 to 4"	@output for prompt #6
szMsg6.2: .asciz "   String 1: "				@output for prompt #6
szMsg6.3: .asciz "   String 4: "				@output for prompt #6

szMsg7.1: .asciz "7. Calling string substring 1 for string 3\n"	@output for prompt #7
szMsg7.2: .asciz "   Index 4 to 14: "				@output for prompt #7

szMsg8.1: .asciz "8. Calling string substring 2 for string 3\n"	@output for prompt #8
szMsg8.2: .asciz "   Starting from index 7: "			@output for prompt #8

szMsg9.1: .asciz "9. Calling string char at for string 2\n"	@output for prompt #9
szMsg9.2: .asciz "   The character at index 4: "		@output for prompt #9

szMsg10.1: .asciz "10. Calling Starts with to check string 1\n" @output for prompt #10
szMsg10.2: .asciz "    Checking 'hat.' at index 12: "		@output for prompt #10
szMsg10.3: .asciz "hat."			   @the string to check for prompt #10

szMsg11.1: .asciz "11. Checking if string 1 starts with 'Cat': "@output for prompt #11
szMsg11.2: .asciz "Cat"			   	   @the string to check for prompt #11

szMsg12.1: .asciz "12. Checking if string 1 ends with 'in the hat.': "@output for prompt #12
szMsg12.2: .asciz "in the hat."			   	 @the string to check for prompt #12

crCr: .byte 10			@byte nuber for carrage return
																			@ empty string for output
	.text			

	.global main		@ Provide program starting address to linker

main:

	ldr 	r0, =szTop		@ load title card
	bl 	putstring		@ display title card

@--------first string input------@
	ldr	r0, =szMsg1	@load into r0 address of szMsg1
	bl	putstring	@call putstring (external fn) to print szMsg1

	ldr	r0, =str1	@ load into r0 address of kbBuf
	mov	r1, #KBSIZE	@ store KBSIZE

	bl	getstring	@calls getstring, stores user input into kbBuf
	mov	r6, r0		@move first string into r6

@-------second string input------@
	ldr	r0, =szMsg2	@load into r0 address of szMsg2
	bl	putstring	@call putstring (external fn) to print szMsg2

	ldr	r0, =str2	@ load into r0 address of kbBuf
	mov	r1, #KBSIZE	@ store KBSIZE

	bl	getstring	@calls getstring, stores user input into kbBuf
	mov	r7, r0		@move first string into r7

@--------third string input------@
	ldr	r0, =szMsg3	@load into r0 address of szMsg3
	bl	putstring	@call putstring (external fn) to print szMsg3

	ldr	r0, =str3	@ load into r0 address of kbBuf
	mov	r1, #KBSIZE	@ store KBSIZE

	bl	getstring	@calls getstring, stores user input into kbBuf
	mov	r8, r0		@move first string into r8

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'
	
@*********************************@
@	  PROMPT NUMBER 1         @
@*********************************@

@----------1.1------------@
	ldr	r0, =szMsg1.1	@load into r0 address of szMsg1.1
	bl	putstring	@call putstring (external fn) to print szMsg1.1

	mov	r0, r6		@move the first string into r0
	bl	String_Length	@call string length (puts length of the string into r0)

	ldr	r1, =szMsgS	@point r1 to blank string
	bl	intasc32	@call intasc32 to convert int to ascii
	mov	r0, r1		@move ascii in r1 to r0
	bl	putstring	@print r0

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@----------1.2------------@
	ldr	r0, =szMsg1.2	@load into r0 address of szMsg1.2
	bl	putstring	@call putstring (external fn) to print szMsg1.2

	mov	r0, r7		@move the second string into r0
	bl	String_Length	@call string length (puts length of the string into r0)

	ldr	r1, =szMsgS	@point r1 to blank string
	bl	intasc32	@call intasc32 to convert int to ascii
	mov	r0, r1		@move ascii in r1 to r0
	bl	putstring	@print r0

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@----------1.3------------@
	ldr	r0, =szMsg1.3	@load into r0 address of szMsg1.3
	bl	putstring	@call putstring (external fn) to print szMsg1.3

	mov	r0, r8		@move the third string into r0
	bl	String_Length	@call string length (puts length of the string into r0)

	ldr	r1, =szMsgS	@point r1 to blank string
	bl	intasc32	@call intasc32 to convert int to ascii
	mov	r0, r1		@move ascii in r1 to r0
	bl	putstring	@print r0

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'
	
@*********************************@
@	  PROMPT NUMBER 2         @
@*********************************@

	ldr	r0, =szMsg2.1	@load into r0 address of szMsg2.1
	bl	putstring	@call putstring (external fn) to print szMsg2.1

	mov	r0, r6		@moving string 1 into r0
	mov	r1, r8		@moving string 3 into r1

	bl 	String_equals	@call string equals function to compare r0, r1
	
	cmp	r0, #0		@comparing the output
	beq	false2		@if 0 then branch to false

	ldr	r0, =true	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end2

false2:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end2:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 3         @
@*********************************@	
	
	ldr	r0, =szMsg3.1	@load into r0 address of szMsg3.1
	bl	putstring	@call putstring (external fn) to print szMsg3.1

	mov	r0, r6		@moving string 1 into r0
	mov	r1, r6		@moving string 1 into r1

	bl 	String_equals	@call string equals function to compare r0, r1
	
	cmp	r0, #0		@comparing the output
	beq	false3		@if 0 then branch to false

	ldr	r0, =true	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end3

false3:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end3:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 4         @
@*********************************@

	ldr	r0, =szMsg4.1	@load into r0 address of szMsg4.1
	bl	putstring	@call putstring (external fn) to print szMsg4.1

	mov	r0, r6		@moving string 1 into r0
	mov	r1, r8		@moving string 3 into r1

	bl 	String_equalsIgnoreCase		@call string equals function to compare r0, r1
	
	cmp	r0, #0		@comparing the output
	beq	false4		@if 0 then branch to false

	ldr	r0, =true	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end4

false4:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end4:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 5         @
@*********************************@

	ldr	r0, =szMsg5.1	@load into r0 address of szMsg5.1
	bl	putstring	@call putstring (external fn) to print szMsg5.1

	mov	r0, r6		@moving string 1 into r0
	mov	r1, r7		@moving string 2 into r1

	bl 	String_equalsIgnoreCase		@call string equals function to compare r0, r1
	
	cmp	r0, #0		@comparing the output
	beq	false5		@if 0 then branch to false

	ldr	r0, =true	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end5

false5:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end5:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 6         @
@*********************************@

	ldr	r0, =szMsg6.1	@load into r0 address of szMsg6.1
	bl	putstring	@call putstring (external fn) to print szMsg6.1

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

	ldr	r0, =szMsg6.2	@load into r0 address of szMsg6.2
	bl	putstring	@call putstring (external fn) to print szMsg6.2

	mov	r0, r6		@load string 1 into r0
	bl	putstring	@call putstring (external fn) to print string 1

	mov	r0, r6		@load string 1 into r0
	bl	String_copy	@call string copy to copy string 1
	mov	r5, r0		@store the copied string into r5

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

	ldr	r0, =szMsg6.3	@load into r0 address of szMsg6.3
	bl	putstring	@call putstring (external fn) to print szMsg6.3

	mov	r0, r5		@moving string 4 into r0
	bl	putstring	@call putsting to print the copied string

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 7         @
@*********************************@

	ldr	r0, =szMsg7.1	@load into r0 address of szMsg7.1
	bl	putstring	@call putstring (external fn) to print szMsg7.1

	ldr	r0, =szMsg7.2	@load into r0 address of szMsg7.2
	bl	putstring	@call putstring (external fn) to print szMsg7.2

	mov	r0, r8		@moving string 3 into r0
	mov	r1, #4		@setting begining index to 4
	mov	r2, #14		@setting end index to 14
	bl	String_substring_1 @creates a new string consisting of the substring indexes

	bl	putstring	@outputs the string in r0
	
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 8         @
@*********************************@
	
	ldr	r0, =szMsg8.1	@load into r0 address of szMsg8.1
	bl	putstring	@call putstring (external fn) to print szMsg8.1

	ldr	r0, =szMsg8.2	@load into r0 address of szMsg8.2
	bl	putstring	@call putstring (external fn) to print szMsg8.2

	mov	r0, r8		@moving string 3 into r0
	mov	r1, #7		@setting begining index to 7
	bl	String_substring_2	@creates a new string consisting of the begining index to the end

	bl	putstring	@outputs the string in r0

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 9         @
@*********************************@

	ldr	r0, =szMsg9.1	@load into r0 address of szMsg9.1
	bl	putstring	@call putstring (external fn) to print szMsg9.1

	ldr	r0, =szMsg9.2	@load into r0 address of szMsg9.2
	bl	putstring	@call putstring (external fn) to print szMsg9.2

	mov	r0, r7		@move string 2 into r0
	mov	r1, #4		@setting the character index
	bl	String_charAt	@calling String_charAt to find the character at the given index

	ldr	r2, =char	@setting address of char into r2
	str	r0, [r2]	@storing the given character for putch

	ldr	r0, =char	@load address of char into r0
	bl	putch		@call putch to print the stored character

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 10        @
@*********************************@

	ldr	r0, =szMsg10.1	@load into r0 address of szMsg10.1
	bl	putstring	@call putstring (external fn) to print szMsg10.1

	ldr	r0, =szMsg10.2	@load into r0 address of szMsg10.2
	bl	putstring	@call putstring (external fn) to print szMsg10.2

	ldr	r0, =szMsg10.3 	@load the string to check into r0
	mov 	r1, r6		@loading the first string into r1
	mov	r2, #12		@setting the begining index to 12

	bl	String_startsWith_1	@calling to check if the string starts with the substring
	cmp	r0, #0		@comparing the output
	beq	false10		@if 0 then branch to false
	
	ldr	r0, =test	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end10

false10:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end10:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 11        @
@*********************************@

	ldr	r0, =szMsg11.1	@load into r0 address of szMsg11.1
	bl	putstring	@call putstring (external fn) to print szMsg11.1

	ldr	r0, =szMsg11.2	@load into r0 address of szMsg11.2
	mov	r1, r6		@put string 1 into r1
	bl	String_startsWith_2	@calling to check if the string starts with the substring

	cmp	r0, #0		@comparing the output
	beq	false11		@if 0 then branch to false
	
	ldr	r0, =test	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end11

false11:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end11:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

@*********************************@
@	  PROMPT NUMBER 12        @
@*********************************@

	ldr	r0, =szMsg12.1	@load into r0 address of szMsg12.1
	bl	putstring	@call putstring (external fn) to print szMsg12.1

	ldr	r0, =szMsg12.2	@load into r0 address of szMsg12.2
	mov	r1, r6		@put string 1 into r1
	bl	String_endsWith	@calling to check if the string starts with the substring

	cmp	r0, #0		@comparing the output
	beq	false12		@if 0 then branch to false
	
	ldr	r0, =test	@load into r0 address of true
	bl	putstring	@call putstring (external fn) to print true
	b	end12

false12:
	ldr	r0, =false	@load into r0 address of false
	bl	putstring	@call putstring (external fn) to print false
end12:
	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'	

	@new line
	ldr	r0, =crCr	@load into r0 address of crCr
	bl	putch		@call putstring (external fn) to print the character 'carriage return'

	
	



	mov 	r0, #0 		@ set exit status to 0
	mov 	r7, #1		@ service command code to 1

	svc	0 		@ call to linux
	.end
~
~
