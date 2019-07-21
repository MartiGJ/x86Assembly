; Filename: Libc.asm
; Author: Martí Guasch Jiménez
; SIGSEV in x64 work in qemu-i386-static
; declare libc functions
extern printf
extern snprintf
extern exit

global main

section .text
main:
    push ebp
    mov ebp, esp
    push message    ; arg printf
    call printf
    add esp, 0x4    ; adjust the stack

    push message    ; arg3 source
    push 0x5        ; arg2 size
    push destination; arg1 destination
    call snprintf
    add esp, 0xc    ; adjust the stack
    
    push destination
    call printf
    add esp, 0x4
    
    push 0x0
    call exit


section .data:

    message: db "Hello World!", 0xA, 0x0

section .bss

    destination: resb 5