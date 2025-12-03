%include "asm_io.inc"

segment .data
prompt_name     db "Enter your name (max 63 chars): ", 0
prompt_count    db "How many welcomes? (51-99): ", 0
error_range     db "Value must be greater than 50 and less than 100.", 10, 0
greet_prefix    db "Welcome ", 0
greet_suffix    db "!", 0

segment .bss
name_buffer     resb 64
greet_count     resd 1

segment .text
global asm_main

asm_main:
    enter 0, 0
    pusha

    mov eax, prompt_name
    call print_string
    mov edi, name_buffer
    mov ecx, 63
.read_name_loop:
    call read_char
    cmp eax, 10          ; newline?
    je .terminate_name
    cmp ecx, 0
    je .read_name_loop   ; discard extra chars
    mov [edi], al
    inc edi
    dec ecx
    jmp .read_name_loop

.terminate_name:
    mov byte [edi], 0

    mov eax, prompt_count
    call print_string
    call read_int
    mov [greet_count], eax

    cmp eax, 51
    jl .range_error
    cmp eax, 99
    jg .range_error

    mov ecx, [greet_count]
.greet_loop:
    mov eax, greet_prefix
    call print_string
    mov eax, name_buffer
    call print_string
    mov eax, greet_suffix
    call print_string
    call print_nl
    loop .greet_loop
    jmp .done

.range_error:
    mov eax, error_range
    call print_string

.done:
    popa
    mov eax, 0
    leave
    ret

