#!/usr/bin/env python3
import os
import sys

def main():
    if len(sys.argv) != 2 :
        print(f"Usage: {sys.argv[0]} <file.asm>.")
        sys.exit()

    cmd = f"nasm -fbin -o shellcode.bin {sys.argv[1]}"
    exit_status = os.system(cmd)
    if exit_status != 0:
        print("[!] Error executing nasm.")
        sys.exit()

    print("[+] Shellcode:")
    with open("shellcode.bin","rb") as f:
        code = f.read()
        print(''.join(f"\\x{x:02X}" for x in code))

    if os.path.exists("shellcode.bin"):
        os.remove("shellcode.bin")

if __name__ == '__main__':
    main()