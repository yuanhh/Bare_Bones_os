#ifndef _PAGING_H
#define _PAGING_H

#include "types.h"

#define CR0_PG 0x80000000
#define PGSIZE 4096

// Memory layout
#define PHYSTART 0x0
#define EXTMEM   0x100000            // Start of extended memory
#define PHYSTOP  0x1000000           // Top physical memory
#define DEVSPACE 0xFE000000

#define V2P(a) (uint)(a)
#define P2V(a) (void *)(a)

// first PGSIZE -1 for already aligned input address
#define PGROUNDUP(a) (((a)+PGSIZE-1) & ~(PGSIZE-1))
#define PGROUNDDOWN(a) (((a)) & ~(PGSIZE-1))

// Page table/directory entry flags.
#define PTE_P           0x001   // Present
#define PTE_W           0x002   // Writeable
#define PTE_U           0x004   // User
#define PTE_PWT         0x008   // Write-Through
#define PTE_PCD         0x010   // Cache-Disable
#define PTE_A           0x020   // Accessed
#define PTE_D           0x040   // Dirty
#define PTE_PS          0x080   // Page Size
#define PTE_MBZ         0x180   // Bits must be zero

#define PTXSHIFT        12
#define PDXSHIFT        22

// Address in page table or page directory entry
#define PTE_ADDR(pte)   ((uint)(pte) & ~0xFFF)
#define PTE_FLAGS(pte)  ((uint)(pte) & 0xFFF)

#define PDX(va)         (((uint)(va) >> PDXSHIFT) & 0x3ff)
#define PTX(va)         (((uint)(va) >> PTXSHIFT) & 0x3ff)

#define PGADDR(d, t, o) ((uint)((d) << PDXSHIFT | (t) << PTXSHIFT | (o)))

#define NPDENTRIES 1024

pte_t *walkpgdir(pde_t *pgdir, uint pa, int alloc);
int mappages(pde_t *pgdir, uint pa, uint sz, int perm);
void init_paging(void);

#endif
