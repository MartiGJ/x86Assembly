#!/bin/bash

# exit when any command fails
set -e

# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
function finish {
    exit_status=$?
    if [ $exit_status -ne 0 ]; then
        echo "[!] [${last_command}] command failed with exit code $exit_status."
    else
        echo '[+] Done!'
    fi
}
trap finish EXIT

if [ "$1" = "clean" ]; then
    echo '[+] Removing files...'
    rm -f elf32_*
    rm -f */*.o
else
    echo '[+] Assembling with Nasm...'
    nasm -f elf32 -o $1/$1.o $1/$1.asm

    if [ "$2" = "gcc" ]; then
        echo '[+] Linking with GCC...'
        gcc -m32 -o elf32_$1 $1/$1.o
    else
        echo '[+] Linking with LD...'
        ld -m elf_i386 -o elf32_$1 $1/$1.o
    fi
fi