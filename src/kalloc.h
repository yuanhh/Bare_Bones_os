#ifndef _KALLOC_H
#define _KALLOC_H

#include "types.h"

void kinit(void);
uint kalloc(void);
void kfree(uint pa);
void freerange(uint, uint);

#endif