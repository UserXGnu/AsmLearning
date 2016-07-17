.text
 	.globl strlen
	.type strlen, @function

strlen:
 	push 	%rbp
	mov 	%rsp, %rbp

	xor 	%rax, %rax
	xor 	%rcx, %rcx
	not 	%rcx

 	cld 

	push 	%rdi

	repne 	scasb 

	not 	%rcx
	pop 	%rdi


	mov 	%rcx, %rax
	mov 	%rbp, %rsp
	pop 	%rbp
	ret

