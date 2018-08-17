.set SEG_KCODE, 1
.set SEG_KDATA, 2

.text

.global lgdt
lgdt:
    movl 4(%esp), %eax
    lgdt (%eax)

    movw $(SEG_KDATA<<3), %ax
    movw %ax, %ds
    movw %ax, %es
    movw %ax, %fs
    movw %ax, %gs
    movw %ax, %ss

    ljmp $(SEG_KCODE<<3), $load

load:
    ret

.global lidt
lidt:
    movl 4(%esp), %eax
    lidt (%eax)

	ret
