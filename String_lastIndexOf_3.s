/* --String_lastIndexOf_3.s */
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = string to be checked for
@ Outputs      r0 = integer of the last index where the string is found, if not found then -1 is returned
@ 

	.data
						
	.global			String_lastIndexOf_3			
																											
	.text

String_lastIndexOf_3:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    ldrb    r4, [r0, #0]        @ store first character for comparison later 
    mov     r2, #0              @ set counter to 0
    mov     r6, #0              @ storing counter
    mov     r7, #0              @ counter for 2nd string
    
loopRev:
    ldrb    r3, [r0, r2]        @ load character pointed to by r0
    cmp     r3, #0	            @ compare to find null termination
    beq	    loop		        @ go to main loop
    add     r2, #1              @ increment r2 by 1
    b       loopRev             @ back to loop
    
loop:
    mov     r7, #0              @ reset second string index to 0
    ldrb    r3, [r0, r2]        @ load character pointed to by r0
    ldrb    r5, [r1, #0]        @ load first character pointed to by r1
    cmp     r5, r3              @ compare character to character passed by user
    moveq   r6, r2              @ save place and send index to r6 for firstFound loop
    beq     firstFound          @ if first character is found jump to first found loop
    cmp     r2, #0              @ check if we have reached front of string
    beq     exitNoSln           @ go to exit without found character
    sub     r2, #1              @ decrement index by 1 going back to front
    b       loop                @ go again if not found yet and not at front of 1st string
    
firstFound:
    add     r6, #1              @ increment the string pointer by 1
    add     r7, #1              @ increment the second string pointer by 1
    ldrb    r3, [r0, r6]        @ load character pointed to by r0
    ldrb    r5, [r1, r7]        @ load character pointed to by r1
    cmp     r5, #0              @ check if second string is over
    beq     exit                @ if second string finished then exit
    cmp     r3, r5              @ check if character found matches
    subne   r2, #1              @ if no match decrement original string pointer
    bne     loop                @ go back to loop if not found
    b       firstFound          @ back to firstFound loop
    
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
