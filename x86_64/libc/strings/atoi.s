.data
 	fmt:
 		.asciz "%d\n"
	ask:
	 	.asciz "Type a number: "
	str_fmt:
	 	.asciz "%s\n"
	 	
	 	

.text
    .globl atoi
#    .globl main
    .type atoi, @function
/*

main: 
    push    %rbp
    mov     %rsp, %rbp

    sub     $0x10, %rsp

 	mov 	$0x1, %rdi 
	mov 	$ask, %rsi
	mov 	$0xf, %rdx
	mov 	$0x1, %rax
	syscall

  	# read (int fd, void * buf, size_t size)
	mov 	$0x0, %rax   	# syscall number 
	mov 	$0x0, %rdi   	# fileno(stdin) = 0
	mov 	%rsp, %rsi  	# buf 
	mov 	$0x3, %rdx 		# size 
	syscall

 	mov 	$0x03, %rcx
 	movb 	$0x00, (%rsi, %rcx, 1)

	mov 	%rsp, %rdi
 	call 	atoi

	mov 	$fmt, %rdi
	mov 	%rax, %rsi
	xor 	%rax, %rax
	call 	printf

	xor 	%rax, %rax

	mov 	%rbp, %rsp
	pop 	%rbp
	ret
*/


atoi:
    push    %rbp
    mov     %rsp, %rbp
	sub 	$0x10, %rsp

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
 		mov 	(%rsi), %rdx
		imul 	$0xa, %rdx, %rdx
		mov 	%rdx, (%rsi)

		xor 	%rdx, %rdx 

		# n = n + (num[i] - 0x30
		mov 	(%rdi, %rcx, 1), %dl
		sub 	$0x30, %rdx
		add 	%rdx, (%rsi)
		inc 	%rcx 
		jmp 	atoi_loop
 		
 	atoi_end:
	 	mov 	(%rsi), %rax

 		mov 	%rbp, %rsp
		pop 	%rbp
		ret




    
