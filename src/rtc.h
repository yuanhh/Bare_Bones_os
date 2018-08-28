#ifndef _KCLOCK_H
#define _KCLOCK_H

#include "types.h"

#define RTC_IO1 0x70
#define RTC_IO2 0x71

#define	MC_NVRAM_START	0xe	/* start of NVRAM: offset 14 */
#define	MC_NVRAM_SIZE	50	/* 50 bytes of NVRAM */

/* Non-volatile RAM bytes 7 & 8: base memory size */
#define NVRAM_BASELO (MC_NVRAM_START + 7)	/* low byte; RTC off. 0x15 */
#define NVRAM_BASEHI (MC_NVRAM_START + 8) /* high byte; RTC off. 0x16 */

/* Non-volatile RAM bytes 9 & 10: extended memory size */
#define NVRAM_EXTLO	(MC_NVRAM_START + 9)	/* low byte; RTC off. 0x17 */
#define NVRAM_EXTHI	(MC_NVRAM_START + 10) /* high byte; RTC off. 0x18 */

uchar lnvram(uint reg);

#endif
