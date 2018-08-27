#ifndef _PAGING_H
#define _PAGING_H

#define PGSIZE 4096

#define PHYSTOP 0xe000000

// first PGSIZE -1 for already aligned input address
#define PGROUNDUP(a) (((a) + PGSIZE - 1) & ~(PGSIZE - 1))

struct pagelist {
    struct pagelist *next;
};

#endif
