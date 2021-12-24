/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2021 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_HPP
#define __MAIN_HPP

/* Includes ------------------------------------------------------------------*/

#include "hcommon.hpp"
#include "hCommunication.hpp"
#include <htimer.hpp>
#include "workspace.hpp"


#ifdef __cplusplus
extern "C" {
#endif

#include "stm32f4xx_hal.h"
#include "hGPIOconf.h"


void SystemClock_Config(void);
void Error_Handler(void);



#ifdef __cplusplus
}
#endif



#endif /* __MAIN_HPP */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
