#include "types.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"

struct segdesc gdt[NSEGS];

extern void lgdt();

static void set_segdesc(
        ushort sel, 
        uint base, 
        uint limit, 
        uchar type, 
        uchar dpl)
{
    gdt[sel].base_low = base & 0xffff;
    gdt[sel].base_middle = (base >> 16) & 0xff;
    gdt[sel].base_high = (base >> 24) & 0xff;

    gdt[sel].limit_low = limit & 0xffff;
    gdt[sel].limit_high = (limit >> 16) & 0xf;

    gdt[sel].flags = SEG_GRAN|SEG_SIZE;
    gdt[sel].access = PRESENT|dpl|DT_APP|type;
}

void init_gdt(void)
{
	struct dtreg gdtr;

    memset(&gdt, 0, sizeof(gdt));

    set_segdesc(SEG_KCODE, 0, 0xffffffff, DPL_KERN, STA_X|STA_R);
    set_segdesc(SEG_KDATA, 0, 0xffffffff, DPL_KERN, STA_W);
    set_segdesc(SEG_UCODE, 0, 0xffffffff, DPL_USER, STA_X|STA_R);
    set_segdesc(SEG_UDATA, 0, 0xffffffff, DPL_USER, STA_W);

	gdtr.size = sizeof(gdt) - 1;
	gdtr.offset = (uint)&gdt;

    lgdt(&gdtr);
}
