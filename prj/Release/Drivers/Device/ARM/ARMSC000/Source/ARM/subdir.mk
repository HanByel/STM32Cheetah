################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/Device/ARM/ARMSC000/Source/ARM/startup_ARMSC000.s 

S_DEPS += \
./Drivers/Device/ARM/ARMSC000/Source/ARM/startup_ARMSC000.d 

OBJS += \
./Drivers/Device/ARM/ARMSC000/Source/ARM/startup_ARMSC000.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/ARM/ARMSC000/Source/ARM/%.o: ../Drivers/Device/ARM/ARMSC000/Source/ARM/%.s Drivers/Device/ARM/ARMSC000/Source/ARM/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

