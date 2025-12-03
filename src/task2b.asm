%include "asm_io.inc"

segment .data
    result_msg  db "Sum of array (1-100) is: ", 0

segment .bss
    array   resd 100
    sum     resd 1

segment .text
    global asm_main

asm_main:
    enter   0,0
    pusha

    mov     ecx, 100
    mov     edi, array
    mov     eax, 1
init_loop:
    mov     [edi], eax
    add     edi, 4
    inc     eax
    loop    init_loop
    
    mov     ecx, 100
    mov     esi, array
    xor     eax, eax
sum_loop:
    add     eax, [esi]
    add     esi, 4
    loop    sum_loop
    
    mov     [sum], eax
    
    mov     eax, result_msg
    call    print_string
    mov     eax, [sum]
    call    print_int
    call    print_nl

    popa
    mov     eax, 0
    leave
    ret
