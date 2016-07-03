/*
 * @ note
 *  	Use gcc.
 *
 *  	gcc beginning_att.s -c 
 *  	gcc beginning_att.s -o beginning_att 
 */

.text
 	.globl main
	.type main, @function

main:
 	// prologue
 	push  	%rbp
	mov  	%rsp, %rbp

	// TODO
	
	// epilogue
	mov 	%rbp, %rsp  
	pop 	%rbp 
	ret
