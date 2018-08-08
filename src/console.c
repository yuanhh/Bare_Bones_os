#include <stddef.h>

#include "console.h"

static const int VGA_WIDTH = 80;
static const int VGA_HEIGHT = 25;
 
uint16_t *vga;

static inline uint8_t vga_entry_color(enum vga_color fg, enum vga_color bg) 
{
    return fg | bg << 4;
}
 
static inline uint16_t vga_entry(unsigned char uc, uint8_t color) 
{
    return (uint16_t) uc | (uint16_t) color << 8;
}

static void console_putc(char c)
{
    int pos;

    // Cursor position: col + 80*row.
    outb(VGA_CONTROL_PORT, VGA_HIGH_BYTE);
    pos = inb(VGA_DATA_PORT) << 8;
    outb(VGA_CONTROL_PORT, VGA_LOW_BYTE);
    pos |= inb(VGA_DATA_PORT);

    if (c == '\n') {
        pos += VGA_WIDTH - pos % 80;
    } else if (c == 0x08) { /* back space */
        if (pos > 0)
            --pos;
    } else {
        vga[pos++] = (c&0xff) | TERMINAL_COLOR;
    }

    if (pos < 0 || pos > VGA_WIDTH * VGA_HEIGHT) {
        for (;;);
    }

    outb(VGA_CONTROL_PORT, VGA_HIGH_BYTE);
    outb(VGA_DATA_PORT, pos>>8);
    outb(VGA_CONTROL_PORT, VGA_LOW_BYTE);
    outb(VGA_DATA_PORT, pos);

    vga[pos] = ' ' | TERMINAL_COLOR;
}

void console_clear()
{
    int pos;

    vga = (uint16_t *) VGA_MEMORY;

    for (pos = 0; pos < VGA_WIDTH*VGA_HEIGHT; pos++)
        vga[pos] = ' ' | TERMINAL_COLOR;
}

void console_write(char *string)
{
    int i = 0;

    while (string[i])
        console_putc(string[i++]);
}