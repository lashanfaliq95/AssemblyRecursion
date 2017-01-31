@ ARM Assembly - exercise 6
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
mypow:

SUB sp,sp,#8
STR lr,[sp,#4]
STR r0,[sp,#0]
CMP r1,#0  @(n,0) 
BNE L1

MOV r0,#1   @ return 1
ADD sp,sp,#8
MOV pc,lr

L1:
   SUB r1,r1,#1  @n--;
   BL  mypow
   
   MOV r12,r0  @putting return of recursive to r12
   LDR r0,[sp,#0]
   LDR lr,[sp,#4]
   ADD sp,sp,#8

   MUL r2,r0,r12
   MOV r0,r2
   MOV pc,lr

@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #8 	@the value x
	mov r5, #3 	@the value n
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl mypow
	mov r6,r0
	

	@ load aguments and print
	ldr r0, =format
	mov r1, r4
	mov r2, r5
	mov r3, r6
	bl printf

	@ stack handling (pop lr from the stack) and return
	ldr lr, [sp, #0]
	add sp, sp, #4
	mov pc, lr

	.data	@ data memory
format: .asciz "%d^%d is %d\n"

