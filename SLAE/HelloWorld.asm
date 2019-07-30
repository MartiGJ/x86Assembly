; Filename: HelloWorld.asm
; Author: Marti Guasch

global _start

section .text

_start:
        ; print "Hello World" on the screen
        mov eax, 0x4
        mov ebx, 0x1
        mov ecx, message
        mov edx, mlen
        int 0x80

        ; exit the program gracefully

        mov eax, 0x1
        mov ebx, 0x5
        int 0x80

section .data

        message: db "Hello World", 0xA
        mlen    equ $-message
