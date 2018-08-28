#include "types.h"
#include "x86.h"
#include "console.h"
#include "rtc.h"
#include "paging.h"
#include "string.h"

struct pagelist {
    struct pagelist *next;
};

struct pagelist *freelist;

void kfree(uint pa)
{
    struct pagelist *p;

    if (pa % PGSIZE)
        panic("kfree");

    memset((void *)pa, 1, PGSIZE);

    p = (struct pagelist *)pa;
    p->next = freelist;
    freelist = p;
}

uint kalloc(void)
{
    struct pagelist *p;

    p = freelist;
    if (p)
        freelist = p->next;

    return (uint)p;
}

void freerange(uint start, uint end)
{
    uint pa;
    pa = PGROUNDUP(start);

    for (; pa + PGSIZE <= end; pa += PGSIZE)
        kfree(pa);
}

void kinit(void)
{
    extern uint kend;

    cprintf("start kmem init at %p\n", &kend);

    freerange((uint)&kend, 0x1000000);
}
