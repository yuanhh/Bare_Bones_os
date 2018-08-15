#include "types.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"
#include "trap.h"
#include "console.h"

//extern uint vectors[];
void (*vectors[])(void) = {
    [T_DIVIDE] = vector0,
    [T_DEBUG] = vector1,
    [T_NMI] = vector2,
    [T_BRKPT] = vector3,
    [T_OFLOW] = vector4,
    [T_BOUND] = vector5,
    [T_ILLOP] = vector6,
    [T_DEVICE] = vector7,
    [T_DBLFLT] = vector8,
    [T_RES1] = vector9,
    [T_TSS] = vector10,
    [T_SEGNP] = vector11,
    [T_STACK] = vector12,
    [T_GPFLT] = vector13,
    [T_PGFLT] = vector14,
    [T_RES2] = vector15,
    [T_FPERR] = vector16,
    [T_ALIGN] = vector17,
    [T_MCHK] = vector18,
    [T_SIMDERR] = vector19,
};
extern void lidt(uint);

struct gatedesc idt[256];
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
    struct dtreg idtr;

    memset(&idt, 0, sizeof(idt));

    for (gate = 0; gate < 20; gate++)
        set_gatedesc(gate, (uint)vectors[gate], SEG_KCODE << 3, DPL_KERN, 0);

    idtr.size = sizeof(idt) - 1;
    idtr.offset = (uint)&idt;

    cprintf("%d %d\n", sizeof(idtr), sizeof(struct gatedesc));

    lidt((uint)&idtr);
}
