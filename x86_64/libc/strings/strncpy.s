.text
    .globl strncpy
    .type  strncpy, @function

/* char * strncpy (char * dest, const char * str, size_t n); */
strncpy:
    push    %rbp
    mov     %rsp, %rbp

    xor     %rcx, %rcx

    strncpy_loop:
        mov     (%rsi, %rcx, 1), %rax
        mov     %rax, (%rdi)
        cmp     %rdx, %rcx
        je      strncpy_end
        inc     %rdi
        inc     %rcx
        jmp     strncpy_loop 

    strncpy_end:
        sub     %rdi, %rcx
        mov     %rdi, %rax

        mov     %rbp, %rsp
        pop     %rbp
        ret
        
    

    


