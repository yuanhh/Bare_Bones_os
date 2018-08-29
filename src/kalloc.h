#ifndef _KALLOC_H
#define _KALLOC_H

#include "types.h"

void kinit(void);
char *kalloc(void);
void kfree(char *pa);
void freerange(char *, char *);

#endif
