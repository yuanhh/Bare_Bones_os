.text
.global lgdtr
lgdtr:
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

.global lidtr
lidtr:
    movl 4(%esp), %eax
    lidt (%eax)

    ret
