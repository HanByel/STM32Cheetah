#ifndef HCOMMON_HPP
#define HCOMMON_HPP



#include "stm32f4xx_hal.h"
#include <string.h>
#include <stdio.h>
#include <string>
#include <iostream>
#include <math.h>



#define oneDegree 45
#define MAXIMUM_BUFFER_SIZE 20
#define MAXIMUM_MOTOR_NUMBER 3
#define SPIBUFFERSIZE 20




struct posSt{
    unsigned char data1;
    unsigned char data2;
};


class hCommon{

public:
    hCommon();
    virtual ~hCommon();

    static hCommon &getInstance();
    static hCommon *mp_Instance;

private:

public:
    void hTimerFunc(int _timer, float _time, void *_func());
    void convertingtDegree(float _degree, unsigned char *_dataVal);

public:
    void getAllDegreeData(int *arr);
    void setUartData(char *arr);

    void convReceivedData2DegreeData(char *arr);

public:
    void setSPIData(char *arr);
    
private:
    char mUartBuff[MAXIMUM_BUFFER_SIZE]={0,};
    char mSPIBuff[MAXIMUM_BUFFER_SIZE]={0,};
    signed int mDegreeBuff[MAXIMUM_MOTOR_NUMBER]={0,};
    char mZBuff[MAXIMUM_BUFFER_SIZE]={0,};
    int Uartcnt = 0;

};


#endif //COMMON_HPP
