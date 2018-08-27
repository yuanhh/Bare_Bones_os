#include "types.h"
#include "console.h"
#include "desctable.h"

int main(void)
{
    vga_init();

    init_gdt();
    init_idt();

    //pit8253_timerinit();
    asm volatile("int $0x0");
    asm volatile("int $0x3");

    return 0;
}
