#include "stdafx.h"
#if defined (_WOODANG_CNT_)
#include "mtDef.h"
#endif

extern void	lcd_disp_n(uint8_t pos, uint8_t n);
/*
 *
 */
//uint8_t	_mtCntl = 0;
//uint8_t	_mtCntlCount = 0;
uint8_t	__f[8];
uint8_t	_fs = 0;
uint8_t	_fs2 = 0;

/*
void	mtCntl(uint8_t cmd, uint8_t offset)
{
	if( _mtCntl == 0 )
	{
		//	open
		//	set command @stop
		//	20ms		
		_mtCntlCount = 10;
	}
	else if( _mtCntl == 1 )
	{
		_mtCntlCount--;
		if( _mtCntlCount == 0 )
		{
			//	move
			_mtCntl = 2;
		}
	}
	else if( _mtCntl == 2 )
	{
		//	
	}

}

void	dispCntl(uint8_t mode)
{
	if( mode == 1 )
	{
		//	display 2-wire
	}
	else if( mode == 2 )
	{
		//	display valve
	}
	else if( mode == 3 )
	{
		//	display 485a
	}
	else if( mode == 4 )
	{
		//	display 485b
	}
}

void	errCntl(uint8_t mode)
{
	//	232 packet ready - 500ms toggle
	//	485 packet ready - 
	//	rc error - 250ms toggle
}
*/

/*
 *	factory.c
 */	
#if defined (_WOODANG_CNT_)
#if defined (_RINNAI_BOILER_)
extern uint8_t	_io9_head, _io9_tail;
#endif
#if defined (_DAEWOO_BOILER_)
extern uint8_t	_io9d_head, _io9d_tail;
#endif
uint8_t	__ff[2];
#endif

void	factory2wire(void)
{
	uint8_t	*p;
	uint8_t	i;
	if( _io_head != _io_tail )
	{
		i = iouart_Ready();
		if( i==1 )
		{
			p = iouart_getBuffer();
			p[0] = 0x0;
			p[1] = 0x1;
			p[2] = 0x2;
			p[3] = 0x3;
			p[4] = 0x4;
			p[5] = 0x5;
			p[6] = 0x6;
			p[7] = 0x15;
			iouart_Set_Packet(0);
			iouart_Pkt_Start();
		}
	}
#if defined (_WOODANG_CNT_)
#if defined (_RINNAI_BOILER_)
	//	rinnai
	while( 1 )
	{
		if( _io9_head != 0 )
		{
			i++;
			
			_io9_head = 0;
			{
				__ff[0] = __timer1s;
				__ff[1]++;
				if( __ff[1] >= 10 )
				{
					__ff[1] = 0;
					D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
				}
			}			
		}
		else
			break;
	}	
#endif
#if defined (_DAEWOO_BOILER_)
	//	rinnai
	while( 1 )
	{
		if( _io9d_head != 0 )
		{
			i++;
			
			_io9d_head = 0;
			{
				__ff[0] = __timer1s;
				__ff[1]++;
				if( __ff[1] >= 10 )
				{
					__ff[1] = 0;
					D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
				}
			}			
		}
		else
			break;
	}	
#endif
#endif
}

#if defined (_WOODANG_CNT_)
						
extern void		relayCntl(uint8_t i);

#define MT_IN_TEST(b,bp,m,mp)	\
					i = MT_READ(b, bp);\
					__f[3] |= i==0 ? 0 : 1;

#define MT_IN_TEST0(b,bp,m,mp)	\
					i = MT_READ(b, bp);\
					__f[3] |= i==0 ? 0 : 1;\
					if( i!=0 )	{\
						D_IO_HIGH(m, mp);\
						__func();\
					}

uint8_t	_fa = 0;
uint8_t	_fb = 0;
uint8_t	_fc = 0;

void	__func(void)
{
	_fs = 2;
	_fc = 10;
}

void	__func1(void)
{
	_fs = 1;
}

void	factoryMtOff(void)
{
	D_IO_LOW(IO_M1, IO_M1p);
	D_IO_LOW(IO_M2, IO_M2p);
	D_IO_LOW(IO_M3, IO_M3p);
	D_IO_LOW(IO_M4, IO_M4p);
	D_IO_LOW(IO_M5, IO_M5p);
	D_IO_LOW(IO_M6, IO_M6p);
	D_IO_LOW(IO_M7, IO_M7p);
	D_IO_LOW(IO_M8, IO_M8p);
	
	D_IO_LOW(IO_MV, IO_V1p);
	D_IO_LOW(IO_MV, IO_V2p);
	D_IO_LOW(IO_MV, IO_V3p);
	D_IO_LOW(IO_MV, IO_V4p);
}

void	factoryMtOn(void)
{
	D_IO_HIGH(IO_M1, IO_M1p);
	D_IO_HIGH(IO_M2, IO_M2p);
	D_IO_HIGH(IO_M3, IO_M3p);
	D_IO_HIGH(IO_M4, IO_M4p);
	D_IO_HIGH(IO_M5, IO_M5p);
	D_IO_HIGH(IO_M6, IO_M6p);
	D_IO_HIGH(IO_M7, IO_M7p);
	D_IO_HIGH(IO_M8, IO_M8p);
	
	D_IO_LOW(IO_MV, IO_V1p);
	D_IO_LOW(IO_MV, IO_V2p);
	D_IO_LOW(IO_MV, IO_V3p);
	D_IO_LOW(IO_MV, IO_V4p);
}

void	factoryMtSetLow(void)
{
	D_IO_HIGH(IO_M1, IO_M1p);
	D_IO_HIGH(IO_M2, IO_M2p);
	D_IO_HIGH(IO_M3, IO_M3p);
	D_IO_HIGH(IO_M4, IO_M4p);
}

void	factoryMtSetHigh(void)
{
	D_IO_HIGH(IO_M5, IO_M5p);
	D_IO_HIGH(IO_M6, IO_M6p);
	D_IO_HIGH(IO_M7, IO_M7p);
	D_IO_HIGH(IO_M8, IO_M8p);
}

uint8_t	_mi = 0;
uint8_t	_aa = 0, _bb = 0;

void	factoryCntl(void)
{
	uint8_t	i, a, b;
	uint8_t	ch;
	uint8_t j;
	/*
	 *	CNV - CNTL
	 */
	if( _fs == 0 )
	{
		_fs = 1;
		mt_clear(0);
		__f[0] = __timer1s;
	}
	else if( _fs == 4 )
	{
		i = 0;
	}
	else if( _fs == 1 )
	{
		if( __f[0] != (__timer100ms/2) )//&& __f[3] != 0 )
		{
			__f[0] = __timer100ms/2;
			//if( __f[1] == 0 )
			{
				_mi++;
				if( _mi == 33 )
					_mi = 1;
			//	__f[1] = 1;
//				__f[0] = __timer100ms%4;
				_fa++;
				
				factoryMtOff();

				i = _fa % /*8*/4;
j = i;
_aa++;
a = _aa%8;
b = _aa%4;

D_IO_HIGH(IO_MV, IO_V1p);	
D_IO_HIGH(IO_MV, IO_V2p);	
D_IO_HIGH(IO_MV, IO_V3p);	
D_IO_HIGH(IO_MV, IO_V4p);	

if( a == 0 ){	D_IO_HIGH(IO_M1, IO_M1p);}
if( a == 1 ){	D_IO_HIGH(IO_M2, IO_M2p);}
if( a == 2 ){	D_IO_HIGH(IO_M3, IO_M3p);}
if( a == 3 ){	D_IO_HIGH(IO_M4, IO_M4p);}
if( a == 4 ){	D_IO_HIGH(IO_M5, IO_M5p);}
if( a == 5 ){	D_IO_HIGH(IO_M6, IO_M6p);}
if( a == 6 ){	D_IO_HIGH(IO_M7, IO_M7p);}
if( a == 7 ){	D_IO_HIGH(IO_M8, IO_M8p);}
				relayCntl((_fa%2));
			}
		}
		//else
		//	__f[1] = 0;

		__f[3] = 0;
//		
/*
*/
		i = MT_READ(IO_B1, IO_B1p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B2, IO_B2p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B3, IO_B3p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B4, IO_B4p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B5, IO_B5p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B6, IO_B6p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B7, IO_B7p);
		if( i == 0 )	__func();
		i = MT_READ(IO_B8, IO_B8p);
		if( i == 0 )	__func();
	}
	else if( _fs == 2 )
	{
		if( __f[0] != (__timer100ms) )//&& __f[3] != 0 )
		{
			if( __f[1] == 0 )
			{
				__f[1] = 1;
				__f[0] = __timer100ms%8;

				__f[3] = 0;
				factoryMtOff();
		
				i = MT_READ(IO_B1, IO_B1p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V1p);	
					factoryMtSetLow();
				}
				i = MT_READ(IO_B2, IO_B2p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V2p);	
					factoryMtSetLow();
				}
				i = MT_READ(IO_B3, IO_B3p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V3p);	
					factoryMtSetLow();
				}
				i = MT_READ(IO_B4, IO_B4p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V4p);	
					factoryMtSetLow();
				}
				i = MT_READ(IO_B5, IO_B5p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V4p);	
					factoryMtSetHigh();
				}
				i = MT_READ(IO_B6, IO_B6p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V3p);	
					factoryMtSetHigh();
				}
				i = MT_READ(IO_B7, IO_B7p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V2p);	
					factoryMtSetHigh();
				}
				i = MT_READ(IO_B8, IO_B8p);
				if( i == 1 )
				{
					D_IO_HIGH(IO_MV, IO_V1p);	
					factoryMtSetHigh();
				}
				_fc--;
				if( _fc == 0 )
					_fs = 1;
			}
		}	
		else
			__f[1] = 0;
	}

	factory2wire();
	if( (__timer100ms%2) == 0 )
		uart3_tx_put("A", 1);
			
	if( uart3_Ready() == 1 )
	{
		ch = uart3_get();
		if( ch == 'A' )
		{
			__f[4] = __timer100ms;
			_fs2 = 2;
#if defined (_RC_WD_)
			D_IO_LOW(D_LED_PORT, D_LED_PIN);
#endif
		}			
	}
	if( uart1_Ready() == 1 )
	{
		ch = uart1_get();
		if( ch == 'B' )	
		{	
#if defined (_RC_WD_)
			D_IO_HIGH(D_LED_PORT, D_LED_PIN);	
#endif
		}
	}
	if( _fs2 == 2 )
	{
		if( __f[4] != __timer100ms ){	_fs2 = 3;	}		
	}
	else if( _fs2 == 3 )
	{
		uart3_tx_put("B", 1);
		_fs2 = 4;
	}
	else if( _fs2 == 4 )
	{
	}
/*
	if( (__timer100ms%2) == 0 )
		uart1_tx_put("A", 1);
			
	if( uart3_Ready() == 1 )
	{
		ch = uart3_get();
		if( ch == 'A' )
		{
			__f[4] = __timer100ms;
			_fs2 = 2;
			D_IO_LOW(D_LED_PORT, D_LED_PIN);
		}			
	}
	if( uart1_Ready() == 1 )
	{
		ch = uart1_get();
		if( ch == 'B' )	{	D_IO_HIGH(D_LED_PORT, D_LED_PIN);	}
	}
	if( _fs2 == 2 )
	{
		if( __f[4] != __timer100ms ){	_fs2 = 3;	}		
	}
	else if( _fs2 == 3 )
	{
		uart3_tx_put("B", 1);
		_fs2 = 4;
	}
	else if( _fs2 == 4 )
	{
	}
*/
}
#endif

#if defined (_RC_WD_)
#include "uiDef.h"

uint8_t	__enc = 1;
uint8_t	__lcd = 0;
uint8_t	__lcdi = 0;

extern void	lcd_disp_all(void);
extern uint8_t	_backlight;

void	factoryRC(void)
{
	/*
	 *	CNV - RC
	 *	LED 
	 */
	uint8_t	i;
	uint8_t	ch;
	uint8_t	key;
	if( _fs == 0 )
	{
		_fs = 1;
		__f[0] = __timer1s;
		D_IO_LOW(D_LED_PORT, D_LED_PIN);
		//	Display LCD
		lcd_disp_all();
	}
	else if( _fs == 1 )
	{
		key = key_ready();
		if( key != 0 )
		{
			if( (key & 0x80) != 0 )
			{
				_fs = 14;
				if( (key&0x40) == 0 )
					__enc--;
				else
					__enc++;
				if( __enc == 0 )		__enc = 8;
				else if( __enc == 9 )	__enc = 1;
				return;
			}
			lcd_clear(0);
			if( key == 1 )	_fs = 10;
			if( key == 2 )	_fs = 11;
			if( key == 3 )	_fs = 12;
			if( key == 4 )	_fs = 13;
		}
		
	}
	else if( _fs == 2 )
	{
		_fs = 1;
	}
	else if( _fs == 10 )
	{
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 1);
		_fs = 2;
	}
	else if( _fs == 11 )
	{
		lcd_disp_n(0, 2);
		lcd_disp_n(1, 2);
		_fs = 2;
	}
	else if( _fs == 12 )
	{
		lcd_disp_n(0, 3);
		lcd_disp_n(1, 3);
		_fs = 2;
	}
	else if( _fs == 13 )
	{
		lcd_disp_n(0, 4);
		lcd_disp_n(1, 4);
		_fs = 2;
	}
	else if( _fs == 14 )
	{
		lcd_disp_n(0, __enc);
		lcd_disp_n(1, __enc);
		_fs = 2;
	}
	if( (__timer100ms%2) == __lcdi )
	{
		__lcdi = __timer100ms%2;
		if( __lcd == 0 )
		{
			__lcd = 1;
			_backlight++;
			if( _backlight == 24 )
				_backlight = 12;
		}
		i = adcGet(1);
		ui_disp_temp_setup(i);
	}
	else
		__lcd = 0;

	factory2wire();
}
#endif

void	_factoryCntl(uint8_t i)
{
#if defined (_RC_DR_)
	lcd_disp_n(0, i);
	lcd_disp_n(1, i);
	_fs = 2;
#endif
#if defined (_RC_DW_)
	lcd_disp_n(0, i);
	lcd_disp_n(1, i);
	_fs = 2;
#endif
}


#if defined (_RC_DR_)
#include "uiDef.h"

//uint8_t	__enc = 1;
uint8_t	__lcd = 0;
uint8_t	__lcdi = 0;

uint8_t	_key_first = 0;

extern void	lcd_disp_all(void);
extern uint8_t	_backlight;

extern uint8_t	tc[];
extern uint8_t	tci;
extern uint8_t	_tcKey;
extern uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key);
extern void	beepSet(uint8_t i);
extern uint8_t	_uart1_rx_head;
extern uint8_t	_uart1_rx_tail;
extern uint8_t	_tctimer100ms[];

void	factoryDr(void)
{
	uint8_t	i, j;
	uint8_t	ch;
	uint8_t	key;
	if( _fs == 0 )
	{
		_fs = 1;
		__f[0] = __timer1s;
		//	Display LCD
		lcd_disp_all();
	}
	else if( _fs == 1 )
	{
		key = 0;
		while( _uart1_rx_tail != _uart1_rx_head )
		{
			i = uart1_get();
			if( i != 0xff )
			{
				tc[tci] = i;
				tci = tci==0 ? 1 : 0;
				if( tci != 0 )
					continue;
					
				i = tc[0] + tc[1];
				if( i != 0xff )
					continue;
					
				key = _touchKey(0, 0x01, 0x20);
				key |= _touchKey(1, 0x02, 0x02);
				key |= _touchKey(2, 0x04, 0x08);
				key |= _touchKey(3, 0x08, 0x04);
				key |= _touchKey(4, 0x10, 0x10);
				key |= _touchKey(5, 0x20, 0x01);
				if( _tcKey == 0 )
					continue;
					
				beepSet(4);			
				_tctimer100ms[0] = __timer1s;
			}		
			else 
				tci = 0;
		}
		if( _tctimer100ms[0] != __timer1s )
		{
			_tctimer100ms[0] = __timer1s;
			if( _key_first == 1 )
				lcd_clear(0);
			else
				lcd_disp_all();
//			lcd_clear(0);
//			lcd_disp_all();
		}
		if( key != 0 )
		{
			lcd_clear(0);
			if( key == 1 )	_fs = 10;
			if( key == 2 )	_fs = 11;
			if( key == 4 )	_fs = 12;
			if( key == 8 )	_fs = 13;
			if( key == 16 )	_fs = 14;
			if( key == 32 )	_fs = 15;
			_key_first = 1;
		}
	}
	else if( _fs == 2 )
	{
		_fs = 1;
	}
	else if( _fs == 10 )	_factoryCntl(1);
	else if( _fs == 11 )	_factoryCntl(2);
	else if( _fs == 12 )	_factoryCntl(3);
	else if( _fs == 13 )	_factoryCntl(4);
	else if( _fs == 14 )	_factoryCntl(5);
	else if( _fs == 15 )	_factoryCntl(6);
	
	if( (__timer100ms%2) == __lcdi )
	{
		__lcdi = __timer100ms%2;
		if( __lcd == 0 )
		{
			__lcd = 1;
			_backlight++;
			if( _backlight == BACKLIGHT_MAX_LEVEL )
				_backlight = 12;
		}
		i = adcGet(1);
		ui_disp_temp_setup(i);
	}
	else
		__lcd = 0;

	factory2wire();
}
#endif
#if defined (_RC_DW_)
#include "uiDef.h"

uint8_t	__enc = 1;
uint8_t	__lcd = 0;
uint8_t	__lcdi = 0;

uint8_t	_key_first = 0;

extern void	lcd_disp_all(void);
extern uint8_t	_backlight;

extern uint8_t	tc[];
extern uint8_t	tci;
extern uint8_t	_tcKey;
extern uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key);
extern void	beepSet(uint8_t i);
extern uint8_t	_uart1_rx_head;
extern uint8_t	_uart1_rx_tail;
extern uint8_t	_tctimer100ms[];

void	factoryDw(void)
{
	/*
	 *	CNV - RC
	 *	LED 
	 */
	uint8_t	i;
	uint8_t	ch;
	uint8_t	key;
	if( _fs == 0 )
	{
		_fs = 1;
		__f[0] = __timer1s;
		//	Display LCD
		lcd_disp_all();
	}
	else if( _fs == 1 )
	{
		key = 0;
		while( _uart1_rx_tail != _uart1_rx_head )
		{
			i = uart1_get();
			if( i != 0xff )
			{
				tc[tci] = i;
				tci = tci==0 ? 1 : 0;
				if( tci != 0 )
					continue;
					
				i = tc[0] + tc[1];
				if( i != 0xff )
					continue;
					
				key = _touchKey(0, 0x01, 0x01);
				key |= _touchKey(1, 0x02, 0x04);
				key |= _touchKey(2, 0x04, 0x10);
				key |= _touchKey(3, 0x08, 0x02);
				key |= _touchKey(4, 0x10, 0x08);
				key |= _touchKey(5, 0x20, 0x20);
				if( _tcKey == 0 )
					continue;
					
				//beepSet(4);			
				_tctimer100ms[0] = __timer1s;
			}		
			else 
				tci = 0;
		}
		if( _tctimer100ms[0] != __timer1s )
		{
			_tctimer100ms[0] = __timer1s;
			if( _key_first == 1 )
				lcd_clear(0);
			else
				lcd_disp_all();
//			lcd_clear(0);
//			lcd_disp_all();
		}
		if( key != 0 )
		{
			lcd_clear(0);
			if( key == 1 )	_fs = 10;
			if( key == 2 )	_fs = 11;
			if( key == 4 )	_fs = 12;
			if( key == 8 )	_fs = 13;
			if( key == 16 )	_fs = 14;
			if( key == 32 )	_fs = 15;
			_key_first = 1;
		}
	}
	else if( _fs == 2 )
	{
		_fs = 1;
	}
	else if( _fs == 10 )	_factoryCntl(1);
	else if( _fs == 11 )	_factoryCntl(2);
	else if( _fs == 12 )	_factoryCntl(3);
	else if( _fs == 13 )	_factoryCntl(4);
	else if( _fs == 14 )	_factoryCntl(5);
	else if( _fs == 15 )	_factoryCntl(6);
	if( (__timer100ms%2) == __lcdi )
	{
		__lcdi = __timer100ms%2;
		if( __lcd == 0 )
		{
			__lcd = 1;
			_backlight++;
			if( _backlight == 24 )
				_backlight = 12;
		}
		i = adcGet(1);
		ui_disp_temp_setup(i);
	}
	else
		__lcd = 0;

	factory2wire();
}
#endif

#if defined (_CNV_)
void	factoryCnv(void)
{
	/*
	 *	CNV - CNV
	 *	LED 
	 */
	//	485a			if ready, resend B, 485a <-> 485b loop back, 0.25s toggle LED @CNT
	//	2-wire			if ready, resend A, if packet loop back @CNV, toggle LED@CNV
	factory2wire();

	if( __f[0] == _timer1s )
	{
		if( __f[1] != 0 )
		{
			__f[0] = _timer1s;
			__f[1] = 1;
		}
	}
}
#endif

uint8_t factory(uint8_t mode)
{
	timerCalc();

#if defined (_WOODANG_CNT_)
	factoryCntl();
#endif
#if defined (_RC_WD_)
	factoryRC();
#endif
#if defined (_CNV_)
	factoryCnv();
#endif
#if defined (_RC_DR_)
	factoryDr();
#endif
#if defined (_RC_DW_)
	factoryDw();
#endif

}
