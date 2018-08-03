#ifndef _STDAFX2_H_
#define _STDAFX2_H_

#define TYPE_MD24			1
#define TYPE_MD12			2

#define TYPE_1Phase			0
#define TYPE_12Phase		1
#define TYPE_2Phase			2

#define _MT_CLOSE_			1		//	Drive.NormalOpen
#define _MT_OPEN_			(8-1)

#define TIME_POWERDELAY		499

#if defined (_CNT_CONV_)
#error
#include "stm8s_conf.h"
#include "stm8s.h"

#endif

#if defined(MOTOR_CPU)

#include "stm8s_conf.h"
#include "stm8s.h"

//	for PWM INPUT MODE
#define _DEBUG_TIM1_
#define _PWM_TIMER_MODE_
/*
#define _DEBUG_MOTOR_WATCH_
//*/
#define _MOTOR_ISR_MODE_

//	MOTOR_EXCITATION TYPE
#define EXCITATION_TYPE		TYPE_12Phase

#define MAX_ADC_BUF			4	//	Resize for RAM Size
#define MAX_DUTYBUFFER		32
#define MAX_MOTOR_POS		200

#endif	//	MOTOR_CPU

typedef struct tagIoDef
{
	GPIO_TypeDef	*port;
	GPIO_Mode_TypeDef	pin;
}	IODEF, *LPIODEF;

typedef enum 
{ 
	nMotorClose, 
	nMotorOpen 
} 	MOTOR_DIR;

typedef struct tagDutyInfo
{
	uint8_t b[MAX_DUTYBUFFER];
	uint8_t i;
	uint8_t n;
	uint16_t s;
} 	DUTYINFO, *LPDUTYINFO;

#define IODEF_RESET(io,_port,_pin)	IO_##io.port = GPIO##_port;\
									IO_##io.pin = GPIO_PIN_##_pin;
#define GPIO_SET(portDef,type)		GPIO_Init(\
										IO_##portDef.port,\
										IO_##portDef.pin, type\
										);

typedef struct tagDrive 
{
	uint8_t Enabled : 1;
//	uint8_t Run0 : 1;
	uint8_t LastOrigin : 1; 
//	uint8_t Dir	: 1;
	uint8_t Origin : 1;
	uint8_t Run;
	uint16_t Position;			// Current position (pulse)
	uint16_t Target;			// Target Position  (pulse)
	uint16_t Overrun;			// Origin cal overrun (pulse)
	uint8_t Overrun2;			// Valve hysteresis calibration overrun 
	uint16_t ZeroOffset;
	uint8_t Phase;				// motor coil phase
	uint16_t  MaxOverrun;	
	uint16_t  ORGPosition;		// Hall IC origin position
	uint8_t Interval;			// Drive interval (mS)
	uint8_t Ticks;				
	uint8_t	MotorRun;
	uint8_t Step;
	uint8_t PreStep;
	uint8_t Stage;
	uint8_t DeviceType;		//	1, 2, 3
} 	DRIVE, *LPDRIVE;

typedef struct tagPwm 
{
#if defined(_DEBUG_TIME_ELAPSED_)
	uint16_t T1_1mS;	
//	uint16_t T2_1mS;
	uint16_t diff;
#endif
	uint8_t Edge : 1;
	uint8_t Update : 1;
	uint8_t Calc : 1;
	uint8_t Overflow;
	uint16_t T1;
	uint16_t T2;
	uint16_t sT;
	uint16_t Duty;
	uint16_t Duty100;
	uint16_t _t1, _t2;
} 	PWM, *LPPWM;

typedef struct tagTimer
{
	uint16_t Led;
/*	uint16_t Motor;*/
	uint16_t Adc;
	uint16_t PwmUpdate;
	uint16_t Origin;
} 	TIMER, *LPTIMER;

typedef struct tagAdcBuf
{
	uint16_t b[MAX_ADC_BUF];
	uint8_t avg;
#if defined (_DEBUG_ADC_SUM_)
	uint8_t i;
#endif
}	ADCBUF, *LPADCBUF;


#if defined (_DEBUG_MOTOR_WATCH_)
#define MAX_MOTORWATCH		16

typedef struct tagMotorWatch
{
	uint16_t step[MAX_MOTORWATCH];
	uint8_t i;
} 	MOTORWATCH, *LPMOTORWATCH;

void	debug_motor_watch(uint16_t tPos);

#else
#define debug_motor_watch
#endif	//	_DEBUG_MOTOR_WATCH_

extern DRIVE Drive;

//
//	MOTOR
extern IODEF IO_X1;
extern IODEF IO_X2;
extern IODEF IO_Y1;
extern IODEF IO_Y2;

extern IODEF IO_LED;

extern IODEF IO_ORG;
extern IODEF IO_ADJ;
extern IODEF IO_SEN;
extern IODEF IO_POWER;
extern IODEF IO_MOD;
extern IODEF IO_BAT;
extern IODEF IO_BOOST;
extern IODEF IO_CHARGE;
	
#define _H_X1			GPIO_WriteHigh(IO_X1.port, IO_X1.pin);	
#define _H_X2			GPIO_WriteHigh(IO_X2.port, IO_X2.pin);	
#define _H_Y1			GPIO_WriteHigh(IO_Y1.port, IO_Y1.pin);	
#define _H_Y2			GPIO_WriteHigh(IO_Y2.port, IO_Y2.pin);	
#define _L_X1			GPIO_WriteLow(IO_X1.port, IO_X1.pin);	
#define _L_X2			GPIO_WriteLow(IO_X2.port, IO_X2.pin);	
#define _L_Y1			GPIO_WriteLow(IO_Y1.port, IO_Y1.pin);	
#define _L_Y2			GPIO_WriteLow(IO_Y2.port, IO_Y2.pin);

//
//	LED
#define LightOn			GPIO_WriteLow(IO_LED.port, IO_LED.pin);
#define LightOff		GPIO_WriteHigh(IO_LED.port, IO_LED.pin);
#define LightToggle 	GPIO_WriteReverse(IO_LED.port, IO_LED.pin);

#define MotorOrigin()	GPIO_ReadInputPin(IO_ORG.port, IO_ORG.pin);
#define ModeSelect()	GPIO_ReadInputPin(IO_MOD.port, IO_MOD.pin)

//
//	TIMER
//
extern uint8_t Ticks_50uS;
extern uint16_t Ticks_1mS;


//
//	FUNCTION
//
uint8_t  Diff(uint16_t time, uint16_t diff);
uint16_t CPulse(uint8_t step);

void _motorRunStep(uint8_t phase);
void motorDriveStop(void);
void motorStep2Close(void);
void motorStep2Open(void);

void MotorStepOpen(void);
void MotorStepClose(void);
void MotorSetZero(uint8_t offset);

void waitPowerDelay(uint16_t time);

//
//	SYSTEM
//
void configClock(void);
void configTimer(void);
void configGpio(void);

#ifdef USE_FULL_ASSER T
void assert_failed(uint8_t* file, uint32_t line);
#endif

#define	_MOTOR_RUN_STEP_	if ( Drive.Run && Drive.Enabled ) { _motorRunStep(Drive.Phase%8); }

#if defined(_DEBUG_TIME_ELAPSED_)
void debug_motor_elapsed(void);
#else
#define debug_motor_elapsed
#endif

#endif 	//	_STDAFX__H

