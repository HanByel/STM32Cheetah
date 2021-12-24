################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f401xx.s \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f40_41xxx.s \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f40xx.s \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f427_437xx.s \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f427xx.s \
../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f429_439xx.s 

S_DEPS += \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f401xx.d \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f40_41xxx.d \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f40xx.d \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f427_437xx.d \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f427xx.d \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f429_439xx.d 

OBJS += \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f401xx.o \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f40_41xxx.o \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f40xx.o \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f427_437xx.o \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f427xx.o \
./Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/startup_stm32f429_439xx.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/%.o: ../Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/%.s Drivers/CMSIS/Device/ST/STM32F4xx/Source/Templates/TrueSTUDIO/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

