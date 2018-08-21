#include "types.h"
#include "x86.h"
#include "console.h"

void trap(struct trapframe* tf)
{
    cprintf("received interupt %d\n", tf->trapno);
}
