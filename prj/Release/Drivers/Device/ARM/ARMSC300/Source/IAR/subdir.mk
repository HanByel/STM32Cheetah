################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/Device/ARM/ARMSC300/Source/IAR/startup_ARMSC300.s 

S_DEPS += \
./Drivers/Device/ARM/ARMSC300/Source/IAR/startup_ARMSC300.d 

OBJS += \
./Drivers/Device/ARM/ARMSC300/Source/IAR/startup_ARMSC300.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/ARM/ARMSC300/Source/IAR/%.o: ../Drivers/Device/ARM/ARMSC300/Source/IAR/%.s Drivers/Device/ARM/ARMSC300/Source/IAR/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

