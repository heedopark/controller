#ifndef _STDAFX_H_
#define _STDAFX_H_

#define  _VERSION2 					1

#define PACKET_ERROR_COUNT		30
#define PACKET_ERROR_COUNT_60	60

#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)

#define BACKLIGHT_MAX_LEVEL		96

#define D_USART_TX_PORT			GPIOC
#define D_USART_TX_PIN			GPIO_Pin_3
#define D_USART_RX_PORT			GPIOC
#define D_USART_RX_PIN			GPIO_Pin_2

#define COM1					USART1
#define COM1_ITConfig			USART_ITConfig
#define COM1_IT_TXE				USART_IT_TXE
#define COM1_ClearITPendingBit	USART_ClearITPendingBit
#define COM1_Cmd				USART_Cmd
#define COM1_IT_TC				USART_IT_TC
#define COM1_IT_RXNE			USART_IT_RXNE
#define COM1_DR					USART1->DR

#define TX1_BUFFER_SIZE			(8)
#define RX1_BUFFER_SIZE			(4)

#if defined (_RC_DR_)

#undef RX1_BUFFER_SIZE
#define RX1_BUFFER_SIZE			(16)

#endif

#elif defined (_RC_DW_VENT_)

#define BACKLIGHT_MAX_LEVEL		96

#define D_USART_TX_PORT			GPIOC
#define D_USART_TX_PIN			GPIO_Pin_3
#define D_USART_RX_PORT			GPIOC
#define D_USART_RX_PIN			GPIO_Pin_2

#define COM1					USART1
#define COM1_ITConfig			USART_ITConfig
#define COM1_IT_TXE				USART_IT_TXE
#define COM1_ClearITPendingBit	USART_ClearITPendingBit
#define COM1_Cmd				USART_Cmd
#define COM1_IT_TC				USART_IT_TC
#define COM1_IT_RXNE			USART_IT_RXNE
#define COM1_DR					USART1->DR

#define TX1_BUFFER_SIZE			(8)
#define RX1_BUFFER_SIZE			(4)

#else

#if defined (_CNV_)
#define D_USART_TX_PORT			GPIOD
#define D_USART_TX_PIN			GPIO_PIN_3
#define D_USART_RX_PORT			GPIOC
#define D_USART_RX_PIN			GPIO_PIN_5
#endif

#define COM1					UART1
#define COM1_ITConfig			UART1_ITConfig
#define COM1_IT_TXE				UART1_IT_TXE
#define COM1_ClearITPendingBit	UART1_ClearITPendingBit
#define COM1_Cmd				UART1_Cmd
#define COM1_IT_TC				UART1_IT_TC
#define COM1_IT_RXNE			UART1_IT_RXNE
#define COM1_IT_RXNE_OR			UART1_IT_RXNE_OR
#define COM1_DR					UART1->DR

#define COM3					UART3
#define COM3_ITConfig			UART3_ITConfig
#define COM3_IT_TXE				UART3_IT_TXE
#define COM3_ClearITPendingBit	UART3_ClearITPendingBit
#define COM3_Cmd				UART3_Cmd
#define COM3_IT_TC				UART3_IT_TC
#define COM3_IT_RXNE			UART3_IT_RXNE
#define COM3_IT_RXNE_OR			UART3_IT_RXNE_OR
#define COM3_DR					UART3->DR

#define TX1_BUFFER_SIZE			(48)
#define RX1_BUFFER_SIZE			(48)

#endif

/*
 *	define MCU
 */
//#define _CNV_
//#define _RC_WD_
//#define _PLC_
//#define _CNT_

//	I/O
#define D_IO_HIGH(port,pin)	port->ODR |= pin
#define D_IO_LOW(port,pin)	port->ODR &= ~pin
#define D_IO_TOGGLE(port,pin)		port->ODR ^= pin

#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
#include "stm8l15x_conf.h"

#define DISP_CODE

#define DISP	uart1_tx_put
#define DISP2	swuart_Write

#define D_IO_OUT_TRIGER		GPIO_Mode_Out_PP_Low_Fast
#define D_IO_IN_TRIGER		GPIO_Mode_In_PU_IT
#define D_IO_IN_TRIGER_NOIT	GPIO_Mode_In_PU_No_IT

#define D_LED_PORT			GPIOC
#define D_LED_PIN			GPIO_Pin_0

#define D_BL_PORT			GPIOE
#define D_BL_PIN			GPIO_Pin_6

#define D_IOUART_RX_PORT	GPIOD
#define D_IOUART_RX_PIN		GPIO_Pin_5
#define D_IOUART_TX_PORT	GPIOF
#define D_IOUART_TX_PIN		GPIO_Pin_0

/*
#define DISP_CODE

#define DISP	uart1_tx_put
#define DISP2	swuart_Write

#define D_IO_OUT_TRIGER		GPIO_Mode_Out_PP_Low_Fast
#define D_IO_IN_TRIGER		GPIO_Mode_In_PU_IT
#define D_IO_IN_TRIGER_NOIT	GPIO_Mode_In_PU_No_IT

#define D_LED_PORT			GPIOC
#define D_LED_PIN			GPIO_Pin_0

#define D_BL_PORT			GPIOE
#define D_BL_PIN			GPIO_Pin_6

#define D_IOUART_RX_PORT	GPIOD
#define D_IOUART_RX_PIN		GPIO_Pin_5
#define D_IOUART_TX_PORT	GPIOF
#define D_IOUART_TX_PIN		GPIO_Pin_0
*/

#elif defined (_RC_DW_VENT_)
#include "stm8l15x_conf.h"

#define DISP_CODE

#define DISP	uart1_tx_put
#define DISP2	swuart_Write

#define D_IO_OUT_TRIGER		GPIO_Mode_Out_PP_Low_Fast
#define D_IO_IN_TRIGER		GPIO_Mode_In_PU_IT
#define D_IO_IN_TRIGER_NOIT	GPIO_Mode_In_PU_No_IT
/*
#define D_LED_PORT			GPIOC
#define D_LED_PIN			GPIO_Pin_0
*/
#define D_BL_PORT			GPIOD
#define D_BL_PIN			GPIO_Pin_7

#define D_IOUART_RX_PORT	GPIOD
#define D_IOUART_RX_PIN		GPIO_Pin_5
#define D_IOUART_TX_PORT	GPIOF
#define D_IOUART_TX_PIN		GPIO_Pin_0

#define D_485v_PORT			GPIOC
#define D_485v_PIN			GPIO_Pin_1

#define D_485v_WRITE_ON		D_IO_HIGH(D_485v_PORT, D_485v_PIN)
#define D_485v_READ_ON		D_IO_LOW(D_485v_PORT, D_485v_PIN)

extern uint8_t 	indi485vReady;
extern uint8_t 	indi485vSendWait;
extern uint8_t 	indi485vSendReady;
extern uint8_t 	indi485vSendSize;

#else	//	_RC_WD_
/*
 *	include stm8s system header file
 */
#include "stm8s_conf.h"

#define D_IO_OUT_TRIGER		GPIO_MODE_OUT_PP_LOW_FAST
#define D_IO_IN_TRIGER		GPIO_MODE_IN_PU_IT
#define D_IO_IN_TRIGER_NOIT	GPIO_MODE_IN_PU_NO_IT

#endif	//	_RC_WD_


//	ADC1
void systemADC(void);
uint8_t	adcGet(uint8_t mode);
void disp_adc(uint8_t i);
void disp_enc(uint8_t i);

//	BUTTON
uint8_t	key_get(void);

//	ENCODER & CB
extern uint8_t	indiEncoderCode;
extern uint8_t	indiEncoderFlag;

void encoder_irq(void);
void encoder_Open(void);
uint8_t key_ready(void);

//	lcd
void systemLcd(void);
void lcd_blink(uint8_t mode);
void lcd_disp(uint8_t id, uint8_t mode);
void	lcd_cntl(uint8_t cmd, uint8_t param);

//	for iouart receive 
void timer2_UpdateCb(void);

void	error_display(uint8_t type, uint8_t err);


#if defined (_CNV_) || defined (_FACTORY_CNT_)
/*
 *	MCU - stm8s003
 */
#define DISP	swuart_Write

#define D_LED_PORT			GPIOA
#define D_LED_PIN			GPIO_PIN_1

#define D_IOUART_RX_PORT	GPIOC
#define D_IOUART_RX_PIN		GPIO_PIN_7
#define D_IOUART_TX_PORT	GPIOC
#define D_IOUART_TX_PIN		GPIO_PIN_6

#define D_485_PORT			GPIOB
#define D_485_READ_PIN		GPIO_PIN_5

#define D_485_WRITE_ON		D_IO_HIGH(D_485_PORT, D_485_READ_PIN)
#define D_485_READ_ON		D_IO_LOW(D_485_PORT, D_485_READ_PIN)

#endif	//	_CNV_

#if defined (_WOODANG_CNT_)

//	Rinnai boiler

#define D_IOUART9_TX_PORT	GPIOD
#define D_IOUART9_TX_PIN	GPIO_PIN_2

#define D_IOUART9_HIGH		D_IO_HIGH(D_IOUART9_TX_PORT, D_IOUART9_TX_PIN)
#define D_IOUART9_LOW		D_IO_LOW(D_IOUART9_TX_PORT, D_IOUART9_TX_PIN)

#define D_IOUART9_READ_PORT	GPIOD
#define D_IOUART9_READ_PIN	GPIO_PIN_0

//#define DISP	swuart_Write
#define DISP	uart1_tx_put

#define D_LED_PORT			GPIOA
#define D_LED_PIN			GPIO_PIN_1

#define D_IOUART_RX_PORT	GPIOD
#define D_IOUART_RX_PIN		GPIO_PIN_3
#define D_IOUART_TX_PORT	GPIOD
#define D_IOUART_TX_PIN		GPIO_PIN_4

#define D_IOUART3_RX_PORT	GPIOC
#define D_IOUART3_RX_PIN	GPIO_PIN_2
#define D_IOUART3_TX_PORT	GPIOC
#define D_IOUART3_TX_PIN	GPIO_PIN_1

#define D_485_PORT			GPIOA
#define D_485_READ_PIN		GPIO_PIN_6

#define D_485_WRITE_ON		D_IO_HIGH(D_485_PORT, D_485_READ_PIN)
//#define D_485_READ_ON		D_485_WRITE_ON
#define D_485_READ_ON		D_IO_LOW(D_485_PORT, D_485_READ_PIN)

#define D_485b_PORT			GPIOD
#define D_485b_READ_PIN		GPIO_PIN_7

#define D_485b_WRITE_ON		D_IO_HIGH(D_485b_PORT, D_485b_READ_PIN)
#define D_485b_READ_ON		D_IO_LOW(D_485b_PORT, D_485b_READ_PIN)

void	_mtCb(void);
void	mtCalc(void);

#endif

//	iouart
extern uint8_t	indiIOUartWrite;
extern uint16_t	indiIOUartSendWait;
extern uint8_t	__iouart_Ready;
extern uint8_t	indiIOUartIdle;

//	ENABLE/DISABLE
#define IOUART(mode)	timer2Cntl(mode)

void	timer2Cntl(uint8_t mode);

void	iouartCb(void);
void 	__iouartCb(void);
void 	iouart_Open(void);
uint8_t	iouart_Get_WriteEnable(void);
void 	iouart_Set_Packet(uint8_t wait);
void 	iouart_Pkt_Start(void);
uint8_t 	iouart_Write(void);
void 	iouart_ReadCb(void);
void	iouart_WritePacket(void);

#define _IO_BUF_SIZE	(48)

extern uint8_t	_io_head;
extern uint8_t	_io_tail;
extern uint8_t	_io_buf[];

void 	pktIOUartWrite(uint8_t wait100us, uint8_t size);

uint8_t	iouart_Ready(void);
uint8_t	*iouart_getBuffer(void);
uint8_t	*iouart_getReadBuffer(void);

//	UART1 / UART3
uint8_t	uart1_Ready(void);
void	uart1_tx_packet(uint8_t *buf, uint8_t size);
void	uart1_tx_put(uint8_t *buf, uint8_t size);
void	uart1_tx_irq(void);
void	uart1_rx_irq(void);
uint8_t	uart1_get(void);
uint8_t	uart1_pkt_ready(void);
void 	uart1_tx_irq(void);
void 	uart1_rx_irq(void);

uint8_t	uart3_Ready(void);
void	uart3_tx_packet(uint8_t *buf, uint8_t size);
void	uart3_tx_put(uint8_t *buf, uint8_t size);
void	uart3_tx_irq(void);
void	uart3_rx_irq(void);
uint8_t	uart3_get(void);
uint8_t	uart3_pkt_ready(void);
void 	uart3_tx_irq(void);
void 	uart3_rx_irq(void);

void 	systemUart(void);
void	systemUart3ChangeEvenParity(void);
void	systemUart3ChangeNoneParity(void);

extern uint8_t 	indi485Ready;
extern uint8_t 	indi485SendWait;
extern uint8_t 	indi485SendReady;
extern uint8_t 	indi485SendSize;

#if defined (_WOODANG_CNT_) || (_WOODANG_PLC_)

extern uint8_t 	indi485bReady;
extern uint8_t 	indi485bSendWait;
extern uint8_t 	indi485bSendReady;
extern uint8_t 	indi485bSendSize;

extern uint8_t	_io3_head;
extern uint8_t	_io3_tail;
extern uint8_t	_u3Idle;

extern uint8_t	*iouart3_getBuffer(void);
extern uint8_t	*iouart3_getReadBuffer(void);
extern uint8_t	iouart3_Ready(void);
extern uint8_t	iouart3_Get_WriteEnable(void);
extern void	iouart3_Set_Packet(uint8_t wait);
extern void	iouart3_Pkt_Start(void);

#define _PKT3_SIZE		32
#define _IO_PKT_SIZE	13


#define PLC_C_GO			1
#define PLC_C_BACK			2
#define PLC_C_OPEN_MAX		3
#define PLC_C_CLOSE_MAX		4
#define PLC_C_GO_REV		5
#define PLC_C_BACK_REV		6
#define PLC_C_ORIGIN_CALC	7
#define PLC_C_GOTO_POS		8
#define PLC_C_ID_SET		9
#define PLC_C_ORIGIN_ERR	10
#define PLC_C_ORIGIN_OK		11
#define PLC_C_ERR			12
#define PLC_C_TEST_OK		13
#define PLC_C_TEST_ERR		14

typedef struct tagPktInfo
{
	uint8_t	id, pos, cmd;
}	PKTINFO;

void	p3_push(PKTINFO *p);
PKTINFO *p3_pop(void);
uint8_t	p3_Ready(void);
uint8_t	p3_decoder(uint8_t *buf);
uint8_t	p3_write(uint8_t id, uint8_t pos, uint8_t cmd);

#endif	//	_WOODANG_CNT_ || _WOODANG_PLC_

//	timer
extern uint8_t	timer1msCount;
extern uint8_t	timer100usCount;
extern uint8_t	timer50usCount;

extern uint8_t	_t20ms;
extern uint8_t	__timer1ms;
extern uint8_t	__timer100ms;
extern uint8_t	__timer1s;
extern uint8_t	__timer1min;
extern uint8_t	__timer1h;

void systemTimer(void);
void timer4_UpdateCb(void);
void timer2_UpdateCb(void);
void timer2CiCb(void);
void timer1_UpdateCb(void);
uint8_t timerCalc(void);

void timer1CiCb(void);

//	util.c
void	clockConfig(void);
void	disp_char(uint8_t ch);
void	disp_int(uint8_t i);
void	disp_int16(uint16_t i);
uint8_t	*_i2a(uint16_t i);
uint8_t	_strlen(uint8_t *p);
void	dispCursor(uint8_t t);

//	swUart
void	swuart_Write(uint8_t *p, uint8_t size);

void	file_write(uint8_t addr, uint8_t data);

uint8_t	file_read(uint8_t addr);

extern uint8_t	ext_br_error;
extern uint8_t	ext_hn_error;

#endif 	//	_STDAFX__H

