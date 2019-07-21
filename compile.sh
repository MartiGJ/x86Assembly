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

echo '[+] Assembling with Nasm...'
nasm -f elf32 -o $1.o $1.asm

echo '[+] Linking ...'
ld -m elf_i386 -o $1 $1.o
