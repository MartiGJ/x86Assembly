; Filename: Procedure.asm
; Author: Martí Guasch Jiménez

global _start

section .text

HelloWorldProc:

    ; print "Hello World" on the screen

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message
    mov edx, mlen
    int 0x80
    ret


_start:

    mov ecx, 0x10

PrintHelloWorld:

    push ecx
    call HelloWorldProc
    pop ecx
    loop PrintHelloWorld
    
	; exit program  

	mov eax, 1
	mov ebx, 10
	int 0x80

section .data

    message:    db "Hello World!", 0xA
    mlen        equ $-message