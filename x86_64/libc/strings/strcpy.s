.text
    .globl nstrcpy
    .type nstrcpy, @function

nstrcpy:
    push    %rbp
    mov     %rsp, %rbp

    xor     %rax, %rax
    xor     %rcx, %rcx

    nstrcpy_loop:
        movb    (%rsi), %al
        mov     %rax, (%rdi)
        cmpb    $0x0, (%rdi)
        je      nstrcpy_end
        inc     %rsi
        inc     %rdi
        jmp     nstrcpy_loop

    nstrcpy_end:
        sub     %rcx, %rdi
        mov     %rdi, %rax
        
        mov     %rbp, %rsp
        pop     %rbp
        ret


