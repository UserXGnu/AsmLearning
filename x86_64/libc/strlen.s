.text
 	.globl strlen
 	.type strlen, @function

strlen:
 	push  	%rbp
	mov 	%rsp, %rbp 

	xor 	%rcx, %rcx 
 	
	strlen_loop:
		cmpb   	$0x00, (%rdi, %rcx, 1)
		je  	strlen_return 
		inc 	%rcx
		jmp  	strlen_loop

	strlen_return:
		mov 	%rcx, %rax 	 	# return value to rax

		mov 	%rbp, %rsp
		pop 	%rbp
		ret 
		


    

	
