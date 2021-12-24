#include "hGPIOconf.h"


void hInitGPIOA(){
	  __HAL_RCC_GPIOA_CLK_ENABLE();
	  //GPIO PORT, PIN NUMBER, (IN = 0, OUT = else)
	  GPIO_INIT_FUNC(GPIOA, GPIO_PIN_15, 1);
}

void hInitGPIOB(){
	  __HAL_RCC_GPIOB_CLK_ENABLE();
	  GPIO_INIT_FUNC(GPIOB, GPIO_PIN_4, 1);

}

void hInitGPIOC(){
	  __HAL_RCC_GPIOC_CLK_ENABLE();

}

void hInitGPIOD(){
	  __HAL_RCC_GPIOD_CLK_ENABLE();

}
void hInitGPIOE(){
	  __HAL_RCC_GPIOE_CLK_ENABLE();

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
void GPIO_INIT_FUNC(GPIO_TypeDef* _gpio, uint16_t _num, int _inout){
	  GPIO_InitTypeDef GPIO_InitStruct = {0};
	  HAL_GPIO_WritePin(_gpio, _num, GPIO_PIN_RESET);

	  GPIO_InitStruct.Pin = _num;
	  if(_inout)	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	  else			GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
	  GPIO_InitStruct.Pull = GPIO_NOPULL;
	  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	  HAL_GPIO_Init(_gpio, &GPIO_InitStruct);

}
