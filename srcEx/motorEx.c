#include "stdafx2.h"

void	motorDriveMove1Phase(uint8_t phase)
{
	Drive.Phase = (Drive.Phase + phase) % 8;
	switch(Drive.Phase)
	{
#if (EXCITATION_TYPE == TYPE_2Phase)
		case 0: case 1: _H_X1 _L_X2 _H_Y1 _L_Y2 break;		
		case 2: case 3: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
		case 4: case 5: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
		case 6: case 7: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
#endif
#if (EXCITATION_TYPE == TYPE_1Phase)
		case 0: case 1: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
		case 2: case 3: _L_X1 _L_X2 _H_Y1 _L_Y2 break;
		case 4: case 5: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
		case 6: case 7: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
#endif
#if (EXCITATION_TYPE == TYPE_12Phase)
		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
#endif
	}
#if defined(_DEBUG_TIME_ELAPSED_)
	debug_motor_elapsed();
#endif
}

void motorDriveStop(void)
{
	_L_X1 _L_X2 _L_Y1 _L_Y2
	Drive.Run = Drive.Overrun = 0;
}

void	MotorStepOpen(void)
{
//	// Find hall ic position
//	if( Drive.Origin ) 
//	{			
//		Drive.ORGPosition = Drive.Position;
//		//	TBD
//		Drive.LastOrigin = TRUE;
//	}
//	else
//	{
//		//	TBD
//		if ( Drive.LastOrigin )
//		{
//			Drive.MaxOverrun = Drive.ORGPosition - HALL_THRESHOLD;
//			if( Drive.MaxOverrun > MAX_ZERO_OVERRUN )
//				Drive.MaxOverrun = MAX_ZERO_OVERRUN;
//		}
//	}
	Drive.Position++;
	motorDriveMove1Phase(_MT_OPEN_); 
}

void	MotorStepClose(void)
{
	if( Drive.Position == 0 ) 
	{
		//	TBD
		//	Origin Not passed
		//		It maybe opened 
		Drive.Target = 0;
		motorDriveStop();	
		return;
	}
	Drive.Position--;
	motorDriveMove1Phase(_MT_CLOSE_); 
}

#if defined(_DEBUG_TIME_ELAPSED_)
void debug_motor_elapsed(void)
{
	if ( Drive.Run == 1 )
		Pwm.T1_1mS = Ticks_1mS;

	if ( Drive.Run == 0 )
		Pwm.diff = Ticks_1mS - Pwm.T1_1mS;
}
#endif	//	_DEBUG_TIME_ELAPSED_

#if defined (_DEBUG_MOTOR_WATCH_)
MOTORWATCH _mt;

void	debug_motor_watch(uint16_t tPos)
{
	_mt.step[_mt.i] = tPos;
	_mt.i = (_mt.i + 1) % MAX_MOTORWATCH;
	_mt.step[_mt.i] = 0;
}
#endif	//	_DEBUG_MOTOR_WATCH_	


