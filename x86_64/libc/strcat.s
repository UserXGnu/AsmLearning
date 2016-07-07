.text
    .globl nstrcat
    .type nstrcat, @function

nstrcat:
    push    %rbp
    mov     %rsp, %rbp

    xor     %rcx, %rcx
    xor     %rax, %rax

    push    %rdi

    nstrcat_loop:
        movb    (%rdi), %al 
        cmpb    $0x0, %al
        je      proper_nstrcat
        inc     %rdi
        jmp     nstrcat_loop

        proper_nstrcat:
            movb    (%rsi, %rcx, 1), %al
            movb    %al, (%rdi, %rcx, 1)
            cmpb    $0x0, (%rdi, %rcx, 1)
            je      nstrcat_end
            inc     %rcx
            jmp     proper_nstrcat

    nstrcat_end:
        pop     %rax

        mov     %rbp, %rsp
        pop     %rbp
        ret



