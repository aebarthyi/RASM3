/* --String_indexOf_2.s */
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be checked against string
@              r2 = index to start searching from
@ Outputs      r0 = integer of the index where the character is found, if not found then -1 is returned
@ 

	.data
						
	.global			String_indexOf_2			
																											
	.text

String_indexOf_2:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
loop:
    ldrb    r3, [r0, r2]        @ load character pointed to by r0
    cmp     r1, r3              @ compare character to character passed by user
    beq     exit                @ go to end and return size 
    cmp     r3, #0		@ compare to find null termination
    beq	    exitNoSln		@ go to no findings exit branch
    add     r2, #1              @ increment r2 by 1 
    b       loop                @ back to loop
    
exit:
    mov     r0, r2              @ move counter to r0
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr    		@ back to the main where it is called

exitNoSln:
    mov     r0, #-1		@ move -1 into ouput register for no found index error

    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr    		@ back to the main where it is called

    .end
