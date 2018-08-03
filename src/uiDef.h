#ifndef	_UI_DEF_H_
#define _UI_DEF_H_

#if defined (_RC_WD_)

#define _TIME_REPEAT_BASE	90
#define _DEG				1

#elif defined (_RC_DR_)

#define _TIME_REPEAT_BASE	60
#define _DEG				2

#elif defined (_RC_DW_)

#define _TIME_REPEAT_BASE	90
#define _DEG				1

#define K_UP				16
#define K_DN				32
#define K_NANB				1
#define K_MODE				4
#define K_ROOM				8
#define K_FIRE				2

#elif defined (_RC_DW_VENT_)

#define _TIME_REPEAT_BASE	90
#define _DEG				1
/*
#define VK_UP				16
#define VK_DN				32
#define VK_NAN				1
#define VK_SET				4
#define VK_ROOM				8
#define VK_FIRE				2
*/
//#endif

typedef struct tagVentInfo
{
	uint8_t	enable;
	uint8_t	bl;
	uint8_t	fn;
	uint8_t	t1, t2;
	uint8_t	speed;
	uint8_t	err;
	uint8_t	_temp;
	uint8_t	err_clear;
	uint8_t	b[36];
}	VENTINFO, *LPVENTINFO;

extern LPVENTINFO	vent_getInfo(void);

#endif

typedef enum
{
#if defined (_RC_WD_)
	b_ = 0,		b__ = 1,	b1A = 2,	bS1 = 3,
	b2A = 4,	bS2 = 5,	bC1 = 6,	b3A = 7,
	bS3 = 8,	b4A = 9,	bS4 = 10,	bS5 = 11,
	bS12 = 12,	b7 = 13,	bS20 = 14,	bS19 = 15,
	bS9 = 16,	bS6 = 17,	b1F = 18,	b1B = 19,
	b2F = 20,	b2B = 21,	bCOL = 22,	b3F = 23,
	b3B = 24,	b4F = 25,	b4B = 26,	bC2 =27 ,
	bS13 = 28,	b6 = 29,	b1 = 30,	bS18 = 31,
	bS10 = 32,	bS7 = 33,	b1E = 34,	b1G = 35,
	b2E = 36,	b2G = 37,	bT2 = 38,	b3E = 39,
	b3G = 40,	b4E = 41,	b4G = 42,	bT4 = 43,
	bS14 = 44,	b5 = 45,	b2 = 46,	bS17 = 47,
	bS11 = 48,	bS8 = 49,	b1D = 50,	b1C = 51,
	b2D = 52,	b2C = 53,	bT1 = 54,	b3D = 55,
	b3C = 56,	b4D = 57,	b4C = 58,	bT3 = 59,
	bS15 = 60,	b4 = 61, 	b3 = 62,	bS16 = 63,
	g1 = 128, 	g2 = 129,	g3 = 130,	g4 = 131,
	g12 = 132,	g34 = 133,	g1234 = 134,	
#elif defined (_RC_DR_)
	bP14 = 0,	bR5 = 1,	bP5 = 2,	bP4 = 3,	bR4 = 4,	b2D = 5,	bDP1 = 6,	b1D = 7,	
	_b1 = 8,	_b2 = 9,	bDP2 = 10,	b4A = 11,	b4F = 12,	b3A = 13,	b3F = 14,	bP18 = 15,
	bP13 = 16,	bR6 = 17,	bP6 = 18,	bP3 = 19,	bR3 = 20,	b2C = 21,	b2E = 22,	b1C = 23,
	b1E = 24,	bP0 = 25,	bS2d = 26,	b4B =27 ,	b4G = 28,	b3B = 29,	b3G = 30,	bP17 = 31,
	bP12 = 32,	bR7 = 33,	bP7 = 34,	bP2 = 35,	bR2 = 36,	b2B = 37,	b2G = 38,	b1B = 39,
	b1G = 40,	bP19 = 41,	bS1 = 42,	b4C = 43,	b4E = 44,	b3C = 45,	b3E = 46,	bP16 = 47,
	bP11 = 48,	bP9 = 49,	bP8 = 50,	bP1 = 51,	bR1 = 52,	b2A = 53,	b2F = 54,	b1A = 55,
	b1F = 56,	bP20 = 57,	bP10 = 58,	b4D = 59,	_b3 = 60,	b3D = 61, 	_b4 = 62,	bP15 = 63,
	g1 = 128, 	g2 = 129,	g3 = 130,	g4 = 131,
	g12 = 132,	g34 = 133,	g1234 = 134,	
#elif defined (_RC_DW_)
	bT3 = 0,	b3A = 1,	bT2 = 2,	b2A = 3,	bT1 = 4,	b1A = 5,	bT6 = 6,	bT8 = 7,
	bT11 = 8,	bT15 = 9,	bT19 = 10,	bT23 = 11,	bT26 = 12,	bT5 = 13,	b6A = 14,	bT4 = 15,	//	bP18 온수 -> bS2,
	b5A = 16,	g10 = 17,	b4A = 18,	b3B = 19,	b3F = 20,	b2B = 21,	b2F = 22,	b1B = 23,
	b1F = 24,	bT7 = 25,	bT9 = 26,	bT12 =27 ,	bT16 = 28,	bT20 = 29,	bT24 = 30,	bT27 = 31,	//	bP17 연소 -> bS5
	b6B = 32,	b6F = 33,	b5B = 34,	b5F = 35,	b4B = 36,	b4F = 37,	b3G = 38,	b3E = 39,
	b2G = 40,	b2E = 41,	b1G = 42,	b1E = 43,	g30 = 44,	bT10 = 45,	bT13 = 46,	bT17 = 47,	//	bP16 난방수 -> bS4
	bT21 = 48,	bT25 = 49,	bT28 = 50,	b6G = 51,	b6E = 52,	b5G = 53,	b5E = 54,	b4G = 55,
	b4E = 56,	b3C = 57,	b3D = 58,	b2C = 59,	b2D = 60,	b1C = 61, 	b1D = 62,	g40 = 63,
	bP1 = 64,	bT14 = 65,	bT18 = 66,	bT22 = 67,	bP2 = 68,	bT29 = 69,	b6C = 70,	b6D = 71,
	b5C = 72,	b5D = 73,	b4C = 74,	b4D = 75,	g1 = 128, 	g2 = 129,	g3 = 130,	g4 = 131,
	g12 = 132,	g34 = 133,	g1234 = 134,	
#elif defined (_RC_DW_VENT_)
/*
	bT34 = 0,	bT27 = 1,	bT22 = 2,	bT11 = 3,	b2A = 4,	bT9 = 5,	b1A = 6,	bT24 = 7,
	bT18 = 8,	bT19 = 9,	bT20 = 10,	bT12 = 11,	b4A = 12,	bT10 = 13,	b3A = 14,	bT8 = 15,	bT1 = 16,	
	
	bT33 = 17,	bT26 = 18,	bT21 = 19,	b2B = 20,	b2F = 21,	bT14 = 22,	bT15 = 23,	bT16 = 24,	
	b1B = 25,	b1F = 26,	bT28 = 27,	bT7 = 28,	bT2 = 29,	b3B = 30,	b3F = 31,	b4C = 32,	b4F = 33,	
	
	bT32 = 34,	bT25 = 35,	bT17 = 36,	b2G = 37,	b2E = 38,	b1G = 39,	b1E = 40,	bT29 = 41,	
	bP1 = 42,	bM = 43,	bP2 = 44,	b4G = 45,	b4E = 46,	b3G = 47,	b3E = 48,	bT6 = 49,	bT3 = 50,	
	
	bT31 = 51,	bT23 = 52,	bT13 = 53,	b2C = 54,	b2D = 55,	bS1 = 56,	bH = 57,	bS2 = 58,	
	b1C = 59,	b1D = 60,	bT30 = 61, 	bT5 = 62,	bT4 = 63,	b3C = 64,	b3D = 65,	b4B = 66,	b4D = 67,	

//
	b1A = 0,	bT9 = 1,	b2A = 2,	bT11 = 3,	bT22 = 4,	bT27 = 5,	bT34 = 6,	bT24 = 7,
	bT18 = 8,	bT19 = 9,	bT20 = 10,	bT12 = 11,	b4A = 12,	bT10 = 13,	b3A = 14,	bT8 = 15,	bT1 = 16,	
	
	b1F = 17,	b1B = 18,	b2F = 19,	b2B = 20,	bT21 = 21,	bT26 = 22,	bT33 = 23,	bT28 = 24,	
	bT14 = 25,	bT15 = 26,	bT16 =27 ,	b4B = 28,	b4F = 29,	b3B = 30,	b3F = 31,	bT7 = 32,	bT2 = 33,	
	
	b1E = 34,	b1G = 35,	b2E = 36,	b2G = 37,	bT17 = 38,	bT25 = 39,	bT32 = 40,	bT29 = 41,	
	bP1 = 42,	bM = 43,	bP2 = 44,	b4G = 45,	b4E = 46,	b3G = 47,	b3E = 48,	bT6 = 49,	bT3 = 50,	
	
	b1D = 51,	b1C = 52,	b2D = 53,	b2C = 54,	bT13 = 55,	bT23 = 56,	bT31 = 57,	bT30 = 58,	
	bS1 = 59,	bH = 60,	bS2 = 61, 	b4C = 62,	b4D = 63,	b3C = 64,	b3D = 65,	bT5 = 66,	bT4 = 67,	
	f1 = 68,	f2 = 69,	f3 = 70,	f4 = 71,

*/	//f1 = 68,	f2 = 69,	f3 = 70,	f4 = 71,
//
	bT34 = 0,	bT27 = 1,	bT22 = 2,	bT11 = 3,	b2A = 4,	bT9 = 5,	b1A = 6,	bT24 = 7,
	bT18 = 8,	bT19 = 9,	bT20 = 10,	bT12 = 11,	b4A = 12,	bT10 = 13,	b3A = 14,	bT8 = 15,	bT1 = 16,	
	
	bT33 = 17,	bT26 = 18,	bT21 = 19,	b2B = 20,	b2F = 21,	b1B = 22,	b1F = 23,	bT28 = 24,	
	bT14 = 25,	bT15 = 26,	bT16 =27 ,	b4B = 28,	b4F = 29,	b3B = 30,	b3F = 31,	bT7 = 32,	bT2 = 33,	
	
	bT32 = 34,	bT25 = 35,	bT17 = 36,	b2G = 37,	b2E = 38,	b1G = 39,	b1E = 40,	bT29 = 41,	
	bP1 = 42,	bM = 43,	bP2 = 44,	b4G = 45,	b4E = 46,	b3G = 47,	b3E = 48,	bT6 = 49,	bT3 = 50,	
	
	bT31 = 51,	bT23 = 52,	bT13 = 53,	b2C = 54,	b2D = 55,	b1C = 56,	b1D = 57,	bT30 = 58,	
	bS1 = 59,	bH = 60,	bS2 = 61, 	b4C = 62,	b4D = 63,	b3C = 64,	b3D = 65,	bT5 = 66,	bT4 = 67,	
	f1 = 68,	f2 = 69,	f3 = 70,	f4 = 71,
//
	//f5 = 72,	f6 = 73,	f7 = 74,	f8 = 75,	g1 = 128, 	g2 = 129,	g3 = 130,	g4 = 131,
	//g12 = 132,	g34 = 133,	g1234 = 134,	
#endif
	bEnd = 0
}	LF_DEF;

typedef struct tagUiInfo
{
	uint8_t enc;

	uint8_t	id_rc;
	uint8_t tCurr;

	uint8_t	cntlMode;	//	0 local, 1 Each 
	uint8_t	id;
	uint8_t	cnt;		//	roomC Count
	uint8_t	cnt_sub;		//	roomC Count
	uint8_t	opMode;		//	0 On, 1 Po, 2 2motor
	uint8_t	mode;		//	0 client, 1 host

	uint8_t	controlMode;	//	0 main, 1 sub
	uint8_t	valve;		//	valve count
	uint8_t	valve_sub;		//	valve count
	uint8_t	repeat;
	uint8_t	reserve;
	uint8_t	tSetup;
	
	uint8_t	poType;		//	0 xl, 1 pb, 2 pe
	uint8_t	houseCapa;	//	세대밸브 최대유량
	uint8_t	tOffset;	//	100, 1 for +/- 00 for 0.5 offset
	uint8_t	tempOffset;	//	tempe offset 60~100

	uint8_t	lpmType;	//	0, 8, 10, 15, 20, 25, 30
	uint8_t	lpmType_sub;	//	0, 8, 10, 15, 20, 25, 30
	
	uint8_t	valve_len[8];	//	coil length for valve
	uint8_t	valve_rc[8];	//	coil vs roomCntl
	uint8_t	valve_sub_len[8];	//	coil length for valve
	uint8_t	valve_sub_rc[8];	//	coil vs roomCntl
	
	uint8_t	tempCurr[8];
	uint8_t	tempSetup[8];
	uint8_t	remote_mode[8];
	uint8_t	remote_time[8];
	uint8_t	remote_banb[8];
	uint8_t subRCLock;
//	uint8_t	dispMode;	//	current operation mode
	
	uint8_t	relay;		//	0 - Nothing, 1 - Relay Control
//	uint8_t	_i[8];
	uint8_t	_t;
	
	uint8_t	_temp[4];	//	temp
	
//	uint8_t	m[8];
//	uint8_t	top;
//	uint8_t	cmd;
//	uint8_t	room[8];	//	coil length for valve
//	uint8_t	link[8];
//	uint8_t	maxValue;
//	uint8_t	runMode;
//	uint8_t	houseLen;
//	uint8_t	repeatA;
//	uint8_t	repeatB;
	uint8_t	plc;		//	plc, 0 Not Connected, else 1~7 Connected
	
	uint8_t	remote_t[8];
}	UIINFO;

typedef struct tagUiInfoSet
{
//	uint8_t tCurr;

	uint8_t	cntlMode;	//	0 local, 1 Each 
	uint8_t	id;
	uint8_t	cnt;		//	roomC Count
	uint8_t	cnt_sub;		//	roomC Count
	uint8_t	opMode;		//	0 On, 1 Po, 2 2motor
	uint8_t	mode;		//	0 client, 1 host

	uint8_t	controlMode;	//	0 main, 1 sub
	uint8_t	valve;		//	valve count
	uint8_t	valve_sub;		//	valve count
	
	uint8_t	poType;		//	0 xl, 1 pb, 2 pe
	uint8_t	houseCapa;	//	세대밸브 최대유량
	uint8_t	tOffset;	//	100, 1 for +/- 00 for 0.5 offset
	uint8_t	tempOffset;	//	tempe offset 60~100

	uint8_t	lpmType;	//	0, 8, 10, 15, 20, 25, 30
	uint8_t	lpmType_sub;	//	0, 8, 10, 15, 20, 25, 30
	
	uint8_t	valve_len[8];	//	coil length for valve
	uint8_t	valve_rc[8];	//	coil vs roomCntl
	uint8_t	valve_sub_len[8];	//	coil length for valve
	uint8_t	valve_sub_rc[8];	//	coil vs roomCntl
	uint8_t subRCLock;
//	uint8_t	dispMode;	//	current operation mode
	
	uint8_t	relay;		//	0 - Nothing, 1 - Relay Control
	uint8_t	_i[4];
//	uint8_t	_t;

	uint8_t	plc;		//	plc, 0 Not Connected, else 1~7 Connected
}	UIINFO_SET;

extern UIINFO_SET	uiInfoSet;
extern UIINFO	uiInfo;
extern CONST uint8_t	bLF_DEF[];
extern CONST uint8_t	iLF_DEF[];
extern CONST uint8_t	_rid[];

extern uint8_t	__error;

#define LCD_BIT_CLEAR(i)	LCD->RAM[iLF_DEF[(i)]] &= (uint8_t)(~bLF_DEF[(i)])
#define LCD_BIT_SET(i)		LCD->RAM[iLF_DEF[(i)]] |= (uint8_t)bLF_DEF[(i)]


#define LCD_FUNC_DEF(name)	void	name(void);


#define LCD_CLEAR_FUNC(name,size,buf)	\
		void	name(void)\
		{\
			uint8_t	i,j;\
			for(i=0; i<size; i++)\
			{\
				j = buf[i];\
				LCD_BIT_CLEAR(j);\
			}\
		}


#define LCD_DISP_FUNC(name,size,buf)	\
		void	name(void)\
		{\
			uint8_t	i, j;\
			lcd_clear_n();\
			for(i=0; i<size; i++)\
			{\
				j = buf[i];\
				LCD_BIT_SET(j);\
			}\
		}

#define LCD_DISP_FUNC_1(name,size,buf)	\
		void	name(void)\
		{\
			uint8_t	i, j;\
			for(i=0; i<size; i++)\
			{\
				j = buf[i];\
				LCD_BIT_SET(j);\
			}\
		}

#define ENC_MOVE(min,max,diff)	\
						if( (uiInfo.enc & 0x40) == 0 )\
						{\
							if( i<min )	i = max;\
							else\
								i -= diff;\
						}\
						else\
						{\
							if( i>max )	i = min;\
							else\
								i += diff;\
						}

#define ENC_MOVE_0(min,max,diff)	\
						if( (uiInfo.enc & 0x40) == 0 )\
						{\
							if( i<=min )	i = max;\
							else\
								i -= diff;\
						}\
						else\
						{\
							if( i>=max )	i = min;\
							else\
								i += diff;\
						}


LCD_FUNC_DEF(lcd_clear_backlight)
LCD_FUNC_DEF(lcd_clear_btn)
LCD_FUNC_DEF(lcd_clear_setup_runMode)
LCD_FUNC_DEF(lcd_clear_c)
LCD_FUNC_DEF(lcd_clear_n)
LCD_FUNC_DEF(lcd_clear_mode)
LCD_FUNC_DEF(lcd_clear_run)
LCD_FUNC_DEF(lcd_clear_rid)

LCD_FUNC_DEF(lcd_disp_backlight)
LCD_FUNC_DEF(lcd_disp_setup_lpm)
LCD_FUNC_DEF(lcd_disp_setup_temp_offset)

LCD_FUNC_DEF(lcd_disp_setup_po_type)
LCD_FUNC_DEF(lcd_disp_setup_po_type_xl)
LCD_FUNC_DEF(lcd_disp_setup_po_type_pe)
LCD_FUNC_DEF(lcd_disp_setup_po_type_pb)

LCD_FUNC_DEF(lcd_disp_setup_len)
LCD_FUNC_DEF(lcd_disp_setup_cntl_op)
LCD_FUNC_DEF(lcd_disp_setup_cntl_on)
LCD_FUNC_DEF(lcd_disp_setup_cntl_po)
LCD_FUNC_DEF(lcd_disp_setup_cntl_2motor)
LCD_FUNC_DEF(lcd_disp_setup_cntl_tab)

LCD_FUNC_DEF(lcd_disp_mir1)
LCD_FUNC_DEF(lcd_disp_mir2)
LCD_FUNC_DEF(lcd_disp_freset)

LCD_FUNC_DEF(lcd_disp_cnt_host)
LCD_FUNC_DEF(lcd_disp_cnt_sub)

LCD_FUNC_DEF(lcd_disp_plc)

LCD_FUNC_DEF(lcd_disp_setup_op)
//LCD_FUNC_DEF(lcd_disp_setup_runMode)
LCD_FUNC_DEF(lcd_disp_setup_link)
LCD_FUNC_DEF(lcd_disp_setup_maxValue)
LCD_FUNC_DEF(lcd_disp_setup_c)
LCD_FUNC_DEF(lcd_disp_setup_run)
LCD_FUNC_DEF(lcd_disp_setup_mode)
LCD_FUNC_DEF(lcd_clear_setup_cnt)
LCD_FUNC_DEF(lcd_disp_setup_id)
LCD_FUNC_DEF(lcd_disp_setup_m)
LCD_FUNC_DEF(lcd_disp_setup_cnt)
LCD_FUNC_DEF(lcd_disp_setup_valve)

LCD_FUNC_DEF(lcd_disp_setup_mode_local)
LCD_FUNC_DEF(lcd_disp_setup_mode_each)

void	lcd_disp_setup_mode_type(uint8_t mode);
void	lcd_clear(uint8_t type);
void	lcd_disp_n(uint8_t pos, uint8_t n);
void 	lcd_disp_err(uint8_t err);
void 	lcd_disp_rid(uint8_t id, uint8_t mode, uint8_t multi);
void	pc_cursor(void);
void	lcd_clear_npos(uint8_t pos, uint8_t type);

void	disp_status(uint8_t key);

void	lcd_blink_clear(void);
void	lcd_blink_clearRoom(void);

void	lcd_blink_item(uint8_t i);
void	lcd_blink_itemRoom(uint8_t i, uint8_t imode);

void	lcd_blinkCb(void);

void	lcd_clear_rid_n(uint8_t id, uint8_t mode);

//	ui2.c

void	ui_disp_temp_setup(uint8_t i);
void	ui_disp_temp_curr(uint8_t i);
void	ui_disp_temp_c(uint8_t i);
void	ui_disp_temp_mark(uint8_t i);
void	__ui_disp_temp_c(uint8_t i);
void	ui_disp_clear_tSetup(uint8_t i);
void	ui_disp_set_tSetup(uint8_t i);

void	ui_disp_repeat_setup(uint8_t i);
void	ui_disp_reserve_setup(uint8_t i);

void	lcd_disp_info_shower(uint8_t mode, uint8_t para);

void	lcd_disp_info_fire(uint8_t mode);
void	lcd_disp_info(uint8_t info, uint8_t mode, uint8_t multi);

void	lcd_blink_npos_clear(void);
void	lcd_blink_npos(uint8_t i);

void	lcd_disp_all(void);

//	uiMaster/uiClient.c

extern uint8_t	__s;
extern uint8_t	__sUp;
extern uint8_t	__sDn;
extern uint8_t	__sInfo;
extern uint8_t	__sRoom;

#define STATUS_CLIENT	if( uiInfo.mode==0 )	goto next;
#define	STATUS_NEXT(i)	{\
							_ds = (i);\
							_dsCount = 0;\
							_dsPrev = 0xff;\
						}

#define UI_DISP_2Digit(i)	{\
							lcd_disp_n(2, i/10);\
							lcd_disp_n(3, i%10);\
							}

#define UI_DISP_3Digit(i)	{\
							lcd_disp_n(1, i/100);\
							i = i%100;\
							lcd_disp_n(2, i/10);\
							lcd_disp_n(3, i%10);\
						}
						
void	disp_status_loop_host(uint8_t key);
void	disp_status_loop_client(uint8_t key);
void	ui_room_clear(uint8_t id, uint8_t mode);
void	ui_Open(void);

//
//	display status
extern uint8_t	_ds;
extern uint8_t _dsCount;
extern uint8_t	_dsPrev;
extern uint8_t _subRemote;

void	clear_npos1(void);
void	clear_npos2(void);
void	disp_status_init(uint8_t key, uint8_t next);
void	disp_status_id(uint8_t key, uint8_t next);
void	disp_status_cnt(uint8_t key, uint8_t next);
void	disp_status_meter(uint8_t key, uint8_t next, uint8_t prev);
void	disp_status_maxValve(uint8_t key, uint8_t next);
void	disp_status_toffset(uint8_t key, uint8_t next);
void	disp_status_backlight2(uint8_t key, uint8_t next);
void	disp_status_link(uint8_t key, uint8_t next, uint8_t prev);
void	disp_status_run_op(uint8_t key, uint8_t next);
void	disp_status_cntl_op(uint8_t key, uint8_t next);
void	disp_status_len(uint8_t key, uint8_t next);
void	disp_status_po_type(uint8_t key, uint8_t next);
void	disp_status_lpm(uint8_t key, uint8_t next);
void	disp_status_temp_offset(uint8_t key, uint8_t next);
void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev);
uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev);
void	disp_status_exit(uint8_t key, uint8_t next);
void	disp_status_loop_message(uint8_t i);
void	disp_status_loop_messageDn(uint8_t i);
uint8_t	disp_status_loop_host_N(uint8_t key);
uint8_t	disp_status_loop_host_Y(uint8_t key);
uint8_t	disp_status_loop_host_B(uint8_t key);
void	disp_status_loop_init(void);
void	disp_status_curr_only(void);
void	disp_status_loop_clientDn(uint8_t key);
void	disp_status_op_disp(uint8_t key, uint8_t next);
void	disp_status_2nd(uint8_t key, uint8_t next);

//	defined uiMaster.c
extern uint8_t	_disp_mode;
extern uint8_t	_disp_mode2;

//	dev_keyin.c
extern uint8_t	_key_sec;
extern uint8_t	_key_min;
extern uint8_t	_key_hour;

extern uint8_t	_key_blink;

#define KEY_BLINK_FADE		10
#define KEY_BOILER_FADE		10

void	disp_set_cmd(uint8_t cmd, uint8_t para);

//	
#define BIT_REPEAT			0x01
#define BIT_RESERVE			0x02
#define BIT_TSETUP			0x04
#define BIT_DISPMODE		0x08
/*
	OFFSET 8 -> 4 
	2015.9.20 by heedop
 */
#define _B					8

#define FW_CNTLMODE(i)		file_write(_B+0, i)		//	local/each
#define FW_MODE(i)			file_write(_B+1, i)		//	client/host
#define FW_ID(i)			file_write(_B+2, i)		//	id
#define FW_CNT(i)			file_write(_B+3, i)		//	cnt
#define FW_OPMODE(i)		file_write(_B+4, i)		//	opMode
#define FW_CNT_MODE(i)		file_write(_B+5, i)		//	controlMode
#define FW_VALVE(i)			file_write(_B+6, i)		//	valve
#define FW_REPEAT(i)		file_write(_B+7, i)		//	repeat		+1
#define FW_RESERVE(i)		file_write(_B+8, i)		//	reserve		+2
#define FW_TSETUP(i)		file_write(_B+9, i)		//	setup		+3
#define FW_POTYPE(i)		file_write(_B+10, i)	//	potype
#define FW_HOUSECAPA(i)		file_write(_B+11, i)	//	houseCapa
#define FW_TOFFSET(i)		file_write(_B+12, i)	//	tOffset	

#define FW_VL_1(i)			file_write(_B+13, i)	//	valve len	
#define FW_VL_2(i)			file_write(_B+14, i)	//	valve len	
#define FW_VL_3(i)			file_write(_B+15, i)	//	valve len	
#define FW_VL_4(i)			file_write(_B+16, i)	//	valve len	
#define FW_VL_5(i)			file_write(_B+17, i)	//	valve len	
#define FW_VL_6(i)			file_write(_B+18, i)	//	valve len	
#define FW_VL_7(i)			file_write(_B+19, i)	//	valve len	
#define FW_VL_8(i)			file_write(_B+20, i)	//	valve len	

#define FW_VRC_1(i)			file_write(_B+21, i)	//	valve rc
#define FW_VRC_2(i)			file_write(_B+22, i)	//	valve rc
#define FW_VRC_3(i)			file_write(_B+23, i)	//	valve rc
#define FW_VRC_4(i)			file_write(_B+24, i)	//	valve rc
#define FW_VRC_5(i)			file_write(_B+25, i)	//	valve rc
#define FW_VRC_6(i)			file_write(_B+26, i)	//	valve rc
#define FW_VRC_7(i)			file_write(_B+27, i)	//	valve rc
#define FW_VRC_8(i)			file_write(_B+28, i)	//	valve rc

#define FW_B_SHOWER(i)		file_write(_B+29, i)	//	boiler water
#define FW_B_HEAT(i)			file_write(_B+30, i)	//	boiler heat
#define FW_TEMPOFFSET(i)	file_write(_B+31, i)	//	temp offset
#define FW_LPM(i)					file_write(_B+32, i)	//	lpm
#define FW_DISPMODE(i)		file_write(_B+33, i)	//	dispMode

#define FW_BACKLIGHT(i)		file_write(_B+34, i)	//	backlight

#define FW_CNT_SUB(i)			file_write(_B+35, i)		//	cnt
#define FW_VALVE_SUB(i)		file_write(_B+36, i)		//	valve
#define FW_LPM_SUB(i)			file_write(_B+37, i)	//	lpm

#define FW_VL_1_SUB(i)			file_write(_B+38, i)	//	valve len	
#define FW_VL_2_SUB(i)			file_write(_B+39, i)	//	valve len	
#define FW_VL_3_SUB(i)			file_write(_B+40, i)	//	valve len	
#define FW_VL_4_SUB(i)			file_write(_B+41, i)	//	valve len	
#define FW_VL_5_SUB(i)			file_write(_B+42, i)	//	valve len	
#define FW_VL_6_SUB(i)			file_write(_B+43, i)	//	valve len	
#define FW_VL_7_SUB(i)			file_write(_B+44, i)	//	valve len	
#define FW_VL_8_SUB(i)			file_write(_B+45, i)	//	valve len	

#define FW_VRC_1_SUB(i)			file_write(_B+46, i)	//	valve rc
#define FW_VRC_2_SUB(i)			file_write(_B+47, i)	//	valve rc
#define FW_VRC_3_SUB(i)			file_write(_B+48, i)	//	valve rc
#define FW_VRC_4_SUB(i)			file_write(_B+49, i)	//	valve rc
#define FW_VRC_5_SUB(i)			file_write(_B+50, i)	//	valve rc
#define FW_VRC_6_SUB(i)			file_write(_B+51, i)	//	valve rc
#define FW_VRC_7_SUB(i)			file_write(_B+52, i)	//	valve rc
#define FW_VRC_8_SUB(i)			file_write(_B+53, i)	//	valve rc

#define FW_PLC(i)				file_write(_B+54, i)	//	plc
//#define FW_DISPMODE(i)		file_write(_B+33, i)	//	dispMode
//
#if defined (_RC_SETUP_)

#define _B_SETUP	(_B+54)
#define FW_SETUP_LAST(i)		file_write(_B_SETUP, i)
#define FW_GET_SETUP_LAST		file_read(_B_SETUP)

#endif

#define FW_GET_CNTLMODE		file_read(_B+0)
#define FW_GET_MODE			file_read(_B+1)
#define FW_GET_ID			file_read(_B+2)
#define FW_GET_CNT			file_read(_B+3)
#define FW_GET_OPMODE		file_read(_B+4)
#define FW_GET_CNT_MODE		file_read(_B+5)
#define FW_GET_VALVE		file_read(_B+6)
#define FW_GET_REPEAT		file_read(_B+7)
#define FW_GET_RESERVE		file_read(_B+8)
#define FW_GET_TSETUP		file_read(_B+9)
#define FW_GET_POTYPE		file_read(_B+10)
#define FW_GET_HOUSECAPA	file_read(_B+11)
#define FW_GET_TOFFSET		file_read(_B+12)

#define FW_GET_VL_1			file_read(_B+13)	//	valve len	
#define FW_GET_VL_2			file_read(_B+14)	//	valve len	
#define FW_GET_VL_3			file_read(_B+15)	//	valve len	
#define FW_GET_VL_4			file_read(_B+16)	//	valve len	
#define FW_GET_VL_5			file_read(_B+17)	//	valve len	
#define FW_GET_VL_6			file_read(_B+18)	//	valve len	
#define FW_GET_VL_7			file_read(_B+19)	//	valve len	
#define FW_GET_VL_8			file_read(_B+20)	//	valve len	

#define FW_GET_VRC_1		file_read(_B+21)	//	valve rc
#define FW_GET_VRC_2		file_read(_B+22)	//	valve rc
#define FW_GET_VRC_3		file_read(_B+23)	//	valve rc
#define FW_GET_VRC_4		file_read(_B+24)	//	valve rc
#define FW_GET_VRC_5		file_read(_B+25)	//	valve rc
#define FW_GET_VRC_6		file_read(_B+26)	//	valve rc
#define FW_GET_VRC_7		file_read(_B+27)	//	valve rc
#define FW_GET_VRC_8		file_read(_B+28)	//	valve rc

#define FW_GET_B_SHOWER		file_read(_B+29)	//	boiler water
#define FW_GET_B_HEAT		file_read(_B+30)	//	boiler heat
#define FW_GET_TEMPOFFSET	file_read(_B+31)	//	temp offset
#define FW_GET_LPM			file_read(_B+32)	//	lpm
#define FW_GET_DISPMODE		file_read(_B+33)	//	dispMode

#define FW_GET_BACKLIGHT	file_read(_B+34)	//	backlight

#define FW_GET_CNT_SUB			file_read(_B+35)		//	cnt
#define FW_GET_VALVE_SUB		file_read(_B+36)		//	valve
#define FW_GET_LPM_SUB			file_read(_B+37)	//	lpm

#define FW_GET_VL_1_SUB			file_read(_B+38)	//	valve len	
#define FW_GET_VL_2_SUB			file_read(_B+39)	//	valve len	
#define FW_GET_VL_3_SUB			file_read(_B+40)	//	valve len	
#define FW_GET_VL_4_SUB			file_read(_B+41)	//	valve len	
#define FW_GET_VL_5_SUB			file_read(_B+42)	//	valve len	
#define FW_GET_VL_6_SUB			file_read(_B+43)	//	valve len	
#define FW_GET_VL_7_SUB			file_read(_B+44)	//	valve len	
#define FW_GET_VL_8_SUB			file_read(_B+45)	//	valve len	

#define FW_GET_VRC_1_SUB			file_read(_B+46)	//	valve rc
#define FW_GET_VRC_2_SUB			file_read(_B+47)	//	valve rc
#define FW_GET_VRC_3_SUB			file_read(_B+48)	//	valve rc
#define FW_GET_VRC_4_SUB			file_read(_B+49)	//	valve rc
#define FW_GET_VRC_5_SUB			file_read(_B+50)	//	valve rc
#define FW_GET_VRC_6_SUB			file_read(_B+51)	//	valve rc
#define FW_GET_VRC_7_SUB			file_read(_B+52)	//	valve rc
#define FW_GET_VRC_8_SUB			file_read(_B+53)	//	valve rc

#define FW_GET_PLC				file_read(_B+54)	//	plc

extern uint8_t	_updateTimer;
extern uint8_t	_updateBit;
extern uint8_t	_updateCount;

#define UPDATE_BIT(i)	{\
				_updateBit |= i;\
				_updateTimer = __timer1s;\
				_updateCount = 5;\
				}
				
void	file_update2(uint8_t i);
void	disp_backlight(uint8_t mode);

#define _GOTO(i)	{	__sUp=i; _dsCount=10; }
#define _GOTO2(i,j)	{ _GOTO(i);	__sDn=j; }
#if defined (_RC_DW_VENT_)
#define _UP			{	uiInfo.enc = 0x40;	}
#define _DN			{	uiInfo.enc = 1;	}
#else
#define _UP			{	uiInfo.enc = 1;	}
#define _DN			{	uiInfo.enc = 0x40;	}
#endif

#define _NOT_DEF_	;
#define _NOT_KEY_	;

#define EXIT_HOST(i)	__s = 0;\
						_dsCount = 0;\
						_dsPrev = 0xff;\
						lcd_blink_clear();\
						lcd_disp_info(__sInfo, 1, 0);

#define EXIT_HOST2(i)	__s = 0;\
						__sUp = i;\
						_dsCount = 10;\
						_dsPrev = 0xff;\
						lcd_blink_clear();\
						lcd_disp_info(__sInfo, 1, 0);

#define EXIT_HOST3(i)	__s = 0;\
						__sDn = i;\
						_dsCount = 11;\
						_dsPrev = 0xff;\
						lcd_blink_clear();\
						lcd_disp_info(__sInfo, 1, 0);

#define REMOTE_EXIT		\
						if( __sRoom == uiInfo.id_rc )\
						{\
							_remote = 0;\
							__s = 0;\
							return;\
						}

#define _B_CNTL(i)	_disp_status_loop_host_boiler(i);
extern void	_disp_status_loop_host_boiler(uint8_t id);
extern uint8_t	__boiler_shower[];
extern uint8_t	_boiler_water_shower;
extern uint8_t	_boiler_water_heat;
extern void lcd_disp_rid_hw(uint8_t id, uint8_t t);

#endif
