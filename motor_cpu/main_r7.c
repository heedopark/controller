#include "stdafx2.h"

#if defined (_DEBUG_TIM1_)
#define GET_CAPTURECOUNT	TIM1_GetCapture3()
#define GET_ITSTATUS		TIM1_GetITStatus(TIM1_IT_CC3)

#else
#define GET_CAPTURECOUNT	TIM2_GetCapture1()
#define GET_ITSTATUS		TIM2_GetITStatus(TIM2_IT_CC1)

#endif

//#define	_DEBUG_TIME_ELAPSED_	//	enable calc elasped time for PWM
//#define _DEBUG_MOTOR_WATCH_		//	enable ave Motor Step 
//#define _DEBUG_ADC_SUM_			//	enable ave for adc

#define HALL_THRESHOLD 		40	// hall IC threshold
#define OVER_STEP  			30
#define MAX_ZERO_OVERRUN  	300	// Pulse, Zero position overrun

#define VALVE_TIMEOUT_S 	300	// sec
#define MAX_ADC				5

#define OFFSET_OVERRUN		0

//	TIM2_IT_CC1/TIM2_IT_CC2
#define TIM2_InterruptClear(i)	TIM2_ClearITPendingBit(i); TIM2_SetCounter(0);
#define TIM1_InterruptClear(i)	TIM1_ClearITPendingBit(i);

DUTYINFO dutyInfo;

volatile uint8_t Ticks_50uS;
volatile uint16_t Ticks_1mS;
uint16_t lightBlink = 500;

DRIVE	Drive;
PWM		Pwm;
TIMER	Timer;
ADCBUF	AdcBuf;

struct {
	uint8_t ch;
	ADCBUF	buf[MAX_ADC];
} 	Adc;
/*/
#if defined (_DEBUG_TIM1_)
//
//
//	TIM1_ICPSC_DIV4 : CLK / 4 = 0.25us(0.266779661)
//		200us -> 744 :: 198.4840
//		10ms -> 37474 :: 9,997301
//
//
#define TIMER_EDGE_SET_0 	\
			TIM1_SetCounter(0);\
			TIM1_ICInit(TIM1_CHANNEL_3,\
				TIM1_ICPOLARITY_FALLING,\
				TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV4, 0);\
			TIM1_ClearITPendingBit(TIM1_IT_CC3);

#define TIMER_EDGE_SET_1 	\
			TIM1_SetCounter(0);\
			TIM1_ICInit(TIM1_CHANNEL_3,\
		   	TIM1_ICPOLARITY_RISING,\
		   	TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV4, 0);\
			TIM1_ClearITPendingBit(TIM1_IT_CC3);
#endif
//*/

/*
uint16_t	stepPrepare(uint8_t i)
{
	dutyInfo.s -= dutyInfo.b[i];
	dutyInfo.b[i] = Pwm.Duty;
	dutyInfo.s += dutyInfo.b[i];
	return dutyInfo.s;
}
*/

uint8_t	stepCalc(uint16_t duty)
{
	uint16_t t;
	if ( dutyInfo.n < 16 )
		dutyInfo.n ++;
	t = (duty / dutyInfo.n) * 2 + 1;	
	t /= 2;
	if( t < 20 )	t = 20;
	if( t > 180 )	t = 180;
						 
	t = (625 * t)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
	t = (t / 25 + 1 ) /	2;

	return (uint8_t)t;
}

OnTimer_1S(void) {}
//	3/4/2 -> 3/4/5/6/2
//	MD24
//	I_SENSE = 4
//	I_POWER = 3
//	I_ADJ = 2
uint8_t	_chan[] = { ADC1_CHANNEL_3, ADC1_CHANNEL_4, 
		ADC1_CHANNEL_5, ADC1_CHANNEL_6,
		ADC1_CHANNEL_2 };
uint8_t	_chanSchmit[] = { ADC1_SCHMITTTRIG_CHANNEL3 , ADC1_SCHMITTTRIG_CHANNEL4 , 
		ADC1_SCHMITTTRIG_CHANNEL5, ADC1_SCHMITTTRIG_CHANNEL6,
		ADC1_SCHMITTTRIG_CHANNEL2 };

uint8_t	_chanId[] = { 1, 2, 3, 4, 0 };
//uint8_t	_chanId[] = { 2, 2, 4, 4, 0 };

void	AdcGetCode(uint8_t ch)
{
#if defined (_DEBUG_ADC_SUM_)
	uint8_t i = Adc.buf[ch].i;
	Adc.buf[ch].i = (i + 1) % MAX_ADC_BUF;
#else
	uint8_t i = 0;
#endif
	Adc.buf[ch].b[i] = ADC1_GetConversionValue();
}

void Adc_Config(void)
{
	AdcGetCode(Adc.ch);
	Adc.ch = _chanId[Adc.ch];
	//@ Check Type
	if( Drive.DeviceType == TYPE_MD24 )
	{		
		if( Adc.ch == 1 ) Adc.ch = 2;
		if( Adc.ch == 3 ) Adc.ch = 4;
	}
		
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
		_chan[Adc.ch], 
		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
		_chanSchmit[Adc.ch],
	   	DISABLE
		);
	ADC1_StartConversion();		
}

void	AdcGetAvg(uint8_t ch)
{
#if defined (_DEBUG_ADC_SUM_)
	uint8_t i;
	uint16_t s = 0;
	for( i=0; i<MAX_ADC_BUF; i++ )
		s += Adc.buf[ch].b[i];
	Adc.buf[ch].avg = (s>>2) / MAX_ADC_BUF;
#else
	Adc.buf[ch].avg = Adc.buf[ch].b[0]>>2;
#endif
}

void AdcService(uint8_t ch)
{
	Adc_Config();
	AdcGetAvg(ch);	//	Adc.buf[ch].avg
	if( Drive.DeviceType == TYPE_MD24 )
	{
		//	MD12(Germany)
		//	ch3/4/2, Power,Sense,Adjust
		if( ch == 0 ) { }
		else if( ch == 1 ) { }
		else if( ch == 2 ) 
		{
			//	Read - MOTOR LEVEL value
			//	Convert 0~10v -> 0~200
			//
			//	pos =  
			//Drive.Target = CPulse(pos);
	   	}
	}
	else
	{
		//	CAP type
		if( ch == 0 ) { }
		else if( ch == 1 ) { }
		else if( ch == 2 ) { }
		else if( ch == 3 ) { }
		else if( ch == 4 ) { }
	}
}

void OnCaptureOVTim2(void)
{
	//if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
	//	return;
	//Pwm.T1 = Pwm.T10 = 0u;		
#if defined(_DEBUG_TIM1_)
	//TIM1_PrescalerConfig(0x02, TIM1_PSCRELOADMODE_UPDATE);
	//TIM1_SetCounter(0xffff);
	Pwm.Overflow = 1;
	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
#else
	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
#endif
}	

void OnCaptureTim2(void)
{
#if defined (_PWM_TIMER_MODE_)
	if( TIM1_GetITStatus(TIM1_IT_CC1) == SET )
	{
		Pwm.T1 = TIM1_GetCapture1();	
		TIM1_InterruptClear(TIM1_IT_CC1)
	}
	if( TIM1_GetITStatus(TIM1_IT_CC2) == SET ) 
	{
		Pwm.T2 = TIM1_GetCapture2();	
		TIM1_InterruptClear(TIM1_IT_CC2)
		TIM1_SetCounter(0u);
		Pwm._t1 = Pwm.T1;
		Pwm._t2 = Pwm.T2;
		if ( Pwm.Overflow )
		{	
			Pwm._t1 = 0;
			Pwm.Overflow = 0;
		}
		else
			Pwm.Calc = 1;
	}
#else
	if( GET_ITSTATUS == SET )
	{
		if ( Pwm.Edge == 0 ) 
		{	
			Pwm.T1 = GET_CAPTURECOUNT;	
			TIMER_EDGE_SET_0
			Pwm.Edge = 1;
		}	
		else
		{
			Pwm.T2 = GET_CAPTURECOUNT;	
			TIMER_EDGE_SET_1
			Pwm.Edge = 0; 
			Pwm.Calc = 1;	
			
			//Pwm.sT = Pwm.T1 +Pwm.T2;
		}
		//TIM1_SetCounter(0);
	}
#endif
}

void mainDeviceType(void)
{
	while (1)	{}
}

void mtSetPos(uint16_t tPos, uint8_t overrun)
{
	debug_motor_watch(tPos);
	
	Drive.PreStep = Drive.Step;
	Drive.Step= tPos;
	//	Drive.Run set 0 if stoped
	//		Can't change tPos when motor is running
	//		
	if( Drive.Run || Drive.Position == tPos ) 
		return;

	Drive.Run = 1;
	Drive.Ticks = Drive.Interval;
	Drive.Overrun = Drive.Overrun2 = 0;

	if( tPos == 0 )				
	{
		//Drive.ZeroOffset = CPulse(OVER_STEP);
		//Drive.Position += Drive.ZeroOffset;
		Drive.Position += CPulse(OVER_STEP);
	}
	else
	{
		//	Open
		if(Drive.Position < tPos)
			Drive.Overrun2 = overrun;
	}
	Drive.Target = tPos + Drive.Overrun2;
}

void mtCheckPowerOnStatus(uint8_t mode)
{
	Drive.Origin = !MotorOrigin();	//	read pos
	if( mode == 1 )
	{
		//	open
	}
	else
	{
		//	close
	}
	if( Drive.Origin == 0 ) 
	{
		Drive.Position = CPulse(MAX_MOTOR_POS + 5);
		return;
	}

	Drive.Position = 0;
//	mtSetPos(MAX_MOTOR_POS, OFFSET_OVERRUN);
//	
//	while(Drive.Run)
//		motorCallback();
}

void	motorCallback(void)
{
	uint8_t i;
	//	Drive.Run set if tPos is updated
	//	Drive.MotorRun set if Timer ISR is ready
#if !defined(_MOTOR_ISR_MODE_)
	if( Drive.Run == 0 || Drive.MotorRun == 0 || Drive.Enabled )
		return;
	Drive.MotorRun = 0;
#endif

	i = Drive.Target==Drive.Position ? 1 : Drive.Target > Drive.Position ? 2 : 3;
	switch(i)
	{
	case 1:	
		if ( Drive.Overrun2 )
		{				
			Drive.Target -= Drive.Overrun2;
			Drive.Overrun2 = 0;
			break;
		}
		motorDriveStop();	
		break;
	case 2:
	 	MotorStepOpen();
		break;
	case 3:
		if ( Drive.Origin )
		{	
			//	origin passed
			if( Drive.Overrun >= Drive.MaxOverrun )
			{
				Drive.Position = Drive.Target = 0;
				motorDriveStop();	
				break;
			}
			Drive.Overrun++;
		}
		MotorStepClose();
		break;
	}
}

//	Timer ISR for #4
//		50us
//
void OnTimer4(void)
{
	Ticks_50uS++;
	if( Ticks_50uS >= 20 )
	{
		Ticks_50uS = 0;
		Ticks_1mS++;
	}
	if( Drive.Ticks )
		Drive.Ticks--;
	else 
	{
#if !defined(_MOTOR_ISR_MODE_)
		Drive.MotorRun = 1;
#endif
		Drive.Ticks = Drive.Interval;
#if defined(_MOTOR_ISR_MODE_)
		if( Drive.Enabled )
		{
			if( Drive.Run == 1 && Drive.Enabled == 1 )
				motorCallback();
		}
#endif
	}
	TIM4_ClearFlag(TIM4_IT_UPDATE);
}

void mtSetZeroPos(uint8_t offset)
{
	uint16_t i = 0;

	mtSetPos(0, offset);
	while( Drive.Stage == 0 )
	{
		if( Diff(i, 60000) == 1 )
		{
			//	60s timeout
			//
		}
		if( Drive.Origin == 1 ) 
			break;
#if !defined(_MOTOR_ISR_MODE_)
		if( Drive.MotorRun == 1 )
			motorCallback();
#endif
	}
	Drive.Stage = 1;
}

void mtPwmUpdate(void)
{
	double dt;
	while( Pwm._t2 > 0xff )
	{
		Pwm._t1 >>= 1;
		Pwm._t2 >>= 1;
	}
			
	dt = 100. * Pwm._t1 / ( Pwm._t2);
	Pwm.Duty100 = (uint16_t)dt;
	Pwm.Duty = Pwm.Duty100 / 100 * MAX_MOTOR_POS / 100; 
	mtSetPos(stepCalc(Pwm.Duty), OFFSET_OVERRUN);
}

void main(void)
{
	uint8_t		channel = 0;

	Drive.MaxOverrun = MAX_ZERO_OVERRUN;
	Drive.Position = Drive.Stage = 0;
	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
	
	Ticks_1mS = Ticks_50uS = 0;

	configClock();
	configGpio();
	configTimer();
	LightOn
	
	Adc.ch = 2;
	Adc_Config();

	dutyInfo.s = dutyInfo.i = 0;
	Pwm.Calc = Pwm.Edge = 0;
	Pwm.Update = 1;

	enableInterrupts();
	waitPowerDelay(TIME_POWERDELAY);

	Drive.Enabled = 1;	//	motor enable
	
	//	default pos ? if PowerOn
	//
	mtCheckPowerOnStatus(1);	//	open max

	Timer.Led = Timer.Adc = Ticks_1mS;

	if( Drive.DeviceType == TYPE_MD12 )
		mainDeviceType();

	mtSetZeroPos(OFFSET_OVERRUN); 

	while (1)
	{
		if( Diff(Timer.Led, lightBlink) == 1 )
		{
			Timer.Led = Ticks_1mS;
			LightToggle
		}
		if( Diff(Timer.Origin, 1) == 1 )
		{
			Timer.Origin = Ticks_1mS;
			Drive.Origin = !MotorOrigin();
		}
		if( Diff(Timer.Adc, 10) == 1 )
		{
			Timer.Adc = Ticks_1mS;
			AdcService(channel);
		}
		if( Diff(Timer.PwmUpdate, 2000) == 1 )
		{
			Timer.PwmUpdate = Ticks_1mS;		
			Drive.Step = 0;
			Pwm.Update = 0;
		}
		else
			Pwm.Update = 1;
		
		if( Pwm.Calc == 1 )
		{
			Pwm.Calc = 0;
			mtPwmUpdate();

			Timer.PwmUpdate = Ticks_1mS;		
		}
#if !defined(_MOTOR_ISR_MODE_)
		if( Drive.MotorRun == 1 )
			motorCallback();
#endif
	}
}

