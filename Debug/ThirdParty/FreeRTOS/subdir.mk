################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/croutine.c \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/event_groups.c \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/list.c \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/queue.c \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/stream_buffer.c \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/tasks.c \
C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/timers.c 

OBJS += \
./ThirdParty/FreeRTOS/croutine.o \
./ThirdParty/FreeRTOS/event_groups.o \
./ThirdParty/FreeRTOS/list.o \
./ThirdParty/FreeRTOS/queue.o \
./ThirdParty/FreeRTOS/stream_buffer.o \
./ThirdParty/FreeRTOS/tasks.o \
./ThirdParty/FreeRTOS/timers.o 

C_DEPS += \
./ThirdParty/FreeRTOS/croutine.d \
./ThirdParty/FreeRTOS/event_groups.d \
./ThirdParty/FreeRTOS/list.d \
./ThirdParty/FreeRTOS/queue.d \
./ThirdParty/FreeRTOS/stream_buffer.d \
./ThirdParty/FreeRTOS/tasks.d \
./ThirdParty/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
ThirdParty/FreeRTOS/croutine.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/croutine.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/croutine.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThirdParty/FreeRTOS/event_groups.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/event_groups.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/event_groups.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThirdParty/FreeRTOS/list.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/list.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/list.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThirdParty/FreeRTOS/queue.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/queue.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/queue.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThirdParty/FreeRTOS/stream_buffer.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/stream_buffer.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/stream_buffer.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThirdParty/FreeRTOS/tasks.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/tasks.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/tasks.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
ThirdParty/FreeRTOS/timers.o: C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/timers.c
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F446xx -DDEBUG -c -I../Core/Inc -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/USART_PROJECT/Core/HCSR04" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/include" -I"C:/Users/yeshasyesodharan/Documents/RTOS_Workspace/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"ThirdParty/FreeRTOS/timers.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

