#include "types.h"
#include "x86.h"
#include "console.h"
#include "string.h"

void trap(struct trapframe *tf)
{
    cprintf("received interrupt: %d\n", tf->trapno);
}
