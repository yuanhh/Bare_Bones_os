#ifndef GDT_H
#define GDT_H

#include "types.h"

struct descreg {
    ushort size;
    uint offset;
}__attribute__((packed));

struct segdesc {
    uint lim_low : 16;  // Low bits of segment limit
    uint base_low : 16; // Low bits of segment base address
    uint base_mid : 8; // Middle bits of segment base address
    uint type : 4;       // Segment type (see STS_ constants)
    uint s : 1;          // 0 = system, 1 = application
    uint dpl : 2;        // Descriptor Privilege Level
    uint p : 1;          // Present
    uint lim_high : 4;  // High bits of segment limit
    uint avl : 1;        // Unused (available for software use)
    uint rsv1 : 1;       // Reserved
    uint db : 1;         // 0 = 16-bit segment, 1 = 32-bit segment
    uint g : 1;          // Granularity: limit scaled by 4K when set
    uint base_high : 8; // High bits of segment base address
}__attribute__((packed));

struct gatedesc {
    uint off_low : 16;   // low 16 bits of offset in segment
    uint cs : 16;         // code segment selector
    uint args : 5;        // # args, 0 for interrupt/trap gates
    uint rsv1 : 3;        // reserved(should be zero I guess)
    uint type : 4;        // type(STS_{TG,IG32,TG32})
    uint s : 1;           // must be 0 (system)
    uint dpl : 2;         // descriptor(meaning new) privilege level
    uint p : 1;           // Present
    uint off_high : 16;  // high bits of offset in segment
};

void init_gdt(void);
void init_idt(void);

// various segment selectors.
#define SEG_KCODE 1  // kernel code
#define SEG_KDATA 2  // kernel data+stack
#define SEG_UCODE 3  // user code
#define SEG_UDATA 4  // user data+stack
#define SEG_TSS   5 // this process's task state

#define DPL_KERN    0x0     // Kernel DPL
#define DPL_USER    0x3     // User DPL

// Application segment type bits
#define STA_X       0x8     // Executable segment
#define STA_E       0x4     // Expand down (non-executable segments)
#define STA_C       0x4     // Conforming code segment (executable only)
#define STA_W       0x2     // Writeable (non-executable segments)
#define STA_R       0x2     // Readable (executable segments)
#define STA_A       0x1 // Accessed

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
