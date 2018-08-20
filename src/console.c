#include "types.h"
#include "x86.h"
#include "console.h"
#include "string.h"

static const int VGA_WIDTH = 80;
static const int VGA_HEIGHT = 25;

void panic(char *s);

static ushort *vga;

static int get_cursor()
{
    int pos;

    outb(VGA_CONTROL_PORT, VGA_HIGH_BYTE);
    pos = inb(VGA_DATA_PORT) << 8;
    outb(VGA_CONTROL_PORT, VGA_LOW_BYTE);
    pos |= inb(VGA_DATA_PORT);

    return pos;
}

static void set_cursor(int pos)
{
    outb(VGA_CONTROL_PORT, VGA_HIGH_BYTE);
    outb(VGA_DATA_PORT, pos >> 8);
    outb(VGA_CONTROL_PORT, VGA_LOW_BYTE);
    outb(VGA_DATA_PORT, pos);
}

static void cputc(char c)
{
    int pos;

    pos = get_cursor();

    if (c == '\n') {
        pos += VGA_WIDTH - pos % VGA_WIDTH;
    } else if (c == 0x08) { /* back space */
        if (pos > 0)
            --pos;
    } else {
        vga[pos++] = (c & 0xff) | TERMINAL_COLOR;
    }

    if (pos < 0 || pos > VGA_WIDTH * VGA_HEIGHT) {
        panic("pos overflow");
    }

    if (pos / VGA_WIDTH >= 24) {
        memmove(vga, vga + VGA_WIDTH, sizeof(vga[0])*23*80);
        pos -= VGA_WIDTH;
        memset(vga + pos, 0, sizeof(vga[0])*(24*80 - pos));
    }

    set_cursor(pos);

    vga[pos] = ' ' | TERMINAL_COLOR;
}

void cputs(const char *string)
{
    int i = 0;

    while (string[i])
        cputc(string[i++]);
}

// Clear the screen
void clear(void)
{
    int pos;

    for (pos = 0; pos < VGA_WIDTH*VGA_HEIGHT; pos++)
        cputc(' ');
}

// init and clear the screen
void vga_init(void)
{
    vga = (ushort *)VGA_MEMORY;

    clear();
}

void panic(char *s)
{
    cli();

    cputs(s);

    for(;;)
        ;
}

void cprintf(const char *fmt, ...)
{
    uint *argp;
    int i ,c;
    char num[12];
    char *str;

    if (fmt == 0)
        panic("null fmt");

    argp = (uint *)(void *)(&fmt + 1);
    for (i = 0; (c = fmt[i] & 0xff) != 0; i++) {
        if (c != '%') {
            cputc(c);
            continue;
        }
        c = fmt[++i] & 0xff;
        if (c == 0)
            break;

        switch(c) {
            case 'd':
                memset(&num, 0, sizeof(num));
                itoa(*argp++, num, 12, 10);
                cputs(num);
                break;
            case 'x':
            case 'p':
                memset(&num, 0, sizeof(num));
                itoa(*argp++, num, 12, 16);
                cputs(num);
                break;
            case 's':
                if ((str = (char *)*argp++) == 0)
                    str = "(null)";
                cputs(str);
                break;
            default:
                // Print unknown % sequence to draw attention.
                cputc('%');
                cputc(c);
                break;
        }
    }
}
