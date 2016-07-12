[BITS 64]

section .text
 	global 	atoi 

atoi:
 	push 	rbp
	mov 	rbp, rsp

 	xor 	rcx, rcx 
 	push 	rcx
 
  	.atoi_loop:
		cmp 	byte [rdi + rcx * 1], 0x00
 		je 		.atoi_end
 	
	 	pop 	rdx
		imul 	rdx, rdx, 0x0a
		push 	rdx
		xor 	rdx, rdx

		mov 	dl, byte [rdi + rcx * 1 ]
		sub 	rdx, 0x30
		pop 	rax
		add 	rdx, rax
		push 	rdx
		inc 	rcx
		jmp 	.atoi_loop 
		
	.atoi_end:
	 	pop 	rax

		mov 	rsp, rbp
		pop 	rbp
		ret 

