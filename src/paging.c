#include "types.h"
#include "x86.h"
#include "string.h"
#include "console.h"
#include "kalloc.h"
#include "paging.h"

extern char kend[];
extern char kdata[];
pde_t *kpgdir;

pte_t *walkpgdir(pde_t *pgdir, uint pa, int alloc)
{
    pde_t *pde;
    pte_t *pte;

    pde = &pgdir[PDX(pa)];
    if (*pde & PTE_P) {
        pte = (pte_t *)PTE_ADDR(*pde);
    } else if (alloc) {
        pte = (pte_t *)kalloc();
        if (!pte)
            return 0;
        memset(pte, 0, PGSIZE);

        *pde = V2P(pte) | PTE_P | PTE_W | PTE_U;
    } else
        return 0;

    return &pte[PTX(pa)];
}

int mappages(pde_t *pgdir, uint pa, uint sz, int perm)
{
    uint pa_st, pa_end;
    pte_t *pte;

    pa_st = PGROUNDDOWN(pa);
    pa_end = PGROUNDDOWN(pa + sz - 1);

    for (; pa_st + PGSIZE <= pa_end; pa_st += PGSIZE) {
        pte = walkpgdir(pgdir, pa_st, 1);
        if (!pte)
            return -1;
        if (*pte & PTE_P)
            panic("remap");

        *pte = pa_st | perm | PTE_P;
    }
    return 0;
}

void switchkvm(pde_t *pgdir)
{
    lcr3(V2P(pgdir));
}

static struct kmap {
    uint pa_st;
    uint pa_end;
    int perm;
} kmap [] = {
    {PHYSTART,      EXTMEM,      PTE_W},
    {EXTMEM,        V2P(kdata),  0},
    {V2P(kdata),    PHYSTOP,     PTE_W},
};

pde_t *setupkvm(void)
{
    pde_t *pgdir;
    struct kmap *k;

    pgdir = (pde_t *)kalloc();
    if (!pgdir)
        return 0;

    memset(pgdir, 0, PGSIZE);

    for (k = kmap; k < &kmap[NELEM(kmap)]; k++)
        if (mappages(pgdir, k->pa_st, k->pa_end - k->pa_st, k->perm) < 0) {
            return 0;
        }

    return pgdir;
}

void init_paging(void)
{
    uint cr0;

    freerange(V2P(kend), PHYSTOP);

    kpgdir = setupkvm();

    switchkvm(kpgdir);

    cr0 = scr0();
    cr0 |= CR0_PG;
    lcr0(cr0);

    cprintf("paging start!\n");
}
