#include "stdafx.h"
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)

#include "uiDef.h"

#define	LCD_CE		LCD->CR3 |= (uint8_t)LCD_CR3_SOFC

void	lcd_blink(uint8_t mode)
{
/*	
*            @arg LCD_BlinkMode_Off:           Blink disabled
*            @arg LCD_BlinkMode_SEG0_COM0:     Blink enabled on SEG[0], COM[0] (1 pixel)
*            @arg LCD_BlinkMode_SEG0_AllCOM:   Blink enabled on SEG[0], all COM (up to 8 
*                                       pixels according to the programmed duty)
*            @arg LCD_BlinkMode_AllSEG_AllCOM: Blink enabled on all SEG and all COM 
*                                       (all pixels)
* @param  LCD_BlinkFrequency: specifies the LCD blink frequency.
*          This parameter can be one of the following values:
*            @arg LCD_BlinkFrequency_Div8:    The Blink frequency = fLcd/8
*            @arg LCD_BlinkFrequency_Div16:   The Blink frequency = fLcd/16
*            @arg LCD_BlinkFrequency_Div32:   The Blink frequency = fLcd/32
*            @arg LCD_BlinkFrequency_Div64:   The Blink frequency = fLcd/64 
*            @arg LCD_BlinkFrequency_Div128:  The Blink frequency = fLcd/128
*            @arg LCD_BlinkFrequency_Div256:  The Blink frequency = fLcd/256
*            @arg LCD_BlinkFrequency_Div512:  The Blink frequency = fLcd/512
*            @arg LCD_BlinkFrequency_Div1024: The Blink frequency = fLcd/1024
*/
/* Configures the LCD Blink mode*/
//    LCD_BlinkConfig(LCD_BlinkMode_AllSEG_AllCOM, LCD_BlinkFrequency_Div64);
}

#if defined (_RC_DR_)	
CONST	uint8_t	bLF_DEF[]=
{
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10,

	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10,
};
CONST	uint8_t iLF_DEF[] =
{
	0, 0, 0, 0, 0, 0, 0, 0,				1, 1, 1, 1, 1, 1, 1, 2,
	3, 3, 3, 3, 4, 4, 4, 4,				4, 4, 4, 5, 5, 5, 5, 5,
	
	7, 7, 7, 7, 7, 7, 7, 7,				8, 8, 8, 8, 8, 8, 8, 9,
	10, 10, 10, 10, 11, 11, 11, 11, 	11, 11, 11, 12, 12, 12, 12, 12	
};
#elif defined (_RC_DW_)
#if 0
CONST	uint8_t	bLF_DEF[]=
{
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08,	0x10, 0x20, 0x40, 0x80, 	
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 
	0x01, 0x02, 0x04, 0x08,	0x10, 0x20, 0x40, 0x80, 	
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,

	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		/*0x01*/0x02, 0x04, 0x08, 	0x10, 0x20, 0x40, 0x80, 	0x01,		0x02, 0x10, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		/*0x10*/0x20, 0x40, 0x80, 	0x01, 0x02, 0x04, 0x08, 	0x10,		0x20, 0x01, 0x10
};
#endif
CONST	uint8_t	bLF_DEF[]=
{
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		/*0x01*/0x02, 0x04, 0x08, 	0x10, 0x20, 0x40, 0x80, 	0x01,		0x02, 0x10, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		/*0x10*/0x20, 0x40, 0x80, 	0x01, 0x02, 0x04, 0x08, 	0x10,		0x20, 0x01, 0x10,

	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		/*0x01*/0x02, 0x04, 0x08, 	0x10, 0x20, 0x40, 0x80, 	0x01,		0x02, 0x10, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		/*0x10*/0x20, 0x40, 0x80, 	0x01, 0x02, 0x04, 0x08, 	0x10,		0x20, 0x01, 0x10
/*	
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01,		0x02, 0x01, 0x08,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10,		0x20, 0x10, 0x80,

	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01,		0x02, 0x01, 0x08,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10,		0x20, 0x10, 0x80
*/
};
CONST	uint8_t iLF_DEF[] =
{
	0, 0, 0, 0, 0, 0, 0, 0,				1, 1, 1, 1, 1, 1, 1, 2,		2, 2, 3,	//	-3
	3, 3, 3, 3, 4, 4, 4, 4,				4, 4, 4, 5, 5, 5, 5, 5,		5, 6, 6,
	
	7, 7, 7, 7, 7, 7, 7, 7,				8, 8, 8, 8, 8, 8, 8, 9,		9, 9, 10,
	10, 10, 10, 10, 11, 11, 11, 11, 	11, 11, 11, 12, 12, 12, 12, 12,		12, 13, 13
/*
	0, 0, 0, 0, 0, 0, 0, 0,				1, 1, 1, 1, 1, 1, 1, 2,		2, 2, 2,	//	-3
	3, 3, 3, 3, 4, 4, 4, 4,				4, 4, 4, 5, 5, 5, 5, 5,		5, 6, 6,
	
	7, 7, 7, 7, 7, 7, 7, 7,				8, 8, 8, 8, 8, 8, 8, 9,		9, 9, 9,
	10, 10, 10, 10, 11, 11, 11, 11, 	11, 11, 11, 12, 12, 12, 12, 12,		12, 13, 13
*/
};
#elif defined (_RC_DW_VENT_)
void	vent_disp(void);
CONST	uint8_t	bLF_DEF[]=
{
/*	
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
*/
/*
//+1
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02,
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02,
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02,		
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
*/
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02,
	
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		
	0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20,		
	
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
	0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01, 0x02,
	
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		
	0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20,		
	
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		
};
CONST	uint8_t iLF_DEF[] =
{
	0, 0, 0, 0, 0, 0, 0, 0,				
	1, 1, 1, 1, 1, 1, 1, 2,		2,
	
	3, 3, 3, 3, 4, 4, 4, 4,		
	4, 4, 4, 5, 5, 5, 5, 5,		5,
	
	7, 7, 7, 7, 7, 7, 7, 7,				
	8, 8, 8, 8, 8, 8, 8, 9, 	9,
	
	10, 10, 10, 10, 11, 11, 11, 11, 	
	11, 11, 11, 12, 12, 12, 12, 12, 	12,


};
#else
CONST	uint8_t	bLF_DEF[]=
{
	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10,

	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80,		0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x01,
	0x10, 0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08,		0x20, 0x40, 0x80, 0x01, 0x02, 0x04, 0x08, 0x10,
};
CONST	uint8_t iLF_DEF[] =
{
	0, 0, 0, 0, 0, 0, 0, 0,				1, 1, 1, 1, 1, 1, 1, 2,
	3, 3, 3, 3, 4, 4, 4, 4,				4, 4, 4, 5, 5, 5, 5, 5,
	
	7, 7, 7, 7, 7, 7, 7, 7,				8, 8, 8, 8, 8, 8, 8, 9,
	10, 10, 10, 10, 11, 11, 11, 11, 	11, 11, 11, 12, 12, 12, 12, 12	
};
#endif
CONST uint8_t	_na[] = 
{ 
	b1A, b1B, b1C, b1D, b1E, b1F, 0,
	b1B, b1C, 0, 0, 0, 0, 0,
	b1A, b1B, b1G, b1E, b1D, 0, 0,
	b1A, b1B, b1G, b1C, b1D, 0, 0,
	b1F, b1G, b1B, b1C, 0, 0, 0,
	b1A, b1F, b1G, b1C, b1D, 0, 0,
	b1F, b1G, b1E, b1D, b1C, b1A, 0,
	b1A, b1B, b1C, 0, 0, 0, 0,
	b1A, b1B, b1C, b1D, b1E, b1F, b1G,
	b1A, b1F, b1G, b1B, b1C, b1D, 0
};

CONST uint8_t	_nb[] = 
{ 
	b2A, b2B, b2C, b2D, b2E, b2F, 0,
	b2B, b2C, 0, 0, 0, 0, 0,
	b2A, b2B, b2G, b2E, b2D, 0, 0,
	b2A, b2B, b2G, b2C, b2D, 0, 0,
	b2F, b2G, b2B, b2C, 0, 0, 0,
	b2A, b2F, b2G, b2C, b2D, 0, 0,
	b2F, b2G, b2E, b2D, b2C, b2A, 0,
	b2A, b2B, b2C, 0, 0, 0, 0,
	b2A, b2B, b2C, b2D, b2E, b2F, b2G,
	b2A, b2F, b2G, b2B, b2C, b2D, 0
};

CONST uint8_t	_nc[] = 
{ 
	b3A, b3B, b3C, b3D, b3E, b3F, 0,
	b3B, b3C, 0, 0, 0, 0, 0,
	b3A, b3B, b3G, b3E, b3D, 0, 0,
	b3A, b3B, b3G, b3C, b3D, 0, 0,
	b3F, b3G, b3B, b3C, 0, 0, 0,
	b3A, b3F, b3G, b3C, b3D, 0, 0,
	b3F, b3G, b3E, b3D, b3C, b3A, 0,
	b3A, b3B, b3C, 0, 0, 0, 0,
	b3A, b3B, b3C, b3D, b3E, b3F, b3G,
	b3A, b3F, b3G, b3B, b3C, b3D, 0
};

CONST uint8_t	_nd[] = 
{ 
	b4A, b4B, b4C, b4D, b4E, b4F, 0, 
	b4B, b4C, 0, 0, 0, 0, 0,
	b4A, b4B, b4G, b4E, b4D, 0, 0,
	b4A, b4B, b4G, b4C, b4D, 0, 0,
	b4F, b4G, b4B, b4C, 0, 0, 0,
	b4A, b4F, b4G, b4C, b4D, 0, 0,
	b4F, b4G, b4E, b4D, b4C, b4A, 0,
	b4A, b4B, b4C, 0, 0, 0, 0,
	b4A, b4B, b4C, b4D, b4E, b4F, b4G,
	b4A, b4F, b4G, b4B, b4C, b4D, 0
};
#if defined (_RC_DW_)
/*
*/
CONST uint8_t	_ne[] = 
{ 
	b5A, b5B, b5C, b5D, b5E, b5F, 0,
	b5B, b5C, 0, 0, 0, 0, 0,
	b5A, b5B, b5G, b5E, b5D, 0, 0,
	b5A, b5B, b5G, b5C, b5D, 0, 0,
	b5F, b5G, b5B, b5C, 0, 0, 0,
	b5A, b5F, b5G, b5C, b5D, 0, 0,
	b5F, b5G, b5E, b5D, b5C, b5A, 0,
	b5A, b5B, b5C, 0, 0, 0, 0,
	b5A, b5B, b5C, b5D, b5E, b5F, b5G,
	b5A, b5F, b5G, b5B, b5C, b5D, 0
};

CONST uint8_t	_nf[] = 
{ 
	b6A, b6B, b6C, b6D, b6E, b6F, 0, 
	b6B, b6C, 0, 0, 0, 0, 0,
	b6A, b6B, b6G, b6E, b6D, 0, 0,
	b6A, b6B, b6G, b6C, b6D, 0, 0,
	b6F, b6G, b6B, b6C, 0, 0, 0,
	b6A, b6F, b6G, b6C, b6D, 0, 0,
	b6F, b6G, b6E, b6D, b6C, b6A, 0,
	b6A, b6B, b6C, 0, 0, 0, 0,
	b6A, b6B, b6C, b6D, b6E, b6F, b6G,
	b6A, b6F, b6G, b6B, b6C, b6D, 0
};
#endif

CONST uint8_t	_nerr[] = 
{
	b1A, b1F, b1E, b1D, b1G, 
	b2E, b2G
};
CONST uint8_t	_nerrBr[] = 
{
	b1C, b1F, b1E, b1D, b1G, 
	b2E, b2G
};

CONST uint8_t	_nm[] ={	b1E, b1G, b1C};
CONST uint8_t	_ncnt[] ={	b1G, b1E, b1D, b2E, b2G, b2C};
CONST uint8_t	_nvalve[] ={	b1C, b1E, b1D, b2E, b2G, b2C};

CONST uint8_t	_n[]  = 
{
#if defined (_RC_DR_)	
	b1A, b1B, b1C, b1D, b1E, b1F, b1G, 
	b2A, b2B, b2C, b2D, b2E, b2F, b2G, 
	b3A, b3B, b3C, b3D, b3E, b3F, b3G, 
	b4A, b4B, b4C, b4D, b4E, b4F, b4G,
#elif defined (_RC_DW_)
	b1A, b1B, b1C, b1D, b1E, b1F, b1G, 
	b2A, b2B, b2C, b2D, b2E, b2F, b2G, 
	b4A, b4B, b4C, b4D, b4E, b4F, b4G,
	b5A, b5B, b5C, b5D, b5E, b5F, b5G,
	b3A, b3B, b3C, b3D, b3E, b3F, b3G, 
	b6A, b6B, b6C, b6D, b6E, b6F, b6G,
#elif defined (_RC_DW_VENT_)
	b1A, b1B, b1C, b1D, b1E, b1F, b1G, 
	b2A, b2B, b2C, b2D, b2E, b2F, b2G, 
	b3A, b3B, b3C, b3D, b3E, b3F, b3G, 
	b4A, b4B, b4C, b4D, b4E, b4F, b4G,
#else
	b1A, b1B, b1C, b1D, b1E, b1F, b1G, 
	b2A, b2B, b2C, b2D, b2E, b2F, b2G, 
	b3A, b3B, b3C, b3D, b3E, b3F, b3G, 
	b4A, b4B, b4C, b4D, b4E, b4F, b4G,
	bC1, bC2, bT1, bT3, bT2, bT4, bCOL 
#endif
};

CONST uint8_t	_nid[] = {	b1C, b2B, b2C, b2G, b2E, b2D};
CONST uint8_t	_info[] ={	//	연소/난방수/온수/
#if defined (_RC_DR_)	
	bP17, bP16, bP18
#elif defined (_RC_DW_)
	bT2, bT22, bT29			
#elif defined (_RC_DW_VENT_)
	bT17, bT16, bT18
#else
	bS2, bS4, bS5
#endif
};	

CONST uint8_t	_rid[] = 
{
#if defined (_RC_DR_)	
	bR1, bP1,
	bR2, bP2, 
	bR3, bP3,
	bR4, bP4,
	bR5, bP5,
	bR6, bP6,
	bR7, bP7,
#elif defined (_RC_DW_)
	bT9, bT10,
	bT12,	bT13,
	bT16,	bT17,
	bT20,	bT21,
	bT24,	bT25,
	bT27,	bT28,
	g10, g10,
	g10, g10,
#elif defined (_RC_DW_VENT_)
	bT1, 	bT1,
	bT2,	bT2,
	bT3,	bT3,
	bT4,	bT4,
	bT5,	bT5,
	bT6,	bT6,
	bT7,	bT7,
	bT8,	bT7,
#else
	bS20, bS19,		//0
	b1, bS18, 		//1
	b2, bS17, 		//2
	b3, bS16, 		//3
	b4, bS15, 		//4
	b5, bS14, 		//5	
	b6, bS13,		//6
	b7, bS12		//7
#endif
};

CONST uint8_t	_bL[] = {	b1F, b1E, b1G, b1D, b1C, b2F, b2E, b2D };

#if defined (_RC_DR_)	
//CONST uint8_t	_btn[] = {	_b1, _b2, _b3, _b4, _b1 };
CONST uint8_t	_btn[] = {	bP9, bP10, bP11, bP12, bP13 };
//CONST uint8_t	_cmd[] = {	_b1 };
CONST uint8_t	_cc[] ={	bP19 };
CONST uint8_t	_cntl_on[] = {	b3G, b3E, b3C, b3D, b4A, b4E, b4G, b4F };
CONST uint8_t	_cntl_po[] = {	b3A, b3B, b3F, b3G, b3E, b4G, b4E, b4C, b4D };
CONST uint8_t	_hcLocal[] = {	b3F, b3E, b3D, b4G, b4E, b4D, b4C};	//	Local
CONST uint8_t	_hcEach[] = {	b3A, b3F, b3G, b3E, b3D, b4A, b4F, b4E, b4B, b4G, b4C};		//	Each
#elif defined (_RC_DW_)
CONST uint8_t	_btn[] = {	bT7, bT14, bT18, bT6, bT6 };
//CONST uint8_t	_cmd[] = {	g1 };
CONST uint8_t	_cc[] ={	bT1 };
CONST uint8_t	_cntl_on[] = {	b4G, b4E, b4C, b4D, b5A, b5E, b5G, b5F };
CONST uint8_t	_cntl_po[] = {	b4A, b4B, b4F, b4G, b4E, b5G, b5E, b5C, b5D };
CONST uint8_t	_hcLocal[] = {	b4F, b4E, b4D, b5G, b5E, b5D, b5C};	//	Local
CONST uint8_t	_hcEach[] = {	b4A, b4F, b4G, b4E, b4D, b5A, b5F, b5E, b5B, b5G, b5C};		//	Each
#elif defined (_RC_DW_VENT_)
CONST uint8_t	_btn[] = {	bT13, bT14, bT15, bT16, bT17, bT18, bT19, bT20 };
//CONST uint8_t	_cmd[] = {	g1 };
CONST uint8_t	_cc[] ={	bT11 };
CONST uint8_t	_cntl_on[] = {	b3G, b3E, b3C, b3D, b4A, b4E, b4G, b4F };
CONST uint8_t	_cntl_po[] = {	b3A, b3B, b3F, b3G, b3E, b4G, b4E, b4C, b4D };
CONST uint8_t	_hcLocal[] = {	b3F, b3E, b3D, b4G, b4E, b4D, b4C};	//	Local
CONST uint8_t	_hcEach[] = {	b3A, b3F, b3G, b3E, b3D, b4A, b4F, b4E, b4B, b4G, b4C};		//	Each
#else
CONST uint8_t	_btn[] = {	bS6, bS7, bS8, bS9, bS10 };
//CONST uint8_t	_cmd[] = {	bS6, bS7, bS8, bS9, bS10, bS11};
CONST uint8_t	_cc[] ={	b1G, b1E, b1D, bC2};
CONST uint8_t	_cntl_on[] = {	b3G, b3E, b3C, b3D, b4A, b4E, b4G, b4F };
CONST uint8_t	_cntl_po[] = {	b3A, b3B, b3F, b3G, b3E, b4G, b4E, b4C, b4D };
CONST uint8_t	_hcLocal[] = {	b3F, b3E, b3D, b4G, b4E, b4D, b4C};	//	Local
CONST uint8_t	_hcEach[] = {	b3A, b3F, b3G, b3E, b3D, b4A, b4F, b4E, b4B, b4G, b4C};		//	Each
#endif
CONST uint8_t	_run[] ={	b1E, b1G, b2E, b2D, b2C, b3E, b3G, b3C};
CONST uint8_t	_hc[] = {	b1F, b1E, b1G, b1D, b2G, b2F, b2B, b2C };
//CONST uint8_t	_maxValue[] = {	b1F, b1E, b1G, b1C, b1D };
CONST uint8_t	_link[] = {	b1F, b1E, b1D, b2E, b2G, b2C };
CONST uint8_t	_cntl_op[] = {	b1G, b1E, b1C, b1D, b2A, b2B, b2F, b2G, b2E };
CONST uint8_t	_cntl_2motor[] = {	b3A, b3B, b3D, b3G, b3E, b4G, b4E, b4A, b4F, b4B };
CONST uint8_t	_cntl_tab[] = {	b3A, b3F, b3E, b4G, b4E, b4F, b4D, b4C };

CONST uint8_t	_mir1[] = {	b3B, b3C, b3E, b3G, b3D, b4B, b4C };
CONST uint8_t	_mir2[] = {	b3B, b3C, b3E, b3G, b3D, b4A, b4B, b4G, b4E, b4D };
CONST uint8_t	_freset[] = {	b3A, b3F, b3E, b3G, b4G, b4E };

CONST uint8_t	_len[] = {	b1F, b1E, b1D };
CONST uint8_t	_po_type[] = {	b2G, b2E, b2C, b2D, b1A, b1B, b1F, b1G, b1E };
CONST uint8_t	_po_type_xl[] = {	b4F, b4E, b4D, b3F, b3B, b3C, b3G, b3E };
CONST uint8_t	_po_type_pb[] = {	b4G, b4E, b4C, b4D, b4F, b3A, b3B, b3F, b3G, b3E };
/*
CONST uint8_t	_po_type_pe[] = {	b4G, b4E, b4A, b4D, b4F, b3A, b3B, b3F, b3G, b3E };
*/
CONST uint8_t	_temp_offset[] ={	b1G, b1E, b1D, b1F};
CONST uint8_t	_lpm[] = {	b1F, b1E, b1D, b2E, b2G, b2A, b2F, b2B };

CONST uint8_t	_cnt_host[] = {	b3B, b3C, b3E, b3G, b3F, b4G, b4C, b4E, b4D };
CONST uint8_t	_cnt_sub[] = {	b3A, b3C, b3F, b3G, b3D, b4E, b4D, b4C };

CONST uint8_t	_plc[] = {	b1A, b1B, b1F, b1E, b1G, b2E, b2D, b2F, b3A, b3F, b3E, b3D };

LCD_DISP_FUNC_1(lcd_disp_plc, 12, _plc)

LCD_DISP_FUNC_1(lcd_disp_cnt_host, 9, _cnt_host)
LCD_DISP_FUNC_1(lcd_disp_cnt_sub, 8, _cnt_sub)

LCD_DISP_FUNC_1(lcd_disp_mir1, 7, _mir1)
LCD_DISP_FUNC_1(lcd_disp_mir2, 10, _mir2)
LCD_DISP_FUNC_1(lcd_disp_freset, 6, _freset)

LCD_DISP_FUNC(lcd_disp_backlight, 8, _bL)

LCD_DISP_FUNC(lcd_disp_setup_lpm, 8, _lpm)
LCD_DISP_FUNC(lcd_disp_setup_temp_offset, 4, _temp_offset)

LCD_DISP_FUNC(lcd_disp_setup_po_type, 9, _po_type)
LCD_DISP_FUNC_1(lcd_disp_setup_po_type_xl, 8, _po_type_xl)
LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pb, 10, _po_type_pb)
/*
LCD_DISP_FUNC_1(lcd_disp_setup_po_type_pe, 10, _po_type_pe)
*/
LCD_DISP_FUNC(lcd_disp_setup_len, 3, _len)
LCD_DISP_FUNC(lcd_disp_setup_cntl_op, 9, _cntl_op)
LCD_DISP_FUNC_1(lcd_disp_setup_cntl_on, 8, _cntl_on)
LCD_DISP_FUNC_1(lcd_disp_setup_cntl_po, 9, _cntl_po)
LCD_DISP_FUNC_1(lcd_disp_setup_cntl_2motor, 10, _cntl_2motor)
LCD_DISP_FUNC_1(lcd_disp_setup_cntl_tab, 8, _cntl_tab)

LCD_DISP_FUNC(lcd_disp_setup_c, 1, _cc)
//LCD_DISP_FUNC(lcd_disp_setup_maxValue, 5, _maxValue)
LCD_DISP_FUNC(lcd_disp_setup_link, 6, _link)

LCD_DISP_FUNC(lcd_disp_setup_run, 8, _run)

LCD_DISP_FUNC_1(lcd_disp_setup_mode_local, 7, _hcLocal)
LCD_DISP_FUNC_1(lcd_disp_setup_mode_each, 11, _hcEach)
LCD_DISP_FUNC(lcd_disp_setup_mode, 8, _hc)

LCD_DISP_FUNC(lcd_disp_setup_id, 6, _nid)
LCD_DISP_FUNC(lcd_disp_setup_m, 3, _nm)
LCD_DISP_FUNC(lcd_disp_setup_cnt, 6, _ncnt)
LCD_DISP_FUNC(lcd_disp_setup_valve, 6, _nvalve)

LCD_CLEAR_FUNC(lcd_clear_backlight, 8, _bL)
LCD_CLEAR_FUNC(lcd_clear_c, 4, _cc)
#if defined (_RC_DW_VENT_)
LCD_CLEAR_FUNC(lcd_clear_btn, 8, _btn)
#else
LCD_CLEAR_FUNC(lcd_clear_btn, 5, _btn)
#endif
LCD_CLEAR_FUNC(lcd_clear_run, 8, _run)
LCD_CLEAR_FUNC(lcd_clear_mode, 8, _hc)
//LCD_CLEAR_FUNC(lcd_clear_cmd, 6, _cmd)
LCD_CLEAR_FUNC(lcd_clear_info, 3, _info)
#if defined (_RC_DR_)	
LCD_CLEAR_FUNC(lcd_clear_rid, 14, _rid)
LCD_CLEAR_FUNC(lcd_clear_n, 28, _n)
#elif defined (_RC_DW_)
LCD_CLEAR_FUNC(lcd_clear_rid, 12, _rid)
LCD_CLEAR_FUNC(lcd_clear_n, 42, _n)
#elif defined (_RC_DW_VENT_)
LCD_CLEAR_FUNC(lcd_clear_rid, 14, _rid)
LCD_CLEAR_FUNC(lcd_clear_n, 28, _n)
#else
LCD_CLEAR_FUNC(lcd_clear_rid, 16, _rid)
LCD_CLEAR_FUNC(lcd_clear_n, 35, _n)
#endif
LCD_CLEAR_FUNC(lcd_clear_m, 3, _nm)
LCD_CLEAR_FUNC(lcd_clear_cnt, 6, _ncnt)

void	lcd_clear_npos(uint8_t pos, uint8_t type)
{
	uint8_t	i, j;
	pos = pos*7;
	for( i=0; i<7; i++ )
	{
		j = _n[pos++];
		LCD_BIT_CLEAR(j);
	}
}

void	lcd_disp_all(void)
{
	uint8_t	i;
	for( i=0; i<15; i++ )
		LCD->RAM[i] = 0xff;
}

void	lcd_clear(uint8_t type)
{
	uint8_t	i;
	for( i=0; i<15; i++ )
		LCD->RAM[i] = 0;
#if defined (_RC_DW_VENT_)
	vent_disp();
#endif
}

uint8_t	*lcd_get_npos(uint8_t i)
{
	uint8_t	*p;
	switch( i )
	{
#if defined (_RC_DW_)
	case 0:	p = _na;	break;
	case 1:	p = _nb;	break;
	case 2:	p = _nd;	break;
	case 3:	p = _ne;	break;
	case 4:	p = _nc;	break;
	case 5:	p = _nf;	break;
#else
	case 0:	p = _na;	break;
	case 1:	p = _nb;	break;
	case 2:	p = _nc;	break;
	case 3:	p = _nd;	break;
#endif
	}
	return p;
}

void	lcd_disp_n(uint8_t pos, uint8_t n)
{
	uint8_t	i, j;
	uint8_t	*p;
	
	lcd_clear_npos(pos, 0);
	p = lcd_get_npos(pos);
	p = p+n*7;
	for( i=0; i<7; i++ )
	{
		if( p[i] != 0 )
		{
			j = p[i];
			LCD_BIT_SET(j);
		}
	}
}

extern uint8_t	error_type;

void	lcd_disp_err(uint8_t n)
{
	uint8_t	i, j;
	uint8_t	*p;
	LCD_CE;
	lcd_clear_n();
	p = error_type==1 ? _nerrBr : _nerr;
	for( i=0; i<7; i++ )
	{
		LCD_BIT_SET(p[i]);
	}
	if( uiInfo.mode == 1 )
	{
Print:		
//		LCD_BIT_SET(bCOL);
		lcd_disp_n(2, n/10);
		lcd_disp_n(3, n%10);
	}
	else
	{
		if( n==30 )
			goto Print;
	}
}

void	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi)
{
	uint8_t	j;
#if defined (_RC_DW_)
	uint8_t	_b[] = { bT8, bT11, bT15, bT19, bT23, bT26, g10, g10 };
#endif
	LCD_CE;
	if( multi == 0 )
	{
#if defined (_RC_DW_)
		for( j=0; j<6; j++ )
			LCD_BIT_CLEAR(_b[j]);
#endif
		lcd_clear_rid();
	}

	if( id != 0 )
		id -= 1;
		
#if defined (_RC_DW_)
	if( mode != 0 )
	{
		j = _b[id];
		LCD_BIT_SET(j);
	} else {
		j = _b[id];
		LCD_BIT_CLEAR(j);
	}
	j = _rid[id*2+1];
	LCD_BIT_SET(j);
	j = _rid[id*2];
	LCD_BIT_SET(j);
#else
	if( mode != 0 )
	{
		j = _rid[id*2+1];
		LCD_BIT_SET(j);
	} else {
		j = _rid[id*2+1];
		LCD_BIT_CLEAR(j);
	}
	j = _rid[id*2];
	LCD_BIT_SET(j);
#endif
}


void	lcd_clear_rid_n(uint8_t id, uint8_t mode)
{
	uint8_t	j;
	LCD_CE;
	
	if( id != 0 )
		id -= 1;
		
	if( mode != 0 )
	{
		j = _rid[id*2+1];
		LCD_BIT_CLEAR(j);
	}
	j = _rid[id*2];
	LCD_BIT_CLEAR(j);
}
void	lcd_disp_cmd(uint8_t cmd, uint8_t mode, uint8_t multi)
{
	uint8_t	j;
	LCD_CE;
	/*
	if( multi == 0 )
		lcd_clear_cmd();
	*/
	/*
	if( mode != 0 )
		LCD->RAM[iLF_DEF[_rid[id*2+1]]] |= bLF_DEF[_rid[id*2+1]];
	*/
//	j = _cmd[cmd];
	LCD_BIT_SET(j);
}

void	lcd_disp_info_fire(uint8_t mode)
{
	if( mode == 0 )
		LCD_BIT_CLEAR(_info[0]);
	else
		LCD_BIT_SET(_info[0]);
}

void	lcd_disp_info_shower(uint8_t mode, uint8_t para)
{
	if( (mode & 0x80) != 0 )
		lcd_blink_item(_info[2]);
		
	else if( (mode &0x08) != 0 )
		lcd_blink_item(_info[1]);
	else 
		lcd_blink_clear();
		
}

void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi)
{
	uint8_t	j;
	LCD_CE;
	if( multi == 0 )
		lcd_clear_info();
	/*
	if( mode != 0 )
		LCD->RAM[iLF_DEF[_rid[id*2+1]]] |= bLF_DEF[_rid[id*2+1]];
	*/
	j = _info[info];
	if( mode == 1 )
		LCD_BIT_CLEAR(j);
	else
		LCD_BIT_SET(j);
	
	if( _key_blink == 1 )
		lcd_blink_item(j);

}
/*
void	lcd_disp_setup_mode_type(uint8_t mode)
{
	lcd_clear_npos(2, 0);
	lcd_clear_npos(3, 0);
	if( mode == 0 )
		lcd_disp_setup_mode_local();
	else
		lcd_disp_setup_mode_each();
}
*/
uint8_t __i = 0;

void	lcd_disp(uint8_t id, uint8_t enable)
{
	uint8_t	i;
	
	LCD_CE;
	if( enable == 1 )
	{
		lcd_clear(0);
		__i = (__i+1) % 10;
		lcd_disp_n(0, __i);
		lcd_disp_n(1, __i);
		lcd_disp_n(2, __i);
		lcd_disp_n(3, __i);
	}
	else
	{
		LCD->RAM[LCD_RAMRegister_1] &= (uint8_t)(~id);
	}
}

void	lcd_init(void)
{
	uint8_t	i;
	LCD_CE;
	for( i=0; i<15; i++ )
		LCD->RAM[i] = 0xff;
}

extern uint8_t	lcd_pwmCount;

void	lcd_cntl(uint8_t cmd, uint8_t param)
{
#if defined (_RC_WD_)
#if	0
	uint8_t	buf[8];
	if( cmd == 101 )
	{
		lcd_pwmCount++;
		if( lcd_pwmCount == 10 )
			lcd_pwmCount = 1;

		buf[1] = '0' + lcd_pwmCount/10;
		buf[2] = '0' + lcd_pwmCount%10;
		buf[3] = 'P';
		buf[0] = 'w';
		buf[4] = ' ';
		uart1_tx_put(buf, 5);
	}
#endif
#endif
}

void	systemLcdClear(void)
{
	LCD->CR1 = LCD_CR1_RESET_VALUE;
	LCD->CR2 = LCD_CR2_RESET_VALUE;
	LCD->CR3 = LCD_CR3_RESET_VALUE;
	LCD->FRQ = LCD_FRQ_RESET_VALUE;
	
	LCD->CR4 = LCD_CR4_RESET_VALUE;
}

#if 0
void LCD_GLASS_Init(void)
{
 /* Enable LCD/RTC clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
  CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
  
  #ifdef USE_LSE
    CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
  #else
    CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
  #endif
  
  /* Initialize the LCD */
  LCD_Init(LCD_Prescaler_1, LCD_Divider_31, LCD_Duty_1_4, 
                                   LCD_Bias_1_3, LCD_VoltageSource_Internal);
  
  /* Mask register
  For declare the segements used.
  in the Discovery we use 0 to 23 segments. */
  LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
  LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);
  LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0xff);
  
  /* To set contrast to mean value */
  LCD_ContrastConfig(LCD_Contrast_3V0);
  
  LCD_DeadTimeConfig(LCD_DeadTime_0);
  LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
  
  /* Enable LCD peripheral */ 
  LCD_Cmd(ENABLE);
}
#endif

void	systemLcd(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, ENABLE);
	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);

	systemLcdClear();
	
	LCD_Init(
		LCD_Prescaler_2, 
		LCD_Divider_18, 
		LCD_Duty_1_4,
		LCD_Bias_1_3, 
#if defined (_RC_DR_) || defined (_RC_DW_)
		LCD_VoltageSource_External
#else
		LCD_VoltageSource_Internal
#endif
		);
	/* Mask register*/
#if defined (_RC_DR_)	
	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x01);
	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);	//	seg24/seg20/seg17/seg16
#elif defined (_RC_DW_)	
	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x13);
	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x01);	//	seg24/seg20/seg17/seg16
#elif defined (_RC_DW_VENT_)
	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFF);	//	s8 Skip
	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x03);
	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);	//	seg24/seg20/seg17/seg16
#else
	LCD_PortMaskConfig(LCD_PortMaskRegister_0, 0xFF);
	LCD_PortMaskConfig(LCD_PortMaskRegister_1, 0xFE);	//	s8 Skip
	LCD_PortMaskConfig(LCD_PortMaskRegister_2, 0x01);	//	
	LCD_PortMaskConfig(LCD_PortMaskRegister_3, 0x00);
#endif

#if defined (_RC_DR_) || defined (_RC_DW_)	
	LCD_HighDriveCmd(ENABLE);
	LCD_ContrastConfig(LCD_Contrast_Level_7);
	LCD_DeadTimeConfig(LCD_DeadTime_0);
	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_0);
#elif defined (_RC_DW_VENT_)
	LCD_HighDriveCmd(ENABLE);
	LCD_ContrastConfig(LCD_Contrast_Level_7);
	LCD_DeadTimeConfig(LCD_DeadTime_0);
	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_0);
#else
	LCD_ContrastConfig(LCD_Contrast_Level_7);
	LCD_DeadTimeConfig(LCD_DeadTime_0);
	LCD_PulseOnDurationConfig(LCD_PulseOnDuration_1);
#endif
	/*
	*/
	//LCD_HighDriveCmd(ENABLE);
	lcd_init();

	LCD_Cmd(ENABLE); 
}

uint8_t	_blink_timer = 5;
uint8_t	_blinkFlag = 0;
uint8_t	_blinkId = 0xff;
uint8_t	_blink = 0;

uint8_t	_blinkFlag2 = 0;
uint8_t	_blinkId2 = 0xff;
uint8_t	_blinkId2b = 0xff;
uint8_t	_blink2 = 0;

uint8_t	_blinkNpos = 0;
uint8_t	_blinkFlag3 = 0;
uint8_t	_blinkId3 = 0xff;
uint8_t	_blink3 = 0;

void	lcd_blink_npos_clear(void)
{
	_blinkNpos = 0;
}

void	lcd_blink_npos(uint8_t i)
{
	_blinkNpos = i + 1;
}

void	lcd_blink_clear(void)
{
	_blinkId = 0;
	_blinkId2 = 0;
	_blinkId2b = 0;
}

void	lcd_blink_item(uint8_t i)
{
	_blinkId = i;
	_blink = 0;
}

void	lcd_blink_clearRoom(void)
{
	_blinkId2 = 0;
	_blinkId2b = 0;
}

void	lcd_blink_itemRoom(uint8_t i, uint8_t imode)
{
	_blinkId2 = _rid[i*2];
	if( imode != 0 )
		_blinkId2b = _rid[i*2+1];
	_blink2 = 0;
}

void	lcd_blinkCb(void)
{
	uint8_t	i;
	uint8_t	*p;
	if( _blink_timer == 0 )
		return;
		
	if( (__timer100ms%_blink_timer) == 0 )
	{
		if( _blinkFlag == 0 )
		{
			_blinkFlag = 1;
			if( _blinkId != 0 )
			{
				if( _blink != 0 )
				{
					LCD_BIT_CLEAR(_blinkId);
					_blink = 0;
				}
				else
				{
					LCD_BIT_SET(_blinkId);
					_blink = 1;
				}
			}
		}
		if( _blinkFlag2 == 0 )
		{
			_blinkFlag2 = 1;
			if( _blinkId2 != 0 )
			{
				if( _blink2 != 0 )
				{
					if( _blinkId2b != 0 )
						LCD_BIT_CLEAR(_blinkId2b);
					LCD_BIT_CLEAR(_blinkId2);
					_blink2 = 0;
				}
				else
				{
					if( _blinkId2b != 0 )
						LCD_BIT_SET(_blinkId2b);
					LCD_BIT_SET(_blinkId2);
					_blink2 = 1;
				}
			}
		}
		if( _blinkFlag3 == 0 )
		{
			_blinkFlag3 = 1;
			if( _blinkNpos != 0 )
			{
				p = lcd_get_npos(0);
				p = p+(_blinkNpos-1)*7;
				if( _blinkId3 != 0 )
				{
					for( i=0; i<7; i++ )
					{
						if( p[i] != 0 )
							LCD_BIT_CLEAR(p[i]);
					}
					_blinkId3 = 0;
				}
				else
				{
					for( i=0; i<7; i++ )
					{
						if( p[i] != 0 )
							LCD_BIT_SET(p[i]);
					}
					_blinkId3 = 1;
				}
			}
		}
	}
	else
	{
		_blinkFlag = 0;
		_blinkFlag2 = 0;
		_blinkFlag3 = 0;
	}
}

#endif