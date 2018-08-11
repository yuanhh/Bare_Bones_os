#include "types.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"

struct gatedesc idt[256];
extern uint vectors[];

// Set up a normal interrupt/trap gate descriptor.
// - istrap: 1 for a trap (= exception) gate, 0 for an interrupt gate.
//   interrupt gate clears FL_IF, trap gate leaves FL_IF alone
// - sel: Code segment selector for interrupt/trap handler
// - off: Offset in code segment for interrupt/trap handler
// - dpl: Descriptor Privilege Level -
//        the privilege level required for software to invoke
//        this interrupt/trap gate explicitly using an int instruction.
static void set_gatedesc(
        uint gate,
        uint off, 
        ushort sel, 
        uchar dpl,
        uint istrap)
{

    idt[gate].off_low = off & 0xffff;
    idt[gate].off_high = (off >> 16) & 0xffff;

    idt[gate].cs = sel; // code segment selector
    idt[gate].args = 0; // 0
    idt[gate].rsv1 = 0; // reserved
    idt[sel].access = PRESENT|dpl|DT_SYS;
    idt[sel].access |= (istrap) ? STS_TG32 : STS_IG32;
}

void init_idt(void)
{
    int gate;

    memset(&idt, 0, sizeof(idt));

    for (gate = 0; gate < 256; gate++)
        set_gatedesc(gate, vectors[gate], SEG_KCODE << 3, DPL_KERN, 0);

    lidt(idt, sizeof(idt));
}
