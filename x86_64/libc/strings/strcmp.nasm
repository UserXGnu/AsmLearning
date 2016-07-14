[BITS 64]

section .text
    global strcmp

strcmp:
    push    rbp
    mov     rbp, rsp

    xor     rax, rax
    xor     rdx, rdx
    xor     rcx, rcx

    .strcmp_loop:
        cmp     byte [rdi + rcx * 1], 0x00
        je      .strcmp_loop_end
        mov     al, byte [rdi + rcx * 1]
        mov     dl, byte [rsi + rcx * 1]
        cmp     dl, al
        jl      .strcmp_less
        jg      .strcmp_greater
        inc     rcx
        cmp     byte [rsi + rcx * 1], 0x00
        je      .strcmp_loop_end
        jmp     .strcmp_loop

    .strcmp_less:
        mov     rax, -0x01
        jmp     .strcmp_end

    .strcmp_greater:
        mov     rax,0x01
        jmp     .strcmp_end 

    .strcmp_loop_end:
        mov     rax, 0x00
        jmp     .strcmp_end

    .strcmp_end:
        mov     rsp, rbp
        pop     rbp
        ret 
        

    

