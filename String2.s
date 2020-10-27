@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be checked against string
@ Outputs      r0 = integer of the index where the character is found, if not found then -1 is returned
@ 
						
	.global			String_indexOf	
  
  .text
  
String_indexOf:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    mov     r2, #0              @ start our counter at 0    
loop:
    ldrb    r3, [r0, r2]        @ load character pointed to by r0
    cmp     r1, r3              @ compare character to character passed by user
    beq     exit                @ go to end and return size 
    cmp     r3, #0	        @ compare to find null termination
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
    bx      lr    	        @ back to the main where it is called
    

@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be checked against string
@              r2 = index to start searching from
@ Outputs      r0 = integer of the index where the character is found, if not found then -1 is returned
@ 

						
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


@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = string to be checked for
@ Outputs      r0 = integer of the last index where the string is found, if not found then -1 is returned
@ 
						
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
    
    
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be checked against string
@ Outputs      r0 = integer of the last index where the character is found, if not found then -1 is returned
@ 

						
	.global			String_lastIndexOf			

  .text
    
String_lastIndexOf:
    push {r4-r8, r10, r11}      @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    mov     r2, #0              @ start our counter at 0
    ldrb    r4, [r0, #0]        @ store first character for comparison later    
    
loopRev:
    ldrb    r3, [r0, r2]        @ load character pointed to by r0
    cmp     r3, #0	        @ compare to find null termination
    beq	    loop		@ go to main loop
    add     r2, #1              @ increment r2 by 1 
    b       loopRev             @ back to loop
    
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
    bx      lr    		@ back to the main where it is called

exitNoSln:
    mov     r0, #-1		@ move -1 into ouput register for no found index error

    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11}       @ pop the preserved regiesters for aapcs
    bx      lr    	        @ back to the main where it is called
    
    
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = character to be checked against string
@              r2 = index to check from to the front
@ Outputs      r0 = integer of the last index where the character is found, if not found then -1 is returned
@ 
						
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
    
   
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = string to be checked for
@ Outputs      r0 = integer of the last index where the string is found, if not found then -1 is returned
@ 

						
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
    
    
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = address of string to be added to the first string
@ Outputs      r0 = address of the concatonated string
@ 
				
	.global			String_concat			
																											
	.text

String_concat:
    push {r4-r8, r10, r11, lr}  @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    mov     r7, r0              @ move string to diff register to call length
    mov     r8, r1              @ move string to diff register to call length
    bl      String_Length       @ call string length and store length in r0
    mov     r4, r0              @ store length in r4 for later
    mov     r0, r8              @ move string over to r0 register for length
    bl      String_Length       @ call string length and store length in r0
    mov     r5, r0              @ store length in r5 for later
    add     r0, r4              @ add both length and store in r0
    add     r0, #3              @ add extra length
    bl      malloc              @ allocate memory
    mov     r3, r0              @ store pointer to allocated memory in r8 for returning final address
    mov     r6, r0              @ save pointer in r6 as well for use immediately
    
loop:
    cmp     r4, #0              @ check if done copying
    beq     secondLoop          @ branch to second loop for second string copy
    ldrb    r0, [r7], #1        @ load byte pointed to by r2, index by 1 each time
    strb    r0, [r6], #1        @ store byte pointed to by r2 in r6, index by 1 each time
    sub     r4, #1              @ decrement our counter
    b       loop                @ back to loop

secondLoop:
    cmp     r5, #0              @ check if done copying second string
    beq     exit                @ branch to exit if done copying
    ldrb    r0, [r8], #1        @ load byte pointed to by r3, index by 1 each time
    strb    r0, [r6], #1        @ store byte pointed to by r2 in r6, index by 1 each time
    sub     r5, #1              @ decrement second string counter by 1
    b       secondLoop
    
exit:
    mov     r0, r3              @ move concatonated string address to output 
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11, lr}   @ pop the preserved regiesters for aapcs
    bx      lr    		        @ back to the main where it is called
   
   
////////////////////////////////////////////////// STRING REPLACE GOES HERE //////////////////////////////////////////////


@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = address of string to be added to the first string
@ Outputs      r0 = address of the concatonated string
@ 

						
	.global			String_concat			

	.text

String_concat:
    push {r4-r8, r10, r11, lr}  @ push preserved registers for aapcs
    push {sp}                   @ push stack pointer
    
    mov     r7, r0              @ move string to diff register to call length
    mov     r8, r1              @ move string to diff register to call length
    bl      String_Length       @ call string length and store length in r0
    mov     r4, r0              @ store length in r4 for later
    mov     r0, r8              @ move string over to r0 register for length
    bl      String_Length       @ call string length and store length in r0
    mov     r5, r0              @ store length in r5 for later
    add     r0, r4              @ add both length and store in r0
    add     r0, #3              @ add extra length
    bl      malloc              @ allocate memory
    mov     r3, r0              @ store pointer to allocated memory in r8 for returning final address
    mov     r6, r0              @ save pointer in r6 as well for use immediately
    
loop:
    cmp     r4, #0              @ check if done copying
    beq     secondLoop          @ branch to second loop for second string copy
    ldrb    r0, [r7], #1        @ load byte pointed to by r2, index by 1 each time
    strb    r0, [r6], #1        @ store byte pointed to by r2 in r6, index by 1 each time
    sub     r4, #1              @ decrement our counter
    b       loop                @ back to loop

secondLoop:
    cmp     r5, #0              @ check if done copying second string
    beq     exit                @ branch to exit if done copying
    ldrb    r0, [r8], #1        @ load byte pointed to by r3, index by 1 each time
    strb    r0, [r6], #1        @ store byte pointed to by r2 in r6, index by 1 each time
    sub     r5, #1              @ decrement second string counter by 1
    b       secondLoop
    
exit:
    mov     r0, r3              @ move concatonated string address to output 
    
    pop	{sp}                    @ pop stack pointer
    pop	{r4-r8, r10, r11, lr}   @ pop the preserved regiesters for aapcs
    bx      lr    		        @ back to the main where it is called
    
    
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
	cmp		r0, #97			@ check character to lowercase a
	addlt	r0, #32			@ add 32 to make character lowercase if found to be uppercase
	strb	r0, [r3], #1	@ store the character back to the string 	
	sub		r6, #1			@ decrement length
	b		loop

end:
	mov 	r0, r4			@ move address to r0 for return
	
	pop	{lr}				@preservs the link register for recursion
	pop	{sp}				@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr					@end of function
    
@ String_toUpperCase
@ Requirements: r0 = address of string to be converted to lowercase
@			
@ Outputs: 		r0 = address of converted string
@ Purpose: to convert a string to lowercase
	
	.global String_toUpperCase	@provide program starting address to linker

	.text

String_toUpperCase:
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
	cmp		r0, #97			@ check character to lowercase a
	subgt	r0, #32			@ subtract 32 to make character uppercase if found to be lowercase
	strb	r0, [r3], #1	@ store the character back to the string 	
	sub		r6, #1			@ decrement length
	b		loop

end:
	mov 	r0, r4			@ move address to r0 for return
	
	pop	{lr}				@preservs the link register for recursion
	pop	{sp}				@preserve stack pointer
	pop	{r4-r8, r10, r11}	@preserve registers

	bx lr					@end of function
    
