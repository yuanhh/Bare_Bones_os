#include "types.h"
#include "console.h"
#include "desctable.h"

int main(void)
{
    vga_init();

    init_gdt();
    init_idt();

    asm volatile ("int $0x3");
    asm volatile ("int $0x4");

    return 0xDEADBABA;
}
