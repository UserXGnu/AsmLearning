.text
    .globl atoi
    .type atoi, @function


atoi:
    push    %rbp
    mov     %rsp, %rbp
	sub 	$0x4, %rsp

	xor 	%rcx, %rcx

	mov 	%rsp, %rsi
	movb 	$0x00, (%rsi)

 	/*
	 * int n = 0;
	 * for (int i = 0; i < 3; i++) {
	 * 		n = n * 10 + (num[i] - 0x30);
	 * }
	 */
	atoi_loop:
		cmpb  	$0x00, (%rdi, %rcx, 1)
 		je 		atoi_end

 		# n = n * 10
 		movq 	(%rsi), %rdx
		imul 	$0xa, %rdx, %rdx
		movq  	%rdx, (%rsi)

		xor 	%rdx, %rdx 

		# n = n + (num[i] - 0x30
		mov 	(%rdi, %rcx, 1), %dl
		sub 	$0x30, %rdx
		add 	%rdx, (%rsi)
		inc 	%rcx 
		jmp 	atoi_loop
 		
 	atoi_end:
	 	movq 	(%rsi), %rax

 		mov 	%rbp, %rsp
		pop 	%rbp
		ret




    
