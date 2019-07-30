#!/bin/python
import os
import sys
if len(sys.argv) != 2 :
    print "Usage: "+sys.argv[0]+" <file.asm>."
    sys.exit()

cmd = "nasm -fbin -o shellcode.bin " +sys.argv[1]
exit_status = os.system(cmd)
if exit_status != 0:
    print "[!] Error executing nasm."
    sys.exit()

with open("shellcode.bin") as f: 
    code = f.read()
    print '\\x'+'\\x'.join(x.encode('hex') for x in code)

os.remove("shellcode.bin")
