@ String_charAt function
@ Requirements: r0 = address of string
@		r1 = the index
@ Outputs: 	r0 = the character at the given index, if unable, 0
@ Purpose: returns the character at the given index
	
	.global String_charAt	@provide program starting address to linker

	.text

String_charAt:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov 	r4, r0		@preserve registers for calling functions
	mov	r5, r1		@preserve registers for calling functions

	bl	String_Length	@call string length
	mov	r2, r0		@stores the length of the string into r2

	cmp	r2, r5		@compares the given index to the string length
	blt	zero		@if the given index is larger than the string length, branch

	ldrb	r0, [r4, r5]	@loads the character at the index r1 into r0
	b	end

zero:
	mov	r0, #0		@moves 0 into r0

end:
	pop	{lr}			@preservs the link register for recursion
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end