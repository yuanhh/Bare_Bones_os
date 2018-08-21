CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -ffreestanding
LDFLAGS = -Tlink.ld
ASFLAGS = -felf

KERNEL_AS = boot.s		\
			x86asm.s	\
			vectors.s	\
			trapasm.s

KERNEL_C = 	main.c 		\
			string.c	\
			console.c 	\
			gdt.c		\
			idt.c		\
			trap.c		\

KERNEL_OBJ = $(KERNEL_C:.c=.o) $(KERNEL_AS:.s=.o)

all: $(KERNEL_OBJ) link

run:
	qemu-system-i386 -d cpu -kernel kernel

link:
	gcc $(CFLAGS) $(LDFLAGS) -o kernel $(KERNEL_OBJ) -lgcc

.c.o:
	gcc $(CFLAGS) -c -o $@ $<

.s.o:
	as --32 $(ASFLAG) -o $@ $<

.PHONY: clean
clean:
	rm -f *.o kernel
