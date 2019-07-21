; Filename: SaveState.asm
; Author: Martí Guasch Jiménez

global _start

section .text

HelloWorldProc:

    push ebp
    mov ebp,esp

    ; print "Hello World" on the screen

    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, message
    mov edx, mlen
    int 0x80
    
    ; mov esp, ebp
    ; pop ebp
    
    leave
    ret


_start:

    mov ecx, 0x10

PrintHelloWorld:

    ; preserve registers and flags

    pushad
    pushfd

    call HelloWorldProc
    
    ; restore registers and flags

    popfd
    popad
    
    loop PrintHelloWorld
    
	; exit program  

	mov eax, 1
	mov ebx, 10
	int 0x80

section .data

    message:    db "Hello World!", 0xA
    mlen        equ $-message