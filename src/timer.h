#ifndef _TIMER_H
#define _TIMER_H

#include "types.h"

void init_timer(uint freq);

#define PIT_IO1 0x40
#define PIT_IO2 0x41
#define PIT_IO3 0x42
#define PIT_CMD 0x43

#endif
