[BITS 64]

section .text
 	global strlen

strlen:
 	push 	rbp
	mov 	rbp, rsp

	xor 	rcx, rcx
 	
	strlen_loop:
	 	cmp     byte [rdi+rcx*1], 0x0
		je 		strlen_return
		inc 	rcx
		jmp 	strlen_loop

	strlen_return:
	 	mov 	rax, rcx

		mov 	rsp, rbp
		pop 	rbp
		ret


