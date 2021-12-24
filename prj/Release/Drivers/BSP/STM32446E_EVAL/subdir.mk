################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_audio.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_camera.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_eeprom.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_io.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_lcd.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_qspi.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_sd.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_sdram.c \
../Drivers/BSP/STM32446E_EVAL/stm32446e_eval_ts.c 

C_DEPS += \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_audio.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_camera.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_eeprom.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_io.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_lcd.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_qspi.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_sd.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_sdram.d \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_ts.d 

OBJS += \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_audio.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_camera.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_eeprom.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_io.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_lcd.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_qspi.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_sd.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_sdram.o \
./Drivers/BSP/STM32446E_EVAL/stm32446e_eval_ts.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32446E_EVAL/%.o: ../Drivers/BSP/STM32446E_EVAL/%.c Drivers/BSP/STM32446E_EVAL/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

