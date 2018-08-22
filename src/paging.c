#include "types.h"
#include "x86.h"
#include "console.h"
#include "rtc.h"
#include "paging.h"
#include "string.h"

uint *kern_pgdir;

uint totmem;
static uint basemem;

// end of kernel prog
extern char end[];

void detect_memory(void)
{
    uint extmem;

    basemem = lnvram(NVRAM_BASELO) | lnvram(NVRAM_BASEHI) << 8;
    extmem = lnvram(NVRAM_EXTLO) | lnvram(NVRAM_EXTHI) << 8;

    if (extmem)
        totmem = (EXTPHYSMEM / 1024) + extmem;
    else
        totmem = basemem;

    cprintf("Physical memory:   %d KB\n", totmem);
    cprintf("Base memory:       %d KB\n", basemem);
    cprintf("Extended memory:   %d KB\n", extmem);
}

static void *kalloc(uint sz)
{
    static char *nextfree;

    if (!nextfree)
        nextfree = PGROUNDUP((char *)end);

    if (sz != 0)
        nextfree = PGROUNDUP(nextfree + sz);

    return nextfree;
}

void init_paging(void)
{

    detect_memory();

    kern_pgdir = (uint *)kalloc(PGSIZE);
    memset(kern_pgdir, 0, PGSIZE);

}
