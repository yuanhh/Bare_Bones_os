#include "types.h"
#include "x86.h"
#include "console.h"
#include "rtc.h"

uint totmem;
static uint basemem;

void detect_memory(void)
{
    uint extmem;

    basemem = lnvram(NVRAM_BASELO) | lnvram(NVRAM_BASEHI) << 8;
    extmem = lnvram(NVRAM_EXTLO) | lnvram(NVRAM_EXTHI) << 8;

    if (extmem)
        totmem = (EXTPHYSMEM / 1024) + extmem;
    else
        totmem = basemem;

    cprintf("Physical memory:   %d KB\n", totmem);
    cprintf("Base memory:       %d KB\n", basemem);
    cprintf("Extended memory:   %d KB\n", extmem);
}
