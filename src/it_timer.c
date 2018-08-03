#include "stdafx.h"

volatile uint8_t	timer50usCount = 0;
volatile uint8_t	timer100usCount = 0;
volatile uint8_t	_t20ms = 0;

volatile uint8_t	_io_buf[_IO_BUF_SIZE];
volatile uint8_t	_io_head = 0;
volatile uint8_t	_io_tail = 0;
volatile uint8_t	___k = 0;

#define SW_TX_BUFFER_SIZE	64

#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)

volatile uint8_t	beepCount = 0;
volatile uint8_t	beepEnable = 0;

#define BEEP_COUNT	255

uint8_t	__beep_enable = 0;

void	beepSet(uint8_t i)
{
	if( __beep_enable == 0 )
	{
		__beep_enable = 1;
		//	SWIM & GPIO ENABLE
		CFG-> GCR |= CFG_GCR_SWD;
		CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);
		CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);
		
		BEEP_LSICalibrationConfig( 38000+801+801  );
	
		BEEP_Init(BEEP_Frequency_1KHz);
		BEEP_Cmd(DISABLE);
	}
//	if( i==4 )
//		i = 11;
//	i = 255;
//	beepCount = i;
	beepCount =5;
	beepEnable = 1;
}

volatile uint8_t	_io_rc_prev = 2;
extern __rcCb(void);

#elif defined (_WOODANG_CNT_)

volatile uint8_t	_mtCount = 20;
volatile uint8_t	__t1ms = 0;
volatile uint8_t	_t1ms = 0;

#define SWUART_PORT		GPIOD
#define SWUART_PIN		GPIO_PIN_2

extern uint8_t		___k_3;
extern uint8_t		_u3SendWait;

extern uint8_t	iouart3_Write(void);
extern void		timer2Ci_3_Cb(void);

#elif defined (_CNV_) || defined(_FACTORY_CNT_)

#undef	SW_TX_BUFFER_SIZE
#define SW_TX_BUFFER_SIZE	32
#define SWUART_PORT		GPIOD
#define SWUART_PIN		GPIO_PIN_3

#endif

#if defined (_RC_DW_VENT_)
volatile uint8_t	__t1ms = 0;
volatile uint8_t	_t1ms = 0;
#endif

#define _L			D_IO_LOW(SWUART_PORT, SWUART_PIN)
#define _H			D_IO_HIGH(SWUART_PORT, SWUART_PIN)

volatile uint8_t	swTxBuffer[SW_TX_BUFFER_SIZE];
volatile uint8_t	_swuart_tx_head = 0;
volatile uint8_t	_swuart_tx_tail = 0;
volatile uint8_t	_sw_data;
volatile uint8_t	_sw_bit = 0;
volatile uint8_t	_sw_sending = 0;

#if defined (_WOODANG_CNT_)
#if defined (_RINNAI_BOILER_)

extern uint8_t		_u9Idle;
extern uint16_t		_u9SendWait;
extern void	__timer1CiCb_Rn(void);	//	it_iouart3plc.c
extern uint8_t	iouart9_Write(void);

#elif defined (_DAEWOO_BOILER_)

extern uint8_t		_u9dIdle;
extern uint16_t		_u9dSendWait;
extern void	__timer1CiCb_Dw(void);	//	it_iouart3plc.c
extern uint8_t	iouart9d_Write(void);

#else
#endif
extern void	__timer1CiCb(void);	//	it_iouart3plc.c
#endif

void	timer1CiCb(void)
{	
#if defined (_WOODANG_CNT_)
#if defined (_RINNAI_BOILER_)
	//__timer1CiCb_Rn();
#endif
#if defined (_DAEWOO_BOILER_)
	// __timer1CiCb_Dw();
#endif
	//	plc
	//__timer1CiCb();
#endif
}

void	timer2CiCb(void)
{	
	if( indiIOUartIdle == 0 )
	{
		if( ___k != 0 )
		{
			_io_buf[_io_head++] = ___k;
			if( _io_head == _IO_BUF_SIZE )
				_io_head = 0;
			___k = 0;
		}
	}
}

void	timer2_UpdateCb(void)
{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
	uint8_t	i;

	i = GPIO_ReadInputData(D_IOUART_RX_PORT);
	i = i & D_IOUART_RX_PIN;
	if( i == _io_rc_prev )
		return;

	_io_rc_prev = i;
	if( i == 0 )
	{
		_io_buf[_io_head] = ___k;
		_io_head += 1;
		if( _io_head == _IO_BUF_SIZE )
			_io_head = 0;
		___k = 0;
	}
#endif
//#if defined (_RINNAI_BOILER_)
//	__timer1CiCb_Rn();
//#endif
}

void	_swuartCb(void)
{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
#elif defined (_RC_DW_VENT_)
#else
	if( _sw_sending == 1 )
	{
		switch(_sw_bit)
		{
		case 0: 
			_L;	
			break;
		case 1: if( (_sw_data & 0x01)!=0 ) _H; else _L;	break;
		case 2: if( (_sw_data & 0x02)!=0 ) _H; else _L;	break;
		case 3: if( (_sw_data & 0x04)!=0 ) _H; else _L;	break;
		case 4: if( (_sw_data & 0x08)!=0 ) _H; else _L;	break;
		case 5: if( (_sw_data & 0x10)!=0 ) _H; else _L;	break;
		case 6: if( (_sw_data & 0x20)!=0 ) _H; else _L;	break;
		case 7: if( (_sw_data & 0x40)!=0 ) _H; else _L;	break;
		case 8: if( (_sw_data & 0x80)!=0 ) _H; else _L;	break;
		case 9:	
			_H; 
			break;
		case 10: 
			_sw_bit = 0;	
			_sw_sending = 0;
			return;
		}
		_sw_bit++;
	}
	else
	{
		if( _swuart_tx_head != _swuart_tx_tail )
		{
			_sw_data = swTxBuffer[_swuart_tx_tail];
			_swuart_tx_tail = (_swuart_tx_tail + 1) % SW_TX_BUFFER_SIZE;
			_sw_sending = 1;
			_sw_bit = 0;
		}
	}
#endif
}

void	swuart_Write(uint8_t *p, uint8_t size)
{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
#elif defined (_RC_DW_VENT_)
#else
	uint8_t	i;
	for( i=0; i<size; i++ )
	{
		swTxBuffer[_swuart_tx_head] = p[i];
		_swuart_tx_head = (_swuart_tx_head + 1) % SW_TX_BUFFER_SIZE;
	}
#endif
}

#if defined (_WOODANG_CNT_)
extern uint8_t	enableSamsungHomeNet;
#endif

void	timer485Cntl(void)
{
	
#if defined (_WOODANG_CNT_)
	if( enableSamsungHomeNet == 1 || enableSamsungHomeNet == 2 )
	{
		//	minus 1ms, default time is normally 2ms but not exact timeing
		enableSamsungHomeNet--;
		return;
	}
	else if( enableSamsungHomeNet == 0 )
	{
		enableSamsungHomeNet = 254;
		//	run uart interrupt
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
	COM3_ITConfig(COM3, COM3_IT_TXE, ENABLE);
//#elif defined (_RC_DW_VENT_)
//	COM3_ITConfig(COM3, COM3_IT_TXE, ENABLE);
#else
	COM3_ITConfig(COM3_IT_TXE, ENABLE);
#endif
	}	
#endif

	/*	2ms changed
	*/
#if defined (_485_TO_UART)
	if( indi485Ready != 0 )
		indi485Ready--;
	else
	{
		D_485_READ_ON;
	}
		
	if( indi485SendWait != 0 )
		indi485SendWait--;

#if defined (_WOODANG_CNT_) || (_WOODANG_PLC_)
	if( indi485bReady != 0 )
		indi485bReady--;
	else
	{
		D_485b_READ_ON;
	}

	if( indi485bSendWait != 0 )
		indi485bSendWait--;
#endif
#endif
#if defined (_RC_DW_VENT_)
	if( indi485vReady != 0 )
		indi485vReady--;
	else
	{
		D_485v_READ_ON;
	}

	if( indi485vSendWait != 0 )
		indi485vSendWait--;	
#endif
}

extern void	_iouart_50ms(void);

void	timer4_UpdateCb(void)
{
	_iouart_50ms();
#if defined (_WOODANG_CNT_)
#if defined (_PLC_)
	___k_3++;
#endif
#if defined (_RINNAI_BOILER_)
//	timer2_UpdateCb();
	__timer1CiCb_Rn();
#endif
#if defined (_DAEWOO_BOILER_)
	__timer1CiCb_Dw();
#endif
#endif
	
	___k++;
	if( timer50usCount == 0 )
	{
#if defined (_WOODANG_CNT_)
_mtCount--;
if( _mtCount == 0 )
	_mtCb();
#endif
		
		timer50usCount = 1;
		timer100usCount++;
		if( timer100usCount == 100 )
		{
			_t20ms++;	//	10ms
			if( _t20ms == 100 )
				_t20ms = 0;
			timer100usCount = 0;
#if defined (_RC_DR_) || defined (_RC_DW_VENT_)
			if( beepEnable == 1 )
			{
				D_IO_LOW(GPIOC, GPIO_Pin_5);
				beepEnable = 14;
				BEEP_Cmd(ENABLE);
			}
			else if( beepEnable == 14 )
			{
				beepCount--;
				if( beepCount == 1 )
				{
					beepCount = BEEP_COUNT;
					beepEnable = 2;
				}
			}
			else if( beepEnable == 2 )
			{
				beepCount--;
				if( beepCount == BEEP_COUNT-6 )
				{
					D_IO_HIGH(GPIOC, GPIO_Pin_5);
//				BEEP_Cmd(DISABLE);
					beepEnable = 3;
				}
			}
			else if( beepEnable == 3 )
			{
				beepCount--;
				if( beepCount == 0 )
				{
					beepCount = BEEP_COUNT;
					beepEnable = 4;
				}
			}
			else if( beepEnable == 4 )
			{
				beepCount--;
				if( beepCount == 0 )
				{
					beepCount = BEEP_COUNT;
					beepEnable = 5;
				}
			}
			else if( beepEnable == 5 )
			{
				beepCount--;
				if( beepCount == 0 )
				{
					beepCount = BEEP_COUNT;
					beepEnable = 6;
				}
			}
			else if( beepEnable == 6 )
			{
				beepCount--;
				if( beepCount == 0 )
				{
					BEEP_Cmd(DISABLE);
					beepEnable = 0;
				}
			}
#endif
		}
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
#else
		_swuartCb();
#if defined (_WOODANG_CNT_)
#if defined (_RINNAI_BOILER_)
		if( _u9SendWait != 0 )
			_u9SendWait--;
		else
		{
			if( _u9Idle == 1 )
				iouart9_Write();
		}
#endif
#if defined (_DAEWOO_BOILER_)
		if( _u9dSendWait != 0 )
			_u9dSendWait--;
		else
		{
			if( _u9dIdle == 1 )
				iouart9d_Write();
		}
#endif
#if defined (_PLC_)
		if( _u3SendWait != 0 )
			_u3SendWait--;
		else
			iouart3_Write();
#endif
#endif
#endif
	}
	else
	{
		timer50usCount = 0;
		if( indiIOUartSendWait != 0 )
			indiIOUartSendWait--;
		else
			iouart_Write();
#if defined (_WOODANG_CNT_)
		__t1ms++;
		if( __t1ms == 10 )
		{
			__t1ms = 0;
			timer485Cntl();		
			_t1ms++;
			if( _t1ms == 100 )
				_t1ms = 0;
		}
#endif		
#if defined (_RC_DW_VENT_)
		__t1ms++;
		if( __t1ms == 10 )
		{
			__t1ms = 0;
			timer485Cntl();		
//			_t1ms++;
//			if( _t1ms == 100 )
//				_t1ms = 0;
		}
#endif
	}
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
	__rcCb();
#endif
}

volatile	uint8_t	__timer100ms = 0;
volatile	uint8_t	__timer1s = 0;
volatile	uint8_t	__timer1sa = 0;
volatile	uint8_t	__timer1min = 0;
volatile	uint8_t	__timer1h = 0;
volatile	uint8_t	__timeri = 0;
volatile	uint8_t	__timeri2 = 0;
//uint8_t	__timer2b = 0;

uint8_t	__timerOffset = 60;

uint8_t	timerCalc2(void)
{
	uint8_t	r = 0;
	__timer1sa++;
	if( __timer1sa != __timerOffset )
		return r;
		
	__timerOffset = __timerOffset==60 ? 59 : 60;
	__timer1sa = 0;
	__timer1min++;
	r = 1;
	if( __timer1min != 60 )
		return r;
		
	__timer1min = 0;
	__timer1h++;
	if( __timer1h == 24 )
		__timer1h = 0;

	return r;
}
uint8_t	_timer100ms255 = 0;
uint8_t	timerCalc(void)
{
	uint8_t	buf[3];
	uint8_t	r = 0;
	//	1s
	uint8_t	i = _t20ms/10;
	if( __timeri != i )
	{
		__timeri = i;
		__timer100ms++;
		_timer100ms255++;
		if( _timer100ms255 == 200 )
			_timer100ms255 = 0;
		if( __timer100ms != 10 )
			return r;
			
		__timer100ms = 0;
		__timer1s++;
		r = timerCalc2();
		if( __timer1s != 60 )
			return r;
			
		__timer1s = 0;
	}
	return r;
}

//	create 100/2 us tick timer
//	10us -> 4(5-1
//	50us -> 24(25-1)
//	100us -> 49
#define TIMER_PERIOD		24
#define TIMER_PERIOD50US	9

void	systemTimer(void)
{
/* 
	TIM4 configuration:
	- TIM4CLK is set to 16 MHz, the TIM4 Prescaler is equal to 128 so the TIM1 counter
	clock used is 16 MHz / 128 = 125 000 Hz
	- With 125 000 Hz we can generate time base:
	max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 125000 = 2.048 ms
	min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 125000 = 0.016 ms
	- In this example we need to generate a time base equal to 1 ms
	so TIM4_PERIOD = (0.001 * 125000 - 1) = 124 
*/
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)

	//	enable TIM4 Clock
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
	TIM4_TimeBaseInit(TIM4_Prescaler_32, TIMER_PERIOD);
	TIM4_ClearFlag(TIM4_FLAG_Update);
	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
	TIM4_Cmd(ENABLE);
	//	for RC_DR, RC_DW
	//	encoder_Open@dev_key.c for TIM1

#elif defined (_CNV_) || defined(_FACTORY_CNT_)

	TIM4_TimeBaseInit(TIM4_PRESCALER_32, TIMER_PERIOD);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd(ENABLE);
	GPIO_Init(SWUART_PORT, SWUART_PIN, D_IO_OUT_TRIGER);
	
#elif defined (_WOODANG_CNT_)

//#if defined (_RINNAI_BOILER_)	
//#else
	//	plc
	TIM1_ICInit(
		TIM1_CHANNEL_2, 
		TIM1_ICPOLARITY_FALLING,
		TIM1_ICSELECTION_DIRECTTI,
		TIM1_ICPSC_DIV1,
		0
		);
	TIM1_ClearFlag(TIM1_FLAG_CC2);	
	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);
	TIM1_Cmd(ENABLE);
//#endif
	//	rinnai
	TIM2_ICInit(
		TIM2_CHANNEL_2, 
		TIM2_ICPOLARITY_FALLING,
		TIM2_ICSELECTION_DIRECTTI,
		TIM2_ICPSC_DIV1,
		0
		);
	TIM2_ClearFlag(TIM2_FLAG_CC2);	
	TIM2_ITConfig(TIM2_IT_CC2, ENABLE);
	TIM2_Cmd(ENABLE);

	TIM4_TimeBaseInit(TIM4_PRESCALER_32, TIMER_PERIOD);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
	TIM4_Cmd(ENABLE);
	GPIO_Init(SWUART_PORT, SWUART_PIN, D_IO_OUT_TRIGER);
	
#if defined (_RINNAI_BOILER_)	
	GPIO_Init(D_IOUART3_RX_PORT, D_IOUART3_RX_PIN, D_IO_IN_TRIGER_NOIT);
#endif
#if defined (_DAEWOO_BOILER_)	
	GPIO_Init(D_IOUART3d_RX_PORT, D_IOUART3d_RX_PIN, D_IO_IN_TRIGER_NOIT);
#endif
	
#endif
}

void	timer2Cntl(uint8_t mode)
{
#if defined (_WOODANG_CNT_)
	TIM2_ITConfig(TIM2_IT_CC2, mode);
#endif
	return;
}
