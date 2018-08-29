#include "types.h"
#include "x86.h"
#include "string.h"
#include "console.h"
#include "kalloc.h"
#include "paging.h"

extern char kend[];
extern char kdata[];
pde_t *kpgdir;

pte_t *getpage(pde_t *pgdir, uint va, int alloc)
{
    pde_t *pde;
    pte_t *pte;

    pde = &pgdir[PDX(va)];
    if (*pde & PTE_P) {
        pte = (pte_t *)PTE_ADDR(*pde);
    } else if (alloc) {
        pte = (pte_t *)kalloc();
        if (!pte)
            return 0;

        memset(pte, 0, PGSIZE);

        *pde = (uint)pte | PTE_P | PTE_W | PTE_U;
    }
    else
        return 0;

    return &pte[PTX(va)];
}

int mappages(pde_t *pgdir, uint va, uint sz, int perm)
{
    uint va_st, va_end;
    pte_t *pte;

    va_st = PGROUNDDOWN(va);
    va_end = PGROUNDDOWN(va + sz - 1);

    for (; va_st + PGSIZE <= va_end; va_st += PGSIZE, va += PGSIZE) {
        pte = getpage(pgdir, va_st, 1);
        if (!pte)
            return -1;
        if (*pte & PTE_P)
            panic("remap");
        *pte = va | perm | PTE_P;
    }
    return 0;
}

void switchvm(pde_t *pgdir)
{
    uint cr0;

    lcr3((uint)pgdir);
    cr0 = scr0();
    cr0 |= CR0_PG;
    lcr0(cr0);
}

static struct kmap {
    uint pa_st;
    uint pa_end;
    int perm;
} kmap [] = {
    {PHYSTART,      EXTMEM,         PTE_W},
    {EXTMEM,        (uint)kdata,    0},
    {(uint)kdata,   PHYSTOP,        PTE_W},
};

void init_paging(void)
{
    struct kmap *k;

    freerange(PHYSTART, PHYSTOP);

    kpgdir = (pde_t *)kalloc();
    if (!kpgdir)
        panic("kalloc: kpgdir");

    memset(kpgdir, 0, PGSIZE);

    for (k = kmap; k < &kmap[NELEM(kmap)]; k++)
        if (mappages(kpgdir, k->pa_st, k->pa_end - k->pa_st, k->perm) < 0) {
            panic("kmap");
        }

    switchvm(kpgdir);

    cprintf("paging start!\n");
}
