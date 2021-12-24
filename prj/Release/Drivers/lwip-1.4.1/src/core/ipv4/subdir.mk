################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lwip-1.4.1/src/core/ipv4/autoip.c \
../Drivers/lwip-1.4.1/src/core/ipv4/icmp.c \
../Drivers/lwip-1.4.1/src/core/ipv4/igmp.c \
../Drivers/lwip-1.4.1/src/core/ipv4/inet.c \
../Drivers/lwip-1.4.1/src/core/ipv4/inet_chksum.c \
../Drivers/lwip-1.4.1/src/core/ipv4/ip.c \
../Drivers/lwip-1.4.1/src/core/ipv4/ip_addr.c \
../Drivers/lwip-1.4.1/src/core/ipv4/ip_frag.c 

C_DEPS += \
./Drivers/lwip-1.4.1/src/core/ipv4/autoip.d \
./Drivers/lwip-1.4.1/src/core/ipv4/icmp.d \
./Drivers/lwip-1.4.1/src/core/ipv4/igmp.d \
./Drivers/lwip-1.4.1/src/core/ipv4/inet.d \
./Drivers/lwip-1.4.1/src/core/ipv4/inet_chksum.d \
./Drivers/lwip-1.4.1/src/core/ipv4/ip.d \
./Drivers/lwip-1.4.1/src/core/ipv4/ip_addr.d \
./Drivers/lwip-1.4.1/src/core/ipv4/ip_frag.d 

OBJS += \
./Drivers/lwip-1.4.1/src/core/ipv4/autoip.o \
./Drivers/lwip-1.4.1/src/core/ipv4/icmp.o \
./Drivers/lwip-1.4.1/src/core/ipv4/igmp.o \
./Drivers/lwip-1.4.1/src/core/ipv4/inet.o \
./Drivers/lwip-1.4.1/src/core/ipv4/inet_chksum.o \
./Drivers/lwip-1.4.1/src/core/ipv4/ip.o \
./Drivers/lwip-1.4.1/src/core/ipv4/ip_addr.o \
./Drivers/lwip-1.4.1/src/core/ipv4/ip_frag.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lwip-1.4.1/src/core/ipv4/%.o: ../Drivers/lwip-1.4.1/src/core/ipv4/%.c Drivers/lwip-1.4.1/src/core/ipv4/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

