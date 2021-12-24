################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM0.s \
../Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM3.s \
../Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM4.s 

S_DEPS += \
./Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM0.d \
./Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM3.d \
./Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM4.d 

OBJS += \
./Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM0.o \
./Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM3.o \
./Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/startup_ARMCM4.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/%.o: ../Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/%.s Drivers/CMSIS/DSP_Lib/Examples/Common/ARM/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

