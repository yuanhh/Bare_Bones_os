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
    //init_idt();

    //init_pit();

    init_paging();

    return 0;
}
