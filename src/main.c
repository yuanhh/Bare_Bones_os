#include "types.h"
#include "console.h"
#include "desctable.h"

int main(void)
{
    vga_init();

    init_idt();

    cprintf("int 3 = %d\n", 0x3);

    asm volatile ("int $0x3");
    asm volatile ("int $0x4");

    return 0xDEADBABA;
}
