#include "types.h"
#include "desctable.h"
#include "trap.h"

struct gatedesc idt[256];
struct descreg idtr;

extern void lidtr(uint);

// extern uint vectors[];
static uint (*vectors[])(void) = {
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
    [20] = vector20,
    [21] = vector21,
    [22] = vector22,
    [23] = vector23,
    [24] = vector24,
    [25] = vector25,
    [26] = vector26,
    [27] = vector27,
    [28] = vector28,
    [29] = vector29,
    [30] = vector30,
    [31] = vector31
};

static void set_gatedesc(
        uchar gate,
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

    idt[gate].type = (istrap) ? STS_TG32 : STS_IG32;
    idt[gate].s = 0;
    idt[gate].dpl = dpl;
    idt[gate].p = 1;
}

void init_idt(void)
{
    uint gate;

    for (gate = 0; gate < 32; gate++)
        set_gatedesc(gate, (uint)vectors[gate], SEG_KCODE << 3, DPL_KERN, 0);

	idtr.size = sizeof(idt) - 1;
	idtr.offset = (uint)&idt;

    lidtr((uint)&idtr);
}
