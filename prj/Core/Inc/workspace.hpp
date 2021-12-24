#ifndef HDATASET_HPP
#define HDATASET_HPP

#include <hcommon.hpp>
#include <hCommunication.hpp>


void motorInit(int _Cid, int _Mid);

void communicationInit();
void testMotorCntTorque();
void MotorCntPos();
void testMotorCntPos();
void recieveData();


void rCANTest();
void sCANTest();
void canSendMotorData();
void canRecieveMotorData();


void spiMotor();
void spiTestEcho();
void mainLoop();


void ws_Error_Handler();


#endif //HDATASET_HPP
