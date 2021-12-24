################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/lwip-1.4.1/src/core/snmp/asn1_dec.c \
../Drivers/lwip-1.4.1/src/core/snmp/asn1_enc.c \
../Drivers/lwip-1.4.1/src/core/snmp/mib2.c \
../Drivers/lwip-1.4.1/src/core/snmp/mib_structs.c \
../Drivers/lwip-1.4.1/src/core/snmp/msg_in.c \
../Drivers/lwip-1.4.1/src/core/snmp/msg_out.c 

C_DEPS += \
./Drivers/lwip-1.4.1/src/core/snmp/asn1_dec.d \
./Drivers/lwip-1.4.1/src/core/snmp/asn1_enc.d \
./Drivers/lwip-1.4.1/src/core/snmp/mib2.d \
./Drivers/lwip-1.4.1/src/core/snmp/mib_structs.d \
./Drivers/lwip-1.4.1/src/core/snmp/msg_in.d \
./Drivers/lwip-1.4.1/src/core/snmp/msg_out.d 

OBJS += \
./Drivers/lwip-1.4.1/src/core/snmp/asn1_dec.o \
./Drivers/lwip-1.4.1/src/core/snmp/asn1_enc.o \
./Drivers/lwip-1.4.1/src/core/snmp/mib2.o \
./Drivers/lwip-1.4.1/src/core/snmp/mib_structs.o \
./Drivers/lwip-1.4.1/src/core/snmp/msg_in.o \
./Drivers/lwip-1.4.1/src/core/snmp/msg_out.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/lwip-1.4.1/src/core/snmp/%.o: ../Drivers/lwip-1.4.1/src/core/snmp/%.c Drivers/lwip-1.4.1/src/core/snmp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

