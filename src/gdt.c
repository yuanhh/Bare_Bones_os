#include "string.h"
#include "desctable.h"

struct segdesc gdt[5];
struct descreg gdtr;

extern void lgdtr(uint);

static void set_segdesc(
        ushort sel, 
        uint base, 
        uint limit, 
        uchar type, 
        uchar dpl)
{
    gdt[sel].base_low = base & 0xffff;
    gdt[sel].base_mid = (base >> 16) & 0xff;
    gdt[sel].base_high = (base >> 24) & 0xff;

    gdt[sel].lim_low = limit & 0xffff;
    gdt[sel].lim_high = (limit >> 16) & 0xf;

    gdt[sel].type = type;
    gdt[sel].s = 1;
    gdt[sel].dpl = dpl;
    gdt[sel].p = 1;

    gdt[sel].avl = 0;
    gdt[sel].rsv1 = 0;

    gdt[sel].db = 1;
    gdt[sel].g = 1;
}

void init_gdt(void)
{
    set_segdesc(SEG_KCODE, 0, 0xffffffff, DPL_KERN, STA_X|STA_R);
    set_segdesc(SEG_KDATA, 0, 0xffffffff, DPL_KERN, STA_W);
    set_segdesc(SEG_UCODE, 0, 0xffffffff, DPL_USER, STA_X|STA_R);
    set_segdesc(SEG_UDATA, 0, 0xffffffff, DPL_USER, STA_W);

    gdtr.size = sizeof(gdt) - 1;
    gdtr.offset = (uint)&gdt;

    lgdtr((uint)&gdtr);
}
