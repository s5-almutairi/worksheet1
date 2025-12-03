%include "asm_io.inc"

segment .data
prompt_start    db "Enter start index (1-100): ", 0
prompt_end      db "Enter end index (1-100): ", 0
error_range     db "Invalid range. Start must be >=1, end <=100, and start <= end.", 10, 0
msg_sum         db "Range sum = ", 0

segment .bss
numbers         resd 100
start_index     resd 1
end_index       resd 1

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

    mov eax, prompt_start
    call print_string
    call read_int
    mov [start_index], eax

    mov eax, prompt_end
    call print_string
    call read_int
    mov [end_index], eax

    mov eax, [start_index]
    cmp eax, 1
    jl .range_error
    cmp eax, 100
    jg .range_error
    mov ebx, [end_index]
    cmp ebx, eax
    jl .range_error
    cmp ebx, 100
    jg .range_error

    mov ecx, ebx
    sub ecx, eax
    inc ecx

    dec eax
    mov esi, numbers
    lea esi, [esi + eax*4]
    xor eax, eax
.sum_loop:
    add eax, [esi]
    add esi, 4
    loop .sum_loop

    mov ebx, eax
    mov eax, msg_sum
    call print_string
    mov eax, ebx
    call print_int
    call print_nl
    jmp .done

.range_error:
    mov eax, error_range
    call print_string

.done:
    popa
    mov eax, 0
    leave
    ret

