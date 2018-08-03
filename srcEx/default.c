#include "stdafx2.h"

// 20180610 MD24 NEW
IODEF	IO_LED = { GPIOB, GPIO_PIN_4 };
IODEF	IO_ORG = { GPIOA, GPIO_PIN_1 };

IODEF	IO_X1 = { GPIOA, GPIO_PIN_3 };
IODEF	IO_X2 = { GPIOD, GPIO_PIN_6 };
IODEF	IO_Y1 = { GPIOC, GPIO_PIN_5 };
IODEF	IO_Y2 = { GPIOA, GPIO_PIN_2 };

IODEF	IO_ADJ = { GPIOC, GPIO_PIN_4 };			//MD24, In - Ref Vol
IODEF	IO_SEN = { GPIOD, GPIO_PIN_2 };			//MD24, In - Motor Current Sensing
IODEF	IO_POWER = { GPIOD, GPIO_PIN_5 };		//MD24, In - Vcc(12/24/Drop) 

IODEF	IO_MOD = { GPIOD, GPIO_PIN_4 };
IODEF	IO_BAT = { GPIOD, GPIO_PIN_3 };
IODEF	IO_BOOST = { GPIOD, GPIO_PIN_6 };
IODEF	IO_CHARGE = { GPIOA, GPIO_PIN_3 };
	

void	factory(uint8_t mode)
{
	uint16_t t = 0, _t = 0;
	if( mode == 0 )
		return;
		
#if defined(MOTOR_CPU)
	while(1)
	{
		if( Ticks_1mS == _t )
			continue;
		_t = Ticks_1mS;
		t++;
		if( t > 200 )
		{
			//LightToggle
		}
	}
#endif
}

	
void configClock(void)
{
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	CLK_HSICmd(ENABLE);
}


void configGpioMode(void)
{
	uint8_t t = 0;
	uint8_t prev = 0;

	/*
	 * Default Mode : TYPE_MD24
	 */
	Drive.DeviceType = TYPE_MD24;
	Ticks_1mS = 0;
	return;
/*/	
	GPIO_SET(MOD, GPIO_MODE_IN_FL_IT)

	while( Ticks_1mS < 500 )
	{
		if( Diff(Ticks_1mS, 10) == 0 )
			continue;
			
		t = ModeSelect() == prev ? t+1 : 0; 
		prev = ModeSelect();
		if( t == 10 )
			break;
	}
	if( t != 10 )
		return;

	if( prev == 1 )	
	{
		//	MD12, 24BYJ48 5V, Rinnai/SY, 12V
		Drive.DeviceType = TYPE_MD12;
		IODEF_RESET(LED, B, 1);
		IODEF_RESET(ORG, B, 1);
		IODEF_RESET(X1, B, 1);
		IODEF_RESET(X2, B, 1);
		IODEF_RESET(Y1, B, 1);
		IODEF_RESET(Y2, B, 1);

		IODEF_RESET(ADJ, B, 1);
		IODEF_RESET(SEN, B, 1);
		IODEF_RESET(POWER, B, 1);
		IODEF_RESET(MOD, B, 1);
		IODEF_RESET(BAT, B, 1);
		IODEF_RESET(BOOST, B, 1);
		IODEF_RESET(CHARGE, B, 1);
	}
	else
	{
		//	MD24, SP-350RD(MOATECH), 12/24V, Germany, 12~24V
		Drive.DeviceType = TYPE_MD24;
	}

	factory(0);
	Ticks_1mS = 0;
//*/
}

void configGpio(void)
{
	configGpioMode();

	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
		
	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
	if( Drive.DeviceType == TYPE_MD24 )
	{
		return;
	}
	
	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
		
	if( Drive.DeviceType == TYPE_MD12 )
	{
		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
	}
}


void configTimer(void)
{
	//	50us Timer
	//  	16 * 0x32 = 50uS  Ticks, 0x64 -> 100us 
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  	TIM4_Cmd(ENABLE);

#if defined (_PWM_TIMER_MODE_)

	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
	TIM1_TimeBaseInit(0x02, TIM1_COUNTERMODE_UP, 0xffff, 0);	//	4 -> 0.25us
	TIM1_PWMIConfig(TIM1_CHANNEL_2, 
			TIM1_ICPOLARITY_RISING, //TIM1_ICPOLARITY_FALLING, 
			TIM1_ICSELECTION_DIRECTTI, 
			TIM1_ICPSC_DIV1, 0);
	TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
	TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET);
	TIM1_ITConfig(TIM1_IT_UPDATE | TIM1_IT_CC1 | TIM1_IT_CC2, ENABLE);
	TIM1_SetCounter(0xffff);
	TIM1_Cmd(ENABLE);

#endif
}


uint8_t  Diff(uint16_t time, uint16_t diff)
{
	uint16_t t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
	return t > diff ? 1 : 0;
}


uint16_t CPulse(uint8_t step)
{
	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
}


void	waitPowerDelay(uint16_t time)
{
	LightOn
	while(Ticks_1mS < time)
		;
	LightOff
//	Drive.Origin = !MotorOrigin();
}


#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) 
{ 
	uint8_t i; 
	while (1) 
		i++; 
}
#endif

