/**
  */ 
#include "stdafx.h"

volatile uint8_t TxBuffer1[TX1_BUFFER_SIZE];
volatile uint8_t RxBuffer1[RX1_BUFFER_SIZE];

volatile uint8_t _uart1_tx_head;
volatile uint8_t _uart1_tx_tail;
volatile uint8_t _uart1_rx_head;
volatile uint8_t _uart1_rx_tail;

#if defined (_485_TO_UART)

volatile uint8_t indi485Ready = 0;
volatile uint8_t indi485SendWait;
volatile uint8_t indi485SendReady;
volatile uint8_t indi485SendSize;

volatile uint8_t indi485bReady = 0;
volatile uint8_t indi485bSendWait;
volatile uint8_t indi485bSendReady;
volatile uint8_t indi485bSendSize;

#endif

#if defined (_RC_DW_VENT_)

#define TX3_BUFFER_SIZE			(24)
#define RX3_BUFFER_SIZE			(24)

volatile uint8_t TxBuffer3[TX3_BUFFER_SIZE];
volatile uint8_t RxBuffer3[RX3_BUFFER_SIZE];

volatile uint8_t _uart3_tx_head;
volatile uint8_t _uart3_tx_tail;
volatile uint8_t _uart3_rx_head;
volatile uint8_t _uart3_rx_tail;

volatile uint8_t indi485vReady = 0;
volatile uint8_t indi485vSendWait;
volatile uint8_t indi485vSendReady;
volatile uint8_t indi485vSendSize;

uint8_t	uart3_Ready(void)	
{ 
	return (uint8_t)(_uart3_rx_head != _uart3_rx_tail ? 1 : 0); 
}

void	uart3_tx_485(uint8_t s)
{
	D_485v_WRITE_ON;
	indi485vReady += s+10;
	COM1_ITConfig(USART3, USART_IT_TXE, ENABLE);
	//COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
}

void	uart3_tx_put(uint8_t *buf, uint8_t size)
{
	uint8_t i;
	uint8_t s = 0;
	
	for( i=0; i<size; i++ )
	{
		TxBuffer3[_uart3_tx_head] = buf[i];
		_uart3_tx_head = (uint8_t)((_uart3_tx_head + 1) % TX3_BUFFER_SIZE);
		s += 1;
	}
	uart3_tx_485(s);
}

void	uart3_tx_irq(void)
{
	uint8_t	i;
	
	USART_ClearITPendingBit(USART3, COM1_IT_TC);
	if( _uart3_tx_head == _uart3_tx_tail )
	{
		COM1_ITConfig(USART3, USART_IT_TXE, DISABLE);
		return;
	}
	i = TxBuffer3[_uart3_tx_tail];
	_uart3_tx_tail = (uint8_t)((_uart3_tx_tail + 1) % TX3_BUFFER_SIZE);
    USART3->DR = i;
	/*
	if( _uart3_tx_head == _uart3_tx_tail )
	{
		USART_ITConfig(USART3, USART_IT_TXE, DISABLE);
		return;
	}
	USART3->DR = TxBuffer3[_uart3_tx_tail++];
	if( _uart3_tx_tail == TX3_BUFFER_SIZE )
		_uart3_tx_tail = 0;
	*/
}

void	uart3_rx_irq(void)
{
    RxBuffer3[_uart3_rx_head] = (uint8_t)USART3->DR;
	_uart3_rx_head = (uint8_t)((_uart3_rx_head + 1) % RX3_BUFFER_SIZE);
}

uint8_t	uart3_get(void)
{
	uint8_t	t = RxBuffer3[_uart3_rx_tail];
	_uart3_rx_tail = (uint8_t)((_uart3_rx_tail + 1) % RX3_BUFFER_SIZE);
	return t;
}
/*
*/
//uint8_t	uart3_pkt_ready(void)
//{
//	uint8_t	i = (uint8_t)((_uart3_rx_head - 1 + RX3_BUFFER_SIZE) % RX3_BUFFER_SIZE);
//	return (uint8_t)(RxBuffer3[i]==/*PKT_485_ETX*/0 ? 1 : 0);
//}

#endif

#if defined (_WOODANG_PLC_) || defined (_WOODANG_CNT_)

#define TX3_BUFFER_SIZE			(48)
#define RX3_BUFFER_SIZE			(48)

volatile uint8_t TxBuffer3[TX3_BUFFER_SIZE];
volatile uint8_t RxBuffer3[RX3_BUFFER_SIZE];

volatile uint8_t _uart3_tx_head;
volatile uint8_t _uart3_tx_tail;
volatile uint8_t _uart3_rx_head;
volatile uint8_t _uart3_rx_tail;

uint8_t	uart3_Ready(void)	
{ 
	return (uint8_t)(_uart3_rx_head != _uart3_rx_tail ? 1 : 0); 
}

/*
//	삼성 홈넷 통신시 1ms 이후에 데이터 전송하기로 변경
*/
#if defined (_WOODANG_CNT_)
volatile uint8_t	enableSamsungHomeNet = 0;
#endif

void	uart3_tx_485(uint8_t s)
{
#if defined (_WOODANG_CNT_)
#if defined (_485_TO_UART)
	D_485b_WRITE_ON;
#endif
	/*
	indi485bReady += s+1;
	*/
	indi485bReady += s+1;
	enableSamsungHomeNet = 2;
#endif
//	it called timer485Cntl@it_timer.c
/*
 *
	D_485b_WRITE_ON;
	indi485bReady += s+1;
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
	COM3_ITConfig(COM3, COM3_IT_TXE, ENABLE);
#else
	COM3_ITConfig(COM3_IT_TXE, ENABLE);
#endif
 *
 */
}
/*
void	uart3_tx_packet(uint8_t *buf, uint8_t size)
{
	uint8_t i;
	uint8_t s = 0;
	for( i=0; i<size; i++ )
	{
		TxBuffer3[i] = buf[i];
		s += 13;
	}
	_uart3_tx_head = size;
	_uart3_tx_tail = 0;
	uart3_tx_485(s);
}
*/

void	uart3_tx_put(uint8_t *buf, uint8_t size)
{
	uint8_t i;
	uint8_t s = 0;
	
	for( i=0; i<size; i++ )
	{
		TxBuffer3[_uart3_tx_head] = buf[i];
		_uart3_tx_head = (uint8_t)((_uart3_tx_head + 1) % TX3_BUFFER_SIZE);
		s += 1;
	}
	uart3_tx_485(s);
}

void	uart3_tx_irq(void)
{
//UART3_ClearITPendingBit(UART3_IT_TC);

	if( _uart3_tx_head == _uart3_tx_tail )
	{
//UART3_ClearITPendingBit(UART3_IT_TXE);
		COM3_ITConfig(COM3_IT_TXE, DISABLE);
		return;
	}
	COM3_DR = TxBuffer3[_uart3_tx_tail++];
	if( _uart3_tx_tail == TX3_BUFFER_SIZE )
		_uart3_tx_tail = 0;
		
//	_uart3_tx_tail = (uint8_t)((_uart3_tx_tail + 1) % TX3_BUFFER_SIZE);
}

void	uart3_rx_irq(void)
{
    RxBuffer3[_uart3_rx_head++] = COM3_DR;
	if( _uart3_rx_head == RX3_BUFFER_SIZE )
		_uart3_rx_head = 0;
//		
//	_uart3_rx_head = (uint8_t)((_uart3_rx_head + 1) % RX3_BUFFER_SIZE);
	UART3_ClearITPendingBit(UART3_IT_RXNE);
}

uint8_t	uart3_get(void)
{
	uint8_t	t = RxBuffer3[_uart3_rx_tail];
//	if( _uart3_rx_tail == RX3_BUFFER_SIZE )
//		_uart3_rx_tail = 0;
		
	_uart3_rx_tail = (uint8_t)((_uart3_rx_tail + 1) % RX3_BUFFER_SIZE);
	return t;
}

uint8_t	uart3_pkt_ready(void)
{
	uint8_t	i = (uint8_t)((_uart3_rx_head - 1 + RX3_BUFFER_SIZE) % RX3_BUFFER_SIZE);
	return (uint8_t)(RxBuffer3[i]==/*PKT_485_ETX*/0 ? 1 : 0);
}
#endif

uint8_t	uart1_Ready(void)	
{ 
	return (uint8_t)(_uart1_rx_head != _uart1_rx_tail ? 1 : 0); 
}

void	uart1_tx_485(uint8_t s)
{
#if defined (_WOODANG_CNT_)
#if defined (_485_TO_UART)
	D_485_WRITE_ON;
	
	indi485Ready += s+1;
#endif
#endif
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
	COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
#elif defined (_RC_DW_VENT_)
	COM1_ITConfig(COM1, COM1_IT_TXE, ENABLE);
#else
	COM1_ITConfig(COM1_IT_TXE, ENABLE);
#endif
}
/*
#if defined (_485_TO_UART)
void	uart1_tx_packet(uint8_t *buf, uint8_t size)
{
	uint8_t i;
	uint8_t s = 0;	
	for( i=0; i<size; i++ )
	{
		TxBuffer1[i] = buf[i];
		s += 13;
	}
	_uart1_tx_head = size;
	_uart1_tx_tail = 0;
	uart1_tx_485(s);
}
#endif
*/
void	uart1_tx_put(uint8_t *buf, uint8_t size)
{
	uint8_t i;
	uint8_t s = 0;

	for( i=0; i<size; i++ )
	{
		TxBuffer1[_uart1_tx_head] = buf[i];
		_uart1_tx_head = (uint8_t)((_uart1_tx_head + 1) % TX1_BUFFER_SIZE);
		s += 1;
	}
	uart1_tx_485(s);
}

void	uart1_tx_irq(void)
{
	uint8_t	i;
	
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
	COM1_ClearITPendingBit(COM1, COM1_IT_TC);
#endif
	if( _uart1_tx_head == _uart1_tx_tail )
	{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
//#elif defined (_RC_DW_VENT_)
//		COM1_ITConfig(COM1, COM1_IT_TXE, DISABLE);
#else
		COM1_ITConfig(COM1_IT_TXE, DISABLE);
#endif
		return;
	}
	i = TxBuffer1[_uart1_tx_tail];
	_uart1_tx_tail = (uint8_t)((_uart1_tx_tail + 1) % TX1_BUFFER_SIZE);
    COM1_DR = i;
}

void	uart1_rx_irq(void)
{
    RxBuffer1[_uart1_rx_head] = ((uint8_t)COM1_DR);
	_uart1_rx_head = (uint8_t)((_uart1_rx_head + 1) % RX1_BUFFER_SIZE);
}

uint8_t	uart1_get(void)
{
	uint8_t	t = RxBuffer1[_uart1_rx_tail];
	_uart1_rx_tail = (uint8_t)((_uart1_rx_tail + 1) % RX1_BUFFER_SIZE);
	return t;
}

uint8_t	uart1_pkt_ready(void)
{
	uint8_t	i = (uint8_t)((_uart1_rx_head - 1 + RX1_BUFFER_SIZE) % RX1_BUFFER_SIZE);
	return (uint8_t)(RxBuffer1[i]==/*PKT_485_ETX*/0 ? 1 : 0);
}

void	systemUart(void)
{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
	/* Enable USART clock 
	*/
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	/* Configure USART Tx as alternate function push-pull  (software pull up)
	*/
	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
	
	/* Configure USART Rx as alternate function push-pull  (software pull up)
	*/
	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);

	USART_Init(COM1, 
		9600, 
		USART_WordLength_8b, 
		USART_StopBits_1,
		USART_Parity_No, 
		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
		)
	);
	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
	COM1_Cmd(USART1, ENABLE);

#elif defined (_RC_DW_VENT_)
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);

	USART_Init(COM1, 
		9600, 
		USART_WordLength_8b, 
		USART_StopBits_1,
		USART_Parity_No, 
		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
		)
	);
	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
	COM1_Cmd(USART1, ENABLE);

	/*
	 *	vent
	 */
	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, ENABLE);
	GPIO_ExternalPullUpConfig(GPIOE, GPIO_Pin_6, ENABLE);	//	Tx
	GPIO_ExternalPullUpConfig(GPIOE, GPIO_Pin_7, ENABLE);	//	Rx

	USART_Init(USART3, 
		9600, 
		USART_WordLength_8b, 
		USART_StopBits_1,
		USART_Parity_No, 
		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
		)
	);
	COM1_ITConfig(USART3, USART_IT_RXNE, ENABLE);
	COM1_ITConfig(USART3, USART_IT_TC, ENABLE);
	COM1_Cmd(USART3, ENABLE);

	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast);
	D_IO_HIGH(GPIOC, GPIO_Pin_1);

#else

	UART1_Init( 
		(uint32_t)9600, 
		UART1_WORDLENGTH_8D, 
		UART1_STOPBITS_1, 
		UART1_PARITY_NO,
		UART1_SYNCMODE_CLOCK_DISABLE, 
		UART1_MODE_TXRX_ENABLE
		);
	COM1_ITConfig(COM1_IT_RXNE_OR, ENABLE);
	COM1_ITConfig(COM1_IT_TXE, ENABLE);
	COM1_Cmd(ENABLE);

#endif	
#if defined (_485_TO_UART)
	GPIO_Init(D_485_PORT, D_485_READ_PIN, D_IO_OUT_TRIGER);
	GPIO_ExternalPullUpConfig(D_485_PORT, D_485_READ_PIN, ENABLE);
	D_485_READ_ON;
//	D_485_WRITE_ON;
#endif

	_uart1_rx_head = 0;
	_uart1_rx_tail = 0;
	_uart1_tx_head = 0;
	_uart1_tx_tail = 0;
/**/
#if defined (_WOODANG_CNT_) || defined (_WOODANG_PLC_)
	UART3_DeInit();
	UART3_Init( 
		(uint32_t)9600, 
		UART3_WORDLENGTH_8D, 
		UART3_STOPBITS_1,
		UART3_PARITY_NO,
		UART3_MODE_RX_ENABLE | UART3_MODE_TX_ENABLE
//		UART3_MODE_TXRX_ENABLE
	);
	COM3_ITConfig(COM3_IT_RXNE_OR, ENABLE);
	COM3_ITConfig(COM3_IT_TXE, ENABLE);
	//	disable option
//	UART3_LINCmd(DISABLE);
	COM3_Cmd(ENABLE);
	
	_uart3_rx_head = 0;
	_uart3_rx_tail = 0;
	_uart3_tx_head = 0;
	_uart3_tx_tail = 0;	

#if defined (_485_TO_UART)
	GPIO_Init(D_485b_PORT, D_485b_READ_PIN, D_IO_OUT_TRIGER);
	GPIO_ExternalPullUpConfig(D_485b_PORT, D_485b_READ_PIN, ENABLE);
	D_485b_READ_ON;
//	D_485b_WRITE_ON;
#endif

#endif
/**/
}

void	systemUart3ChangeEvenParity(void)
{
#if defined (_WOODANG_CNT_) || defined (_WOODANG_PLC_)
	UART3_DeInit();
	UART3_Init( 
		(uint32_t)9600, 
		UART3_WORDLENGTH_9D, 
		UART3_STOPBITS_1,
		UART3_PARITY_EVEN,
		UART3_MODE_RX_ENABLE | UART3_MODE_TX_ENABLE
	);
	COM3_ITConfig(COM3_IT_RXNE_OR, ENABLE);
	COM3_ITConfig(COM3_IT_TXE, ENABLE);
	COM3_Cmd(ENABLE);
	
	_uart3_rx_head = 0;
	_uart3_rx_tail = 0;
	_uart3_tx_head = 0;
	_uart3_tx_tail = 0;	

#if defined (_485_TO_UART)
	GPIO_Init(D_485b_PORT, D_485b_READ_PIN, D_IO_OUT_TRIGER);
	GPIO_ExternalPullUpConfig(D_485b_PORT, D_485b_READ_PIN, ENABLE);
	D_485b_READ_ON;
#endif

#endif
}

void	systemUart3ChangeNoneParity(void)
{
#if defined (_WOODANG_CNT_) || defined (_WOODANG_PLC_)
	UART3_DeInit();
	UART3_Init( 
		(uint32_t)9600, 
		UART3_WORDLENGTH_8D, 
		UART3_STOPBITS_1,
		UART3_PARITY_NO,
		UART3_MODE_RX_ENABLE | UART3_MODE_TX_ENABLE
	);
	COM3_ITConfig(COM3_IT_RXNE_OR, ENABLE);
	COM3_ITConfig(COM3_IT_TXE, ENABLE);
	COM3_Cmd(ENABLE);
	
	_uart3_rx_head = 0;
	_uart3_rx_tail = 0;
	_uart3_tx_head = 0;
	_uart3_tx_tail = 0;	

#if defined (_485_TO_UART)
	GPIO_Init(D_485b_PORT, D_485b_READ_PIN, D_IO_OUT_TRIGER);
	GPIO_ExternalPullUpConfig(D_485b_PORT, D_485b_READ_PIN, ENABLE);
	D_485b_READ_ON;
#endif

#endif
}
