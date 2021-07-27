################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/usart/uart.c 

OBJS += \
./Core/usart/uart.o 

C_DEPS += \
./Core/usart/uart.d 


# Each subdirectory must supply rules for building sources it contributes
Core/usart/uart.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/usart/uart.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Core/usart/uart.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

