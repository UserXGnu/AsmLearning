.text
 	.globl 	strcmp
	.type 	strcmp, @function

# int strcmp (const char *, const char *);
strcmp:
 	push 	%rbp
	mov 	%rsp, %rbp

	xor 	%rcx, %rcx

	.Loop_strcmp:
	 	cmpb 	$0x00, (%rdi, %rcx, 1)
		je 		.Loop_strcmp_end
 		movb 	(%rdi, %rcx, 1), %al
		movb	(%rsi, %rcx, 1), %dl
		cmpb 	%al, %dl
		jg 		.Lgreater
		jl 		.Lesser
		inc 	%rcx
		cmpb  	$0x00, (%rsi, %rcx, 1)
		jnz	 	.Loop_strcmp 
		jmp 	.Len_test

 	.Loop_strcmp_end:
	 	mov 	$0x00, %rax
		jmp 	.Lstrcmp_end

	.Lgreater:
	 	mov 	$0x01, %rax
		jmp 	.Lstrcmp_end 

	.Lesser:
	 	mov 	$-0x01, %rax
		jmp 	.Lstrcmp_end 

	.Lstrcmp_end:
	 	mov 	%rbp, %rsp
		pop 	%rbp
		ret

	.Len_test:
		movq 	%rcx, %rax
		movq 	$-0x01, %rcx

		.Len_test_loop:
		 	inc 	%rcx
			cmpb 	$0x00, (%rdi, %rcx, 1);
			jnz 	.Len_test_loop
			cmpq 	%rcx, %rax
			jg 		.Lgreater
			jl 	 	.Lesser
			je 		.Loop_strcmp_end
	 		
 				
			

	 	

 	



	

