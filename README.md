# Bootloader Program for x86 system.
This is a simple legacy bootloader program. It set the cpu to 32 bit protected mode and also enables paging in 32 bit and loads a dummy program to print text on the screen. The text is printed by writing values directly to the display memory.

# Features
1. The bootloader uses combinations of assembly language and C programming language.
2. It set the cpu to 32 bit protected mode from 16 bit real mode.
3. It enables paging for 32 bit.

# Dependencies
1. Qemu virtual machine.
2. gcc's cross-compiler for C targeting x86 system.(Please follow instruction in this [article](https://wiki.osdev.org/GCC_Cross-Compiler) to get a cross compiler)
3. gnu assembler (gas).
4. make.

# How to build
1. clone this project to a folder.
2. To create and refresh the output folders.<br>
`$ make clean`
3. To build the output files.<br>
`$ make compile`
4. To run the program on Qemu<br>
`$ make qemu-boot-hdd`

If the output on the qemu displays Hello World! the program was successfully executed.

![snapshot](https://i.imgur.com/UROBveC.png)
