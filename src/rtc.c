#include "x86.h"
#include "rtc.h"

uchar lnvram(uint reg)
{
    outb(RTC_IO1, reg);
    return inb(RTC_IO2);
}
