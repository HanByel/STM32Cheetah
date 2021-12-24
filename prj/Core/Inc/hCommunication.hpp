#ifndef HCOMM_HPP
#define HCOMM_HPP


#include "hcommon.hpp"



class hCommunication{
public:
    hCommunication();
    virtual ~hCommunication();
    static hCommunication &getInstance();
    void communicationInit();
    //CAN can[4];
    static hCommunication *mp_Instance;
    void Error_Handler(void);


public:
    CAN_HandleTypeDef mcan[3];
    CAN_FilterTypeDef mCANFilterConfig[3];
    void MX_CAN1_Init(void);
    void MX_CAN2_Init(void);
    void setCANID(CAN_HandleTypeDef _CAN, int _numID);
    void getCANID(CAN_HandleTypeDef &_canID, int _numID = 1);
    void canSendData(unsigned int _canId, unsigned int _mId, const unsigned char *_data, unsigned char _len = 8);
    void canRecieveData();
    char mCANBuff[MAXIMUM_BUFFER_SIZE]={0,};


public:
    UART_HandleTypeDef huart[2];
    void uartInit();
    void sendUartData(const void *_buf, size_t _length);
    void receiveUartData();
    void getUartData(char *arr);
    void testUart();
    char mUARTBuff[MAXIMUM_BUFFER_SIZE]={0,};

public:
    SPI_HandleTypeDef mspi;
    DMA_HandleTypeDef mDMA_spi_tx;
    DMA_HandleTypeDef mDMA_spi_rx;
    uint8_t mSPIRData[SPIBUFFERSIZE];
    uint8_t mSPIZData[SPIBUFFERSIZE] = {0,};
    uint8_t mSPITData[SPIBUFFERSIZE] = {0,};
    char mSPIBuff[MAXIMUM_BUFFER_SIZE]={0,};

    void spiInit();
    void getSPIID(SPI_HandleTypeDef &_spiID);
    void setSPItxrxId(DMA_HandleTypeDef &_SPItxId, DMA_HandleTypeDef &_SPIrxId);
    void getSPItxrxId(DMA_HandleTypeDef &_SPItxId, DMA_HandleTypeDef &_SPIrxId);
    void MX_DMA_Init(void);
    void HAL_DMA_STATE_CHANGE(SPI_HandleTypeDef *hspi);

    void spiDataTxRx(uint8_t *_TxBuf, uint8_t *_RxBuf);
    void setSPIRxData(uint8_t *_RxBuf);
    void getSPIRxData(uint8_t *_RxBuf);
    void setSPITxData(uint8_t *_TxBuf);
    void getSPITxData(uint8_t *_TxBuf);
    void setSPIRxDegreeData(uint8_t *_RxBuf);
    void getSPIRxDegreeData(uint8_t *_RxBuf);

    void testSPI(int _testVal);


public:
    posSt canRecievePosData();
    void getPosInt(signed short &_IntVal);

private:
    char mZBuff[MAXIMUM_BUFFER_SIZE]={0,};
    int Uartcnt = 0;
    int spiCnt = 0;
};



#endif //HCOMM_HPP
