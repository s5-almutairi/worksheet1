%include "asm_io.inc"

segment .data
    prompt_num      db  "How many times to print welcome? (50-100): ", 0
    error_small     db  "Error: Number too small! Must be >= 50", 0
    error_large     db  "Error: Number too large! Must be <= 100", 0
    welcome_msg     db  "Welcome to Operating Systems!", 0

segment .bss
    count   resd 1

segment .text
    global asm_main

asm_main:
    enter   0,0
    pusha

    mov     eax, prompt_num
    call    print_string
    call    read_int
    mov     [count], eax
    
    cmp     eax, 50
    jl      error_too_small
    
    cmp     eax, 100
    jg      error_too_large
    
    mov     ecx, [count]
print_loop:
    mov     eax, welcome_msg
    call    print_string
    call    print_nl
    loop    print_loop
    
    jmp     done

error_too_small:
    mov     eax, error_small
    call    print_string
    call    print_nl
    jmp     done

error_too_large:
    mov     eax, error_large
    call    print_string
    call    print_nl
    jmp     done

done:
    popa
    mov     eax, 0
    leave
    ret
