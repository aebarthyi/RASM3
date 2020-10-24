@ String_substring_1 function
@ Requirements: r0 = address of string to be copied
@		r1 = address of empty string (must be greater or equal in size to r0)
@		r2 = beginning index
@		r3 = ending index
@ Outputs: 	r1 = copied string from beginning index to end index
@ Purpose: copy over part of a string from begining index to end index
	
	.global String_substring_1	@provide program starting address to linker

	.text

String_substring_1:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer

	sub	r2, #2		@offsetting beginning index by 1
	sub	r3, #1		@offsetting ending index by 1
	mov	r5, #0		@set counter to 0

copy:
	add	r2, #1		@increment counter by 1
				
	ldrb	r4, [r0, r2]	@loading r4 with the character of r0 + r2
	strb	r4, [r1, r5]	@storing r4 into r1 + r5

	add	r5, #1		@increment counter by 1

	cmp	r2, r3		@compare beginning index to end index
	blt	copy		@if less then jump to copy

end:
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end