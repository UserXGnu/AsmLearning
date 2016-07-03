.text
 	.globl _start

_start:
 	// Prologue
 	push  	$rbp
	mov 	%rsp, %rbp

	// TODO
	
	// I don't know epilogue without gcc yet. It seems not to work well 
	// with _start function.
 	mov  	$60, %rax
	mov 	$0x00, %rdi
	syscall
