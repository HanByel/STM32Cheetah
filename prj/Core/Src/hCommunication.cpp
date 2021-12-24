/* 
 * 2021-09-30 Minicheeta
 * Communication class
 * CAN / UART
 */


#include "hCommunication.hpp"

hCommunication* hCommunication::mp_Instance=NULL;

hCommunication::hCommunication(){


    mspi.State = HAL_SPI_STATE_RESET;

    mspi.hdmatx = &mDMA_spi_tx;
    mspi.hdmarx = &mDMA_spi_rx;
}

hCommunication::~hCommunication(){


}


hCommunication& hCommunication::getInstance(void) {
    if (mp_Instance == NULL) {
        mp_Instance = new hCommunication();
    }


    return *mp_Instance;
}


/** 2021-10-15  HanByel
 * Communication init
 */
void hCommunication::communicationInit(){


	MX_CAN1_Init();
	MX_CAN2_Init();
	MX_DMA_Init();
	spiInit();

	hCommunication::getInstance().spiDataTxRx(mSPIZData, mSPIZData);
	//uartInit();


 }

/**
  * @brief CAN1 Initialization Function
  * @param None
  * @retval None
  */
void hCommunication::MX_CAN1_Init(void)
{

  /* USER CODE BEGIN CAN1_Init 0 */

  /* USER CODE END CAN1_Init 0 */

  /* USER CODE BEGIN CAN1_Init 1 */

  /* USER CODE END CAN1_Init 1 */
	mcan[1].Instance = CAN1;
	mcan[1].Init.Prescaler = 3;
	mcan[1].Init.Mode = CAN_MODE_NORMAL;
	mcan[1].Init.SyncJumpWidth = CAN_SJW_1TQ;
	mcan[1].Init.TimeSeg1 = CAN_BS1_11TQ;
	mcan[1].Init.TimeSeg2 = CAN_BS2_2TQ;
	mcan[1].Init.TimeTriggeredMode = DISABLE;
	mcan[1].Init.AutoBusOff = DISABLE;
	mcan[1].Init.AutoWakeUp = DISABLE;
	mcan[1].Init.AutoRetransmission = DISABLE;
	mcan[1].Init.ReceiveFifoLocked = DISABLE;
	mcan[1].Init.TransmitFifoPriority = DISABLE;
	mcan[1].State = HAL_CAN_STATE_RESET;

  if (HAL_CAN_Init(&mcan[1]) != HAL_OK)
  {
    Error_Handler();
  }

  mCANFilterConfig[1].FilterBank = 0; //CAN1 -> 0~13 , CAN2 -> 14~27
  mCANFilterConfig[1].FilterMode = CAN_FILTERMODE_IDMASK;
  mCANFilterConfig[1].FilterScale = CAN_FILTERSCALE_32BIT;
  mCANFilterConfig[1].FilterIdHigh = 0x0000;
  mCANFilterConfig[1].FilterIdLow = 0x0000;
  mCANFilterConfig[1].FilterMaskIdHigh = 0x0000;              // 0x00000000 = 모든 ID를 받아들이겠다
  mCANFilterConfig[1].FilterMaskIdLow = 0x0000;
  mCANFilterConfig[1].FilterFIFOAssignment = CAN_RX_FIFO0;
  mCANFilterConfig[1].FilterActivation = ENABLE;
  mCANFilterConfig[1].SlaveStartFilterBank = 14; //CAN1 -> 0~13 , CAN2 -> 14~27



  if (HAL_CAN_ConfigFilter(&mcan[1], &mCANFilterConfig[1]) != HAL_OK)
  {
    /* Filter configuration Error */
    Error_Handler();
  }

  /* Can Start */
  if (HAL_CAN_Start(&mcan[1]) != HAL_OK)
  {
    /* Start Error */
    Error_Handler();
  }

  /* Activate CAN RX notification */
  if (HAL_CAN_ActivateNotification(&mcan[1], CAN_IT_RX_FIFO0_MSG_PENDING) != HAL_OK)
  {
    /* Notification Error */
    Error_Handler();
  }

  /* USER CODE BEGIN CAN1_Init 2 */
  //setCANID(hcan, 1);
  /* USER CODE END CAN1_Init 2 */

}

/**
  * @brief CAN2 Initialization Function
  * @param None
  * @retval None
  */
void hCommunication::MX_CAN2_Init(void)
{
  /* USER CODE END CAN2_Init 0 */

  /* USER CODE BEGIN CAN2_Init 1 */


  /* USER CODE END CAN2_Init 1 */
	mcan[2].Instance = CAN2;
	mcan[2].Init.Prescaler = 3;
	mcan[2].Init.Mode = CAN_MODE_NORMAL;
	mcan[2].Init.SyncJumpWidth = CAN_SJW_1TQ;
	mcan[2].Init.TimeSeg1 = CAN_BS1_11TQ;
	mcan[2].Init.TimeSeg2 = CAN_BS2_2TQ;
	mcan[2].Init.TimeTriggeredMode = DISABLE;
	mcan[2].Init.AutoBusOff = DISABLE;
	mcan[2].Init.AutoWakeUp = DISABLE;
	mcan[2].Init.AutoRetransmission = DISABLE;
	mcan[2].Init.ReceiveFifoLocked = DISABLE;
	mcan[2].Init.TransmitFifoPriority = DISABLE;
	mcan[2].State = HAL_CAN_STATE_RESET;

  if (HAL_CAN_Init(&mcan[2]) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN CAN2_Init 2 */
  /* USER CODE END CAN2_Init 2 */


  mCANFilterConfig[2].FilterBank = 14; //CAN1 -> 0~13 , CAN2 -> 14~27
  mCANFilterConfig[2].FilterMode = CAN_FILTERMODE_IDMASK;
  mCANFilterConfig[2].FilterScale = CAN_FILTERSCALE_32BIT;
  mCANFilterConfig[2].FilterIdHigh = 0x0000;
  mCANFilterConfig[2].FilterIdLow = 0x0000;
  mCANFilterConfig[2].FilterMaskIdHigh = 0x0000;              // 0x00000000 = 모든 ID를 받아들이겠다
  mCANFilterConfig[2].FilterMaskIdLow = 0x0000;
  mCANFilterConfig[2].FilterFIFOAssignment = CAN_RX_FIFO1;
  mCANFilterConfig[2].FilterActivation = ENABLE;
  mCANFilterConfig[2].SlaveStartFilterBank = 14; //CAN1 -> 0~13 , CAN2 -> 14~27

  if (HAL_CAN_ConfigFilter(&mcan[2], &mCANFilterConfig[2]) != HAL_OK)
  {
    /* Filter configuration Error */
    Error_Handler();
  }

  /* Can Start */
  if (HAL_CAN_Start(&mcan[2]) != HAL_OK)
  {
    /* Start Error */
    Error_Handler();
  }

  /* Activate CAN RX notification */
  if (HAL_CAN_ActivateNotification(&mcan[2], CAN_IT_RX_FIFO1_MSG_PENDING) != HAL_OK)
  {
    /* Notification Error */
    Error_Handler();
  }

}


void hCommunication::setCANID(CAN_HandleTypeDef _CAN, int _numID){
	mcan[_numID] = _CAN;
}



void hCommunication::getCANID(CAN_HandleTypeDef &_canID, int _numID){
	_canID = mcan[_numID];
}


/** 2021-10-15  HanByel
 * get degree function
 * Can get ALL degree data using this function
 * param unsigned int _canId : CAN ID
 * param unsigned int _mId : Motor ID
 * param const unsigned char *_data : Protocol Data
 * param unsigned char _len : Data length
 * param CANType _type : CAN Type
 * param CANFormat _format : CAN Format
 */
void hCommunication::canSendData(unsigned int _canId, unsigned int _mId, const unsigned char *_data, unsigned char _len){


	CAN_HandleTypeDef localCANID;
	CAN_TxHeaderTypeDef   TxHeader;
	uint32_t              TxMailbox;
	uint8_t               TxData[_len];
	switch(_canId){
	case 2:
		hCommunication::getInstance().getCANID(localCANID, 2);
		break;
	case 1:
	default:
		hCommunication::getInstance().getCANID(localCANID, 1);
		break;
	}

	TxHeader.StdId = _mId;                 // Standard Identifier, 0 ~ 0x7FF
//	TxHeader.ExtId = 0x00;                  // Extended Identifier, 0 ~ 0x1FFFFFFF
	TxHeader.RTR = CAN_RTR_DATA;            // 전송하는 메세지의 프레임 타입, DATA or REMOTE
	TxHeader.IDE = CAN_ID_STD;              // 전송하는 메세지의 식별자 타입, STD or EXT
	TxHeader.DLC = 8;                       // 송신 프레임 길이, 0 ~ 8 byte
	TxHeader.TransmitGlobalTime = DISABLE;  // 프레임 전송 시작될 때 timestamp counter 값을 capture.

	for(int i = 0 ; i < _len ; i++){
		TxData[i] = (uint8_t)_data[i];
	}

	TxMailbox = HAL_CAN_GetTxMailboxesFreeLevel(&localCANID);

	if (HAL_CAN_AddTxMessage(&localCANID, &TxHeader, TxData, &TxMailbox) != HAL_OK)
	{
		Error_Handler();
	}

}


/** 2021-10-15  HanByel
 * TEST code for Recieve CAN data
 */
void  hCommunication::canRecieveData(){

}


/** 2021-10-15  HanByel
 * TEST code for Recieve CAN data and set
 */
posSt hCommunication::canRecievePosData(){
    posSt posMSG;
    posMSG.data1 = 0;
    posMSG.data2 = 0;
    return posMSG;
}


/** 2021-10-15  HanByel
 * get degree function
 * Can get ALL degree data using this function
 * param signed short &_IntVal : Merging Two bit CAN DATA
 */
void hCommunication::getPosInt(signed short &_IntVal){
    posSt posMSG;

    posMSG.data1 = 0;
    posMSG.data2 = 0;

    _IntVal = posMSG.data1 << 8 | posMSG.data2; // char = 8bit(256), -> used two char values for positioning
    _IntVal -=32767;
}


/** 2021-10-15  HanByel
 * uart init
 */
void hCommunication::uartInit(){
    printf("UART INIT\n");

    huart[0].Instance = USART1;
    huart[0].Init.BaudRate = 115200;
    huart[0].Init.WordLength = UART_WORDLENGTH_8B;
    huart[0].Init.StopBits = UART_STOPBITS_1;
    huart[0].Init.Parity = UART_PARITY_NONE;
    huart[0].Init.Mode = UART_MODE_TX_RX;
    huart[0].Init.HwFlowCtl = UART_HWCONTROL_NONE;
    huart[0].Init.OverSampling = UART_OVERSAMPLING_16;
    huart[0].gState = HAL_UART_STATE_RESET;
    if (HAL_UART_Init(&huart[0]) != HAL_OK)
    {
      Error_Handler();
    }
}



/** 2021-10-15  HanByel
 * Send data with uart
 * param const void *_buf : buffer, trying to send
 * param size_t _length : buffer size
 */
void hCommunication::sendUartData(const void *_buf, size_t _length){

}


/** 2021-10-15  HanByel
 * Recieve data with uart
 * Using this for test
 */
void hCommunication::receiveUartData(){
//    char lBuff[MAXIMUM_BUFFER_SIZE]={0,};
    /*
    if(uint32_t num = serial_port.read(lBuff, sizeof(lBuff))){
        hCommunication::getInstance().sendUartData(lBuff,sizeof(lBuff));
        for(int i = 0; i < MAXIMUM_BUFFER_SIZE; i++){
            if(lBuff[i]==0){
                break;
            }
            else if(lBuff[i]==13){
                mBuff[Uartcnt]=lBuff[i];
                Uartcnt = 0;
                hCommon::getInstance().setUartData(mBuff);
                for(int i = 0 ; i < MAXIMUM_BUFFER_SIZE ; i++)  mBuff[i]=0;
            }
            else{
                mBuff[Uartcnt]=lBuff[i];
                Uartcnt++;
            }
        }
    }
    else{
    }
    */
}


/** 2021-10-15  HanByel
 * get Data from Uart
 * param char *arr : buffer
 */
void hCommunication::getUartData(char *arr){
    for(int i = 0 ; i < MAXIMUM_BUFFER_SIZE ; i++)   arr[i] = mUARTBuff[i];

}


/** 2021-10-15  HanByel
 * TESTCODE for recieve
 */
void hCommunication::testUart(){
//    char buf[MAXIMUM_BUFFER_SIZE] = {0};
/*
    if (uint32_t num = serial_port.read(buf, sizeof(buf))) {
        serial_port.write(buf, num);
    }
*/
}


/** 2021-10-15  HanByel
 * uart init
 */
void hCommunication::spiInit(){
    printf("SPI INIT\n");

    mspi.Instance = SPI2;
    mspi.Init.Mode = SPI_MODE_SLAVE;
    mspi.Init.Direction = SPI_DIRECTION_2LINES;
    mspi.Init.DataSize = SPI_DATASIZE_8BIT;
    mspi.Init.CLKPolarity = SPI_POLARITY_HIGH;
    mspi.Init.CLKPhase = SPI_PHASE_2EDGE;
    mspi.Init.NSS = SPI_NSS_HARD_INPUT;
    mspi.Init.FirstBit = SPI_FIRSTBIT_MSB;
    mspi.Init.TIMode = SPI_TIMODE_DISABLE;
    mspi.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
    mspi.Init.CRCPolynomial = 7;
    if (HAL_SPI_Init(&mspi) != HAL_OK)
    {
      Error_Handler();
    }
}

void hCommunication::getSPIID(SPI_HandleTypeDef &_spiID){
	_spiID = mspi;
}

/**
  * Enable DMA controller clock
  */
void hCommunication::MX_DMA_Init(void)
{
  __HAL_RCC_DMA1_CLK_ENABLE();

  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);

  HAL_NVIC_SetPriority(DMA1_Stream4_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream4_IRQn);

}


/**@brief Change SPI State to READY
*/
void hCommunication::HAL_DMA_STATE_CHANGE(SPI_HandleTypeDef *hspi)
{
  hspi->State = HAL_SPI_STATE_READY;
}

/** 2021-10-15  HanByel
 * Send data with uart
 * param const void *_buf : buffer, trying to send
 * param size_t _length : buffer size
 */
void hCommunication::spiDataTxRx(uint8_t *_TxBuf, uint8_t *_RxBuf){
	HAL_SPI_TransmitReceive_DMA(&mspi, _TxBuf, _RxBuf, SPIBUFFERSIZE);
}


void hCommunication::setSPItxrxId(DMA_HandleTypeDef &_SPItxId, DMA_HandleTypeDef &_SPIrxId){
    mDMA_spi_tx = _SPItxId;
    mDMA_spi_rx = _SPIrxId;
}

void hCommunication::getSPItxrxId(DMA_HandleTypeDef &_SPItxId, DMA_HandleTypeDef &_SPIrxId){
    _SPItxId = mDMA_spi_tx;
    _SPIrxId = mDMA_spi_rx;
}


/** 2021-10-15  HanByel
 * Recieve data with uart
 * Using this for test
 */
void hCommunication::setSPIRxData(uint8_t *_RxBuf){
    for(int i = 0 ; i < SPIBUFFERSIZE ; i++)   mSPIRData[i] = _RxBuf[i];
}


/** 2021-10-15  HanByel
 * get Data from Uart
 * param char *arr : buffer
 */
void hCommunication::getSPIRxData(uint8_t *_RxBuf){
    for(int i = 0 ; i < SPIBUFFERSIZE ; i++)   _RxBuf[i] = mSPIRData[i];

}

/** 2021-10-15  HanByel
 * Recieve data with uart
 * Using this for test
 */
void hCommunication::setSPITxData(uint8_t *_TxBuf){
    for(int i = 0 ; i < SPIBUFFERSIZE ; i++)   mSPITData[i] = _TxBuf[i];
}

/** 2021-10-15  HanByel
 * get Data from Uart
 * param char *arr : buffer
 */
void hCommunication::getSPITxData(uint8_t *_TxBuf){
    for(int i = 0 ; i < SPIBUFFERSIZE ; i++)   _TxBuf[i] = mSPIRData[i];

}

/** 2021-10-15  HanByel
 * get Data from Uart
 * param char *arr : buffer
 */
void hCommunication::setSPIRxDegreeData(uint8_t *_RxBuf){
	setSPIRxData(_RxBuf);
	hCommon::getInstance().setSPIData((char*)_RxBuf);
}

/** 2021-10-15  HanByel
 * get Data from Uart
 * param char *arr : buffer
 */
void hCommunication::getSPIRxDegreeData(uint8_t *_RxBuf){


}

/** 2021-10-15  HanByel
 * TESTCODE for recieve
 *
uint8_t mSPITxData[SPIBUFFERSIZE];
uint8_t mSPIRxData[SPIBUFFERSIZE];
uint8_t mSPIZxData[SPIBUFFERSIZE]={0,};
 */
void hCommunication::testSPI(int _testVal){



}



void hCommunication::Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}
