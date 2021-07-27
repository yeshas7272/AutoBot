/*
 * hcsr04.h
 *
 *  Created on: Jul 24, 2021
 *      Author: yeshasyesodharan
 */

#ifndef HCSR04_HCSR04_H_
#define HCSR04_HCSR04_H_

#include "stm32f446xx.h"
#include "stm32f4xx_hal.h"
#include "FreeRTOS.h"
#define HCSR04_NUM	2u
typedef struct
{
	uint8_t echo_pin;
	GPIO_TypeDef * echo_port;
	uint8_t trig_pin;
	GPIO_TypeDef *trig_port;
	TIM_HandleTypeDef *timer;
	TIM_HandleTypeDef *delay_timer;
}HCSR04_Type;

typedef enum
{
	SEND_TRIG = 0,
	WAIT_ECHO,
	ECHO_RECIEVED
}HCSR04_TaskStates;



#endif /* HCSR04_HCSR04_H_ */
