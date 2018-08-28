#ifndef _PAGING_H
#define _PAGING_H

#include "types.h"

#define PGSIZE 4096

#define EXTMEM  0x100000            // Start of extended memory
#define PHYSTOP 0xE000000           // Top physical memory
#define DEVSPACE 0xFE000000         // Other devices are at high addresses

// first PGSIZE -1 for already aligned input address
#define PGROUNDUP(a) (((a)+PGSIZE-1) & ~(PGSIZE-1))
#define PGROUNDDOWN(a) (((a)) & ~(PGSIZE-1))

#endif
