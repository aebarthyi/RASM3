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
szTop: 	.asciz 	"Group: Rasm 16|Andrew Barth-Yi|Alex Au|\nClass: CS 3B\nLab: RASM3\nDate: 10/23/2020\n\n"	@ title card																		@ second user input
	.text			

	.global _start			@ Provide program starting address to linker

_start:

	mov 	r0, #0 		@ set exit status to 0
	mov 	r7, #1		@ service command code to 1

	svc	0 		@ call to linux
	.end
~
~
