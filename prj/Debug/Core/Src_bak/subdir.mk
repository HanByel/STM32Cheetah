################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src_bak/hConf.c \
../Core/Src_bak/hGPIOconf.c \
../Core/Src_bak/syscalls.c \
../Core/Src_bak/sysmem.c 

CPP_SRCS += \
../Core/Src_bak/hCommunication.cpp \
../Core/Src_bak/hPhysics.cpp \
../Core/Src_bak/hcommon.cpp \
../Core/Src_bak/htimer.cpp \
../Core/Src_bak/main.cpp \
../Core/Src_bak/mainbak.cpp \
../Core/Src_bak/stm32f4xx_hal_msp.cpp \
../Core/Src_bak/stm32f4xx_it.cpp \
../Core/Src_bak/system_stm32f4xx.cpp \
../Core/Src_bak/workspace.cpp 

C_DEPS += \
./Core/Src_bak/hConf.d \
./Core/Src_bak/hGPIOconf.d \
./Core/Src_bak/syscalls.d \
./Core/Src_bak/sysmem.d 

OBJS += \
./Core/Src_bak/hCommunication.o \
./Core/Src_bak/hConf.o \
./Core/Src_bak/hGPIOconf.o \
./Core/Src_bak/hPhysics.o \
./Core/Src_bak/hcommon.o \
./Core/Src_bak/htimer.o \
./Core/Src_bak/main.o \
./Core/Src_bak/mainbak.o \
./Core/Src_bak/stm32f4xx_hal_msp.o \
./Core/Src_bak/stm32f4xx_it.o \
./Core/Src_bak/syscalls.o \
./Core/Src_bak/sysmem.o \
./Core/Src_bak/system_stm32f4xx.o \
./Core/Src_bak/workspace.o 

CPP_DEPS += \
./Core/Src_bak/hCommunication.d \
./Core/Src_bak/hPhysics.d \
./Core/Src_bak/hcommon.d \
./Core/Src_bak/htimer.d \
./Core/Src_bak/main.d \
./Core/Src_bak/mainbak.d \
./Core/Src_bak/stm32f4xx_hal_msp.d \
./Core/Src_bak/stm32f4xx_it.d \
./Core/Src_bak/system_stm32f4xx.d \
./Core/Src_bak/workspace.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src_bak/%.o: ../Core/Src_bak/%.cpp Core/Src_bak/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Core/Src_bak/%.o: ../Core/Src_bak/%.c Core/Src_bak/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

