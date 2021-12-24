################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lwip-1.4.1/src/core/def.c \
../Drivers/lwip-1.4.1/src/core/dhcp.c \
../Drivers/lwip-1.4.1/src/core/dns.c \
../Drivers/lwip-1.4.1/src/core/init.c \
../Drivers/lwip-1.4.1/src/core/mem.c \
../Drivers/lwip-1.4.1/src/core/memp.c \
../Drivers/lwip-1.4.1/src/core/netif.c \
../Drivers/lwip-1.4.1/src/core/pbuf.c \
../Drivers/lwip-1.4.1/src/core/raw.c \
../Drivers/lwip-1.4.1/src/core/stats.c \
../Drivers/lwip-1.4.1/src/core/sys.c \
../Drivers/lwip-1.4.1/src/core/tcp.c \
../Drivers/lwip-1.4.1/src/core/tcp_in.c \
../Drivers/lwip-1.4.1/src/core/tcp_out.c \
../Drivers/lwip-1.4.1/src/core/timers.c \
../Drivers/lwip-1.4.1/src/core/udp.c 

C_DEPS += \
./Drivers/lwip-1.4.1/src/core/def.d \
./Drivers/lwip-1.4.1/src/core/dhcp.d \
./Drivers/lwip-1.4.1/src/core/dns.d \
./Drivers/lwip-1.4.1/src/core/init.d \
./Drivers/lwip-1.4.1/src/core/mem.d \
./Drivers/lwip-1.4.1/src/core/memp.d \
./Drivers/lwip-1.4.1/src/core/netif.d \
./Drivers/lwip-1.4.1/src/core/pbuf.d \
./Drivers/lwip-1.4.1/src/core/raw.d \
./Drivers/lwip-1.4.1/src/core/stats.d \
./Drivers/lwip-1.4.1/src/core/sys.d \
./Drivers/lwip-1.4.1/src/core/tcp.d \
./Drivers/lwip-1.4.1/src/core/tcp_in.d \
./Drivers/lwip-1.4.1/src/core/tcp_out.d \
./Drivers/lwip-1.4.1/src/core/timers.d \
./Drivers/lwip-1.4.1/src/core/udp.d 

OBJS += \
./Drivers/lwip-1.4.1/src/core/def.o \
./Drivers/lwip-1.4.1/src/core/dhcp.o \
./Drivers/lwip-1.4.1/src/core/dns.o \
./Drivers/lwip-1.4.1/src/core/init.o \
./Drivers/lwip-1.4.1/src/core/mem.o \
./Drivers/lwip-1.4.1/src/core/memp.o \
./Drivers/lwip-1.4.1/src/core/netif.o \
./Drivers/lwip-1.4.1/src/core/pbuf.o \
./Drivers/lwip-1.4.1/src/core/raw.o \
./Drivers/lwip-1.4.1/src/core/stats.o \
./Drivers/lwip-1.4.1/src/core/sys.o \
./Drivers/lwip-1.4.1/src/core/tcp.o \
./Drivers/lwip-1.4.1/src/core/tcp_in.o \
./Drivers/lwip-1.4.1/src/core/tcp_out.o \
./Drivers/lwip-1.4.1/src/core/timers.o \
./Drivers/lwip-1.4.1/src/core/udp.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lwip-1.4.1/src/core/%.o: ../Drivers/lwip-1.4.1/src/core/%.c Drivers/lwip-1.4.1/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

