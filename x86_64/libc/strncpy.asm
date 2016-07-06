[BITS 64]

section .text
    global strncpy

strncpy:
    push    rbp
    mov     rbp, rsp

    xor     rcx, rcx

    strncpy_loop:
        mov     al, byte [rsi + rcx * 1]
        mov     [rdi], rax
        cmp     rcx, rdx
        je      strncpy_end
        inc     rcx
        inc     rdi
        jmp     strncpy_loop

    strncpy_end:
        sub     rdi, rcx
        mov     rdi, rax

        mov     rsp, rbp
        pop     rbp
        ret

