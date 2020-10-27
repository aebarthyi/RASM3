@ String_substring_1 function
@ Requirements: r0 = address of string to be copied
@		r1 = beginning index
@		r2 = ending index
@ Outputs: 	r1 = copied string from beginning index to end index
@ Purpose: copy over part of a string from begining index to end index
	
	.global String_substring_1	@provide program starting address to linker

	.text

String_substring_1:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov	r6, r0		@preserving the original string	
	mov	r0, #0		@resetting r0

	sub	r0, r2, r1	@getting the length of the substring
	add	r0, #1		@adding 1 to the number of bytes for malloc 

	push	{r1-r8, r10, r11} 	@preserve registers
	bl	malloc			@creating a new string using malloc
	pop	{r1-r8, r10, r11}	@preserve registers

	sub	r1, #2		@offsetting beginning index by 1
	sub	r2, #1		@offsetting ending index by 1
	mov	r5, #0		@set counter to 0

copy:
	add	r1, #1		@increment counter by 1
				
	ldrb	r4, [r6, r1]	@loading r4 with the character of r0 + r2
	strb	r4, [r0, r5]	@storing r4 into r1 + r5

	add	r5, #1		@increment counter by 1

	cmp	r1, r2		@compare beginning index to end index
	blt	copy		@if less then jump to copy

end:
	pop	{lr}			@preservs the link register for recursion
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end