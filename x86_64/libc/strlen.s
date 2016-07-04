.text
 	.globl strlen
 	.type strlen, @function

strlen:
 	push  	%rbp
	mov 	%rsp, %rbp 

	xor 	%rcx, %rcx 
 	
	loop:
		cmpb   	$0x00, (%rdi, %rcx, 1)
		je  	return 
		inc 	%rcx
		jmp  	loop

	return:
		mov 	%rcx, %rax 	 	# return value to rax

		mov 	%rbp, %rsp
		pop 	%rbp
		ret 
		


    

	
