CC = i686-elf-gcc
AS = i686-elf-as

CFLAGS = -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld

KERNEL_AS = src/boot.S 		\
			src/x86asm.S	\
			src/vectors.S	\
			src/trapasm.S

KERNEL_SRC = src/main.c		\
			 src/string.c	\
			 src/console.c	\
			 src/gdt.c		\
			 src/idt.c		\
			 src/trap.c		\
			 src/cpu.c

KERNEL_OBJ = $(KERNEL_SRC:.c=.o) $(KERNEL_AS:.S=.o)

KERNEL = kernel.bin

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $< 

%.o: %.S
	$(AS) -c -o $@ $<

.PHONY: all clean                                                                                                                                             

all: $(KERNEL)

$(KERNEL): $(KERNEL_OBJ)
	$(CC) $(LDFLAGS) $(KERNEL_OBJ) -o $(KERNEL) -lgcc

clean:
	rm -f src/*.o $(KERNEL)
