section .text
     global strncat

strncat:
    push    rbp
    mov     rbp, rsp

    xor     rcx, rcx
    xor     rax, rax

    push    rbx
    xor     rbx, rbx
 
    strncat_loop:
        cmp     byte [rdi + rcx * 1], 0x00
        je      proper_strncat
        inc     rcx
        jmp     strncat_loop

        proper_strncat:
            mov     al, byte [rsi + rbx * 1]
            mov     byte [rdi + rcx * 1], al
            cmp     rbx, rdx
            je      strncat_end
            inc     rbx
            inc     rcx
            jmp     proper_strncat

    strncat_end:
        pop     rbx
        mov     rax, rdi

        mov     rsp, rbp
        pop     rbp
        ret
