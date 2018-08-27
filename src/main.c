#include "types.h"
#include "console.h"
#include "desctable.h"
#include "pit.h"
#include "paging.h"

int main(void)
{
    vga_init();

    init_gdt();
    init_idt();

    init_pit();

    kinit();

    return 0;
}
