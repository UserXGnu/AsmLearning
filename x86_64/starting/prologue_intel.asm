; To compile use nasm and gcc as follow:
; nasm -felf64 beginning_intel_gcc.asm  -o beginning_intel_gcc.o
; gcc beginning_intel_gcc.o -o beginning_intel_gcc 

[BITS 64]


section .text
 	global main

main:
 	; Prologue
 	push 	rbp
	mov 	rbp, rsp

	; TODO
	
 	; Epilogue
	mov 	rsp, rbp
	pop 	rbp
	ret

