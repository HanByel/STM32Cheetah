################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lwip-1.4.1/src/api/api_lib.c \
../Drivers/lwip-1.4.1/src/api/api_msg.c \
../Drivers/lwip-1.4.1/src/api/err.c \
../Drivers/lwip-1.4.1/src/api/netbuf.c \
../Drivers/lwip-1.4.1/src/api/netdb.c \
../Drivers/lwip-1.4.1/src/api/netifapi.c \
../Drivers/lwip-1.4.1/src/api/sockets.c \
../Drivers/lwip-1.4.1/src/api/tcpip.c 

C_DEPS += \
./Drivers/lwip-1.4.1/src/api/api_lib.d \
./Drivers/lwip-1.4.1/src/api/api_msg.d \
./Drivers/lwip-1.4.1/src/api/err.d \
./Drivers/lwip-1.4.1/src/api/netbuf.d \
./Drivers/lwip-1.4.1/src/api/netdb.d \
./Drivers/lwip-1.4.1/src/api/netifapi.d \
./Drivers/lwip-1.4.1/src/api/sockets.d \
./Drivers/lwip-1.4.1/src/api/tcpip.d 

OBJS += \
./Drivers/lwip-1.4.1/src/api/api_lib.o \
./Drivers/lwip-1.4.1/src/api/api_msg.o \
./Drivers/lwip-1.4.1/src/api/err.o \
./Drivers/lwip-1.4.1/src/api/netbuf.o \
./Drivers/lwip-1.4.1/src/api/netdb.o \
./Drivers/lwip-1.4.1/src/api/netifapi.o \
./Drivers/lwip-1.4.1/src/api/sockets.o \
./Drivers/lwip-1.4.1/src/api/tcpip.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lwip-1.4.1/src/api/%.o: ../Drivers/lwip-1.4.1/src/api/%.c Drivers/lwip-1.4.1/src/api/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

