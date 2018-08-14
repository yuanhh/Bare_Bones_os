#include "types.h"
#include "x86.h"
#include "cpu.h"
#include "console.h"

void cpu_detect(void)
{
    // Register storage
    uint eax, ebx, ecx, edx;

    // Function 0x00 - Vendor-ID and Largest Standard Function

    uint largestStandardFunc;
    char vendor[13];
    cpuid(0, &largestStandardFunc, (uint *)(vendor + 0), (uint *)(vendor + 8), (uint *)(vendor + 4));
    vendor[12] = '\0';

    cprintf("CPU Vecdor: %s\n", vendor);

    // Function 0x01 - Feature Information

    if (largestStandardFunc >= 0x01)
    {
        cpuid(0x01, &eax, &ebx, &ecx, &edx);

        cputs("Features:");

        if (edx & EDX_PSE)      cputs(" PSE");
        if (edx & EDX_PAE)      cputs(" PAE");
        if (edx & EDX_APIC)     cputs(" APIC");
        if (edx & EDX_MTRR)     cputs(" MTRR");

        cputs("\n");

        cputs("Instructions:");

        if (edx & EDX_TSC)      cputs(" TSC");
        if (edx & EDX_MSR)      cputs(" MSR");
        if (edx & EDX_SSE)      cputs(" SSE");
        if (edx & EDX_SSE2)     cputs(" SSE2");
        if (ecx & ECX_SSE3)     cputs(" SSE3");
        if (ecx & ECX_SSSE3)    cputs(" SSSE3");
        if (ecx & ECX_SSE41)    cputs(" SSE41");
        if (ecx & ECX_SSE42)    cputs(" SSE42");
        if (ecx & ECX_AVX)      cputs(" AVX");
        if (ecx & ECX_F16C)     cputs(" F16C");
        if (ecx & ECX_RDRAND)   cputs(" RDRAND");

        cputs("\n");
    }

    // Extended Function 0x00 - Largest Extended Function

    uint largestExtendedFunc;
    cpuid(0x80000000, &largestExtendedFunc, &ebx, &ecx, &edx);

    // Extended Function 0x01 - Extended Feature Bits

    if (largestExtendedFunc >= 0x80000001)
    {
        cpuid(0x80000001, &eax, &ebx, &ecx, &edx);

        if (edx & EDX_64_BIT)
        {
            cputs("64-bit Architecture\n");
        }
    }

    // Extended Function 0x02-0x04 - Processor Name / Brand String

    if (largestExtendedFunc >= 0x80000004)
    {
        char name[48];
        cpuid(0x80000002, (uint *)(name +  0), (uint *)(name +  4), (uint *)(name +  8), (uint *)(name + 12));
        cpuid(0x80000003, (uint *)(name + 16), (uint *)(name + 20), (uint *)(name + 24), (uint *)(name + 28));
        cpuid(0x80000004, (uint *)(name + 32), (uint *)(name + 36), (uint *)(name + 40), (uint *)(name + 44));

        // Processor name is right justified with leading spaces
        const char *p = name;
        while (*p == ' ')
        {
            ++p;
        }

        cprintf("CPU Name: %s\n", p);
    }
}
