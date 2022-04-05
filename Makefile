# disable default rules
.SUFFIXES:

.PHONY: run
.DEFAULT: run

run: clean generate_output_files

clean:
	rm -rf bootloader_files
	rm -rf object_files
	mkdir bootloader_files
	mkdir object_files

compile: generate_object_files generate_bootloader_files
generate_object_files:object_files/boot1.o object_files/paging.o object_files/enable_paging.o object_files/Kernel.o
generate_bootloader_files:bootloader_files/bootloader.bin

qemu-boot-hdd:bootloader_files/bootloader.bin
	qemu-system-x86_64 -drive file=$<,media=disk,format=raw

OBJS:= ./object_files/boot1.o ./object_files/paging.o ./object_files/enable_paging.o ./object_files/Kernel.o

CPPFLAGS:=-Wall -Wextra


object_files/boot1.o: source_files/boot1.S
	i686-elf-as -I ./source_files/ $< -o $@

object_files/paging.o: source_files/paging.c
	i686-elf-gcc -m32 -c $< -o $@ -e boot_main -nostdlib -ffreestanding -std=gnu99 -mno-red-zone -fno-exceptions -nostdlib $(CPPFLAGS)

object_files/enable_paging.o: source_files/enable_paging.S
	i686-elf-as $< -o $@

object_files/Kernel.o: source_files/Kernel.c
	i686-elf-gcc -m32 -c $< -o $@ -e boot_main -nostdlib -ffreestanding -std=gnu99 -mno-red-zone -fno-exceptions -nostdlib $(CPPFLAGS)

bootloader_files/bootloader.bin: $(OBJS)
	i686-elf-ld $(OBJS) -o $@ -T linker_files/linker.ld
