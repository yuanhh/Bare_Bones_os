#include "types.h"
#include "x86.h"
#include "timer.h"

void init_timer(uint freq)
{
    uint divisor = 1193180 / freq;

    /* set square wave generator l/h bytes for channel 0 */
    outb(PIT_CMD, 0x36);

    outb(PIT_IO1, divisor & 0xff);
    outb(PIT_IO1, (divisor >> 8) & 0xff);
}
