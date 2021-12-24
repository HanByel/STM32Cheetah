################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/Device/ARM/ARMCM7/Source/IAR/startup_ARMCM7.s 

S_DEPS += \
./Drivers/Device/ARM/ARMCM7/Source/IAR/startup_ARMCM7.d 

OBJS += \
./Drivers/Device/ARM/ARMCM7/Source/IAR/startup_ARMCM7.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/ARM/ARMCM7/Source/IAR/%.o: ../Drivers/Device/ARM/ARMCM7/Source/IAR/%.s Drivers/Device/ARM/ARMCM7/Source/IAR/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

