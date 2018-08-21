#ifndef _TRAP_H
#define _TRAP_H

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

// Programable Interrupt Controller
#define PIC1_CMD 0x20
#define PIC1_IO 0x21
#define PIC2_CMD 0xA0
#define PIC2_IO 0xA1
// PIC Command End of Interrupt
#define PIC_INIT 0x11
#define PIC_EOI 0x20
/* 
 * i8259A definition
 */
#define ICW1_INIT   0x11 /* ICW1 - ICW4 needed, cascade mode, interval=8,
                          * edge triggered. (I think interval is irrelevant
                          * for x86.) */
#define ICW2_MASTER 0x20 /* put IRQs 0-7 at 0x20 (above Intel reserved ints) */
#define ICW2_SLAVE  0x28 /* put IRQs 8-15 at 0x28 */
#define ICW3_MASTER 0x04 /* IR2 connected to slave */
#define ICW3_SLAVE  0x02 /* slave has id 2 */
#define ICW4_8086   0x01 /* 8086 mode, no auto-EOI, non-buffered mode,
                          * not special fully nested mode */

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
extern uint vector32(void);
extern uint vector33(void);
extern uint vector34(void);
extern uint vector35(void);
extern uint vector36(void);
extern uint vector37(void);
extern uint vector38(void);
extern uint vector39(void);
extern uint vector40(void);
extern uint vector41(void);
extern uint vector42(void);
extern uint vector43(void);
extern uint vector44(void);
extern uint vector45(void);
extern uint vector46(void);
extern uint vector47(void);

#endif
