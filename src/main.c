#include "types.h"
#include "mmu.h"
#include "console.h"

int kernel_main(void) 
{
    vga_init();

    init_gdt();
    init_idt();

    //asm volatile ("int $0x50");

    cprintf("Hello World!\n");

    return 0;
} 
