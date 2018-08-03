#include "stdafx.h"

#if	0
CONST	uint8_t	__CharTable[] = "0123456789ABCDEF";
uint8_t	_i2aBuf[6];

uint8_t	*_i2a(uint16_t i)
{
	uint8_t	j, k, n;
	uint8_t	len=0;
	while(1)
	{
		k = i%10;
		i = i/10;
		_i2aBuf[len] = '0' + k;
		len++;
		if( i==0 )
			break;
	}
	for( j=0; j<len/2; j++ )
	{
		n = len-1-j;
		k = _i2aBuf[n];
		_i2aBuf[n] = _i2aBuf[j];
		_i2aBuf[j] = k;
	}
	_i2aBuf[len] = 0;
	return _i2aBuf;
}

uint8_t	_strlen(uint8_t *p)
{
	uint8_t	i=0;
	while(1)
	{
		if( *p == 0 )
			return i;
		i++;
		p++;
	}
}

void	disp_int(uint8_t ch)
{
	uint8_t	buf[3];
	uint8_t i, j, k;

	j = 0;
	i = ch / 100;
	if( i != 0 )
	{
		buf[0] = '0' + i;
		DISP(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		DISP(buf, 1);
	}	
	k = ch % 100;
	i = k / 10; 
	if( i != 0 )
	{
		buf[0] = '0' + i;
		DISP(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		DISP(buf, 1);
	}
	i = ch % 10;
	buf[0] = '0' + i;
	DISP(buf, 1);
	DISP(" ", 1);
}

void	disp_int16(uint16_t ch)
{
	uint8_t	buf[3];
	uint8_t i, j;
	uint16_t	k;

	j = 0;
	i = ch / 10000;
	if( i != 0 )
	{
		buf[0] = '0' + i;
		DISP(buf, 1);
		j = 1;
	}
	k = ch % 10000;
	i = k / 1000;
	if( i != 0 )
	{
		buf[0] = '0' + i;
		DISP(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		DISP(buf, 1);
	}	
	k = ch % 1000;
	i = k / 100;
	if( i != 0 )
	{
		buf[0] = '0' + i;
		DISP(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		DISP(buf, 1);
	}	
	k = ch % 100;
	i = k / 10; 
	if( i != 0 )
	{
		buf[0] = '0' + i;
		DISP(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		DISP(buf, 1);
	}
	i = ch % 10;
	buf[0] = '0' + i;
	DISP(buf, 1);
	DISP(" ", 1);
}

void	disp_char(uint8_t ch)
{
	uint8_t	buf[3];
	uint8_t i, j;
	uint8_t s = 0;
	
	i = (ch>>4) & 0x0f;
	if( i == 0 )
		s = 1;
	buf[0] = __CharTable[i];

	i = ch & 0x0f;
	buf[1] = __CharTable[i];
	buf[2] = ' ';
	if( s == 1 )
		DISP(&buf[1], 2);
	else
		DISP(buf, 3);
}
#else
void	disp_char(uint8_t ch)
{
}
#endif

/*
void	systemClockReset(void)
{
#if defined (_RC_WD_)
	//	NOT USED
#else
    CLK->ICKR = CLK_ICKR_RESET_VALUE;
    CLK->ECKR = CLK_ECKR_RESET_VALUE;
    CLK->SWR  = CLK_SWR_RESET_VALUE;
    CLK->SWCR = CLK_SWCR_RESET_VALUE;
    CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
    CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
    CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
    CLK->CSSR = CLK_CSSR_RESET_VALUE;
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
    {}
    CLK->CCOR = CLK_CCOR_RESET_VALUE;
    CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
    CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
#endif
}
*/
void	clockConfig(void)
{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)
	/*	High speed external clock prescaler: 1
	*/
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	
	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
		;

#elif defined (_RC_DW_VENT_)
	/*	High speed external clock prescaler: 1
	*/
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	
	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
		;

#else
//	CLK_DeInit();
//	systemClockReset();

	//	CLK_PRESCALER_HSIDIV1 is 0
	//CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
    //CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1;
	//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	CLK_HSICmd(ENABLE);
#endif
}
