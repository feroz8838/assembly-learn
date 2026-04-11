all:
	yasm videomem.asm -f elf -g dwarf2 -o videomem.o && ld -Ttext=0x7c00 -melf_i386 videomem.o -o videomem.elf && objcopy -O binary videomem.elf videomem.bin

run:
	qemu-system-x86_64 --drive format=raw,file=videomem.bin

debug:
	qemu-system-x86_64 -S -gdb tcp::1234 --drive format=raw,file=videomem.bin