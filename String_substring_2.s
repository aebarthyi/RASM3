@ String_substring_2 function
@ Requirements: r0 = address of string to be copied
@		r1 = address of empty string (must be greater or equal in size to r0)
@		r2 = beginning index
@ Outputs: 	r1 = copied string from beginning index to end index
@ Purpose: copy over part of a string from begining index to end index
	
	.global String_substring_2	@provide program starting address to linker

	.text

String_substring_2:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov	r6, r0		@store r0 into r6 as back up
	mov	r7, r1		@back up for r1
	mov	r8, r2		@back up for r2
	mov	r5, #0		@set counter to 0

	bl String_Length
	mov	r3, r0		@move the length into the end index

	mov	r0, r6		@moving registers back into place
	mov	r1, r7		@moving registers back into place
	mov	r2, r8		@moving registers back into place

	sub	r2, #2		@offsetting 2 from the begining counter

copy:
	add	r2, #1		@increment counter by 1
				
	ldrb	r4, [r0, r2]	@loading r4 with the character of r0 + r2
	strb	r4, [r1, r5]	@storing r4 into r1 + r5

	add	r5, #1		@increment counter by 1

	cmp	r2, r3		@compare beginning index to end index
	blt	copy		@if less then jump to copy

end:
	pop	{lr}			@preservs the link register for recursion
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end