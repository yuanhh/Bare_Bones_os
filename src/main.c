#include "types.h"
#include "x86.h"
#include "mmu.h"
#include "console.h"

extern void do_test(void);

int kernel_main(void) 
{
    vga_init();

    init_gdt();
    init_idt();

    cprintf("Hello World!\n");

    uint divisor = 1193180 / 50;

    outb(0x43, 0x36);

    uchar l = (uchar)(divisor & 0xff);
    uchar h = (uchar)((divisor >> 8) & 0xff);

    outb(0x40, l);
    outb(0x40, h);

    return 0;
} 
