################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/FatFs/src/option/cc932.c \
../Drivers/FatFs/src/option/cc936.c \
../Drivers/FatFs/src/option/cc949.c \
../Drivers/FatFs/src/option/cc950.c \
../Drivers/FatFs/src/option/ccsbcs.c \
../Drivers/FatFs/src/option/syscall.c \
../Drivers/FatFs/src/option/unicode.c 

C_DEPS += \
./Drivers/FatFs/src/option/cc932.d \
./Drivers/FatFs/src/option/cc936.d \
./Drivers/FatFs/src/option/cc949.d \
./Drivers/FatFs/src/option/cc950.d \
./Drivers/FatFs/src/option/ccsbcs.d \
./Drivers/FatFs/src/option/syscall.d \
./Drivers/FatFs/src/option/unicode.d 

OBJS += \
./Drivers/FatFs/src/option/cc932.o \
./Drivers/FatFs/src/option/cc936.o \
./Drivers/FatFs/src/option/cc949.o \
./Drivers/FatFs/src/option/cc950.o \
./Drivers/FatFs/src/option/ccsbcs.o \
./Drivers/FatFs/src/option/syscall.o \
./Drivers/FatFs/src/option/unicode.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/FatFs/src/option/%.o: ../Drivers/FatFs/src/option/%.c Drivers/FatFs/src/option/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

