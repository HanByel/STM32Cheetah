################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/ethernetif.c \
../Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/sys_arch.c 

C_DEPS += \
./Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/ethernetif.d \
./Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/sys_arch.d 

OBJS += \
./Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/ethernetif.o \
./Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/sys_arch.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/%.o: ../Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/%.c Drivers/lwip-1.4.1/port/STM32F4x7/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

