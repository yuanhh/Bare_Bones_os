#ifndef MMU_H
#define MMU_H

#include "types.h"

/*  struct access {
        uint type : 4;  // type(STS_ constants)
        uint dt : 1;    // 0 = system, 1 = application
        uint dpl : 2;   // descriptor  privilege level
        uint p : 1;     // Present
    }__attribute__((packed)); */

struct dtreg {
    ushort size;
    uint offset;
}__attribute__((packed));

struct segdesc {
    ushort limit_low;           // The lower 16 bits of the limit.
    ushort base_low;            // The lower 16 bits of the base.
    uchar  base_middle;         // The next 8 bits of the base.
    uchar  access;
    uchar  limit_high : 4;       // The last 4 bits of the limit.
    uchar  flags : 4;
    uchar  base_high;           // The last 8 bits of the base.
}__attribute__((packed));

struct gatedesc {
    ushort off_low;
    ushort cs;
    uchar args : 5;
    uchar rsv1 : 3;
    uchar access;
    ushort off_high;
}__attribute__((packed));

void init_gdt(void);
void init_idt(void);

// various segment selectors.
#define SEG_KCODE 1  // kernel code
#define SEG_KDATA 2  // kernel data+stack
#define SEG_UCODE 3  // user code
#define SEG_UDATA 4  // user data+stack
#define SEG_TSS 5 // this process's task state

// gdt[NSEGS] holds the above segments.
#define NSEGS 6

#define PRESENT  0x80
#define DPL_KERN 0x00 // Kernel DPL
#define DPL_USER 0x60 // User DPL
#define DT_APP   0x10 // Descriptor type 0 = system, 1 = application
#define DT_SYS   0x00

// Application segment type bits
#define STA_X   0x8   // Executable segment
#define STA_E   0x4   // Expand down (non-executable segments)
#define STA_C   0x4   // Conforming code segment (executable only)
#define STA_W   0x2   // Writeable (non-executable segments)
#define STA_R   0x2   // Readable (executable segments)
#define STA_A   0x1   // Accessed

#define SEG_GRAN 0x8 // Granularity: limit scaled by 4K when set
#define SEG_SIZE 0x4 // 0 = 16-bit segment, 1 = 32-bit segment

// System segment type bits
#define STS_T16A    0x1     // Available 16-bit TSS
#define STS_LDT     0x2     // Local Descriptor Table
#define STS_T16B    0x3     // Busy 16-bit TSS
#define STS_CG16    0x4     // 16-bit Call Gate
#define STS_TG      0x5     // Task Gate / Coum Transmitions
#define STS_IG16    0x6     // 16-bit Interrupt Gate
#define STS_TG16    0x7     // 16-bit Trap Gate
#define STS_T32A    0x9     // Available 32-bit TSS
#define STS_T32B    0xB     // Busy 32-bit TSS
#define STS_CG32    0xC     // 32-bit Call Gate
#define STS_IG32    0xE     // 32-bit Interrupt Gate
#define STS_TG32    0xF     // 32-bit Trap Gate

#endif
