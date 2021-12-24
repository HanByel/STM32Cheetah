################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_dfu_core.c \
../Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_dfu_mal.c \
../Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_flash_if.c \
../Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_mem_if_template.c \
../Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_otp_if.c 

C_DEPS += \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_dfu_core.d \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_dfu_mal.d \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_flash_if.d \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_mem_if_template.d \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_otp_if.d 

OBJS += \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_dfu_core.o \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_dfu_mal.o \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_flash_if.o \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_mem_if_template.o \
./Drivers/STM32_USB_Device_Library/Class/dfu/src/usbd_otp_if.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32_USB_Device_Library/Class/dfu/src/%.o: ../Drivers/STM32_USB_Device_Library/Class/dfu/src/%.c Drivers/STM32_USB_Device_Library/Class/dfu/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

