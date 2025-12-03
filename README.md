# Operating Systems Worksheet 1
**Student:** [Your Name]  
**Student ID:** [Your ID]  
**Date:** December 2024

---

## Task 1: Basic Assembly Programming

### Program 1.1: Simple Addition
Adds two numbers (10 + 25) and prints result.

**Code snippet:**
```nasm
mov     eax, [num1]     ; Load 10
add     eax, [num2]     ; Add 25
call    print_int       ; Print 35
```

**Screenshot:**  
![Task 1.1](screenshots/task1_1.png)

**Explanation:** Loads first number into EAX register, adds second number, prints result (35).

---

### Program 1.2: Interactive I/O
Gets two numbers from user and prints their sum.

**Screenshot:**  
![Task 1.2](screenshots/task1_2.png)

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
![Valid](screenshots/task2a_valid.png)  
![Error](screenshots/task2a_error.png)

**Explanation:** Uses compare and conditional jumps to validate range, then loops to print messages.

---

### Program 2b: Array Sum
Creates array of 1-100, calculates sum (result: 5050).

**Code snippet:**
```nasm
mov     ecx, 100
init_loop:
    mov     [edi], eax  ; Store value
    add     edi, 4      ; Next element (4 bytes)
    inc     eax
    loop    init_loop
```

**Screenshot:**  
![Task 2b](screenshots/task2b.png)

**Explanation:** Initializes array with loop, then sums all elements. Result is 5050.

---

### Program 2c: Range Sum
Gets start/end from user, sums only that range.

**Screenshot:**  
![Task 2c](screenshots/task2c.png)

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
![Makefile](screenshots/makefile.png)

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

**GitHub:** https://github.com/YOUR_USERNAME/os-worksheet1  
**Submitted:** December 4th, 2025
