/* --String_replace.s */
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be replaced
@              r2 = character to replace with
@ Outputs      r0 = address of string with replacements
@ 

	.data
						
	.global			String_replace			
																											
	.text

String_replace:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    mov     r4, #0              @ start our counter at 0    
    
loop:
    ldrb    r3, [r0, r4]        @ load character pointed to by r0
    cmp     r1, r3              @ compare character to character passed by user
    streqb  r2, [r0, r4]        @ write character to place if found to be replaceable 
    cmp     r3, #0	            @ compare to find null termination
    beq	    exit		        @ go to no findings exit branch
    add     r4, #1              @ increment r2 by 1 
    b       loop                @ back to loop
    
exit:
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr    		        @ back to the main where it is called
    
    .end
