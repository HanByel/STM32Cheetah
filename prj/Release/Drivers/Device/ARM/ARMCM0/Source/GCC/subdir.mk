################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/Device/ARM/ARMCM0/Source/GCC/startup_ARMCM0.c 

S_UPPER_SRCS += \
../Drivers/Device/ARM/ARMCM0/Source/GCC/startup_ARMCM0.S 

C_DEPS += \
./Drivers/Device/ARM/ARMCM0/Source/GCC/startup_ARMCM0.d 

OBJS += \
./Drivers/Device/ARM/ARMCM0/Source/GCC/startup_ARMCM0.o 

S_UPPER_DEPS += \
./Drivers/Device/ARM/ARMCM0/Source/GCC/startup_ARMCM0.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/ARM/ARMCM0/Source/GCC/%.o: ../Drivers/Device/ARM/ARMCM0/Source/GCC/%.S Drivers/Device/ARM/ARMCM0/Source/GCC/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
Drivers/Device/ARM/ARMCM0/Source/GCC/%.o: ../Drivers/Device/ARM/ARMCM0/Source/GCC/%.c Drivers/Device/ARM/ARMCM0/Source/GCC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

