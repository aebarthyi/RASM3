@ String_startsWith_2 function
@ Requirements: r0 = address of the substring to check
@		r1 = address of the string to check
@ Outputs: 	r0 = 1 / 0 if the substring exists in the given string
@ Purpose: to compare if the substring exists in the given string
	
	.global String_startsWith_2	@provide program starting address to linker

	.text

String_startsWith_2:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov	r4, r0		@preserving the substring to call String_length
	mov	r5, r1		@preserving the string to call String_length

	
	bl	String_Length	
	mov	r1, #0		@setting r1 to 0 for counter

loop:
	ldrb	r2, [r4, r1]	@extracting the character from substring into r2
	ldrb	r3, [r5, r1]	@extracting the character from string in to r3

	add	r1, #1		@incrementing the index counter

	cmp	r2, r3		@comparing the characters
	bne	false		@if not equal branch to false

	cmp	r1, r0		@comparing the string index to the offset begin index
	blt	loop		@if less than, loop

	b	true		@if looped through then branch to true
	
false:
	mov	r0, #0		@puts false into r0
	b 	end		@jumps to end
true:
	mov	r0, #1		@puts true into r0
end:
	pop	{lr}			@preservs the link register for recursion
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end