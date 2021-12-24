################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/Device/_Template_Vendor/Vendor/Device/Source/ARM/startup_Device.s 

S_DEPS += \
./Drivers/Device/_Template_Vendor/Vendor/Device/Source/ARM/startup_Device.d 

OBJS += \
./Drivers/Device/_Template_Vendor/Vendor/Device/Source/ARM/startup_Device.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/_Template_Vendor/Vendor/Device/Source/ARM/%.o: ../Drivers/Device/_Template_Vendor/Vendor/Device/Source/ARM/%.s Drivers/Device/_Template_Vendor/Vendor/Device/Source/ARM/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

