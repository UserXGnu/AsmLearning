#Based on liveoverflow chall:
# https://github.com/LiveOverflow/liveoverflow_youtube/blob/master/0x07_0x08_uncrackable_crackme/license_2.c

.data
 	CHECKING:
	 	.asciz "Checking License: %s\n"
 	GRANTED:
	 	.asciz "+ Access Granted!\n"
	DENIED:
	 	.asciz "- Access Denied!\n"
	USAGE:
	 	.asciz "usage: ./chall <serial-key>\n"


.text
 	.globl main
	.type main, @function


main:
 	push 	%rbp
	movq 	%rsp, %rbp

	sub 	$0x30, %rsp

 	# managing the argc and argv thing
	movl 	%edi, -0x24(%rbp)
	movq	%rsi, -0x30(%rbp)

 	# verifying the argc's
	cmpl 	$0x02, -0x24(%rbp)
	jne 	.Lmain_error

	mov 	-0x30(%rbp), %rax
	add 	$0x08, %rax
	mov 	(%rax), %rax

 	push 	%rax

 	mov 	$CHECKING, %rdi
	mov 	%rax, %rsi
	xor 	%rax, %rax
	call 	printf
 	
	pop 	%rdi

	xor 	%rcx, %rcx
 	xor 	%rax, %rax
	mov 	%rax, -0x8(%rbp)

	#Looping
	.Loop_sum:
	 	cmpb 	$0x00, (%rdi, %rcx, 1)
		je 		.Loop_sum_end
	 	movb 	(%rdi, %rcx, 1), %al
		addl  	%eax, -0x08(%rbp)
		inc 	%rcx
	 	jmp 	.Loop_sum

.Loop_sum_end:
 	mov 	-0x08(%rbp), %rax
	cmpq 	$0x400, %rax
	jne 	.Lwrong

	movq 	$GRANTED, %rdi
	call 	puts
	jmp 	.Lmain_end

.Lwrong:
	movq 	$DENIED, %rdi
	call 	puts 
	jmp 	.Lmain_end

.Lmain_error:
 	mov 	$USAGE, %rdi
	call 	puts
 	
.Lmain_end:
 	xor  	%rax, %rax
	mov 	%rbp, %rsp
	pop 	%rbp
	ret
 	

 	
 	

	
