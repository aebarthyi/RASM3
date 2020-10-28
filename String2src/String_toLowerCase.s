@ String_toLowerCase
@ Requirements: r0 = address of string to be converted to lowercase
@
@ Outputs: 		r0 = address of converted string
@ Purpose: to convert a string to lowercase

	.global String_toLowerCase	@provide program starting address to linker

	.text

String_toLowerCase:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov 	r5, r0 			@ move string address to r1 for length
	bl 		String_Length	@ find the length of the string
	mov 	r6, r0			@ move length to r2
	bl		malloc			@ allocate space for lowercase string
	mov		r3, r0			@ move pointer to allocated space
	mov		r4, r0			@ store starting address to allocated string

loop:
	cmp 	r6, #0			@ check if we are done copying string
	beq		end				@ jump to end if we are done copying
	ldrb	r0, [r5], #1 	@ load byte of string, increment
	cmp  	r0, #65		@check if below the alphabet
	strltb r0, [r3], #1	@store character if found outside of bounds
	sublt r6, #1		@decrement our counter
	blt		loop	@jump back to loop if found outside of bounds
	cmp   r0, #97		@check if in bounds
	addlt	r0, #32		@if in bounds add 32 to make it lowercase
	strb	r0, [r3], #1			@ store the character back to the string
	sub		r6, #1			@ decrement length
	b			loop		@ branch back to loop

end:
	mov 	r0, r4			@ move address to r0 for return

	pop	{lr}				@preservs the link register for recursion
	pop	{sp}				@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr					@end of function
	.end
