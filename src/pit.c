#include "types.h"
#include "x86.h"
#include "pit.h"


void init_pit(void)
{
    // initialize 8253 clock to interrupt 100 times/sec
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) & 0xff);
    outb(IO_TIMER1, (TIMER_DIV(100) >> 8) & 0xff);
}
