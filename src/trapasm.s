.globl alltraps
alltraps:
# Build trap frame.
    pushl %ds
    pushl %es
    pushl %fs
    pushl %gs
    pushal

    # Set up data segments.
    movw $0x10, %ax
    movw %ax, %ds
    movw %ax, %es
    
    # Call trap(tf), where tf=%esp
    pushl %esp
    call trap
    addl $4, %esp

# Return falls through to trapret...
.globl trapret
trapret:
    popal
    popl %gs
    popl %fs
    popl %es
    popl %ds
    addl $0x8, %esp  # trapno and errcode
	iret
