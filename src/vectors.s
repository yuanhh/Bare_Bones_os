.text 

.macro vector_noerr trapno
.global vector\trapno
vector\trapno :
    pushl $0
    pushl $\trapno
    jmp alltraps
.endm

.macro vector_err trapno
.global vector\trapno
vector\trapno :
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
vector_noerr 32
vector_noerr 33
vector_noerr 34
vector_noerr 35
vector_noerr 36
vector_noerr 37
vector_noerr 38
vector_noerr 39
vector_noerr 40
vector_noerr 41
vector_noerr 42
vector_noerr 43
vector_noerr 44
vector_noerr 45
vector_noerr 46
vector_noerr 47

# vector table
.data
.globl vectors
vectors:
  .long vector0
  .long vector1
  .long vector2
  .long vector3
  .long vector4
  .long vector5
  .long vector6
  .long vector7
  .long vector8
  .long vector9
  .long vector10
  .long vector11
  .long vector12
  .long vector13
  .long vector14
  .long vector15
  .long vector16
  .long vector17
  .long vector18
  .long vector19
  .long vector20
  .long vector21
  .long vector22
  .long vector23
  .long vector24
  .long vector25
  .long vector26
  .long vector27
  .long vector28
  .long vector29
  .long vector30
  .long vector31
  .long vector32
  .long vector33
  .long vector34
  .long vector35
  .long vector36
  .long vector37
  .long vector38
  .long vector39
  .long vector40
  .long vector41
  .long vector42
  .long vector43
  .long vector44
  .long vector45
  .long vector46
  .long vector47
