%include "asm_io.inc"

segment .data
    prompt_start    db "Enter start position (1-100): ", 0
    prompt_end      db "Enter end position (1-100): ", 0
    result_msg      db "Sum of range is: ", 0
    error_msg       db "Error: Invalid range!", 0

segment .bss
    array       resd 100
    start_pos   resd 1
    end_pos     resd 1
    sum         resd 1

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
    
    mov     eax, prompt_start
    call    print_string
    call    read_int
    mov     [start_pos], eax
    
    mov     eax, prompt_end
    call    print_string
    call    read_int
    mov     [end_pos], eax
    
    mov     eax, [start_pos]
    cmp     eax, 1
    jl      error
    cmp     eax, 100
    jg      error
    
    mov     eax, [end_pos]
    cmp     eax, 1
    jl      error
    cmp     eax, 100
    jg      error
    
    mov     eax, [start_pos]
    cmp     eax, [end_pos]
    jg      error
    
    mov     ecx, [end_pos]
    sub     ecx, [start_pos]
    inc     ecx
    
    mov     eax, [start_pos]
    dec     eax
    imul    eax, 4
    mov     esi, array
    add     esi, eax
    
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
    jmp     done

error:
    mov     eax, error_msg
    call    print_string
    call    print_nl

done:
    popa
    mov     eax, 0
    leave
    ret
