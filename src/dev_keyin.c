#include "stdafx.h"

uint8_t	_key_sec = 0;
uint8_t	_key_min = 0;
uint8_t	_key_hour = 0;
uint8_t	__key2 = 0;
uint8_t	__key_2 = 0;

uint8_t	_key_continue = 0;

#define	KEY_CLEAR	_key_sec = _key_min = _key_hour = 0

#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)

#define _DISP_CODE_

#define D_KEY_4PORT			GPIOC
#define D_KEY_4PIN			6
#define D_KEY_3PORT			GPIOC
#define D_KEY_3PIN			5
#define D_KEY_2PORT			GPIOA
#define D_KEY_2PIN			3
#define D_KEY_1PORT			GPIOA
#define D_KEY_1PIN			2

volatile uint8_t	indiEncoderPrevCode = 100;
volatile uint8_t	indiEncoderCode;
volatile uint8_t	indiEncoderFlag = 0;
volatile uint8_t	indiEncoderMove = 0;

uint8_t	key_get(void)
{
#if defined (_RC_WD_)
	uint8_t	b = GPIO_ReadInputData(D_KEY_4PORT);
	uint8_t r = (b>>5) & 0x03;
	b = GPIO_ReadInputData(D_KEY_2PORT);
	r = (r<<2) | ((b>>2)&0x03);
	r = r & 0x0f;
	//key
	//4/3/2/1
	if( r != 0x0f )
	{
		KEY_CLEAR;
	}
		
	if( __key2 != __timer1s )
	{
		if( __key_2 == 0 )
		{
			__key_2 = 1;
			_key_sec++;
			if( _key_sec == 60 )
			{
				_key_sec = 0;
				_key_min++;
				if( _key_min == 60 )
				{
					_key_min = 0;
					_key_hour++;
				}
			}
			__key2 = __timer1s;
		}
	}
	else
		__key_2 = 0;
		
	return (r & 0x0f);
#else
	return 0;
#endif
}

void	encoder_resetCount(uint8_t code)
{
#if defined (_RC_WD_)
	TIM1_SetCounter(100);
	indiEncoderCode = 100;
	/*
	if( code < indiEncoderCode )
		indiEncoderPrevCode = indiEncoderCode - 1;
	else
		indiEncoderPrevCode = indiEncoderCode + 1;
	*/
	indiEncoderPrevCode = indiEncoderCode;
#endif
}

void	encoder_irq(void)
{
#if defined (_RC_WD_)
	uint16_t	i;
	i = (uint8_t)TIM1_GetCounter();
	indiEncoderCode = i;
	indiEncoderFlag = 1;
	if( indiEncoderCode > 195 || indiEncoderCode < 5 )
		encoder_resetCount(indiEncoderCode);
#endif
}

uint8_t	_key_pressed = 0;
uint8_t	_key_timer = 0;
uint8_t _key_code = 0;
uint8_t _key_complete = 0;
uint8_t	_enc_t1 = 0;

extern uint8_t	timer100usCount;

uint8_t	key_ready(void)
{
#if defined (_RC_WD_)
	uint8_t	t;
	uint8_t i = 0;
	uint8_t r = 0;
	if( indiEncoderFlag == 1 )
	{
		indiEncoderFlag = 0;
		
		if( indiEncoderCode > indiEncoderPrevCode )
		{
			r = 0xc0;	//	b1100
			i = indiEncoderCode - indiEncoderPrevCode;
		}
		else if( indiEncoderCode < indiEncoderPrevCode )
		{
			r = 0xa0;	//	b1010
			i = indiEncoderPrevCode - indiEncoderCode;
		}
		else
			return 0;

		indiEncoderPrevCode = indiEncoderCode;
		if( _enc_t1 != timer100usCount/10 )//_t20ms )
		{
			encoder_resetCount(0);
			KEY_CLEAR;
			_enc_t1 = timer100usCount/10;//_t20ms;
			return r | i;
		}
	}
	//	same time 1ms t20ms -> 10ms Not 20ms
	if( _t20ms == _key_timer )
		return 0;

	_key_timer = _t20ms;
	t = key_get();
	if( t == 0x0f )
		goto err;
		
	if( (t & 0x08) == 0 )
	{
		i++;
		r = 4;
	}
	if( (t & 0x04) == 0 )
	{
		i++;
		r = 3;
	}
	if( (t & 0x02) == 0 )
	{
		i++;
		r = 2;
	}
	if( (t & 0x01) == 0 )
	{
		i++;
		r = 1;
	}
	if( i != 1 )
		goto err;

	if( _key_code != r )
	{
		_key_code = r;
		_key_pressed = 0;
		_key_complete = 0;
		_key_continue = 0;
		return 0;
	}

	_key_pressed++;
	
	if( _key_pressed >= /*13*/6 )
	{
		if( _key_complete != 0 )
		{
			_key_complete++;
			_key_pressed = 0;
			if( _key_complete == /*15*/20 )
			{
				_key_complete = 1;
				_key_continue++;
				//	2nd key
				return r;
			}
			return 0;
		}
		//	20ms over
		//_key_code = 0;
		_key_pressed = 0;
		_key_complete = 1;
		return r;
	}
	return 0;
err:
	_key_pressed = 0;
	_key_code = 0;
	_key_complete = 0;
	_key_continue = 0;
#endif
	return 0;
}

void 	encoder_Open(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
	
#if defined (_RC_WD_)
	TIM1_EncoderInterfaceConfig (
		TIM1_EncoderMode_TI2, 
		TIM1_ICPolarity_Rising,
		TIM2_ICPolarity_Falling
		);
	TIM1_CounterModeConfig(TIM1_CounterMode_CenterAligned1);
	TIM1_SetCounter(100);
//	TIM1_SetAutoreload(200);
	
	//TIM1->CCMR1 = TIM1->CCMR1 & ((~TIM1_CCMR_ICxF) | (15<<4));
	TIM1_SelectInputTrigger(TIM1_TRGSelection_TI1FP1);
	TIM1_ITConfig(TIM1_FLAG_Trigger, ENABLE);
	/*	RX
	*/
	TIM1_ICInit(
		TIM1_Channel_3, 
//		TIM1_ICPolarity_Rising,
		TIM1_ICPolarity_Falling,
		TIM1_ICSelection_DirectTI,
		TIM1_ICPSC_DIV1,
		0
		);
	TIM1_ClearFlag(TIM1_FLAG_CC3);	
	TIM1_ITConfig(TIM1_IT_CC3, ENABLE);
	TIM1_Cmd(ENABLE);
#elif defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
	/*	RX
	*/
	TIM1_ICInit(
		TIM1_Channel_3, 
		TIM1_ICPolarity_Falling,
		TIM1_ICSelection_DirectTI,
		TIM1_ICPSC_DIV1,
		0
		);
	TIM1_ClearFlag(TIM1_FLAG_CC3);	
	TIM1_ITConfig(TIM1_IT_CC3, ENABLE);
	TIM1_Cmd(ENABLE);
#endif	
/*
*/
#if defined (_RC_WD_)
	GPIO_Init(D_KEY_4PORT, D_KEY_4PIN, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(D_KEY_3PORT, D_KEY_3PIN, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(D_KEY_2PORT, D_KEY_2PIN, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(D_KEY_1PORT, D_KEY_1PIN, GPIO_Mode_In_PU_No_IT);
#endif	
}
/*
#elif defined (_RC_DR_) || defined (_RC_DW_)

uint8_t	_key_sec = 0;
uint8_t	_key_min = 0;
uint8_t	_key_hour = 0;
//uint8_t	__key2 = 0;
//uint8_t	__key_2 = 0;

#define	KEY_CLEAR	_key_sec = _key_min = _key_hour = 0

uint8_t	key_get(void)
{
	return 0;
}

void	encoder_resetCount(uint8_t code)
{
//	TIM1_SetCounter(100);
//	indiEncoderCode = 100;
//	indiEncoderPrevCode = indiEncoderCode;
}

void	encoder_irq(void)
{
}

void 	encoder_Open(void)
{
}

uint8_t	_key_pressed = 0;
uint8_t	_key_timer = 0;
uint8_t _key_code = 0;
uint8_t _key_complete = 0;
uint8_t	_enc_t1 = 0;
uint8_t	_key_continue = 0;

extern uint8_t	timer100usCount;

uint8_t	key_ready(void)
{
	return 0;
}
*/
#endif

