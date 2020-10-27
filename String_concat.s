/* --String_concat.s */
@ String index function
@ Requirements r0 = address of string to be searched
@	           r1 = address of string to be added to the first string
@ Outputs      r0 = address of the concatonated string
@ 

	.data
						
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

    .end
