.data
 	str1:
	 	.asciz "Where there's a shell, there's a way!\n"
	str2:
	 	.asciz "Where there's a shell, there's a way!\n"
	equal:
	 	.asciz "Equal\n"
	nequal:
		.asciz "not equal\n"

.text
 	.globl  main
 	.globl 	compare 
	.type 	compare, @function


main:
 	push 	%rbp
	mov 	%rsp, %rbp

	call 	compare
 	cmp 	$0x01, %rax
	jne 	.Lequal
 	je 		.Lnequal
	
	.Lmain_end:
		xor 	%rax, %rax
		
		mov 	%rbp, %rsp
		pop 	%rbp
		retq

 	.Lequal:
	 	mov $equal, %rdi
		xor %rax, %rax
		call printf
		jmp  .Lmain_end

	.Lnequal:
	 	mov $nequal, %rdi
		xor %rax, %rax
		call printf
		jmp  .Lmain_end 

	 	
#int compare (const char * src, const char * dst);
compare:
 	push 	%rbp
	mov 	%rsp, %rbp


 	cld 
	mov 	$str1, %rdi 
	call 	len
	movq 	%rax, %rcx
	movq 	%rdi, %rsi
	mov 	$str2, %rdi
	cld 
	cmp 	$0x00, %rbp
 	repz  	cmpsb
	cmp 	$0x00, %rcx
	jg 		.Lesser
	
 	movq  	$0x00, %rax 
	
	.Lend:
		movq 	%rbp, %rsp
		pop 	%rbp
		retq

	.Lesser:
	 	movq $0x01, %rax
		jmp 	.Lend



# size_t len (const char * string);
len:
 	push 	%rbp
	movq 	%rsp, %rbp

	xor 	%rax, %rax
 	xor 	%rcx, %rcx
	not 	%rcx
 	
	cmp 	$0x00, %rbp
	 
	repnz  	scasb
	not 	%rcx
	movq 	%rcx, %rax
 	
	sub 	%rcx, %rdi

	movq  	%rbp, %rsp
	pop 	%rbp 
 	ret


