#Based on liveoverflow chall:
# https://github.com/LiveOverflow/liveoverflow_youtube/blob/master/0x07_0x08_uncrackable_crackme/license_2.c

.data
 	SERIAL: 
	 	.asciz "Enter with the with a serial-key:"
 	CHECKING:
	 	.asciz "Checking License: %s\n"
 	GRANTED:
	 	.asciz "+ Access Granted!\nPlease send the keygen source code produced by you through mail solution [!!]"
	DENIED:
	 	.asciz "- [Invalid serial number] Access Denied!\n"
	USAGE:
	 	.asciz "usage: ./chall <serial-key>\n"


.text
 	.globl main
	.globl stripstring
	.type main, @function
	.type stripstring, @function

main:
 	push 	%rbp
	movq 	%rsp, %rbp

	sub 	$0x48, %rsp

 	mov 	$SERIAL, %rdi
	call 	puts

	movq 	$0x00, %rdi
	lea  	-0x40(%rbp), %rsi
	movq 	$0x40, %rdx
	mov 	$0x00, %rax
	syscall
 	
	mov 	%rsi, %rdi
	call 	stripstring


 	mov 	$CHECKING, %rdi
	xor 	%rax, %rax
	call 	printf

	lea 	-0x40(%rbp), %rdi

	xor 	%rcx, %rcx
 	xor 	%rax, %rax
	mov 	%rax, -0x48(%rbp)

	#Looping
	.Loop_sum:
	 	cmpb 	$0x00, (%rdi, %rcx, 1)
		je 		.Loop_sum_end
	 	movb 	(%rdi, %rcx, 1), %al
		addl  	%eax, -0x48(%rbp)
		inc 	%rcx
	 	jmp 	.Loop_sum

.Loop_sum_end:
 	mov 	-0x48(%rbp), %rax
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
 
 
stripstring:
 	push 	%rbp
	mov 	%rsp, %rbp

 	xor 	%rcx, %rcx

	.Loop_strip:
	 	cmpb 	$0x0a, (%rdi, %rcx, 1)
 		je 		.Lstrip_end
		inc 	%rcx 
		jmp 	.Loop_strip

.Lstrip_end:
 	movb 	$0x00, (%rdi, %rcx, 1)
 	
	mov 	%rbp, %rsp
	pop 	%rbp
	ret

