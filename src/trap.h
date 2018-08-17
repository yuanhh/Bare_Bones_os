#ifndef TRAP_H
#define TRAP_H

#include "types.h"

// Programable Interrupt Controller
#define PIC_MS_CMD 0x20
#define PIC_MS_IO 0x21

#define PIC_SV_CMD 0xA0
#define PIC_SV_IO 0xA1

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

extern void vector0(void);
extern void vector1(void);
extern void vector2(void);
extern void vector3(void);
extern void vector4(void);
extern void vector5(void);
extern void vector6(void);
extern void vector7(void);
extern void vector8(void);
extern void vector9(void);
extern void vector10(void);
extern void vector11(void);
extern void vector12(void);
extern void vector13(void);
extern void vector14(void);
extern void vector15(void);
extern void vector16(void);
extern void vector17(void);
extern void vector18(void);
extern void vector19(void);
extern void vector20(void);
extern void vector21(void);
extern void vector22(void);
extern void vector23(void);
extern void vector24(void);
extern void vector25(void);
extern void vector26(void);
extern void vector27(void);
extern void vector28(void);
extern void vector29(void);
extern void vector30(void);
extern void vector31(void);

#endif
