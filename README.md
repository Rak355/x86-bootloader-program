#Bootloader Program for x86 system.
This is a simple legacy bootloader program. It set the cpu to 32 bit protected mode by establishing a global descriptor table. It also enables paging in 32 bit and loads a dummy program to print text on the screen. The text is printed by writing values directly to the display memory.

#Features
1. The bootloader uses combinations of assembly language and C programming language.
2. It also set the Cpu to 32 bit protected mode from 16 bit real mode.
3. It enables paging for 32 bit.

#Dependencies
1. Qemu virtual machine.
2. gnu c cross-compiler for x86 system (gcc).
3. gnu assembler (gas).
4. make.

The cross compiler could be easily created by following this ![tutorial](https://wiki.osdev.org/GCC_Cross-Compiler)

#How to build
1. clone this project to a folder.
2. To create and refresh the output folders.
At the console>$ make clean
3. To build the output files.
At the console>$ make compile
4. To run the program on Qemu
At the console>$ make qemu-boot-hdd

If the output on the qemu displays Hello World! the program was successfully executed.

snapshot.
![snapshot](https://i.imgur.com/UROBveC.png)
