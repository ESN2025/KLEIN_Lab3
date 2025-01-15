#include "sys/alt_stdio.h"

#include "system.h"
#include "alt_types.h"
//TIMER
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
//IRQ
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
//PIO
#include "altera_avalon_pio_regs.h"

alt_u32 value;

static void processTimer(void * context, alt_u32 id){
	value++;
	//clear
	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE,0);
}

int main() {
	alt_printf("\nLab 3 : Timer");
	value = 0;
	
	alt_irq_register(TIMER_IRQ, NULL, (void*)processTimer);
	
	while(1){
		//COMPTEUR
		alt_u32 shift = 0;
		alt_u32 dataSend = 0;
		alt_u32 val = value;
		while (val > 0) {
			dataSend += (val % 10) << shift;
			shift += 4;
			val = val / 10;
		}
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_OUT_BASE,dataSend);
	}
	return 0;
}

