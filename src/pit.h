#ifndef __PIT_H
#define __PIT_H

#define IO_TIMER1       0x040           // 8253 Timer #1

#define TIMER_FREQ      1193182
#define TIMER_DIV(x)    ((TIMER_FREQ+(x)/2)/(x))

#define TIMER_CNTR0     (IO_TIMER1 + 0) // timer 0 counter port
#define TIMER_CNTR1     (IO_TIMER1 + 1) // timer 1 counter port
#define TIMER_CNTR2     (IO_TIMER1 + 2) // timer 2 counter port
#define TIMER_MODE      (IO_TIMER1 + 3) // timer mode port
#define TIMER_SEL0      0x00    // select counter 0
#define TIMER_SEL1      0x40    // select counter 1
#define TIMER_SEL2      0x80    // select counter 2
#define TIMER_INTTC     0x00    // mode 0, intr on terminal cnt
#define TIMER_ONESHOT   0x02    // mode 1, one shot
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_SQWAVE    0x06    // mode 3, square wave
#define TIMER_SWSTROBE  0x08    // mode 4, s/w triggered strobe
#define TIMER_HWSTROBE  0x0a    // mode 5, h/w triggered strobe
#define TIMER_LATCH     0x00    // latch counter for reading
#define TIMER_LSB       0x10    // r/w counter LSB
#define TIMER_MSB       0x20    // r/w counter MSB
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first
#define TIMER_BCD       0x01    // count in BCD

void init_pit(void);

#endif
