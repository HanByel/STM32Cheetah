################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/STM32F401-Discovery/stm32f401_discovery.c \
../Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_accelerometer.c \
../Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_audio.c \
../Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_gyroscope.c 

C_DEPS += \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery.d \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_accelerometer.d \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_audio.d \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_gyroscope.d 

OBJS += \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery.o \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_accelerometer.o \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_audio.o \
./Drivers/BSP/STM32F401-Discovery/stm32f401_discovery_gyroscope.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32F401-Discovery/%.o: ../Drivers/BSP/STM32F401-Discovery/%.c Drivers/BSP/STM32F401-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

