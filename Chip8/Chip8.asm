; Filename: Chip8.asm
; Author: Marti Guasch

global _start

section .text
_start:

        mov eax, 0x36
        mov ebx, 0x1            ; STDOUT
        mov ecx, 0x5413         ; TIOCGWINSZ
        mov edx, sz             ; struct winsize sz
        int 0x80

        movzx edi, WORD [sz+2]      ; sz.ws_col | movzx edx, WORD [sz+0]      ; sz.ws_row

        ; print a square on the screen
loop:   mov eax, 0x4
        mov ebx, 0x1
        mov ecx, color
        mov edx, 0x3
        int 0x80

        dec edi
        jnz loop        
        

        ; exit the program gracefully

        mov eax, 0x1
        mov ebx, 0
        int 0x80

section .data

        message: db "Hello World", 0xA
	mlen	 equ $-message

section .rodata

        color: db 0xe2,0x96,0x88
	squares: TIMES 6 db 0xe2,0x96,0x88
        slen	 equ $-squares

section .bss

        sz: resw 4
	var7: resb 100
	var8: resw 20
