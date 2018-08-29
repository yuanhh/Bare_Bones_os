#include "types.h"
#include "x86.h"
#include "console.h"
#include "paging.h"
#include "string.h"

struct pagelist {
    struct pagelist *next;
};

struct pagelist *freelist;

void kfree(char *pa)
{
    struct pagelist *p;

    if ((uint)pa % PGSIZE)
        panic("kfree");

    memset((void *)pa, 1, PGSIZE);

    p = (struct pagelist *)pa;
    p->next = freelist;
    freelist = p;
}

char *kalloc(void)
{
    struct pagelist *p;

    p = freelist;
    if (p)
        freelist = p->next;

    return (char *)p;
}

void freerange(void *vstart, void *vend)
{
    char *pa;

    pa = (char *)PGROUNDUP((uint)vstart);
    for (; pa + PGSIZE <= (char *)vend; pa += PGSIZE)
        kfree(pa);
}
