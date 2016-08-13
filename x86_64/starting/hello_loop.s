.macro rloop reg, label
 	dec 	\reg
 	cmp 	$0x00, \reg
	jnz 	\label
.endm

.data
 	Hello: .asciz "Hello World\n"
	len: .int 12

.text
 	.globl main
	.type main, @function

main:
 	push 	%rbp
	mov 	%rsp, %rbp

 	mov 	$0x0a, %rbx 

 	main_loop: 
 		mov 	$0x01, %rax
		mov 	$0x01, %rdi
		mov 	$Hello, %rsi
		mov 	$len, %rdx
		mov 	(%rdx), %rdx
		syscall

 		rloop 	%rbx, main_loop

	mov 	%rbp, %rsp
	pop 	%rbp
	ret

