%include "asm_io.inc"

segment .data
    num1    dd  10          
    num2    dd  25   
    result  dd  0          

segment .text
    global asm_main

asm_main:
    enter   0,0           
    pusha

    mov     eax, [num1]
    add     eax, [num2] 
    mov     [result], eax 
    
    call    print_int       
    call    print_nl  

    popa                
    mov     eax, 0          
    leave
    ret
