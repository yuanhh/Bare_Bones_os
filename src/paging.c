#include "types.h"
#include "x86.h"
#include "console.h"
#include "rtc.h"
#include "paging.h"
#include "string.h"

uint *kpgdir;
struct {
    struct pagelist *freelist;
} kmem;

uint totmem;
static uint basemem;

extern char end[];

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

void kfree(char *pa)
{
    struct pagelist *p;

    if((uint)pa % PGSIZE || pa < end || pa >= PHYSTOP)
        panic("kfree");

    memset(pa, 1, PGSIZE);

    p = (struct pagelist *)pa;
    p->next = kmem.freelist;
    kmem.freelist = p;
}

void freerange(void *start, void *end)
{
    char *p;

    p = (char *)PGROUNDUP((uint)start);

    for (; p + PGSIZE <= (char *) end; p += PGSIZE)
        kfree(p);
}

char *kalloc(void)
{
    struct pagelist *p;

    p = kmem.freelist;

    if (p)
        kmem.freelist = p->next;

    return (char *)p;
}

void kinit(void)
{
    detect_memory();
    
    freerange(end, (void *)(4*1024*1024));

    kpgdir = (uint *)kalloc();
    memset(kpgdir, 0, PGSIZE);
}
