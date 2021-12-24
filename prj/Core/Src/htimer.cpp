#include <htimer.hpp>


hTimer* hTimer::mp_Instance=NULL;




TIM_HandleTypeDef htim[15];

hTimer::hTimer(){


}

hTimer::~hTimer(){


}


hTimer& hTimer::getInstance(void) {
    if (mp_Instance == NULL) {
        mp_Instance = new hTimer();
    }
    return *mp_Instance;
}


void hTimer::TIMinit(){
	MX_TIM5_Init();
	MX_TIM7_Init();

	HAL_TIM_Base_Start_IT(&htim[5]);
	HAL_TIM_Base_Start_IT(&htim[7]);

}


void hTimer::MX_TIM5_Init(void)
{
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};

  htim[5].Instance = TIM5;
  htim[5].Init.Prescaler = 419;
  htim[5].Init.CounterMode = TIM_COUNTERMODE_UP;
  htim[5].Init.Period = 499;
  htim[5].Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim[5].Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  if (HAL_TIM_OC_Init(&htim[5]) != HAL_OK)
  {
    Error_Handler();
  }
  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  if (HAL_TIMEx_MasterConfigSynchronization(&htim[5], &sMasterConfig) != HAL_OK)
  {
    Error_Handler();
  }
  sConfigOC.OCMode = TIM_OCMODE_TIMING;
  sConfigOC.Pulse = 0;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  if (HAL_TIM_OC_ConfigChannel(&htim[5], &sConfigOC, TIM_CHANNEL_1) != HAL_OK)
  {
    Error_Handler();
  }
}

void hTimer::MX_TIM7_Init(void)
{
	TIM_MasterConfigTypeDef sMasterConfig = {0};

	htim[7].Instance = TIM7;
	htim[7].Init.Prescaler = 41;
	htim[7].Init.CounterMode = TIM_COUNTERMODE_UP;
	htim[7].Init.Period = 999;
	htim[7].Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	htim[7].State = HAL_TIM_STATE_RESET;
	if (HAL_TIM_Base_Init(&htim[7]) != HAL_OK)
	{
	Error_Handler();
	}
	sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
	sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
	if (HAL_TIMEx_MasterConfigSynchronization(&htim[7], &sMasterConfig) != HAL_OK)
	{
	Error_Handler();
	}

}

void hTimer::getTimerId(TIM_HandleTypeDef &_timId, int _num){
	_timId = htim[_num];
}



void hTimer::Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
