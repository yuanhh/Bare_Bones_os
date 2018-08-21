.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set FLAGS,    ALIGN | MEMINFO  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /* checksum of above, to prove we are multiboot */
.set KSTACKSIZE, 4096

.p2align 2
.text
multiboot:
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.global _start
_start:

    movl $(stack + KSTACKSIZE), %esp

    call main

    cli

spin:
    jmp spin

.comm stack, KSTACKSIZE
