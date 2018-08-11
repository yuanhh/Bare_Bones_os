CC = i686-elf-gcc
AS = i686-elf-as

CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld -ffreestanding -O2 -nostdlib 

KERNEL_AS = src/boot.s 		\
			src/vectors.s	\
			src/trapasm.s	\

KERNEL_SRC = src/kernel.c	\
			 src/string.c	\
			 src/console.c	\
			 src/gdt.c		\
			 src/idt.c		\
			 src/isr.c

KERNEL_OBJ = $(KERNEL_SRC:.c=.o) $(KERNEL_AS:.s=.o)

KERNEL = kernel.bin

run: $(KERNEL)
	qemu-system-i386 -d cpu -kernel $(KERNEL)

%.o: %.c
	$(CC) -c $< $(CFLAGS) -o $@

%.o: %.s
	$(AS) $< -o $@

.PHONY: all clean                                                                                                                                             

all: $(KERNEL)

$(KERNEL): $(KERNEL_OBJ)
	$(CC) $(LDFLAGS) $(KERNEL_OBJ) -o $(KERNEL) -lgcc

clean:
	rm -f src/*.o $(KERNEL)
