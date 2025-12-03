# Operating Systems Worksheet 1
**Student:** SAAD ALMUTAIRI   
**Student ID:** 24023383 
**Date:** December 2025

---

## Task 1: Basic Assembly Programming

### Program 1.1: Simple Addition
Adds two numbers (10 + 25) and prints result.

**Code snippet:**
```nasm
mov     eax, [num1]     
add     eax, [num2]    
call    print_int       
```

**Screenshot:**  
![worksheet1](https://github.com/user-attachments/assets/3839d1a4-d10d-491c-b504-1f4bdc374465)

**Explanation:** Loads first number into EAX register, adds second number, prints result (35).

---

### Program 1.2: Interactive I/O
Gets two numbers from user and prints their sum.

**Screenshot:**  
![worksheet1-2](https://github.com/user-attachments/assets/6ef1868d-7a36-4f12-8466-1ff5a72ef17a)

**Explanation:** Uses read_int to get input, stores in memory, adds them, prints result.

---

## Task 2: Loops and Conditionals

### Program 2a: Welcome Message
Asks for number (50-100), validates it, prints welcome messages.

**Code snippet:**
```nasm
cmp     eax, 50
jl      error           ; Jump if less than 50
cmp     eax, 100
jg      error           ; Jump if greater than 100
```

**Screenshots:**  
![worksheet1-1](https://github.com/user-attachments/assets/315c4968-720d-4432-9f44-5dd5ee68cc30)


**Explanation:** Uses compare and conditional jumps to validate range, then loops to print messages.

---

### Program 2b: Array Sum
Creates array of 1-100, calculates sum (result: 5050).

**Code snippet:**
```nasm
mov     ecx, 100
init_loop:
    mov     [edi], eax 
    add     edi, 4     
    inc     eax
    loop    init_loop
```

**Screenshot:**  
![worksheet1-5](https://github.com/user-attachments/assets/7c716040-c8b2-4889-a321-c830c3babfd7)

**Explanation:** Initializes array with loop, then sums all elements. Result is 5050.

---

### Program 2c: Range Sum
Gets start/end from user, sums only that range.

**Screenshot:**  
![worksheet1-4](https://github.com/user-attachments/assets/b2bb4576-8ea0-45e5-a18c-27d642442494)

**Explanation:** Validates range, calculates starting address using pointer arithmetic, sums specified range.

---

## Task 3: Makefile

Created Makefile to automate building all programs.

**Usage:**
```bash
make        # Build all
make clean  # Remove compiled files
```

**Screenshot:**  
![worksheet1-3](https://github.com/user-attachments/assets/b61eeea8-9a1d-4380-a7b8-f82851d76e2e)

**How it works:** Uses pattern rules to automatically compile .asm files to .o files, then links them. Only rebuilds changed files.

---

## Challenges

1. **Pointer arithmetic:** Had to remember to multiply by 4 for array indexing (each int = 4 bytes)
2. **Register preservation:** Used pusha/popa to save registers
3. **Makefile tabs:** Recipe lines must use TAB not spaces

---

## What I Learned

- Assembly is very explicit - everything manual
- Registers are limited and precious
- Understanding low-level helps appreciate high-level languages
- Build tools like make save tons of time

---

## Repository Structure
```
os-worksheet1/
├── README.md
├── Makefile
├── src/
│   ├── asm_io.inc
│   ├── asm_io.asm
│   ├── driver.c
│   ├── task1.asm
│   ├── task1_2.asm
│   ├── task2a.asm
│   ├── task2b.asm
│   └── task2c.asm
└── screenshots/
```

---

**GitHub:** https://github.com/s5-almutairi/worksheet1
**Submitted:** December 4th, 2025
