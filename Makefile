CC = i686-elf-gcc
AS = i686-elf-as

CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -T linker.ld -ffreestanding -O2 -nostdlib 

KERNEL_AS = src/boot.s

KERNEL_SRC = src/kernel.c

KERNEL_OBJ = $(KERNEL_SRC:.c=.o) $(KERNEL_AS:.s=.o)

KERNEL = kernel.bin

run: $(KERNEL)
	qemu-system-i386 -kernel $(KERNEL)

.PHONY: all clean                                                                                                                                             

all: $(KERNEL)

$(KERNEL): $(KERNEL_OBJ)
	$(CC) $(LDFLAGS) $(KERNEL_OBJ) -o $(KERNEL) -lgcc

%.o: %.c
	$(CC) -c $< $(CFLAGS) -o $@

%.o: %.s
	$(AS) $< -o $@

clean:
	rm -f src/*.o $(KERNEL)
