################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Drivers/CMSIS/NN/NN_Lib_Tests/nn_test/arm_nnexamples_nn_test.cpp 

OBJS += \
./Drivers/CMSIS/NN/NN_Lib_Tests/nn_test/arm_nnexamples_nn_test.o 

CPP_DEPS += \
./Drivers/CMSIS/NN/NN_Lib_Tests/nn_test/arm_nnexamples_nn_test.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/NN_Lib_Tests/nn_test/%.o: ../Drivers/CMSIS/NN/NN_Lib_Tests/nn_test/%.cpp Drivers/CMSIS/NN/NN_Lib_Tests/nn_test/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

