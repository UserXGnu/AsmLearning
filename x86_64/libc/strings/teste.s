.data
 	fmt:
		.asciz "%d\n"

.text
 	.globl main
	.type main, @function

main:
 	push  	%rbp
	mov 	%rsp, %rbp

	sub 	$0x04, %rsp

	mov 	%rsp, %rax
	movq 	$0x80, (%rax)

	mov 	$fmt, %rdi
	mov 	(%rax), %rsi
	xor 	%rax, %rax
	call 	printf 

	mov 	%rbp, %rsp
	pop 	%rbp
	ret


