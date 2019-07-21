; Filename: Loop.asm
; Author: Martí Guasch Jiménez

global _start

section .text
_start:

    jmp Begin

NeverExecute:
    mov eax, 0x10
    xor ebx, ebx

Begin:
    mov ecx, 0x5

PrintHW:

    push ecx

    ; print "Hello World" on the screen

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message
    mov edx, mlen
    int 0x80

    pop ecx
    loop PrintHW

	; exit program  

	mov eax, 1
	mov ebx, 10
	int 0x80

section .data

    message:    db "Hello World!", 0xA
    mlen        equ $-message