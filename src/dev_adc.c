#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)
#include "stdafx.h"

CONST	uint16_t	adcTbl[] =
//	1K Table
{
	2962,
	2932, 2894, 2857, 2818, 2779,	//+3
	2740, 2700, 2661, 2620, 2580,	//+8
	2540, 2499, 2458, 2416, 2375,	//+13
	2335, 2293, 2252, 2210, 2170,	//+18
	2129, 2089, 2048, 2008, 1968,	//+23
	1928, 1888, 1850, 1811, 1772,	//+28
	1734, 1697, 1660, 1623, 1587,	//+33
	1551, 1516, 1481, 1448, 1415,	//+38
	1380
};
/*
//	10K Table
{
2634,	2518,	2408,	2304,	2205,	// 	2 
2111,	2022,	1935,	1855,	1777, 	//	7 
1703, 	1630,	1564, 	1499, 	1438, 	//	12
1381, 	1324, 	1271, 	1222, 	1173, 	//	17
1127, 	1082, 	1040, 	1002, 	961, 	//	22
926, 	891, 	856, 	825, 	793, 	//	27
762, 	734, 	708, 	681, 	656, 	//	32
633, 	609, 	587, 	568, 	546, 	//	37
527, 	508, 	492, 	473, 	
};
*/
//#define DW_2	

#if defined (_RC_DW_)
/*
 *	Loop1 - Thermal
 *		2660(10d)		1660(35d)
 *		135~60
 *	Loop2 - Diff(sensor)
 *		200~100=40~20
 *	Loop3 - Diff(inter)
 *		2500(14d)		1600(36d)
 *		0~45
 */
volatile uint16_t	_adcBuf2[12];
uint16_t	_dwi16 = 0;
uint16_t	__ad[4];
#endif
volatile uint16_t	_adcBuf[12];
volatile uint8_t		_adci = 0;
//uint16_t	_as = 0;

#define _ADC_GET(i16)	{\
					ADC_SoftwareStartConv(ADC1);\
					while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET)\
					;\
					i16 = ADC_GetConversionValue(ADC1);\
					}
uint16_t	__di;
uint16_t	_adcGet(void)
{
	uint16_t	i16;
	uint8_t	min, max;
	uint8_t	i, k;
#if defined (_RC_DW_)
//	uint16_t	i16d;
	uint16_t	diff;
	
	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
	_ADC_GET(i16);
	ADC_ChannelCmd(ADC1, ADC_Channel_3, DISABLE);
	_adcBuf[_adci] = i16; 
	
	k = min = max = 0;
	for( i=1; i<12; i++ )
	{
		if( _adcBuf[i] < _adcBuf[min] )
			min = i;
		if( _adcBuf[i] > _adcBuf[max] )
			max = i;
	}
	i16 = 0;
	for( i=0; i<12; i++ )
	{
		if( i==min || i==max )
			continue;
		i16 += _adcBuf[i];
		k++;
	}
	i16 = i16/k;

	ADC_ChannelCmd(ADC1, ADC_Channel_20, ENABLE);
	_ADC_GET(_dwi16);
	ADC_ChannelCmd(ADC1, ADC_Channel_20, DISABLE);
	_adcBuf2[_adci] = _dwi16;
	
	_adci++;
	if( _adci == 12 )
		_adci = 0;

	k = min = max = 0;
	for( i=1; i<12; i++ )
	{
		if( _adcBuf2[i] < _adcBuf2[min] )
			min = i;
		if( _adcBuf2[i] > _adcBuf2[max] )
			max = i;
	}
	_dwi16 = 0;
	for( i=0; i<12; i++ )
	{
		if( i==min || i==max )
			continue;
		_dwi16 += _adcBuf2[i];
		k++;
	}
	_dwi16 = _dwi16/k;
	__ad[0] = _dwi16;
	__ad[1] = i16;
	__ad[2] = 0;
	if( _dwi16 < i16 )
	{
		//	Therm(Out) > Therm(In)
		//		normally situation
//__di = -_dwi16 + i16;
//#define _DW_T	-10	//26
		diff = i16 - _dwi16;
		if( diff > 100 )	__di = 20 + (diff - 100) / 5;
		else
			__di = 20;
			
		if( _dwi16 < 2500 )
		{
			if( _dwi16 > 1600 )
				__di += 45 - (_dwi16 - 1600) / 20;
			else
				__di += 45;
		}
		
		if( i16 > 2660 )		__di += 135;
		else if( i16 > 1660 )	__di += 60 + (i16 - 1660) / 14;
		else
			__di += 60;
			
		return i16 + __di;
	}
	return	i16 + 0;
#else
	_ADC_GET(i16);
	_adci++;
	if( _adci == 12 )
		_adci = 0;
	_adcBuf[_adci] = i16; 
		
	k = min = max = 0;
	for( i=1; i<12; i++ )
	{
		if( _adcBuf[i] < _adcBuf[min] )
			min = i;
		if( _adcBuf[i] > _adcBuf[max] )
			max = i;
	}
	i16 = 0;
	for( i=0; i<12; i++ )
	{
		if( i==min || i==max )
			continue;
		i16 += _adcBuf[i];
		k++;
	}
	i16 = i16/k;
	return i16;
#endif
}

#if defined (_RC_DW_)
//volatile uint8_t	_add2[12];
#endif
volatile uint8_t	_add[12];
volatile uint8_t _addi = 0;

uint8_t	adcGet(uint8_t mode)
{
	uint8_t	i, j, k, m;
	uint8_t	c;
	uint16_t i16;
	
	i16 = _adcGet();
	//+3
	if( i16 > 2932 )
		i16 = 2932;
	for( i=0; i<42; i++ )
	{
		if( i16 >= adcTbl[i] )
		{
			if( i==0 )
			{
				i = (i+2) * 2;
				goto Exit;
			}

			m = adcTbl[i-1] - adcTbl[i];
			m = m/4;
			j = adcTbl[i-1] - i16;
			k = adcTbl[i] - i16;
			if( j > k )
			{
				//	lower
				if( m > k )
				{
					i = (i+2) * 2;
					goto Exit;
				}
				i = (i+2-1) * 2 + 1;
				goto Exit;
			}
			else
			{
				//	upper
				if( m  > j )
				{
					i = (i+2-1) * 2;
					goto Exit;
				}
				i = (i+2-1) * 2 + 1;
				goto Exit;
			}
		}
	}
	i = (i+2) * 2;
Exit:	
	if( mode == 1 )
		return i;
		
	_add[_addi++] = i;
	if( _addi == 12 )
		_addi = 0;

	j = 0;	//	min
	m = 0;	//	max
	for( i=1; i<12; i++ )
	{
		if( _add[i] < _add[j] )
			j = i;
		if( _add[i] > _add[m] )
			m = i;
	}
	k = 0;
	i16 = 0;
	for( i=0; i<12; i++ )
	{
		if( i==j || i==m )
			continue;
		i16 += _add[i];
		k++;
	}
	i16 = i16/k;
#if defined (_RC_DR_)	
	if( (i16%2) == 1 )
		i16--;
#endif
	return i16;
}

void	systemADC(void)
{
	uint8_t	i;
	//uint16_t	i16;
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

#if defined (_RC_DW_)
	ADC_Init(
		ADC1, 
		ADC_ConversionMode_Single, 
		ADC_Resolution_12Bit, 
		ADC_Prescaler_2
		);
	ADC_SamplingTimeConfig(
		ADC1, 
		ADC_Group_SlowChannels, 
		ADC_SamplingTime_384Cycles
		);
	/* Enable ADC1 
	*/
	ADC_Cmd(ADC1, ENABLE);
#else
	ADC_Init(
		ADC1, 
		ADC_ConversionMode_Continuous, 
		ADC_Resolution_12Bit, 
		ADC_Prescaler_2
		);
	ADC_SamplingTimeConfig(
		ADC1, 
		ADC_Group_SlowChannels, 
		ADC_SamplingTime_384Cycles
		);
	/* Enable ADC1 
	*/
	ADC_Cmd(ADC1, ENABLE);
	/* Enable ADC1 Channel 3
	*/
	ADC_ChannelCmd(ADC1, ADC_Channel_3, ENABLE);
#endif

	/* Enable End of conversion ADC1 Interrupt 
	*/
	//ADC_ITConfig(ADC1, ADC_IT_EOC, ENABLE);
	
	/* Start ADC1 Conversion using Software trigger
	*/
	//ADC_SoftwareStartConv(ADC1);
/*	
	for( i=0; i<9; i++ )
	{
		_ADC_GET(i16);
		_adcBuf[i] = i16; 
	}
*/
}

#endif
