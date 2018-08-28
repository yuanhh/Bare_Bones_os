#include "types.h"

void* memset(void *dst, int c, uint n)
{
    char *d = dst;

    c &= 0xff;

    while (n-- > 0)
        *d++ = (char)c;

    return dst;
}

void* memmove(void *dst, const void *src, uint n)
{
    const char *s = src;
    char *d = dst;

    if (s < d && s + n > d) {
        s += n;
        d += n;
        while (n-- > 0)
            *--d = *--s;
    } else {
        while (n-- > 0)
            *d++ = *s++;
    }

    return dst;
}

void* memcpy(void *dst, const void *src, uint n)
{
    return memmove(dst, src, n);
}

int memcmp(const void *v1, const void *v2, uint n)
{
    const char *s1, *s2;

    s1 = v1;
    s2 = v2;

    while (n-- > 0) {
        if (*s1 != *s2)
            return *s1 - *s2;
        s1++, s2++;
    }

    return 0;
}

    uint
strlen(char const *s)
{
    uint i;

    for (i = 0; s[i]; i++)
        ;

    return i;
}

    void
strrev(char *str)
{
    int i;
    int j;
    uchar c;
    uint len = strlen((const char *)str);

    for (i = 0, j = len - 1; i < j; i++, j--)
    {
        c = str[i];
        str[i] = str[j];
        str[j] = c;
    }
}

int itoa(int num, char* str, int len, int base)
{
    int sum = num;
    int i = 0;
    int digit;

    if (len == 0)
        return -1;

    do
    {
        digit = sum % base;
        if (digit < 0xA)
            str[i++] = '0' + digit;
        else
            str[i++] = 'A' + digit - 0xA;
        sum /= base;
    } while (sum && (i < (len - 1)));

    if (i == (len - 1) && sum)
        return -1;
    str[i] = '\0';

    strrev(str);

    return 0;
}
