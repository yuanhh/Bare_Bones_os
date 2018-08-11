#include "types.h"
#include "x86.h"
#include "console.h"
#include "string.h"

void trap(struct trapframe *frame)
{
	char trapno_s[10] = {0};

	console_write("recieved interrupt: ");
    itoa(frame->trapno, trapno_s, 10, 10);
    console_write(trapno_s);
    console_write("\n");
}
