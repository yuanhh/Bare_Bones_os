#ifndef _PAGING_H
#define _PAGING_H

#include "types.h"

#define PGSIZE 4096
#define EXTPHYSMEM 0x100000


// first PGSIZE -1 for already aligned input address
#define PGROUNDUP(a) (((a)+PGSIZE-1) & ~(PGSIZE-1))
#define PGROUNDDOWN(a) (((a)) & ~(PGSIZE-1))

void kinit(void);
uint kalloc(void);
void kfree(uint pa);
void freerange(uint, uint);

#endif
