.text

.global lgdt
.p2align 3
lgdt:
    movl 4(%esp), %eax
    lgdt (%eax)

    movw $0x10, %ax
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %fs
    movw %ax, %gs
    movw %ax, %ss

    ljmp $0x8, $load

load:
    ret

.global lidt
.p2align 3
lidt:
    movl 4(%esp), %eax
    lidt (%eax)

	ret
