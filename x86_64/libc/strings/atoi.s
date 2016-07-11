.text
    .globl atoi
    .type atoi, @function


atoi:
    push    %rbp
    mov     %rsp, %rbp

 	xor 	%rcx, %rcx
	push 	%rcx 

 	/*
	 * int n = 0;
	 * for (int i = 0; i < 3; i++) {
	 * 		n = n * 10 + (num[i] - 0x30);
	 * }
	 */
	.atoi_loop:
		cmpb  	$0x00, (%rdi, %rcx, 1)
 		je 		.atoi_end

 		# n = n * 10
 		pop 	%rdx
		imul 	$0xa, %rdx, %rdx
 		push 	%rdx

		xor 	%rdx, %rdx 

		# n = n + (num[i] - 0x30
		mov 	(%rdi, %rcx, 1), %dl
		sub 	$0x30, %rdx
		pop 	%rax 
		add 	%rdx, %rax 
		push 	%rax 
		inc 	%rcx 
		jmp 	.atoi_loop
 		
 	.atoi_end:
 		pop 	%rax 

 		mov 	%rbp, %rsp
		pop 	%rbp
		ret




    
