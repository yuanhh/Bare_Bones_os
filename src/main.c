#include "types.h"
#include "console.h"
#include "cpu.h"
#include "x86.h"

int kernel_main(void) 
{
    vga_init();

    cpu_detect();

    init_gdt();
    init_idt();

    asm volatile ("int $0x4");

    return 0;
} 
