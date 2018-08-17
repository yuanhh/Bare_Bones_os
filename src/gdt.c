#include "types.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"
#include "console.h"

extern void lgdt(uint);

struct segdesc gdt[NSEGS];
struct dtreg gdtr;

static void set_segdesc(
        ushort sel, 
        uint base, 
        uint limit, 
        uchar type, 
        uchar dpl)
{
    gdt[sel].base_15_0 = base & 0xffff;
    gdt[sel].base_23_16 = (base >> 16) & 0xff;
    gdt[sel].base_31_24 = (base >> 24) & 0xff;

    gdt[sel].lim_15_0 = limit & 0xffff;
    gdt[sel].lim_19_16 = (limit >> 16) & 0xf;

    // access
    gdt[sel].type = type;
    gdt[sel].s = 1;
    gdt[sel].dpl = dpl;
    gdt[sel].p = 1;

    // granularity
    gdt[sel].db = 1; // 32-bit seg
    gdt[sel].g = 1; // 4k limit
}

void init_gdt(void)
{
    memset(&gdt, 0, sizeof(gdt));

    set_segdesc(SEG_KCODE, 0, 0xffffffff, STA_X|STA_R, DPL_KERN);
    set_segdesc(SEG_KDATA, 0, 0xffffffff, STA_W, DPL_KERN);
    set_segdesc(SEG_UCODE, 0, 0xffffffff, STA_X|STA_R, DPL_USER);
    set_segdesc(SEG_UDATA, 0, 0xffffffff, STA_W, DPL_USER);

    gdtr.size = sizeof(gdt) - 1;
    gdtr.offset = (uint)gdt;

    lgdt((uint)&gdtr);
}
