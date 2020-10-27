/* --String_lastIndexOf_2.s */
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be checked against string
@              r2 = index to check from to the front
@ Outputs      r0 = integer of the last index where the character is found, if not found then -1 is returned
@ 

	.data
						
	.global			String_lastIndexOf_2			
																											
	.text

String_lastIndexOf_2:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    ldrb    r4, [r0, #0]        @ store first character for comparison later 
    
loop:
    ldrb    r3, [r0, r2]        @ load character pointed to by r0
    cmp     r3, r1              @ check if character is found at point
    beq     exit                @ if found, go to exit branch
    cmp     r3, r4              @ check if we have reached front of string
    beq     exitNoSln           @ go to exit without found character
    sub     r2, #1              @ decrement index by 1 going back to front
    b       loop                @ go again if not found yet and not at front of 1st string
    
exit:
    mov     r0, r2              @ move counter to r0
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr    		        @ back to the main where it is called

exitNoSln:
    mov     r0, #-1		        @ move -1 into ouput register for no found index error
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr    	            @ back to the main where it is called

    .end
