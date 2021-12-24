################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM0.S \
../Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM3.S \
../Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM4.S 

OBJS += \
./Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM0.o \
./Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM3.o \
./Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM4.o 

S_UPPER_DEPS += \
./Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM0.d \
./Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM3.d \
./Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/startup_ARMCM4.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/%.o: ../Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/%.S Drivers/CMSIS/DSP_Lib/Examples/Common/GCC/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

