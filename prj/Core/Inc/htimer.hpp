#ifndef HTIEMR_HPP
#define HTIEMR_HPP

#include "stm32f4xx_hal.h"
#include <stm32f4xx_it.hpp>



class hTimer{
public:
	hTimer();
    virtual ~hTimer();
    static hTimer &getInstance();
    void TIMinit();

    static hTimer *mp_Instance;
    void Error_Handler(void);

    void MX_TIM5_Init();
    void MX_TIM7_Init();
    void getTimerId(TIM_HandleTypeDef &_timId, int _num);

public:
    void HAL_CAN_ErrorCallback(CAN_HandleTypeDef *hcan);
};

#endif //HTIEMR_HPP
