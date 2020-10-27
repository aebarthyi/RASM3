@ String_copy function
@ Requirements: r0 = address of string to be copied
@ Outputs: 	r0 = copied string
@ Purpose: creates a new string and copys over the given string into the new one
	
	.global String_copy	@provide program starting address to linker
	.extern malloc
	.extern free

	.text

String_copy:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov	r4, r0		@store r0 into r4 as back up

	bl String_Length
	mov	r3, r0		@move the length r3 for comparison later
	add	r0, #1		@increment the length by 1

	push	{r1-r8, r10, r11} 	@preserve registers
	bl 	malloc
	pop	{r1-r8, r10, r11}	@preserve registers

	mov	r5, r0		@move the address of new string into r5

	mov	r1, #0		@set index counter to 0
copy:				
	ldrb	r2, [r4, r1]	@loading r2 with the character of r4 + r1
	strb	r2, [r5, r1]	@storing r2 into r5 + r1

	add	r1, #1		@increment counter by 1

	cmp	r1, r3		@compare index count to string length
	blt	copy		@if less then jump to copy

end:
	pop	{lr}			@preservs the link register for recursion
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end