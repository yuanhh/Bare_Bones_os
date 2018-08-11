#include "types.h"
#include "mmu.h"

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

static inline void lgdt(struct segdesc *p, int size)
{
	volatile struct dt_reg gdtr;

	gdtr.size = size-1;
	gdtr.offset = (uint)p;

	asm volatile("lgdt (%0)" : : "r" (&gdtr));
}

static inline void lidt(struct gatedesc *p, int size)
{
	volatile struct dt_reg idtr;

	idtr.size = size-1;
	idtr.offset = (uint)p;

	asm volatile("lidt (%0)" : : "r" (&idtr));
}

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
