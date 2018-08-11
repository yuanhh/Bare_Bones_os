#include "types.h"
#include "mmu.h"
#include "console.h"

int kernel_main(void) 
{
    init_gdt();
    init_idt();

    console_clear();
    console_write("Hello,World!\n");

    asm volatile ("int $0x3");
    asm volatile ("int $0x4"); 

    return 0xDEADBABA;
} 
