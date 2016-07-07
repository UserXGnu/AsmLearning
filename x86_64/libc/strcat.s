.text
    .globl strcat
    .type strcat, @function

strcat:
    push    %rbp
    mov     %rsp, %rbp

    xor     %rcx, %rcx
    xor     %rax, %rax

    push    %rdi

    strcat_loop:
        movb    (%rdi), %al 
        cmpb    $0x0, %al
        je      proper_strcat
        inc     %rdi
        jmp     strcat_loop

        proper_strcat:
            movb    (%rsi, %rcx, 1), %al
            movb    %al, (%rdi, %rcx, 1)
            cmpb    $0x0, %al
            je      strcat_end
            inc     %rcx
            jmp     proper_strcat

    strcat_end:
        pop     %rax

        mov     %rbp, %rsp
        pop     %rbp
        ret



