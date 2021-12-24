/* 
 * 2021-10-15 Minicheeta
 * Common class
 * convert data / calculate data
 */

#include "hcommon.hpp"

hCommon* hCommon::mp_Instance=NULL;

hCommon::hCommon(){


}

hCommon::~hCommon(){
    

}


hCommon& hCommon::getInstance(void) {
    if (mp_Instance == NULL) {
        mp_Instance = new hCommon();
    }
    return *mp_Instance;
}


void hCommon::hTimerFunc(int _timer, float _time, void *_func()){


}



/** 2021-10-15  HanByel
 * convert from float degree to character data
 * param float _degree : Degree data
 * param unsigned char *_dataVal : 2 bit position data (array) {pos1,pos2}
 */
void hCommon::convertingtDegree(float _degree, unsigned char *_dataVal){
	_degree *= 7;
	_degree += 32767;
	_dataVal[0] = (short)_degree >> 8;
	_dataVal[1] = (char)_degree;
}


/** 2021-10-15  HanByel
 * get degree function
 * Can get ALL degree data using this function
 * param int *arr : array degree data
 */
void hCommon::getAllDegreeData(int *arr){
    for(int i = 0 ; i < MAXIMUM_MOTOR_NUMBER ; i++)         arr[i] = mDegreeBuff[i];
}


/** 2021-10-15  HanByel
 * set uart data to this class
 * Set degree data with uart interface
 */
void hCommon::setUartData(char *arr){
    for(int i = 0 ; i < MAXIMUM_BUFFER_SIZE ; i++)   mUartBuff[i]=arr[i];
    convReceivedData2DegreeData(mUartBuff);
}

/** 2021-10-15  HanByel
 * set uart data to this class
 * Set degree data with uart interface
 */
void hCommon::setSPIData(char *arr){
    for(int i = 0 ; i < MAXIMUM_BUFFER_SIZE ; i++)   mSPIBuff[i]=arr[i];
    convReceivedData2DegreeData(mSPIBuff);
}


//--------
/** 2021-10-15  HanByel
 * convert UART data, gained with UART, to Degree data
 * Set degree data from uart interface
 * converting uart data to degreedata as integer 
 * less than the number of three figures
 */
void hCommon::convReceivedData2DegreeData(char *_rData){
    int convCnt=0;
    int p=0;

    for(int i = 0 ; i < MAXIMUM_MOTOR_NUMBER ; i++){
        mDegreeBuff[i] = 0;
    }
    for(int i = 0 ; i < MAXIMUM_BUFFER_SIZE ; i++){
        if(mSPIBuff[i]==10||mSPIBuff[i]==32){
            if(mSPIBuff[i+1]==0||mSPIBuff[i+1]==10||
            		mSPIBuff[i+1]==32||mSPIBuff[i+1] == 13)                p = 0;

            else if(mSPIBuff[i+2]==0||mSPIBuff[i+2]==10||
            		mSPIBuff[i+2]==32||mSPIBuff[i+2] == 13)                p = 1;

            else if(mSPIBuff[i+3]==0||mSPIBuff[i+3]==10||
            		mSPIBuff[i+3]==32||mSPIBuff[i+3] == 13)                p = 2;

            else                p = 3;
               

            for(int j = p ; j > 0 ; j--){
                if(mSPIBuff[i+j] !=32 && mSPIBuff[i+j]!= 0 && mSPIBuff[i+j] != 10 && mSPIBuff[i+j] != 13){
                	mDegreeBuff[convCnt]+=(mSPIBuff[i+j]-48)*(int)pow(10,p-j);
                }
                else{
                    mDegreeBuff[convCnt] += 0 ;
                }
            }
            convCnt++;
        }
        else if(mSPIBuff[i]==13){
            
            break;
        }
        else if(mSPIBuff[i]==0){

        }
        else{
            
        }
    }

}

