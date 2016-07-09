.text
    .globl strncpy
    .type strncpy, @function

strncpy:
    push    %rbp
    mov     %rsp, %rbp

    mov     %rdx, %rcx

    rep     movsb

    mov     %rdi, %rax

    mov     %rsp, %rbp
    pop     %rbp
    ret
