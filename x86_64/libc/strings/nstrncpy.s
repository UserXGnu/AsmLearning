.text
 	.globl strncpy
	.type strncpy, @function

strncpy:
 	push 	%rbp
	mov 	%rsp, %rbp

	movq 	%rdx, %rcx
 	
	cld 
	repnz   movsb 

 	mov 	%rbp, %rsp
	pop 	%rbp
	ret
