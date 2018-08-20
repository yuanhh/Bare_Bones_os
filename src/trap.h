#ifndef TRAP_H
#define TRAP_H

#include "types.h"

// x86 trap and interrupt constants.

// Processor-defined:
#define T_DIVIDE         0      // divide error
#define T_DEBUG          1      // debug exception
#define T_NMI            2      // non-maskable interrupt
#define T_BRKPT          3      // breakpoint
#define T_OFLOW          4      // overflow
#define T_BOUND          5      // bounds check
#define T_ILLOP          6      // illegal opcode
#define T_DEVICE         7      // device not available
#define T_DBLFLT         8      // double fault
#define T_RES1           9      // reserved (not used since 486)
#define T_TSS           10      // invalid task switch segment
#define T_SEGNP         11      // segment not present
#define T_STACK         12      // stack exception
#define T_GPFLT         13      // general protection fault
#define T_PGFLT         14      // page fault
#define T_RES2          15      // reserved
#define T_FPERR         16      // floating point error
#define T_ALIGN         17      // aligment check
#define T_MCHK          18      // machine check
#define T_SIMDERR       19      // SIMD floating point error

// These are arbitrarily chosen, but with care not to overlap
// processor defined exceptions or interrupt vectors.
#define T_SYSCALL       64      // system call
#define T_DEFAULT      500      // catchall

#define T_IRQ0          32      // IRQ 0 corresponds to int T_IRQ

#define IRQ_TIMER        0
#define IRQ_KBD          1
#define IRQ_COM1         4
#define IRQ_IDE         14
#define IRQ_ERROR       19
#define IRQ_SPURIOUS    31

extern uint vector0(void);
extern uint vector1(void);
extern uint vector2(void);
extern uint vector3(void);
extern uint vector4(void);
extern uint vector5(void);
extern uint vector6(void);
extern uint vector7(void);
extern uint vector8(void);
extern uint vector9(void);
extern uint vector10(void);
extern uint vector11(void);
extern uint vector12(void);
extern uint vector13(void);
extern uint vector14(void);
extern uint vector15(void);
extern uint vector16(void);
extern uint vector17(void);
extern uint vector18(void);
extern uint vector19(void);
extern uint vector20(void);
extern uint vector21(void);
extern uint vector22(void);
extern uint vector23(void);
extern uint vector24(void);
extern uint vector25(void);
extern uint vector26(void);
extern uint vector27(void);
extern uint vector28(void);
extern uint vector29(void);
extern uint vector30(void);
extern uint vector31(void);

#endif
