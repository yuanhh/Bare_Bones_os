#include "types.h"
#include "x86.h"
#include "string.h"
#include "console.h"
#include "kalloc.h"
#include "paging.h"

extern char kend[];
extern char kdata[];
pde_t *kpgdir;

static struct kmap {
    void *virt;
    uint phys_start;
    uint phys_end;
    int perm;
} kmap[] = {
    { (void*)KERNBASE, KERNBASE,      EXTMEM,      PTE_W}, // I/O space
    { (void*)KERNLINK, V2P(KERNLINK), V2P(kdata),  0},     // kern text+rodata
    { (void*)kdata,    V2P(kdata),    PHYSTOP,     PTE_W}, // kern data+memory
    { (void*)DEVSPACE, DEVSPACE,      0,           PTE_W}, // more devices
};

static pte_t *walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
    pde_t *pde;
    pte_t *pte;

    pde = &pgdir[PDX(va)];
    if (*pde & PTE_P) {
        pte = (pte_t *)P2V(PTE_ADDR(*pde));
    } else {
        pte = (pte_t *)kalloc();
        if (alloc && !pte)
            return 0;

        memset(pte, 0, PGSIZE);

        *pde = V2P(pte) | PTE_P | PTE_W | PTE_U;
    }
    return &pte[PTX(va)];
}

static int mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
    char *va_st, *va_end;
    pte_t *pte;

    va_st = (char*)PGROUNDDOWN((uint)va);
    va_end = (char*)PGROUNDDOWN(((uint)va) + size - 1);

    for (; va_st + PGSIZE < va_end; va_st += PGSIZE, pa += PGSIZE) {
        pte = walkpgdir(pgdir, va, 1);
        if (!pte)
            return -1;
        if(*pte & PTE_P)
            panic("remap");
        *pte = pa | perm | PTE_P;
    }
    return 0;
}

int deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
    pte_t *pte;
    uint a, pa;

    if (newsz >= oldsz)
        return oldsz;

    a = PGROUNDUP(newsz);
    for (; a < oldsz; a += PGSIZE) {
        pte = walkpgdir(pgdir, (char *)a, 0);
        if (!pte)
            a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
        else if (*pte & PTE_P) {
            pa = PTE_ADDR(*pte);
            if (!pa)
                panic("kfree");
            char *v = P2V(pa);
            kfree(v);
            *pte = 0;
        }
    }
    return newsz;
}

void freevm(pde_t *pgdir)
{
    uint i;

    if (!pgdir)
        panic("freevm: no pgdir");

    deallocuvm(pgdir, 0, 0);

    for (i = 0; i < NPDENTRIES; i++) {
        if (pgdir[i] & PTE_P) {
            char *v = P2V(PTE_ADDR(pgdir[i]));
            kfree(v);
        }
    }
}

void init_paging(void)
{
    struct kmap *k;

    cprintf("start kmem init at %p\n", kend);

    freerange(kend, P2V(PHYSTOP));

    kpgdir = (pde_t *)kalloc();
    if (!kpgdir)
        panic("kpgdir");

    memset(kpgdir, 0, PGSIZE);

    for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
        if(mappages(kpgdir, k->virt, k->phys_end - k->phys_start,
                    k->phys_start, k->perm) < 0) {
            panic("mappage");
        }

    lcr3(V2P(kpgdir));
}
