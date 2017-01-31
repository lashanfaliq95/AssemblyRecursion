@ ARM Assembly - exercise 6
@ 
@ Roshan Ragel - roshanr@pdn.ac.lk
@ Hasindu Gamaarachchi - hasindu@ce.pdn.ac.lk

	.text 	@ instruction memory

	
@ Write YOUR CODE HERE	

@ ---------------------	
gcd:
SUB sp,sp,#4



STR lr,[sp,#0]

CMP r1,#0 @ if(b==0)
BNE L1

@we return a(r0)
ADD sp,sp,#4
MOV pc,lr

L1:
   SUB r2,r0,r1 @k=a-b
   
   CMP r2,#0
   BLT else

   SUB r0,r0,r1 @a=a-b
   SUB r2,r0,r1 @c=a-b
   B L1

else:
   MOV r3,r1 @r3=b
   MOV r1,r0
   MOV r0,r3

   BL  gcd
   
  
  
   LDR lr,[sp,#0]
   ADD sp,sp,#4

   MOV pc,lr




@ ---------------------	

	.global main
main:
	@ stack handling, will discuss later
	@ push (store) lr to the stack
	sub sp, sp, #4
	str lr, [sp, #0]

	mov r4, #64	@the value a
	mov r5, #24	@the value b
	

	@ calling the mypow function
	mov r0, r4 	@the arg1 load
	mov r1, r5 	@the arg2 load
	bl gcd
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
format: .asciz "gcd(%d,%d) = %d\n"

