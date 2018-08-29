#include "types.h"
#include "x86.h"
#include "string.h"
#include "console.h"
#include "kalloc.h"
#include "paging.h"

extern uint *kend;
extern uint *kdata;
pde_t *kpgdir;

static struct kmap {
    void *virt;
    uint phys_start;
    uint phys_end;
    int perm;
} kmap[] = {
    { (void*)KERNBASE, KERNBASE, EXTMEM,  PTE_W}, // I/O space
    { (void*)KERNLINK, KERNLINK, kdata,   0},     // kern text+rodata
    { (void*)kdata,    kdata,    PHYSTOP, PTE_W}, // kern data+memory
    { (void*)DEVSPACE, DEVSPACE, 0,       PTE_W}, // more devices
};

static int mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
    char *a, *last;
    pte_t *pte;

    a = (char*)PGROUNDDOWN((uint)va);
    last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
    for(;;){
        if((pte = walkpgdir(pgdir, a, 1)) == 0)
            return -1;
        if(*pte & PTE_P)
            panic("remap");
        *pte = pa | perm | PTE_P;
        if(a == last)
            break;
        a += PGSIZE;
        pa += PGSIZE;
    }
    return 0;
}

uint init_paging(void)
{
    uint pgdir;
    struct kmap *k;

    cprintf("start kmem init at %p\n", kend);

    freerange((uint)kend, PHYSTOP);

    pgdir = kalloc();
    if (!pgdir)
        return 0;

    memset((void *)pgdir, 0, PGSIZE);

    for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
        if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                    (uint)k->phys_start, k->perm) < 0) {
            freevm(pgdir);
            return 0;
        }

    return pgdir;
}
