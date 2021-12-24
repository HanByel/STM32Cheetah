################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/Device/_Template_Flash/Test/startup_stm32f10x_md.s 

C_SRCS += \
../Drivers/Device/_Template_Flash/Test/FlashDev.c \
../Drivers/Device/_Template_Flash/Test/FlashPrg.c \
../Drivers/Device/_Template_Flash/Test/FlashTest.c \
../Drivers/Device/_Template_Flash/Test/system_stm32f10x.c 

S_DEPS += \
./Drivers/Device/_Template_Flash/Test/startup_stm32f10x_md.d 

C_DEPS += \
./Drivers/Device/_Template_Flash/Test/FlashDev.d \
./Drivers/Device/_Template_Flash/Test/FlashPrg.d \
./Drivers/Device/_Template_Flash/Test/FlashTest.d \
./Drivers/Device/_Template_Flash/Test/system_stm32f10x.d 

OBJS += \
./Drivers/Device/_Template_Flash/Test/FlashDev.o \
./Drivers/Device/_Template_Flash/Test/FlashPrg.o \
./Drivers/Device/_Template_Flash/Test/FlashTest.o \
./Drivers/Device/_Template_Flash/Test/startup_stm32f10x_md.o \
./Drivers/Device/_Template_Flash/Test/system_stm32f10x.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/Device/_Template_Flash/Test/%.o: ../Drivers/Device/_Template_Flash/Test/%.c Drivers/Device/_Template_Flash/Test/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Drivers/Device/_Template_Flash/Test/%.o: ../Drivers/Device/_Template_Flash/Test/%.s Drivers/Device/_Template_Flash/Test/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

