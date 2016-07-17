.text
 	.globl 	strlen 
	.type  	strlen, @function

strlenn:
 	push 	%rbp
	mov 	%rsp, %rbp
 	
	xor  	%rax, %rax
	xor 	%rdx, %rdx
 	
	.Lstrlenn_loop:
	 	movb 	(%rdi, %rax, 1), %dl
		inc 	%rax

		cmpb 	$0x00, %dl
		jnz 		.Lstrlenn_loop
		
	.Lend:
	 	mov 	%rbp, %rsp
		pop 	%rbp
		ret
