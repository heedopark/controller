#include "stdafx.h"
/*
 *	iouart3
 */
#if defined (_WOODANG_CNT_)

#define NO_ENCR

#define D_IOUART3_HIGH		D_IO_HIGH(D_IOUART3_TX_PORT, D_IOUART3_TX_PIN)
#define D_IOUART3_LOW		D_IO_LOW(D_IOUART3_TX_PORT, D_IOUART3_TX_PIN)

volatile uint8_t	_io3_buf[_IO_BUF_SIZE];
volatile uint8_t	_io3_head = 0;
volatile uint8_t	_io3_tail = 0;
volatile uint8_t	___k_3 = 0;

volatile uint8_t	_u3SendWait = 0;
volatile uint8_t	_u3SendReady = 0;
volatile uint8_t	_u3Idle = 1;
volatile uint8_t	_u3TxBuf[4];
volatile uint8_t	_u3_i1 = 0;
volatile uint8_t	_u3_i2 = 0;

//	tx
volatile uint8_t	_u3s = 0;

extern uint8_t	__rcCntl_Start[];
extern uint8_t	__rcCntl_Port[];
extern uint8_t	__iBitTable[];

uint8_t	_ubit3 = 0;
uint8_t	_uByte3 = 0;
uint8_t	_uData3 = 0;
uint8_t	_uBuf3[8];

void	__timer1CiCb(void)
{	
	if( _u3Idle != 0 )
		return;

	if( ___k_3 == 0 )
		return;

	_io3_buf[_io3_head++] = ___k_3;
	if( _io3_head == _IO_BUF_SIZE )
		_io3_head = 0;
	___k_3 = 0;
}

void	iouart3_Open(void)
{
	/*
	GPIO_Init(D_IOUART3_TX_PORT, D_IOUART3_TX_PIN, D_IO_OUT_TRIGER);
	*/
}
/*
uint8_t	*iouart3_getBuffer(void)
{
	return _u3TxBuf;
}
*/
uint8_t	*iouart3_getReadBuffer(void)
{
	return _uBuf3;
}

uint8_t	iouart3_Get_WriteEnable(void)
{
	if( _u3SendReady == 1 && _u3SendWait == 0 )
	{
		_u3SendReady = 0;
		return 1;
	}
	return 0;
}

void	iouart3_Set_Packet(uint8_t wait)
{
	_u3SendReady = 1;
	_u3SendWait = wait;
}

void	iouart3_Pkt_Start(void)
{
	_u3Idle = 1;	//	Busy
	_u3s = 1;
	_u3SendReady = 0;
//	IOUART(DISABLE);
}
/*
void	iouart3_WritePacket(void)
{
	if( iouart3_Get_WriteEnable() == 1 )
		iouart3_Pkt_Start();
	else
		iouart3_Write();
}
*/

uint8_t	iouart3_Write(void)
{
	uint8_t	t;
	if( _u3_i1 != 0 )
	{
		_u3_i1 -= 1;
		D_IOUART3_LOW;
	}
	else
	{
		if( _u3s == 0 )
		{
			D_IOUART3_LOW;
			return 1;
		}			
		if( _u3s <= 21 )
		{
			if( __rcCntl_Start[_u3s-1] == 1 )
			{
				D_IOUART3_HIGH;
			}
			else
			{
				D_IOUART3_LOW;
			}
		}
		else if( _u3s <= 53 )	//	21+32
		{
			t = _u3TxBuf[(uint8_t)(_u3_i2>>3)];
			t = (uint8_t)(t & __iBitTable[(uint8_t)(_u3_i2&0x07)]);
			if( t != 0 )
				t = 1;
			_u3_i1 = __rcCntl_Port[t];
			_u3_i2 += 1;
			D_IOUART3_HIGH;
		}
		else if( _u3s <= 55 )	//	(21+32)+2
		{
			D_IOUART3_HIGH;
		}
		else
		{
			D_IOUART3_LOW;
			_u3s = _u3_i1 = _u3_i2 = _u3Idle = 0;	//	Not Busy
//			IOUART(ENABLE);
			return 2;
		}
		_u3s += 1;
	}	
	return 0;
}
/*
uint8_t	_io3_prev = 0;
void	iouart3Cb(void)
{
	if( _io3_prev == timer100usCount )
		return;

	_io3_prev = timer100usCount;
	if( _u3SendWait != 0 )
		_u3SendWait--;
	else
		iouart3_Write();
}
*/
volatile uint8_t	_is3 = 0;
uint8_t		iouart3_Ready(void)
{	
	uint8_t	i;
	uint8_t	j;
	j = _io3_tail;
	i = (_io3_buf[_io3_tail]+1)/2;
	_io3_tail += 1;
	if( _io3_tail == _IO_BUF_SIZE )
		_io3_tail = 0;

	if( _is3 == 0 )
	{
		if( i == 12 )
		{
			_ubit3 = _uByte3 = _uData3 = 0;
			_is3 = 1;
			_io3_buf[j] = 0;
		}
	}
	else if( _is3 == 1 )
	{
		_is3 = i == 8 || i == 9 || i == 10 ? 2 : 0;
	}
	else if( _is3 == 2 )
	{
		if( i > 5 )
			_uData3 |= __iBitTable[_ubit3];

		_ubit3++;
		if( _ubit3 == 8 )
		{
			_ubit3 = 0;
			_uBuf3[_uByte3++] = _uData3;
			if( _uByte3 == 4 )
			{
				_is3 = 0;
				return 1;
			}
			_uData3 = 0;
		}
	}
	return 0;
}

#ifdef NO_ENCR
//	
#else
CONST	uint8_t	_pkt_mask[] = 
{ 
	0,
	0x55, 0xaa, 0xc3, 0x7e, 0x96, 
	0x37, 0x82, 0x14, 0xb8, 0xdc, 
	0xe9, 0x61, 0x2d
};

CONST	uint8_t	_pkt_indexMask[] = 
{
	9, 11, 7, 1, 4, 
	8, 12, 10, 2, 3, 
	13, 6, 5
};
#endif

uint8_t	_p3_head = 0;
uint8_t	_p3_tail = 0;

volatile PKTINFO	_pkt;
volatile PKTINFO	_p3_buf[_PKT3_SIZE];

void	p3_push(PKTINFO *p)
{
	PKTINFO *i;
	i = &_p3_buf[_p3_head++];
	if( _p3_head == _PKT3_SIZE )
		_p3_head = 0;
	i->id = p->id;
	i->pos = p->pos;
	i->cmd = p->cmd;
}

PKTINFO *p3_pop(void)
{
	PKTINFO *i;
	i = &_p3_buf[_p3_tail++];
	if( _p3_tail == _PKT3_SIZE )
		_p3_tail = 0;
	return i;
}

uint8_t	p3_Ready(void)
{
	return _p3_head==_p3_tail ? 0 : 1;
}

uint8_t	p3_decoder(uint8_t *buf)
{
	uint8_t	r[4];
	uint8_t	i, j;
	uint8_t	cs = 0;
#ifdef NO_ENCR
	for( i=0; i<3; i++ )
	{
		cs += buf[i];
	}
	if( cs == buf[3] )
	{
		_pkt.id = buf[0] & 0x0f;
		_pkt.pos = buf[1];
		_pkt.cmd = buf[2] & 0x0f;
		return 0;
	}
#else
	j = buf[0]>>4;
	i = (buf[0] ^ _pkt_mask[j]) & 0xf0;
	buf[0] = i | (buf[0]&0x0f);
	for( i=0; i<3; i++ )
	{
		r[i] = buf[i] ^ _pkt_mask[j];
		j++;
		if( j==_IO_PKT_SIZE )
			j = 0;
		cs += r[i];
	}
	r[3] = buf[3] ^ _pkt_mask[j];
	if( cs == r[3] )
	{
		_pkt.id = r[0] & 0x0f;
		_pkt.pos = r[1];
		_pkt.cmd = r[2] & 0x0f;
		return 0;
	}
#endif
	return 1;
}

#ifdef NO_ENCR
#else
uint8_t	_pkt_mi = 0;

uint8_t	pkt_get_mask(void)
{
	uint8_t i;
	i = _pkt_indexMask[_pkt_mi++];
	if( _pkt_mi==_IO_PKT_SIZE )
		_pkt_mi = 0;
	return i;
}
#endif

uint8_t	_pkt_r[4];
extern uint8_t	_plc_rc;

uint8_t	p3_write(uint8_t id, uint8_t pos, uint8_t cmd)
{
	uint8_t	cs = 0;
	uint8_t	i, j, j2;
#ifdef NO_ENCR
	_pkt_r[0] = id & 0x0f;
	_pkt_r[1] = pos;
	_pkt_r[2] = cmd & 0x0f;
	for( i=0; i<3; i++ )
		cs += _pkt_r[i];
		
	_pkt_r[3] = cs;
#else
	j = pkt_get_mask();
	j2 = j;
	_pkt_r[0] = (j<<4) | id;
	_pkt_r[1] = pos;
	_pkt_r[2] = (j+1) & 0x0f;
	_pkt_r[2] = (_pkt_r[2]<<4) | cmd;
	_pkt_r[2] &= 0x7f;
	for( i=0; i<3; i++ )
		cs += _pkt_r[i];
	_pkt_r[3] = cs;
	for( i=0; i<4; i++ )
	{
		_pkt_r[i] = _pkt_r[i] ^ _pkt_mask[j];
		j++;
		if( j==_IO_PKT_SIZE )
			j = 0;
	}
	_pkt_r[0] = (j2<<4) | (_pkt_r[0]&0x0f);
#endif	
	for( i=0; i<4; i++ )
		_u3TxBuf[i] = _pkt_r[i];
	//	1000us
	/*
	iouart3_Set_Packet(10);
	*/
	//	10ms
	iouart3_Set_Packet(100);
	
	//	clear status
	_plc_rc = 0;
	return 0;
}

#endif
