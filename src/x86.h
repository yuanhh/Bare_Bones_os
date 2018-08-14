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

static inline void cli(void)
{
    asm volatile("cli");
}

static inline void cpuid(
        uint info, 
        uint *eaxp, 
        uint *ebxp, 
        uint *ecxp, 
        uint *edxp)
{
    uint eax, ebx, ecx, edx;
    asm volatile("cpuid"
            : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)
            : "a" (info));
    if (eaxp)
        *eaxp = eax;
    if (ebxp)
        *ebxp = ebx;
    if (ecxp)
        *ecxp = ecx;
    if (edxp)
        *edxp = edx;
}

static inline uint read_ebp(void)
{
    uint ebp;

    __asm __volatile("movl %%ebp,%0" : "=r" (ebp));

    return ebp;
}

struct regstate {
    uint eax;
    uint ecx;
    uint edx;
    uint ebx;
    uint oesp; /* useless */
    uint ebp;
    uint esi;
    uint edi;
};

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
void init_gdt(void);
void init_idt(void);
