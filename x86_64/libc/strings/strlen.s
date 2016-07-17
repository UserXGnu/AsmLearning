.text
 	.globl strlen
 	.type strlen, @function

strlen:
 	push  	%rbp
	mov 	%rsp, %rbp 

	xor 	%rax, %rax 
 	
	strlen_loop:
		cmpb   	$0x00, (%rdi, %rax, 1)
		je  	strlen_return 
		inc 	%rax
		jmp  	strlen_loop

	strlen_return:
		mov 	%rbp, %rsp
		pop 	%rbp
		ret 
		


    

	
