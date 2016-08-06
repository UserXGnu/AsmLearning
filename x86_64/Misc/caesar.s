#caesar crypto function

.text
 	.globl encrypt
	.type encrypt, @function


encrypt:
 	push 	%rbp
	mov 	%rsp, %rbp

 	xor 	%rcx, %rcx
	xor 	%rax, %rax

	.Loop_crypt:
	 	cmpb 	$0x00, (%rdi, %rcx, 1)
		je 		.Lcrypt_end
	
		leaq 	(%rdi, %rcx, 1),  %rax
		cmpb 	$0x41, (%rax)
		jge 	.LCap
		.Loop_continue:
 			inc 	%rcx
			xor 	%rax, %rax
			jmp 	.Loop_crypt
		
	.Lcrypt_end:
	 	mov 	%rbp, %rsp
		pop 	%rbp
		ret
	 	

	.LCap:
	 	cmpb  	$0x5a, (%rax)
 		jg 		.Ltest_range
		.LCap_continue:
			add 	%rsi, (%rax)
			cmpb 	$0x5a, (%rax)
			jg 		.Lfix
			jmp 	.Loop_continue 

	.Ltest_range:
	 	cmpb 	$0x60, (%rax)
		jle 	.Loop_continue
 		jg  	.Lower_case
		jmp 	.LCap_continue

	.Lfix:
	 	sub 	$0x5a, (%rax)
		add 	$0x40, (%rax)
		jmp 	.Loop_continue 

 	.Lower_case:
		cmpb 	$0x7b, (%rax)
 		jge 	.Loop_continue
		add 	%rsi, (%rax)
		cmpb 	$0x7b, (%rax)
		jge 	.Lower_fix
		jmp 	.Loop_continue

	.Lower_fix:
	 	sub 	$0x7a, (%rax)
		add 	$0x60, (%rax)
 		jmp 	.Loop_continue



