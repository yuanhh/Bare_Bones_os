#include "types.h"

static inline void outb(ushort port, uchar data)
{
	asm volatile ("out %0, %1" : : "a" (data), "d" (port));
}

static inline uchar inb(ushort port)
{
	uchar data;

	asm volatile ("in %1, %0" : "=a" (data) : "d" (port));

	return data;
}

static inline void cli(void)
{
    asm volatile("cli");
}

// Layout of the trap frame built on the stack by the
// hardware and by trapasm.S, and passed to trap().
struct trapframe {
    // registers as pushed by pusha
    uint edi;
    uint esi;
    uint ebp;
    uint oesp;      // useless & ignored
    uint ebx;
    uint edx;
    uint ecx;
    uint eax;

    // rest of trap frame
    ushort gs;
    ushort padding1;
    ushort fs;
    ushort padding2;
    ushort es;
    ushort padding3;
    ushort ds;
    ushort padding4;
    uint trapno;

    // below here defined by x86 hardware
    uint err;
    uint eip;
    ushort cs;
    ushort padding5;
    uint eflags;

    // below here only when crossing rings, such as from user to kernel
    uint esp;
    ushort ss;
    ushort padding6;
};
