################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/arm_fft_bin_data.c \
../Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/arm_fft_bin_example_f32.c 

C_DEPS += \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/arm_fft_bin_data.d \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/arm_fft_bin_example_f32.d 

OBJS += \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/arm_fft_bin_data.o \
./Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/arm_fft_bin_example_f32.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/%.o: ../Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/%.c Drivers/CMSIS/DSP/Examples/ARM/arm_fft_bin_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

