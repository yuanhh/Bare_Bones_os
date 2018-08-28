#include "types.h"
#include "x86.h"
#include "string.h"
#include "console.h"
#include "kalloc.h"
#include "paging.h"

pde_t *kpgdir;

static struct kmap {
    void *virt;
    uint phys_start;
    uint phys_end;
    int perm;
} kmap[] = {
    { (void*)KERNBASE, 0,             EXTMEM,    PTE_W}, // I/O space
    { (void*)KERNLINK, V2P(KERNLINK), V2P(data), 0},     // kern text+rodata
    { (void*)data,     V2P(data),     PHYSTOP,   PTE_W}, // kern data+memory
    { (void*)DEVSPACE, DEVSPACE,      0,         PTE_W}, // more devices
};

pde_t* kinit(void)
{
    extern uint kend;
    pde_t *pgdir;

    cprintf("start kmem init at %p\n", &kend);

    freerange((uint)&kend, PHYSTOP);

    pgdir = kalloc();
    if (!pgdir)
        return 0;

    memset(pgdir, 0, PGSIZE);
}
