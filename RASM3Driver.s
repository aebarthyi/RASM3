@*****************************************************************************
@Group: Rasm 16|Andrew Barth-Yi|Alex Au|
@Program: RASM3Driver.s
@Class: CS 3B
@Lab: RASM3
@Date: October 23, 2020
@Purpose:
@	Demonstrate external string manipulation functions 
@*****************************************************************************

.equ KBSIZE, 512 @ Keyboard input size max

	.data
szTop: 	.asciz 	"Group: Rasm 16|Andrew Barth-Yi|Alex Au|\nClass: CS 3B\nLab: RASM3\nDate: 10/23/2020\n\n"	@ title card	
szEmp:	.skip 512																							@ empty string for output
	.text			

	.global main			@ Provide program starting address to linker

main:

	ldr 	r0, =szTop		@ load title card
	bl 		putstring		@ display title card
	
	mov 	r1, #65			@ move A into character search buffer
	
	bl		String_indexOf	@ call string index function
	
	ldr		r1, =szEmp		@ load empty string into r1
	bl 		intasc32		@ put the index into emptystring
	
	mov 	r0, r1			@ put index string into r0
	
	bl		putstring		@ display index to console
	

	mov 	r0, #0 		@ set exit status to 0
	mov 	r7, #1		@ service command code to 1

	svc	0 		@ call to linux
	.end
~
~
