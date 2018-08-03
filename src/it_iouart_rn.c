#include "stdafx.h"

//#define _RINNAI_BOILER_
/*
	RINNAI - '9'
 */
#define _IO9_BUF_SIZE		48

#if defined (_RINNAI_BOILER_)
/*
 *	iouart3
 */
#if defined (_WOODANG_CNT_)

volatile uint8_t	_io9_buf[_IO9_BUF_SIZE];
volatile uint8_t	_io9_head = 0;
volatile uint8_t	___k_9 = 0;

volatile uint16_t	_u9SendWait = 0;
volatile uint8_t	_u9Idle = 0;
volatile uint8_t	_u9TxBuf[5];
volatile uint8_t	_u9_i1 = 0;
volatile uint8_t	_u9_i2 = 0;

volatile uint8_t	_u9packet[5];

//	tx
volatile uint8_t	_u9s = 0;
volatile uint8_t	_u9si = 0;

extern uint8_t	__rcCntl_Start[];
extern uint8_t	__rcCntl_Port[];
extern uint8_t	__iBitTable[];

uint8_t	_uBuf9[5+1];

uint8_t	rn_s = 0;
uint8_t	rn_i = 0;

uint8_t	rn_ready = 0;

uint8_t	iouart9_ReadyBuf(void)
{
	return rn_ready == 1 ? 1 : 0;
}

void	__timer1CiCb_Rn(void)
{
	uint8_t	i;

	if( _u9Idle != 0 )
		return;
		
	i = GPIO_ReadInputData(D_IOUART9_READ_PORT);
	i = i & D_IOUART9_READ_PIN;
	
	i = i==0 ? 1 : 0;
	if( rn_s == 0 )
	{
		if( i == 0 )
			return;
			
		___k_9 = 1;
		_io9_head = 0;
		rn_s = 1;
		rn_ready = 0;
	}
	else if( rn_s == 1 )
	{
		___k_9++;
		if( i != 0 )
			return;
			
		_io9_buf[_io9_head++] = ___k_9;
		if( _io9_head == _IO9_BUF_SIZE )
			_io9_head = 0;
		//	H -> L
		rn_s = 2;
		rn_i = 0;
		___k_9 = 1;
	}
	else if( rn_s == 2 )
	{
		if( i != 0 )
		{
			rn_s = 1;
			return;
		}
		rn_i++;
		if( rn_i > 200 )
		{
			if( _io9_head > 40 )
			{
				rn_ready = 1;
				rn_s = 0;
			}
		}
	}
}

void	iouart9_Open(void)
{
}

uint8_t	*iouart9_getBuffer(void)
{
	return _u9TxBuf;
}

uint8_t	*iouart9_getReadBuffer(void)
{
	return _uBuf9;
}

void	iouart9_Set_Packet(uint8_t wait)
{
	_u9SendWait = (wait + 400) + 0;
}

void	iouart9_Pkt_Start(void)
{
	_u9s = 0;
	_u9_i1 = 0;
	_u9_i2 = 0;
	_u9Idle = 1;	//	Busy
}

uint8_t	_iouart9_getCh(void)
{
	uint8_t	t, i, j;
	i = _u9_i2/8;
	j = _u9_i2%8;
	t = _u9TxBuf[i] & __iBitTable[j];
	_u9_i2++;
	if( t != 0 )
	{
		_u9_i1 = 8;
		_u9si = 4;
	}
	else
	{
		_u9_i1 = 4;
		_u9si = 8;
	}
	return t;
}

uint8_t	iouart9_Write(void)
{
	uint8_t	t;
	if( _u9s == 0 )
	{
		//	first ready
		_iouart9_getCh();
		D_IOUART9_HIGH;
		_u9s = 1;
	}
	else if( _u9s == 1 )
	{
		//	data high status
		_u9_i1--;
		if( _u9_i1 == 0 )
		{
			D_IOUART9_LOW;
			_u9s = 11;
		}
	}
	else if( _u9s == 11 )
	{
		//	data low status
		_u9si--;
		if( _u9si == 0 )
		{
			D_IOUART9_HIGH;
			_u9s = _u9_i2 >= 40 ? 9 : 2;
		}		
	}
	else if( _u9s == 9 )
	{
		_u9s = 10;
	}
	else if( _u9s == 10 )
	{
		//	end of packet
		_u9Idle = 0;
		D_IOUART9_LOW;
	}
	else if( _u9s == 2 )
	{
		_iouart9_getCh();
		_u9_i1--;
		_u9s = 1;
	}
	return 0;
}

uint8_t	rn_parity(void)
{
	uint8_t	i, j, k;
	//	1~4B
	for( k=0; k<4; k++ )
	{
		j = 0;
		for( i=0; i<8; i++ )
		{
			if( (__iBitTable[i] & _uBuf9[k]) != 0 )
				j++;
		}
		if( (j%2) == 0 )
			return 1;
	}

	for( k=0; k<8; k++ )
	{
		j = 0;
		for( i=0; i<5; i++ )
		{
			if( (__iBitTable[k] & _uBuf9[i]) != 0 )
				j++;
		}
		if( (j%2) == 1 )
			return 1;
	}
	return 0;	
}

void	rn_parity_make(void)
{
	uint8_t	*p = _u9TxBuf;
	uint8_t	i, j, k;
	//	1~4B
	for( k=0; k<4; k++ )
	{
		j = 0;
		for( i=0; i<7; i++ )
		{
			if( (__iBitTable[i] & p[k]) != 0 )
				j++;
		}
		if( (j%2) == 0 )
			p[k] |= 0x01;
	}

	p[4] = 0;
	for( k=0; k<8; k++ )
	{
		j = 0;
		for( i=0; i<4; i++ )
		{
			if( (__iBitTable[k] & p[i]) != 0 )
				j++;
		}
		if( (j%2) == 1 )
			p[4] |= __iBitTable[k];
	}	
}

uint8_t		iouart9_Ready(void)
{	
	uint8_t	i, j;
	uint8_t	_ubit9;
	uint8_t	_uByte9;	
	uint8_t	_uData9;
	
	j = 0;
	_ubit9 = _uData9 = _uByte9 = 0;
	while(1)
	{
		i = _io9_buf[j++];
		if( i >= 15 )
			_uData9 |= __iBitTable[_ubit9];
		_ubit9++;
		if( _ubit9 == 8 )
		{
			_ubit9 = 0;
			_uBuf9[_uByte9++] = _uData9;
			_uData9 = 0;
			if( _uByte9 == 5 )
			{
				rn_ready = 0;
				if( rn_parity() == 0 )
				{
					for( i=0; i<5; i++ )
						_u9packet[i] = _uBuf9[i];
					return 1;
				}
				return 0;// 
			}
		}
		if( j>=40 )
			return 0;
	}
	return 0;
}

#endif
#endif	//	RINNAI_BOILER
