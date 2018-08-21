#include "types.h"
#include "x86.h"
#include "console.h"
#include "trap.h"

uint ticks = 0;

static void piceoi(uint irq)
{
    if (irq >= 8)
        outb(PIC2_CMD, PIC_EOI);
    outb(PIC1_CMD, PIC_EOI);
}

void trap(struct trapframe* tf)
{
    if (tf->trapno >= T_IRQ0) {
        uint irq = tf->trapno - T_IRQ0;

        switch (irq) {
            case IRQ_TIMER:
                ticks++;
                cprintf("tick: %d\n", ticks);
                break;
            default:
                cprintf("unhandled interrupt: %d\n", irq);
                break;
        }
        piceoi(irq);
    } else {
        switch (tf->trapno) {
            default:
                cprintf("unhandled interrupt: %d\n", tf->trapno);
                break;
        }
    }
}
