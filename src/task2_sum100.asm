%include "asm_io.inc"

segment .data
msg_total       db "Sum of numbers 1..100 = ", 0

segment .bss
numbers         resd 100

segment .text
global asm_main

asm_main:
    enter 0, 0
    pusha

    mov ecx, 100
    mov edi, numbers
    mov eax, 1
.init_loop:
    mov [edi], eax
    add edi, 4
    inc eax
    loop .init_loop

    mov ecx, 100
    mov esi, numbers
    xor eax, eax
.sum_loop:
    add eax, [esi]
    add esi, 4
    loop .sum_loop

    mov ebx, eax
    mov eax, msg_total
    call print_string
    mov eax, ebx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret

