#include "types.h"
#include "x86.h"
#include "console.h"
#include "string.h"
#include "trap.h"

uint ticks = 0;

static void piceoi(uchar irq)
{
    if (irq >= 8)
        outb(PIC_SV_CMD, PIC_EOI);
    outb(PIC_MS_CMD, PIC_EOI);
}

void trap(struct trapframe *tf)
{
    if (tf->trapno >= T_IRQ0) {
        switch(tf->trapno) {
            case T_IRQ0 + IRQ_TIMER: 
                ticks++;
                cprintf("Tick: %d\n", ticks);
        }
        piceoi(tf->trapno - T_IRQ0);
    } else {
        cputs("trapframe: \n");
        cputs("==============================\n");
        cprintf("cs:ip = %x:%x\n", tf->cs, tf->eip);
        cprintf("trapno = %d\n", tf->trapno);
        cprintf("errcode = %d\n", tf->err);
    }

    panic("unhandled\n");
}

