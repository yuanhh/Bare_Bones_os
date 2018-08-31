#include "types.h"
#include "x86.h"
#include "console.h"
#include "desctable.h"
#include "pit.h"
#include "paging.h"

int main(void)
{
    vga_init();
    init_gdt();
    init_paging();

    init_idt();
    init_pit();

    sti();

    uint *ptr = (uint *)0xA0000000;
    uint do_page_fault = *ptr;

    return 0;
}
