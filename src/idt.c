#include "types.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"
#include "console.h"
#include "trap.h"

extern void lidt(uint);

struct gatedesc idt[48];
struct dtreg idtr;

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
    idt[gate].off_15_0 = off & 0xffff;
    idt[gate].off_31_16 = (off >> 16) & 0xffff;

    idt[gate].cs = sel; // code segment selector
    idt[gate].args = 0; // 0
    idt[gate].rsv1 = 0; // reserved

    //access
    idt[sel].type = (istrap) ? STS_TG32 : STS_IG32;
    idt[sel].s = 0;
    idt[sel].dpl = dpl;
    idt[sel].p = 1;
}

void remap_pic(void)
{
    uchar picm, pics;

    picm = inb(PIC_MS_IO);
    pics = inb(PIC_SV_IO);

	outb(PIC_MS_CMD, ICW1_INIT);
	outb(PIC_SV_CMD, ICW1_INIT);
	outb(PIC_MS_IO, ICW2_MASTER);
	outb(PIC_SV_IO, ICW2_SLAVE);
	outb(PIC_MS_IO, ICW3_MASTER);
	outb(PIC_SV_IO, ICW3_SLAVE);
	outb(PIC_MS_IO, ICW4_8086);
	outb(PIC_SV_IO, ICW4_8086);

	outb(PIC_MS_IO, 0x0);
	outb(PIC_SV_IO, 0x0);
}

void picinit(void)
{
    // mask all interrupts
    outb(PIC_MS_IO, 0xFF);
    outb(PIC_SV_IO, 0xFF);
}

void init_idt(void)
{
    int gate = 0;

    memset(&idt, 0, sizeof(idt));
    
    for (gate = 0; gate < 48; gate++)
        set_gatedesc(gate, vectors[gate], SEG_KCODE << 3, DPL_KERN, 0);

    remap_pic();
    //picinit();

    idtr.size = sizeof(idt) - 1;
    idtr.offset = (uint)idt;

    lidt((uint)&idtr);
}
