@ String_equalsIgnoreCase function
@ Requirements: r0 = address of first string
@		r1 = address of second string
@ Outputs: 	r0 = 1 / 0 if strings are equal
@ Purpose: to compare 2 strings are the same characters ignoring case
@	   and return a bool if they are equal
	
	.global String_equalsIgnoreCase	@provide program starting address to linker

	.text

String_equalsIgnoreCase:
	push	{r4-r8, r10, r11} 	@preserve registers
	push	{sp}			@preserve stack pointer
	push	{lr}			@preserve the link register for recursion

	mov	r4, r0		@back up 1st string address
	mov	r5, r1		@back up 2nd string address

	bl	String_Length	@call string length to check the length of the string
	mov	r6, r0		@move the length into r6

	mov 	r0, r5		@moving the 2nd string address into r0
	bl	String_Length	@calling string length to check 2nd string
	mov	r7, r0		@move result into r7

	cmp	r6, r7		@comparing the lengths of both strings
	bne	false		@if lengths != then jump to false

	mov	r2, r6		@setting counter to the lengths

compare:
	cmp	r2, #0		@comparing if remaning length is 0
	beq	true		@branches to true if length == 0

	ldrb	r0, [r4, r2]	@loading the character at address r4 + r2 into r0
	ldrb	r1, [r5, r2]	@loading the character at address r5 + r2 into r1

	sub	r2, r2, #1	@subtracting 1 from total string length
	
	cmp	r0, r1		@comparing the characters to each other
	beq	compare		@if equal jump to compare loop
	
	cmp	r0, #65		@checks if ascii value is less than 65
	blt	false		@if not 65 or over then it is not a character

	cmp	r1, #65		@checks if ascii value is less than 65
	blt	false		@if not 65 or over then it is not a character

	cmp	r1, r0		@compare if r1 is greater than r0
	blt	sub		@if less than, need to sub r1 from r0

	sub	r1, r1, r0	@subtracts r0 from r1 and stores into r1
	cmp	r1, #32		@if r1 == 32 then it is the capital character of r0
	beq	compare		@loops back to compare if true
	
	b	false		@skips over sub
sub:
	sub	r0, r0, r1	@subtracts r1 from r0 and stores into r0
	cmp	r0, #32		@if r0 == 32 then it is the capital character of r1
	beq	compare		@jumps back to compare if true
false:
	mov 	r0, #0		@setting the bool answer to 0
	b	end		@jumping to the end
true:
	mov	r0, #1		@setting the bool answer to 1

end:
	pop	{lr}			@preservs the link register for recursion
	pop	{sp}			@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr				@end of function
	.end