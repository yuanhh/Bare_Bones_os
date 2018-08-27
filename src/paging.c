#include "types.h"
#include "x86.h"
#include "console.h"
#include "rtc.h"
#include "paging.h"
#include "string.h"

uint *kpgdir;
static struct pagelist *freelist;

uint totmem;
static uint basemem;

static void detect_memory(void)
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

/* void kfree(char *pa)
{
    struct pagelist *p;

    if ((uint)pa % PGSIZE)
        panic("kfree");

    memset(pa, 1, PGSIZE);

    p = (struct pagelist *)pa;
    p->next = freelist;
    freelist = p;
}

void freerange(uint start, uint end)
{
    uint p;

    p = (start + (PGSIZE - 1)) & ~(PGSIZE - 1);
    for (; p + PGSIZE <= end; p += PGSIZE)
        kfree((char *)p);
} */

char *kalloc(void)
{
    struct pagelist *p;

    p = freelist;
    if (p)
        freelist = p->next;

    return (char *)p;
}

void kinit(void)
{
    detect_memory();
}
