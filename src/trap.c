#include "types.h"
#include "x86.h"
#include "console.h"
#include "string.h"
#include "mmu.h"

static void piceoi(uchar irq)
{
    if (irq >= 8)
        outb(PIC_SV_CMD, PIC_EOI);
    outb(PIC_MS_CMD, PIC_EOI);
}

void trap(struct trapframe* tf)
{
    cprintf("received interupt %d\n", tf->trapno);
}
