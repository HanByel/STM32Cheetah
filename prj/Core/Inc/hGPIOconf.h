#ifndef HGIPOCONF_H
#define HGIPOCONF_H

#include "stm32f4xx_hal.h"


void hInitGPIOA();
void hInitGPIOB();
void hInitGPIOC();
void hInitGPIOD();
void hInitGPIOE();
void GPIO_INIT_FUNC(GPIO_TypeDef* _gpio, uint16_t _num, int _inout);

#endif //HGIPOCONF_H
