#ifndef __ADC__
#define __ADC__

#include <stdint.h>
#include <xc.h>

void init_adc(void);
void read_adc(uint16_t *value);

#endif