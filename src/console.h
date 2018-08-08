#ifndef MONITOR_H
#define MONITOR_H

#include "io.h"

/* Hardware text mode color constants. */
enum vga_color {
    VGA_COLOR_BLACK = 0,
    VGA_COLOR_BLUE = 1,
    VGA_COLOR_GREEN = 2,
    VGA_COLOR_CYAN = 3,
    VGA_COLOR_RED = 4,
    VGA_COLOR_MAGENTA = 5,
    VGA_COLOR_BROWN = 6,
    VGA_COLOR_LIGHT_GREY = 7,
    VGA_COLOR_DARK_GREY = 8,
    VGA_COLOR_LIGHT_BLUE = 9,
    VGA_COLOR_LIGHT_GREEN = 10,
    VGA_COLOR_LIGHT_CYAN = 11,
    VGA_COLOR_LIGHT_RED = 12,
    VGA_COLOR_LIGHT_MAGENTA = 13,
    VGA_COLOR_LIGHT_BROWN = 14,
    VGA_COLOR_WHITE = 15,
};

/* The I/O ports */
#define VGA_CONTROL_PORT 0x3d4
#define VGA_DATA_PORT 0x3d5
/* The I/O port commands */
#define VGA_HIGH_BYTE 14
#define VGA_LOW_BYTE 15

#define VGA_MEMORY 0xb8000

#define TERMINAL_COLOR 0x0700

void console_clear();

void console_write(char *string);

#endif
