#ifndef _PAGING_H
#define _PAGING_H

#include "types.h"

#define PGSIZE 4096

// first PGSIZE -1 for already aligned input address
#define PGROUNDUP(sz) (((sz)+PGSIZE-1) & ~(PGSIZE-1))

struct pagelist {
    struct pagelist *next;
};

void kinit(void);
char *kalloc(void);
void kfree(char *pa);
void freerange(uint start, uint end);

#endif
