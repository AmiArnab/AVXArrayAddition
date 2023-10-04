# avx_array_addition.s

.section .text
.global addArraysAVX

addArraysAVX:
    # Function prologue
    pushq   %rbp
    movq    %rsp, %rbp

    movq    %rcx, %rax               # Load size into rax
    testq   %rax, %rax               # Check if size is zero
    jz      .exit

.loop:

    movdqu   (%rdi), %xmm0
    movdqu   (%rsi), %xmm1

    vpaddw   %xmm1, %xmm0, %xmm2
    movdqu   %xmm2, (%rdx)

    addq    $16, %rdi                # Move to the next 4 integers (4 bytes each)
    addq    $16, %rsi
    addq    $16, %rdx

    subq    $4, %rax                 # Decrement the loop counter
    jnz     .loop

.exit:
    # Function epilogue
    movq    %rbp, %rsp
    popq    %rbp
    ret
