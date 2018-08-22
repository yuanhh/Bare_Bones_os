#include "types.h"
#include "console.h"
#include "desctable.h"
#include "timer.h"
#include "paging.h"

int main(void)
{
    vga_init();

    init_gdt();
    init_idt();

    init_timer(50);

    detect_memory();

    return 0;
}
