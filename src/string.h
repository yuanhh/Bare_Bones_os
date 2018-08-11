#ifndef STRING_H
#define STRING_H

#include "types.h"

void* memset(void *dst,  int c, uint n);
void* memmove(void *dst, const void *src, uint n);
void* memcpy(void *dst, const void *src, uint n);
int memcmp(const void *v1, const void *v2, uint n);
int itoa(int num, char* str, int len, int base);
uint strlen(char const *s);

#endif
