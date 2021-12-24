################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Device/_Template_Vendor/Vendor/Device/Source/system_Device.c 

C_DEPS += \
./Drivers/Device/_Template_Vendor/Vendor/Device/Source/system_Device.d 

OBJS += \
./Drivers/Device/_Template_Vendor/Vendor/Device/Source/system_Device.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/_Template_Vendor/Vendor/Device/Source/%.o: ../Drivers/Device/_Template_Vendor/Vendor/Device/Source/%.c Drivers/Device/_Template_Vendor/Vendor/Device/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

