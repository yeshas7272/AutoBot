/*
 * hcsr04.c
 *
 *  Created on: Jul 24, 2021
 *      Author: yeshasyesodharan
 */


#include "hcsr04.h"
#include "task.h"
static HCSR04_Type *hscr04_handles[HCSR04_NUM];
static volatile HCSR04_TaskStates hcsr04_states[HCSR04_NUM] = { SEND_TRIG };
/*For Task 0*/
static volatile uint32_t callback_counter_0 = 0;
static volatile uint32_t trigger_sent_0 = 0;
volatile uint32_t fall_edge_time_0 = 0;
volatile uint32_t distance_0 = 0;

/*For Task 1*/
static volatile uint32_t callback_counter_1 = 0;
static volatile uint32_t trigger_sent_1 = 0;
volatile uint32_t fall_edge_time_1 = 0;
volatile uint32_t distance_1 = 0;
void hcsr04_callback_redge(uint8_t index)
{
	hcsr04_states[index] = ECHO_RECIEVED;
	__HAL_TIM_SET_COUNTER(hscr04_handles[index]->delay_timer, 0);

	if(index == 0) callback_counter_0++;
	else callback_counter_1++;
}

void hcsr04_callback_fedge(uint8_t index)
{
	if(index == 0) fall_edge_time_0 = __HAL_TIM_GET_COUNTER(hscr04_handles[index]->delay_timer);
	else fall_edge_time_1 = __HAL_TIM_GET_COUNTER(hscr04_handles[index]->delay_timer);
}

static void hcsr04_delay_0(uint32_t value)
{
	__HAL_TIM_SET_COUNTER(hscr04_handles[0]->delay_timer, 0);
	while(__HAL_TIM_GET_COUNTER(hscr04_handles[0]->delay_timer) < value);
}

static void hcsr04_delay_1(uint32_t value)
{
	__HAL_TIM_SET_COUNTER(hscr04_handles[1]->delay_timer, 0);
	while(__HAL_TIM_GET_COUNTER(hscr04_handles[1]->delay_timer) < value);
}
void HCSR04_TASK_02(void *xParams)
{
	HCSR04_Type *hcsr_handle = hscr04_handles[1];
	char msg_buffer[20] = {0};
	TickType_t currentTime = 0;
	//HAL_TIM_Base_Start_IT(hcsr_handle->timer);
	NVIC_EnableIRQ(EXTI3_IRQn);
	HAL_Delay(1000);
	for(;;)
	{

		switch(hcsr04_states[1])
		{
		case SEND_TRIG:

			/*Send trig by setting the trig pin high for 10us*/
			HAL_GPIO_WritePin(hcsr_handle->trig_port, hcsr_handle->trig_pin, GPIO_PIN_SET);
			hcsr04_delay_1(10);
			HAL_GPIO_WritePin(hcsr_handle->trig_port, hcsr_handle->trig_pin, GPIO_PIN_RESET);

			hcsr04_states[1] = WAIT_ECHO;

			trigger_sent_1++;

			break;

		case ECHO_RECIEVED:
			/*echo is recieved when echo pin is set to high*/
			distance_1 = ((fall_edge_time_1) * 0.034) / 2;

			snprintf(msg_buffer, 20, "Trig_1: %u\r\n", trigger_sent_1);
			HAL_UART_Transmit(get_uart_handle(), msg_buffer, 20, 100);
			hcsr04_states[1] = SEND_TRIG;
			/*Once echo recieved wait for 100ms before sending trig again*/
			currentTime = xTaskGetTickCount();
			vTaskDelayUntil(&currentTime, pdMS_TO_TICKS(100));
			//HAL_Delay(200);

			break;

		case WAIT_ECHO:
			/*wait for state transition from echo interrupt*/
			if(__HAL_TIM_GET_COUNTER(hscr04_handles[1]->delay_timer) > 10000) hcsr04_states[1] = SEND_TRIG;
			break;

		default:
			break;
		}
	}
}

void HCSR04_TASK_01(void *xParams)
{
	HCSR04_Type *hcsr_handle = hscr04_handles[0];
	char msg_buffer[20] = { 0 };
	TickType_t currentTime = 0;
	//HAL_TIM_Base_Start_IT(hcsr_handle->timer);
	NVIC_EnableIRQ(EXTI4_IRQn);
	HAL_Delay(1000);
	for(;;)
	{

		switch(hcsr04_states[0])
		{
		case SEND_TRIG:

			/*Send trig by setting the trig pin high for 10us*/
			HAL_GPIO_WritePin(hcsr_handle->trig_port, hcsr_handle->trig_pin, GPIO_PIN_SET);
			hcsr04_delay_0(10);
			HAL_GPIO_WritePin(hcsr_handle->trig_port, hcsr_handle->trig_pin, GPIO_PIN_RESET);

			hcsr04_states[0] = WAIT_ECHO;

			trigger_sent_0++;

			break;

		case ECHO_RECIEVED:
			/*echo is recieved when echo pin is set to high*/
			distance_0 = ((fall_edge_time_0) * 0.034) / 2;
			hcsr04_states[0] = SEND_TRIG;

			snprintf(msg_buffer, 20, "Trig_0: %u\r\n", trigger_sent_0);
			HAL_UART_Transmit(get_uart_handle(), msg_buffer, 20, 100);
			/*Once echo recieved wait for 100ms before sending trig again*/
			currentTime = xTaskGetTickCount();
			vTaskDelayUntil(&currentTime, pdMS_TO_TICKS(100));
			//HAL_Delay(200);

			break;

		case WAIT_ECHO:
			/*wait for state transition from echo interrupt*/
			if(__HAL_TIM_GET_COUNTER(hscr04_handles[0]->delay_timer) > 10000) hcsr04_states[0] = SEND_TRIG;
			break;

		default:
			break;
		}
	}
}

static void hscr_task_init()
{
	TaskHandle_t hcsr_task_handle_1, hcsr_task_handle_2;
	BaseType_t status;

	status = xTaskCreate(HCSR04_TASK_01, "HCSRTASK01", 400, NULL, 1, &hcsr_task_handle_1);
	configASSERT(status == pdPASS);

	status = xTaskCreate(HCSR04_TASK_02, "HCSRTASK02", 400, NULL, 1, &hcsr_task_handle_2);
	configASSERT(status == pdPASS);
}

void hscr04_init(HCSR04_Type *lHCSR04_handle)
{
	static uint8_t hcsr_num = 0;
	GPIO_InitTypeDef GPIO_InitStruct = { 0 };
	if (hcsr_num > HCSR04_NUM)
	{
		return;
	}
	/*Configure GPIO pin : ECHO Pin */
	GPIO_InitStruct.Pin = lHCSR04_handle->echo_pin;
	GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
	HAL_GPIO_Init(lHCSR04_handle->echo_port, &GPIO_InitStruct);

	/*Configure GPIO pin : TRIG */
	GPIO_InitStruct.Pin = lHCSR04_handle->trig_pin;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(lHCSR04_handle->trig_port, &GPIO_InitStruct);

	hscr04_handles[hcsr_num++] = lHCSR04_handle;

	/*Init RTOS tasks*/
	hscr_task_init();
}
