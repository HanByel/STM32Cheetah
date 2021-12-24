################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32_CPAL_Driver/src/cpal_hal.c \
../Drivers/STM32_CPAL_Driver/src/cpal_i2c.c \
../Drivers/STM32_CPAL_Driver/src/cpal_usercallback_template.c 

C_DEPS += \
./Drivers/STM32_CPAL_Driver/src/cpal_hal.d \
./Drivers/STM32_CPAL_Driver/src/cpal_i2c.d \
./Drivers/STM32_CPAL_Driver/src/cpal_usercallback_template.d 

OBJS += \
./Drivers/STM32_CPAL_Driver/src/cpal_hal.o \
./Drivers/STM32_CPAL_Driver/src/cpal_i2c.o \
./Drivers/STM32_CPAL_Driver/src/cpal_usercallback_template.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32_CPAL_Driver/src/%.o: ../Drivers/STM32_CPAL_Driver/src/%.c Drivers/STM32_CPAL_Driver/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

