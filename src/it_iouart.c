/**
  */ 
#include "stdafx.h"
//#include "stm8s_tim1.h"

#if !defined(MOTOR_CPU)

#define D_IOUART_HIGH		D_IO_HIGH(D_IOUART_TX_PORT, D_IOUART_TX_PIN)
#define D_IOUART_LOW		D_IO_LOW(D_IOUART_TX_PORT, D_IOUART_TX_PIN)

/*	rc for RoomControl
*/
volatile uint8_t	indiIOUartWrite = 0;
//volatile uint8_t	indiIOUartSendWait = 0;

volatile uint16_t	indiIOUartSendWait = 0;

volatile uint8_t	indiIOUartSendReady = 0;
volatile uint8_t	pktIOUartWriteBuffer[8];
volatile uint8_t	indiIOUartIdle = 1;

volatile uint8_t	rcIOUartTxBuffer[8];

volatile uint8_t	rci1 = 0;
volatile uint8_t	rci2 = 0;

//	tx
volatile uint8_t	rcStatus = 0;

CONST uint8_t	__rcCntl_Start[21] = 
{
	1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 
	0
};

CONST uint8_t	__rcCntl_Port[2] = { 3, 5 }; 
CONST uint8_t	__iBitTable[] = { 0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01 };

//uint8_t	iStatus = 0;
uint8_t	iBit = 0;
uint8_t	iByte = 0;
uint8_t	iData = 0;
uint8_t	iBuf[8];

void	iouart_Open(void)
{
	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
	
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)

#elif defined (_CNV_) || defined(_FACTORY_CNT_)
//	GPIO_ExternalPullUpConfig(D_IOUART_RX_PORT, D_IOUART_RX_PIN, ENABLE);
//	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_LOW);
	/*
	*/
	TIM1_ICInit(
		TIM1_CHANNEL_2, 
		TIM1_ICPOLARITY_FALLING,
//		TIM1_ICPOLARITY_RISING,
		TIM1_ICSELECTION_DIRECTTI,
		TIM1_ICPSC_DIV1,
		0
		);
	TIM1_ClearFlag(TIM1_FLAG_CC2);	
	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);
	TIM1_Cmd(ENABLE);
//	GPIO_Init(D_IOUART_RX_PORT, D_IOUART_RX_PIN, D_IO_IN_TRIGER);
//	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_LOW);

#elif defined (_WOODANG_CNT_)

	GPIO_Init(D_IOUART3_TX_PORT, D_IOUART3_TX_PIN, D_IO_OUT_TRIGER);

#endif
}

uint8_t	*iouart_getBuffer(void)
{
	return rcIOUartTxBuffer;
}

uint8_t	*iouart_getReadBuffer(void)
{
	return iBuf;
}
/*
uint8_t	iouart_Get_WriteEnable()
{
	if( indiIOUartSendReady == 1 && indiIOUartSendWait == 0 )
	{
		indiIOUartSendReady = 0;
		return 1;
	}
	return 0;
}
*/
void	iouart_Set_Packet(uint8_t wait)
{
#if defined (_MONITOR_)
	uint8_t marker[2] = { '>', '>' };
	//	monitor '>>' + 8byte + '<<' 
	marker[0] = '[';
	marker[1] = '[';
	uart1_tx_put(marker, 2);
	uart1_tx_put(iouart_getBuffer(), 8);
	marker[0] = ']';
	marker[1] = ']';
	uart1_tx_put(marker, 2);
#endif

	indiIOUartSendReady = 1;
#if defined (_RC_WD_)	
	indiIOUartSendWait = wait + 540; // 60ms
#elif defined (_RINNAI_BOILER_)
	indiIOUartSendWait = wait + 10; // 1ms
#else
	indiIOUartSendWait = wait + 1540; // 160ms
#endif
}

void	iouart_Pkt_Start(void)
{
	indiIOUartIdle = 1;	//	Busy
	rcStatus = 1;
	indiIOUartSendReady = 0;
	IOUART(DISABLE);
}

uint8_t	_iouart_50ms_high = 0;

void	_iouart_50ms(void)
{
//#ifdef	IO_50MS
	if( _iouart_50ms_high == 1 )
	{
		_iouart_50ms_high = 0;
		D_IOUART_LOW;
	}
//#endif
}

uint8_t	iouart_Write(void)
{
	uint8_t	t;
	if( rci1 != 0 )
	{
		rci1 -= 1;
		D_IOUART_LOW;
	}
	else
	{
		if( rcStatus == 0 )
		{
			//	Disable Rx
			D_IOUART_LOW;
			return 1;
		}			
		if( rcStatus <= 21 )
		{
			if( __rcCntl_Start[rcStatus-1] == 1 )
			{
				_iouart_50ms_high = 1;
				D_IOUART_HIGH;
			}
			else
			{
				D_IOUART_LOW;
			}
		}
		else if( rcStatus <= 85 )	//	21+64
		{
			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
			if( t != 0 )
				t = 1;
			rci1 = __rcCntl_Port[t];
			rci2 += 1;
			_iouart_50ms_high = 1;
			D_IOUART_HIGH;
		}
		else if( rcStatus <= 87 )	//	(21+64)+2
		{
			_iouart_50ms_high = 1;
			D_IOUART_HIGH;
		}
		else
		{
			D_IOUART_LOW;
			rcStatus = 0;
			rci1 = 0;
			rci2 = 0;
			indiIOUartIdle = 0;	//	Not Busy
			IOUART(ENABLE);
			return 2;
		}
		rcStatus += 1;
	}	
	return 0;
}

volatile uint8_t	_is = 0;

uint8_t		iouart_Ready(void)
{	
	uint8_t	i;
	uint8_t	cs;
#if defined (_MONITOR_)
uint8_t marker[2] = { '>', '>' };
#endif
	cs = _io_tail;
	i = (_io_buf[_io_tail]+1)/2;
	_io_tail += 1;
	if( _io_tail == _IO_BUF_SIZE )
		_io_tail = 0;

//disp_char(i);			
		
	if( _is == 0 )
	{
		iBit = 0;
		iByte = 0;
		iData = 0;
		if( i == 12 )
			_is = 1;
	}
	else if( _is == 1 )
	{
		_io_buf[cs] = 0;
		_is = i == 8 || i == 9 || i == 10? 2 : 0;
	}
	else if( _is == 2 )
	{
		if( i > 5 )
			iData |= __iBitTable[iBit];

		iBit++;
		if( iBit == 8 )
		{
			iBit = 0;
			iBuf[iByte++] = iData;
			if( iByte == 8 )
			{
				_is = 0;
				cs = 0;
				for( i=0; i<7; i++ )
					cs += iBuf[i];
#if defined (_MONITOR_)
				//	monitor '>>' + 8byte + '<<' 
				marker[0] = '>';
				marker[1] = '>';
				uart1_tx_put(marker, 2);
				uart1_tx_put(iBuf, 8);
				marker[0] = '<';
				marker[1] = '<';
				uart1_tx_put(marker, 2);
#endif
				if( cs != iData )
					return 2;
				return 1;
			}
			iData = 0;
		}
	}
	return 0;
}
#endif	//MOTOR_CPU