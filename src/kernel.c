#include "console.h"

int kernel_main(void) 
{
    console_clear();
    console_write("Hello,World!\n");

    return 0xDEADBABA;
} 
