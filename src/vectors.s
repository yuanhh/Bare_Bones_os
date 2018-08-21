.macro vector_noerr trapno
.global vector\trapno
vector\trapno:
    pushl $0
    pushl $\trapno
    jmp alltraps
.endm

.macro vector_err trapno
.global vector\trapno
    vector\trapno:
    pushl $\trapno
    jmp alltraps
.endm

.global alltraps
vector_noerr 0
vector_noerr 1
vector_noerr 2
vector_noerr 3
vector_noerr 4
vector_noerr 5
vector_noerr 6
vector_noerr 7
vector_err 8
vector_noerr 9
vector_err 10
vector_err 11
vector_err 12
vector_err 13
vector_err 14
vector_noerr 15
vector_noerr 16
vector_err 17
vector_noerr 18
vector_noerr 19
vector_noerr 20
vector_noerr 21
vector_noerr 22
vector_noerr 23
vector_noerr 24
vector_noerr 25
vector_noerr 26
vector_noerr 27
vector_noerr 28
vector_noerr 29
vector_noerr 30
vector_noerr 31
