.text
    .globl  strncat
    .type   strncat, @function


strncat:
    push    %rbp
    mov     %rsp, %rbp

    xor     %rcx, %rcx
    xor     %rax, %rax

    push    %rbx
    xor     %rbx, %rbx

    strncat_loop:
        movb     (%rdi, %rcx, 1), %al
        cmp      $0x00, %al
        je       proper_strncat
        inc      %rcx
        jmp      strncat_loop

        proper_strncat: 
            mov     (%rsi, %rbx, 1), %al
            mov     %al, (%rdi, %rcx, 1)
            cmp     %rbx, %rdx
            je      strncat_end
            inc     %rbx
            inc     %rcx
            jmp     proper_strncat

    strncat_end:
        pop     %rbx

        mov     %rdi, %rax

        mov     %rbp, %rbp
        pop     %rbp
        ret
