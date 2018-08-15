CC = i686-elf-gcc
AS = i686-elf-as

CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld

KERNEL_AS = src/boot.s 		\
			src/x86asm.s	\
			src/vectors.s	\
			src/trapasm.s

KERNEL_SRC = src/main.c		\
			 src/string.c	\
			 src/console.c	\
			 src/gdt.c		\
			 src/idt.c		\
			 src/trap.c		\
			 src/cpu.c

KERNEL_OBJ = $(KERNEL_SRC:.c=.o) $(KERNEL_AS:.s=.o)

KERNEL = kernel.bin

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $< 

%.o: %.s
	$(AS) -c -o $@ $<

.PHONY: all clean                                                                                                                                             

all: $(KERNEL)

$(KERNEL): $(KERNEL_OBJ)
	$(CC) $(LDFLAGS) $(KERNEL_OBJ) -o $(KERNEL) -lgcc

clean:
	rm -f src/*.o $(KERNEL)
