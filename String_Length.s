/* --String_Length.s */
/* This is a comment */
@ This is also a comment
@ Purpose: to count characters in a string and return them to r0

	.data
						
	.global			String_Length			
																											
	.text

String_Length:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    mov     r1, #0              @ start our counter at 0
    mov     r2, r0              @ move address to r2
    
loop:
    ldrb    r0, [r2, r1]        @ load character pointed to by r0
    cmp     r0, #0              @ compare character to zero
    beq     exit                @ go to end and return size 
    add     r1, #1              @ increment r1 by 1 
    b       loop                @ back to loop
    
exit:
    mov     r0, r1              @ move counter to r0
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr            		@ back to the main where it is called
    
    .end
