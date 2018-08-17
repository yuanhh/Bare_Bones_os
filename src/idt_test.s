.text
int_handler:
    movl $0x123abc, 0x0
    hlt

.p2align 3
idt:
    .skip 50*8

idtr:
    .short (50*8)-1
    .long idt

.global do_test
do_test:
    lidt idtr
    movl $int_handler, %eax
    mov %ax, idt+49*8
    movw $0x8, idt+49*8+2
    movw $0x8e00, idt+49*16+4
    shr $16, %eax
    mov %ax, idt+49*8+6
    int $0x49
