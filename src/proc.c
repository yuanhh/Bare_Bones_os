#include "types.h"
#include "paging.h"

struct {
    struct proc proc[NPROC];
} ptable;

static struct proc *proclist;
static uint nextpid = 1;

static struct proc *walkptable(void)
{
    struct proc *p

    for (p = ptable.proc; p < &ptable.proc[NPROC]; p++)
        if (p->state == UNUSED)
            return p;

    return 0;
}

static struct proc *allocproc(void)
{
    struct proc *p;
    char *sp;

    p = walkptable();

    p->state = EMBRYO;
    p->pid = nextpid++;

    // setup stack
    p->kstack = (char *)kalloc();
    if (!p->kstack) {
        p->state = UNUSED;
        return 0;
    }

    sp = p->kstack + PGSZIE;
    // reserve stack for trapframe
    sp -= sizeof(struct trapframe);
    p->tf = (struct trapframe *)sp;

    // set current sp for trapret pointer
    sp -= 4;
    *(uint *)sp = (uint) trapret;

    //leave room for register context
    sp -= sizeof(struct context);
    p->context = (struct context *)sp;

    memset(p->context, 0, sizeof(struct context));
    p->context->eip = (uint)forkret;

    return p;
}

void userinit(void)
{
    struct proc *p;

    p = allocproc();

    proclist = p;
}
