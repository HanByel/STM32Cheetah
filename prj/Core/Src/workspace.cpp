//#include <workspace.hpp>
#include <main.hpp>

//SPI VALUE=====================================================================
#define STMID	1


uint8_t wSPIRData[SPIBUFFERSIZE];
uint8_t wSPIZData[SPIBUFFERSIZE] = {0,};
uint8_t wSPITData[SPIBUFFERSIZE] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};


//CAN VALUE=====================================================================
// 1 drgree = about 7 of encoder value

/*  --test commands
unsigned char motorTest1Cmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x00, 0x00, 0x08, 0x1a};
unsigned char motorTest2Cmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x00, 0x00, 0x08, 0x09};
unsigned char motorTest3Cmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x00, 0x00, 0x07, 0xE4};
unsigned char PosG90Cmd[8] = {0x82, 0x75, 0x7f, 0xf0, 0x08, 0x33, 0x37, 0xff};
unsigned char PosG180Cmd[8] = {0x84, 0xeb, 0x7f, 0xf0, 0x08, 0x33, 0x37, 0xff};
unsigned char PosG360Cmd[8] = {0x89, 0xd6, 0x7f, 0xf0, 0x08, 0x33, 0x37, 0xff};
unsigned char PosG0Cmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x08, 0x33, 0x37, 0xff};
*/

unsigned char motorStartCmd[8] = {0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xfC};
unsigned char motorEndCmd[8] = {0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xfD};
unsigned char motorSetCmd[8] = {0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xfE};
unsigned char TorqueGCmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x00, 0x00, 0x07, 0xff};
unsigned char PosGTCmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x0a, 0x33, 0x37, 0xff};
unsigned char PosGCmd[8] = {0x7f, 0xff, 0x7f, 0xf0, 0x0a, 0x33, 0x37, 0xff};

int p_gain = 1;
int D_gain = 100;
int testCnt = 0;

posSt RReceivedPosData;
posSt OReceivedPosData;
posSt EPosData = {0,};
posSt OEPosData = {0,};

CAN_TxHeaderTypeDef   TxHeader;
uint8_t               TxData[8];
uint32_t              TxMailbox;
CAN_RxHeaderTypeDef   RxHeader;
uint8_t               RxData[8];

int sCANtestcnt = 0;
int rCANtestcnt = 0;
int mAllDegreeVal[MAXIMUM_MOTOR_NUMBER] = {0,}; //  composed degree as integer
signed short posVal = 0;
int dataupF = 0;


//Preinit===========================================================================
/** 2021-10-15  HanByel
 * motorInit init
 * param int _Cid : CAN ID
 * param int _Mid : Motor ID
 */
void motorInit(int _Cid, int _Mid){
	hCommunication::getInstance().canSendData(_Cid,_Mid,motorEndCmd,8); //Turn off a motor
	HAL_Delay(10);
    hCommunication::getInstance().canSendData(_Cid,_Mid,motorStartCmd,8); //Turn on a motor
	HAL_Delay(10);
    hCommunication::getInstance().canSendData(_Cid,_Mid,motorSetCmd,8); // Set zero pos
	HAL_Delay(10);
}

//TIM===========================================================================
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
  if(htim->Instance == TIM5)
  {
	  if(dataupF == 1){
		  MotorCntPos();
		  dataupF = 0;
		  for(int i = 0 ; i < SPIBUFFERSIZE ; i++)	wSPIRData[i] = 0;
	  }
	  else{

	  }
  }
  else if(htim->Instance == TIM7)
  {

	  switch(htim->Channel){
	  case HAL_TIM_ACTIVE_CHANNEL_1:{

		  break;
	  }
	  case HAL_TIM_ACTIVE_CHANNEL_2:{

		  break;
	  }
	  case HAL_TIM_ACTIVE_CHANNEL_3:{

		  break;
	  }
	  case HAL_TIM_ACTIVE_CHANNEL_4:{

		  break;
	  }
	  default:{

		  break;
	  }
	  }

  }
}


//GPIO===========================================================================
/**
 * GPIO_pin - GPIO pin event callback function
 * GPIO_PIN_B9 : SPI NSS Interrupt pin (Pin B9 Changed -> Call SPI txrx callback function)
 * lhspi : dummy value
 */
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin){
	SPI_HandleTypeDef lhspi;
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_4);
	if(GPIO_Pin == GPIO_PIN_9)
		HAL_SPI_TxRxCpltCallback(&lhspi);

	hCommunication::getInstance().setSPIRxDegreeData(wSPIRData);
}


//CAN===========================================================================
void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *CanHandle)
{
	if(CanHandle->Instance == CAN1){
		HAL_CAN_GetRxMessage(CanHandle, CAN_RX_FIFO0, &RxHeader, RxData);
		rCANtestcnt = !rCANtestcnt;
		if(rCANtestcnt)		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
		else		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);


	}
    SET_BIT(CanHandle->Instance->RF0R, CAN_RF1R_RFOM1);
}

void HAL_CAN_RxFifo1MsgPendingCallback(CAN_HandleTypeDef *CanHandle)
{
	if(CanHandle->Instance == CAN2){
		HAL_CAN_GetRxMessage(CanHandle, CAN_RX_FIFO1, &RxHeader, RxData);
		rCANtestcnt = !rCANtestcnt;
		if(rCANtestcnt)		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_SET);
		else		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, GPIO_PIN_RESET);

	}
    SET_BIT(CanHandle->Instance->RF1R, CAN_RF1R_RFOM1);
}

void canSendMotorData(){
    printf("canSendMotorData()_start\n");
    while(1){
        MotorCntPos();              //change function from here

    }
    printf("canSendMotorData()_end\n");
}

void MotorCntPos(){
    hCommon::getInstance().getAllDegreeData(mAllDegreeVal);

    for(int i = 0; i < MAXIMUM_MOTOR_NUMBER ; i++){

    	hCommon::getInstance().convertingtDegree(mAllDegreeVal[i],PosGCmd);

		 hCommunication::getInstance().canSendData(1,i+1,PosGCmd);

    }

}

void testMotorCntTorque(){
    OReceivedPosData = RReceivedPosData;
    OEPosData = EPosData;
//    Receivedmsg = hCommunication::getInstance().canRecieveData();
    RReceivedPosData = hCommunication::getInstance().canRecievePosData();
    EPosData.data1 = TorqueGCmd[0]-RReceivedPosData.data1;
    EPosData.data2 = TorqueGCmd[1]-RReceivedPosData.data2;
    if(EPosData.data1 < 0x7f){
        TorqueGCmd[6] = 0x08;
        TorqueGCmd[7] = p_gain*EPosData.data2+D_gain*(OEPosData.data2-EPosData.data2);
    }
    else if(EPosData.data1 >= 0x7f){
        TorqueGCmd[6] = 0x07;
        TorqueGCmd[7] = 0xff-(p_gain*EPosData.data2+D_gain*(OEPosData.data2-EPosData.data2));
    }

    if(TorqueGCmd[6] >= 0x08){
        if(TorqueGCmd[7] > 0x1a){
            TorqueGCmd[7] = 0x1a;
        }
    }
    else if(TorqueGCmd[6] <= 0x07){
        if(TorqueGCmd[7] < 0xe4){
            TorqueGCmd[7] = 0xe4;
        }
    }

    if(TorqueGCmd[7]>0x1a&&TorqueGCmd[7]<0xe4){
        TorqueGCmd[6] = 0x07;
        TorqueGCmd[7] = 0xff;
    }
    hCommunication::getInstance().canSendData(1,2,TorqueGCmd,8);
}

void rCANTest(){

}

void sCANTest(){
	CAN_HandleTypeDef localCANID;
	hCommunication::getInstance().getCANID(localCANID, 1);

	/* Configure Transmission process */
	TxHeader.StdId = 0x00;                 // Standard Identifier, 0 ~ 0x7FF
	TxHeader.ExtId = 0x00;                  // Extended Identifier, 0 ~ 0x1FFFFFFF
	TxHeader.RTR = CAN_RTR_DATA;            // 전송하는 메세지의 프레임 타입, DATA or REMOTE
	TxHeader.IDE = CAN_ID_STD;              // 전송하는 메세지의 식별자 타입, STD or EXT
	TxHeader.DLC = 8;                       // 송신 프레임 길이, 0 ~ 8 byte
	TxHeader.TransmitGlobalTime = DISABLE;  // 프레임 전송 시작될 때 timestamp counter 값을 capture.

	/* Set the data to be transmitted */
	TxData[0] = 1;
	TxData[1] = 2;
	TxData[2] = 3;
	TxData[3] = 4;
	TxData[4] = 5;
	TxData[5] = 6;
	TxData[6] = 7;
	TxData[7] = 8;

	/* Start the Transmission process */
	TxMailbox = HAL_CAN_GetTxMailboxesFreeLevel(&localCANID);


	if (HAL_CAN_AddTxMessage(&localCANID, &TxHeader, TxData, &TxMailbox) != HAL_OK)
	{

		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_15, GPIO_PIN_RESET);
		Error_Handler();
	}

}

void testMotorCntPos(){
    if(testCnt%4==0){
        hCommon::getInstance().convertingtDegree(mAllDegreeVal[0],PosGTCmd);
        testCnt++;
    }
    else if(testCnt%4==1){
        hCommon::getInstance().convertingtDegree(mAllDegreeVal[1],PosGTCmd);
        testCnt++;
    }
    else if(testCnt%4==2){
        hCommon::getInstance().convertingtDegree(mAllDegreeVal[2],PosGTCmd);
        testCnt++;
    }
    else{
        hCommon::getInstance().convertingtDegree(mAllDegreeVal[3],PosGTCmd);
        testCnt=0;
    }
    hCommunication::getInstance().canSendData(1,2,PosGTCmd,8);
}


//UART===========================================================================
/** 2021-10-15  HanByel
 * recieve all degrees Data from communication class
 */
 void recieveData(){
    printf("recieveData()_start\n");
    while(1){
        hCommon::getInstance().getAllDegreeData(mAllDegreeVal);

    }
    printf("recieveData()_end\n");
}

/** 2021-10-15  HanByel
  * LOOP of Getting position Data from Motor
  */
 void canRecieveMotorData(){
     printf("canRecieveMotorData()_start\n");
     while(1){
         hCommunication::getInstance().getPosInt(posVal);

         //printf("%x\n",PosGCmd[1]);
     }
     printf("canRecieveMotorData()_end\n");
 }

//SPI===========================================================================
 void HAL_SPI_TxRxCpltCallback(SPI_HandleTypeDef *hspi){
	  HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_15);
//	  hCommunication::getInstance().receiveSPIData();
	  spiMotor();
//	  spiTestEcho();
 }

void spiMotor(){
	if(HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_9) != GPIO_PIN_RESET){
	  hCommunication::getInstance().spiDataTxRx(wSPIZData, wSPIRData);
	}
	else{
//	  MotorCntPos();


/*	wSPITData[STMID] = STMID;
	  for(int i = 1; i <= MAXIMUM_MOTOR_NUMBER; i++){
		  wSPITData[i] = mAllDegreeVal[i];
	  }
*/

	  hCommunication::getInstance().spiDataTxRx(wSPITData, wSPIRData);
	  hCommon::getInstance().getAllDegreeData(mAllDegreeVal);
	}
	dataupF = 1;
 }

void spiTestEcho(){
	if(HAL_GPIO_ReadPin(GPIOB, GPIO_PIN_9) != GPIO_PIN_RESET){
	  hCommunication::getInstance().spiDataTxRx(wSPIZData, wSPIRData);
	}
	else{
	  for(int i = 0; i < SPIBUFFERSIZE; i++){
		  wSPITData[i] = wSPIRData[i];
	  }
	  wSPITData[SPIBUFFERSIZE] = STMID;
	  hCommunication::getInstance().spiDataTxRx(wSPITData, wSPIRData);
	}
 }

//MAIN LOOP=====================================================================
void mainLoop(){


	while(1){


		  HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_15);
		  HAL_Delay(500);
	  if(0){
		  break;
	  }
	}

 }













// CAN Error 콜백
void HAL_CAN_ErrorCallback(CAN_HandleTypeDef *hcan)
{
	printf("%s\r\n", __FUNCTION__);
}



