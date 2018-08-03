// hello
#include "stdafx.h"
#include "rc_protocol.h"
#include "uidef.h"


_RCINFO	_rcInfo;

_LPRCINFO	get_rcInfo(void)
{
	return &_rcInfo;
}

void	rcInfoSet(uint8_t id, uint8_t temp)
{
	_LPRCINFO	p = get_rcInfo();
	//	DAERIM
	p->out_temp = temp;
	p->type = id;
}

#define 	BYTE_START_CNT_NORMAL 			0x70
#define 	BYTE_START_SUB_CNT_NORMAL 	0x90
#define 	BYTE_START_CNT_SETTING 			0x30
#define 	BYTE_START_CNT_MIRROR 			0x20

#define 	BYTE_START_RC_NORMAL 				0xF0
#define 	BYTE_START_RC_MIRROR 				0x40
#define 	BYTE_START_RC_SETTING 			0x50
#define 	BYTE_START_RC_SUBRC 				0x60
#define 	BYTE_START_RC_ERROR 				0xE0

#define 	MAX_REPEAT_TIME							90
#define 	RESERVE_TIME_RATE						30
#define 	MAX_SETTING_PAGE						3
#define 	MAX_REPEAT_ERROR_COUNT			5
#define 	MAX_REPEAT_TEMP							0x50

#define 	MODE_REPEAT_TIME						0x5A

extern uint8_t	_remote;
extern uint8_t	_timFlag;
extern uint8_t	_disp_mode2;
extern uint8_t	_boiler_water_shower;
extern uint8_t	_boiler_type;
extern uint8_t	_boiler_water_heat;
extern uint8_t	_boiler_fire;
extern uint8_t	packet_buf[];
extern uint8_t _backup_backlight;
uint8_t state_check;

uint8_t debug_hn = 0;
uint8_t debug_br = 0;

uint8_t error; // error 발생
uint8_t error_type;
uint8_t _version;

uint8_t mode_mirror;
uint8_t mode_factory;
uint8_t mode_recover;
uint8_t mode_hotwater;
uint8_t mode_reset;

uint8_t cur_set_page;
uint8_t cur_mirror_page;

uint8_t packet_changed;
uint8_t test_count;
uint8_t _rcLED;
uint8_t disp_mode_preview;
//TIMEINFO timeInfo;
RCSUBDATAINFO rcSubDataInfo;
BOILERINFO boiler_info;

uint8_t set_changed;
uint8_t ret_count;
uint8_t cur_src;
uint8_t dr_mode_out = 1;

uint8_t only_one = 0;      // 2015.10.29 한번 응답을 위한 수정

void func_rc_settingCb(uint8_t ch);

uint8_t getHexToBin(uint8_t hex, uint8_t idx)
{
	uint8_t p = 0x80;
	p = p >> (0x08 - (idx + 0x01));

	if (hex & p)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

void rc_ptc_baseSet(void) {
	uint8_t i;
	state_check = RC_STATE_NORMAL;
	set_changed = 0;
	
	for (i = 0 ; i < 8 ; i++) {
		rcSubDataInfo.mode_heat[i] = 0xAA;
		rcSubDataInfo.cur_temp[i] = 0xAA;
		rcSubDataInfo.set_temp[i] = 0xAA;
		rcSubDataInfo.time[i] = 0xAA;
		rcSubDataInfo.banb[i] = 0xAA;
	}
}

void rc_ptc_check_master(uint8_t *buf) {
	if (buf[1] != 0x00) {
		return;
	}
	
	if ((buf[0] & 0x0F) >> 4 == 0x09) {
		return;
	}
	
	if (getHexToBin(buf[6], 7) == 1) {  // H/N 패킷
		return;
	}
	
	boiler_info.state = buf[4] & 0x03;
	boiler_info.hotwater = buf[2];
	boiler_info.heatwater = buf[3];
	
	uiInfo.cntlMode = getHexToBin(buf[4], 7);
	
	_boiler_fire = boiler_info.state;
	
}

//hn 요청시
void rc_ptc_check_homenet(uint8_t *buf) {
	_LPRCINFO	p = get_rcInfo();
	uint8_t id;
	uint8_t out_mode;
	
	if (getHexToBin(buf[6], 7) == 0) { // 일반 패킷
		return;
	}
	
	id = buf[1] & 0x0F;
	
	if (id != uiInfo.id) {
		return;
	}
	
	packet_changed = 1;
	
	if (_remote == 0) {
		_disp_mode2 = buf[2];
		
		if (buf[2] == RC_MODE_HEAT) {
			if (buf[3] != 0xFF) {
				uiInfo.tSetup = buf[3];
			}
		} else if (buf[2] == RC_MODE_OUT) {
			out_mode = (buf[4] & 0xF0) >> 7;
			uiInfo.tSetup = /*buf[3];//20*/p->out_temp;
			if (out_mode == 1) {
				dr_mode_out = 1;   // 개별외출
			} else {
				dr_mode_out = 0;   // 전체 외출
			}
		}	//	STOP
		else if( buf[2] == RC_MODE_STOP )
		{
			out_mode = 1;
		}
	}
}

//제어기 요청시
//	20160909 for max rc#
uint8_t	__rc_max = 1;
uint8_t	__rc_s = 0;

void rc_ptc_check_normal(uint8_t *buf) {
	uint8_t start = buf[0] & 0x0F;
#if defined (_RC_DW_VENTI_)
	uint8_t	cmd, para;
	LPVENTINFO	lp = vent_getInfo();
#endif
	
	if (start == 0x0F) {
		state_check = RC_STATE_FACTORY;
		return;
	}
	
	if (start == 0x01 || start == 0x09) {
		only_one = 0;
	}
	//	for max rc#
	//if( start <= 0x08 )
	//{
	//	if( start > __rc_max )
	//		__rc_max = start;
	//}
	if( __rc_s == 0 )
	{
		__rc_s = start==1 ? 1 : 0;
		if( start==9 )	__rc_max = 1;
	}
	else if( __rc_s == 1 )
	{
		__rc_s = start==2 ? 2 : 0;
		if( start==9 )	__rc_max = 1;
	}
	else if( __rc_s == 2 )
	{
		__rc_s = start==3 ? 3 : 0;
		if( start==9 )	__rc_max = 2;
	}
	else if( __rc_s == 3 )
	{
		__rc_s = start==4 ? 4 : 0;
		if( start==9 )	__rc_max = 3;
	}
	else if( __rc_s == 4 )
	{
		__rc_s = start==5 ? 5 : 0;
		if( start==9 )	__rc_max = 4;
	}
	else if( __rc_s == 5 )
	{
		__rc_s = start==6 ? 6 : 0;
		if( start==9 )	__rc_max = 5;
	}
	else if( __rc_s == 6 )
	{
		__rc_s = start==7 ? 7 : 0;
		if( start==9 )	__rc_max = 6;
	}
	else if( __rc_s == 7 )
	{
		__rc_s = start==8 ? 8 : 0;
		if( start==9 )	__rc_max = 7;
	}
	else if( __rc_s == 8 )
	{
		
		if( start==9 )	__rc_max = 7;
	}
	//
	if( start==9 )
	{
		__rc_s = 0;
	}
	
	if (start == uiInfo.id) {
		packet_buf[start - 1] = 0;
		state_check = RC_STATE_NORMAL;
	} else {
		state_check = RC_STATE_NONE;
	}
	
	if (start == 0x09 ) {
		debug_hn = buf[2];
		debug_br = buf[1];
		/*
		 *	venti
		 */
#if defined (_RC_DW_VENTI_)
		cmd = buf[3];
		para = buf[4];
		if( cmd == 0x01 )
		{
			//	update venti
			lp->speed = (para&0x0f);
			if( (para&0xf0) == 0xf0 )
			{
				lp->err_clear = 1;
			}
		}
#endif
		return;
	}
	
	if (uiInfo.mode == SETTING_MODE_MASTER) {
		rc_ptc_check_master(buf);
	}
	
	if ( _remote == 0 && _backup_backlight == 0) {
		if (getHexToBin(buf[6], 7) == 0) {
			_rcLED = buf[1];
			
			if (getHexToBin(buf[1], uiInfo.id - 1) == 1) {
#if defined (_RC_WD_)
				D_IO_LOW(D_LED_PORT, D_LED_PIN);
#endif
#ifndef _CNTL_
				lcd_disp_rid(uiInfo.id, 1, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
#endif

#if defined (_RC_DW_)
				lcd_disp_rid_hw(uiInfo.id, 1);
#endif
			} else {
#if defined (_RC_WD_)
				D_IO_HIGH(D_LED_PORT, D_LED_PIN);
#endif
#ifndef _CNTL_
				lcd_disp_rid(uiInfo.id, 0, (uiInfo.mode == SETTING_MODE_MASTER) ? 1 : 0);
#endif

#if defined (_RC_DW_)
				lcd_disp_rid_hw(uiInfo.id, 0);
#endif
			}
		}
	}

	rc_ptc_check_homenet(buf);
	
	_version = buf[6] >> 1;
	
	if (mode_recover == 0) {
		error_type = (buf[4] & 0x0F) >> 2;
		
		if (error_type != 0) {
			error = buf[5];
		} else {
			error = 0;
		}
	} else {
		if (((buf[4]& 0x0F) >> 2) == 0 && buf[5] == 0) {
			error_type = 0;
			error = 0;
			mode_recover = 0;
		}
	}
	
//	if (error != 0x00) {
//		DISP("1111", 4);
//	}
}

// 설정 모드로 응답시
void rc_ptc_check_setting(uint8_t *buf) {
	uint8_t page = buf[0] & 0x0F;
	
	if (uiInfo.mode != SETTING_MODE_MASTER) {
		return;
	}
	
	state_check = RC_STATE_SETTING;
	
	if (cur_set_page == page) {
		cur_set_page++;
	}
		
	if (cur_set_page == MAX_SETTING_PAGE) { 
		set_changed = 0;
		cur_set_page = 0;
		
		func_rc_settingCb(1);
		state_check = RC_STATE_NORMAL;
	} else {
		func_rc_settingCb(0);
	}
}

// 각 룸콘이 응답시
void rc_ptc_check_rc(uint8_t *buf) {
	uint8_t k;
	uint8_t st;
	
	st = (buf[0] & 0x0F) - 1;
	
	if (uiInfo.mode != SETTING_MODE_MASTER) {
		if (st == 0) {
			if (buf[1] == RC_MODE_OUT && (buf[5] & 0x01)  == 0) {
				_disp_mode2 = RC_MODE_OUT;
				dr_mode_out = 0;
				
#if defined (_RC_DR_)										  
// 2015.10.26 대림 : All out + each return
				dr_mode_out = 1;
#endif
			}
			
			if (dr_mode_out == 0) {
				if (_disp_mode2 == RC_MODE_OUT) {
					if (buf[1] != RC_MODE_OUT) {
						packet_changed = 1;
						dr_mode_out = 1;
						_disp_mode2 = FW_GET_DISPMODE;
					} else { 
						if((buf[5] & 0x01) != 0)  {
							packet_changed = 1;
							dr_mode_out = 1;
							_disp_mode2 = FW_GET_DISPMODE;
						}
					}
				}
			}
		}
		return;
	}
	
	k = 0;
	
	packet_buf[st] = 0;
	
	if (_remote == 0) {
		if (rcSubDataInfo.mode_heat[st] == 0xFF) {
			if (uiInfo.remote_mode[st] != buf[1]) {
				k = 1;
			} else {
				
				switch (buf[1]) {
					case RC_MODE_HEAT:
						if (uiInfo.tempSetup[st] != buf[3]) {
							k = 1;
						}
						break;
					case RC_MODE_OUT:
						break;
					case RC_MODE_STOP:
						break;
					case RC_MODE_RESERVE:
						if (uiInfo.remote_time[st] != buf[5]) {
							k = 1;
						}
						break;
					case RC_MODE_REPEAT:
						if (uiInfo.remote_banb[st] != buf[5]) {
							k = 1;
						}
						break;
				}
			}
			
			if (k == 1) {
				return;
			}
		}			
		
		rcSubDataInfo.mode_heat[st] = buf[1];
		rcSubDataInfo.cur_temp[st] = buf[2];
		
		uiInfo.remote_mode[st] = buf[1];
		uiInfo.tempCurr[st] = buf[2];
		
		switch (buf[1]) {
			case RC_MODE_HEAT:
				rcSubDataInfo.set_temp[st] = buf[3];
				uiInfo.tempSetup[st] = buf[3];
				break;
			case RC_MODE_OUT:
				break;
			case RC_MODE_STOP:
				break;
			case RC_MODE_RESERVE:
				rcSubDataInfo.time[st] = buf[5];
				uiInfo.remote_time[st] = buf[5];
				break;
			case RC_MODE_REPEAT:
				rcSubDataInfo.banb[st] = buf[5];
				uiInfo.remote_banb[st] = buf[5];
				break;
		}
		
		disp_char(uiInfo.remote_mode[st]);
//		DISP("\r\n", 2);
		
	} else {
		rcSubDataInfo.mode_heat[st] = 0xFF;
		rcSubDataInfo.cur_temp[st] = buf[2];
		rcSubDataInfo.set_temp[st] = 0xFF;
		rcSubDataInfo.time[st] = 0xFF;
		rcSubDataInfo.banb[st] = 0xFF;
	}
}

// 마스터 룸콘에서 서브룸콘 조절
void rc_ptc_check_subrc(uint8_t *buf) {
	uint8_t start = buf[0] & 0x0F;
	
	state_check = RC_STATE_NONE;
	
	if (uiInfo.mode == SETTING_MODE_MASTER) {
		return;
	}
	
	if (start != uiInfo.id) {
		return;
	}
	
	packet_changed = 1;	
	_disp_mode2 = buf[1];
	
	switch(_disp_mode2)
	{
	case RC_MODE_HEAT:		uiInfo.tSetup = buf[3];	break;
	case RC_MODE_RESERVE:	uiInfo.reserve = buf[5];	break;
	case RC_MODE_REPEAT:	uiInfo.repeat = buf[5];	break;
	}
}

void rc_ptc_check_mirror(uint8_t *buf) {
	uint8_t mode;
	uint8_t page;
	uint8_t i;
	
	state_check = RC_STATE_NONE;
	
	if (uiInfo.mode != SETTING_MODE_MASTER) {
		return;
	}
	
	page = buf[0] & 0x0F;
	cur_mirror_page = page;
	state_check = RC_STATE_MIRROR;
	
	switch(page) {
		case 0:
			mode = (buf[6] & 0x80) >> 7;
			if (mode == CNT_MODE_MAIN) {
				_boiler_type = (buf[1] & 0x80) >> 7;
				uiInfo.lpmType = (buf[1] & 0x0F);
				uiInfo.cnt = (buf[2] & 0x70) >> 4;
				uiInfo.valve = buf[2] & 0x0F;
				_boiler_water_shower = buf[3];
				uiInfo.houseCapa = buf[4];
				_boiler_water_heat = buf[5] ;
				uiInfo.controlMode = mode;
				uiInfo.subRCLock = (buf[6] & 0x40) >> 6 ;
				uiInfo.poType = (buf[6] & 0x30) >> 4;
				uiInfo.cntlMode = (buf[6] & 0x08) >> 3;
				uiInfo.opMode = buf[6] & 0x07;
			} else {
				uiInfo.lpmType_sub = (buf[1] & 0x0F);
				uiInfo.cnt_sub = (buf[2] & 0xF0) >> 4;
				uiInfo.valve_sub = buf[2] & 0x0F;
			}
			break;
		case 1:
			mode = (buf[1] & 0x80) >> 7;
			if (mode == CNT_MODE_MAIN) {
				uiInfo.valve_rc[0] = (buf[1] & 0x70) >> 4;
				uiInfo.valve_rc[1] = buf[1] & 0x07;
				uiInfo.valve_rc[2] = (buf[2] & 0x70) >> 4;
				uiInfo.valve_rc[3] = buf[2] & 0x07;
				
				uiInfo.valve_len[0] = buf[3];
				uiInfo.valve_len[1] = buf[4];
				uiInfo.valve_len[2] = buf[5];
				uiInfo.valve_len[3] = buf[6];
			} else {
				uiInfo.valve_sub_rc[0] = (buf[1] & 0x70) >> 4;
				uiInfo.valve_sub_rc[1] = buf[1] & 0x07;
				uiInfo.valve_sub_rc[2] = (buf[2] & 0x70) >> 4;
				uiInfo.valve_sub_rc[3] = buf[2] & 0x07;
				
				uiInfo.valve_sub_len[0] = buf[3];
				uiInfo.valve_sub_len[1] = buf[4];
				uiInfo.valve_sub_len[2] = buf[5];
				uiInfo.valve_sub_len[3] = buf[6];

				for (i = 0 ; i < 4 ; i++) {
					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
						uiInfo.valve_sub_rc[i] = 8;
					}
				}
			}
			break;
		case 2:
			mode = (buf[1] & 0x80) >> 7;
			if (mode == CNT_MODE_MAIN) {
				uiInfo.valve_rc[4] = (buf[1] & 0x70) >> 4;
				uiInfo.valve_rc[5] = buf[1] & 0x07;
				uiInfo.valve_rc[6] = (buf[2] & 0x70) >> 4;
				uiInfo.valve_rc[7] = buf[2] & 0x07;
				
				uiInfo.valve_len[4] = buf[3];
				uiInfo.valve_len[5] = buf[4];
				uiInfo.valve_len[6] = buf[5];
				uiInfo.valve_len[7] = buf[6];
			} else {
				uiInfo.valve_sub_rc[4] = (buf[1] & 0x70) >> 4;
				uiInfo.valve_sub_rc[5] = buf[1] & 0x07;
				uiInfo.valve_sub_rc[6] = (buf[2] & 0x70) >> 4;
				uiInfo.valve_sub_rc[7] = buf[2] & 0x07;
				
				uiInfo.valve_sub_len[4] = buf[3];
				uiInfo.valve_sub_len[5] = buf[4];
				uiInfo.valve_sub_len[6] = buf[5];
				uiInfo.valve_sub_len[7] = buf[6];
				
				for (i = 4 ; i < 8 ; i++) {
					if (uiInfo.valve_sub_rc[i] == 0 && uiInfo.valve_sub_len[i] != 0) {
						uiInfo.valve_sub_rc[i] = 8;
					}
				}
			}
			break;
	}
}

void rc_ptc_check(uint8_t *buf) {
	uint8_t start;
	start = buf[0] & 0xF0;
	
	switch(start) {
		case BYTE_START_CNT_NORMAL:
			rc_ptc_check_normal(buf);
			break;
		case BYTE_START_CNT_SETTING:
			rc_ptc_check_setting(buf);
			break;
		case BYTE_START_RC_NORMAL:
			rc_ptc_check_rc(buf);
			break;
		case BYTE_START_RC_SUBRC:
			rc_ptc_check_subrc(buf);
			break;
		case BYTE_START_CNT_MIRROR:
			rc_ptc_check_mirror(buf);
			break;
		default:
			state_check = RC_STATE_ERROR;
			disp_char(buf[0]);
//			DISP("#error\r\n", 8);
			break;
	}
}
 /////////////////////////////////////////////////////////////////////////////////
void setSettingChange(uint8_t ch) {
	set_changed = ch;
}

uint8_t getSettingChange(void) {
	return set_changed;
}

uint8_t getState_check(void) {
	return state_check;
}

void setState_check(uint8_t st) {
	state_check = st;
}

void makeChecksum(uint8_t *buf) {
	uint8_t i;
	uint8_t s;
	uint8_t j;
	
	s = 0;
	for (i = 0 ; i < 7 ; i++) {
		s += buf[i];
	}
	buf[7] = s;
	
//	for( j=0; j<8; j++ )
//		disp_char(buf[j]);
//		
//	DISP("\r\n", 2);
}

void rc_ptc_make_baseSetting(uint8_t *buf, uint8_t page, uint8_t mode) {
	switch (page) {
		case 0:
			if (mode == CNT_MODE_MAIN) {
				buf[1] = (_boiler_type << 7)
									| ((uiInfo.plc & 0x07) << 4)
									| (uiInfo.lpmType);
				buf[2] = ((uiInfo.relay & 0x01) << 7) 
									| ((uiInfo.cnt & 0x07) << 4) 
									| (uiInfo.valve & 0x0F);
				buf[3] = _boiler_water_shower;
				buf[4] = uiInfo.houseCapa;
				buf[5] = _boiler_water_heat;
				buf[6] = 	(mode << 7) 
									| (uiInfo.subRCLock << 6) 
									| ((uiInfo.poType & 0x01) << 4) 
									| ((uiInfo.cntlMode & 0x01) << 3) 
									| uiInfo.opMode;
			} else {
				buf[1] = (_boiler_type << 7) 
									| (uiInfo.lpmType_sub);
				buf[2] = ((uiInfo.relay & 0x01) << 7) 
									| ((uiInfo.cnt_sub & 0x07) << 4) 
									| (uiInfo.valve_sub & 0x0F);
				buf[3] = _boiler_water_shower;
				buf[4] = uiInfo.houseCapa;
				buf[5] = _boiler_water_heat;
				buf[6] = 	(mode << 7) 
									| (uiInfo.subRCLock << 6) 
									| ((uiInfo.poType & 0x01) << 4) 
									| ((uiInfo.cntlMode & 0x01) << 3) 
									| uiInfo.opMode;
			}
		break;
		case 1:
			if (mode == CNT_MODE_MAIN) {
				buf[1] = mode << 7 
							 | (uiInfo.valve_rc[0] << 4)
							 | mode << 3 
							 | uiInfo.valve_rc[1];
				buf[2] = mode << 7 
							 | (uiInfo.valve_rc[2] << 4)
							 | mode << 3 
							 | uiInfo.valve_rc[3];
				buf[3] = uiInfo.valve_len[0];
				buf[4] = uiInfo.valve_len[1];
				buf[5] = uiInfo.valve_len[2];
				buf[6] = uiInfo.valve_len[3];
			} else {
				buf[1] = mode << 7 
							 | (uiInfo.valve_sub_rc[0] << 4)
							 | mode << 3 
							 | uiInfo.valve_sub_rc[1];
				buf[2] = mode << 7 
							 | (uiInfo.valve_sub_rc[2] << 4)
							 | mode << 3 
							 | uiInfo.valve_sub_rc[3];
				buf[3] = uiInfo.valve_sub_len[0];
				buf[4] = uiInfo.valve_sub_len[1];
				buf[5] = uiInfo.valve_sub_len[2];
				buf[6] = uiInfo.valve_sub_len[3];
			}
		break;
		case 2:
			if (mode == CNT_MODE_MAIN) {
				buf[1] = mode << 7 
							 | (uiInfo.valve_rc[4] << 4) 
							 | mode << 3 
							 | uiInfo.valve_rc[5];
				buf[2] = mode << 7 
							 | (uiInfo.valve_rc[6] << 4) 
							 | mode << 3 
							 | uiInfo.valve_rc[7];
				buf[3] = uiInfo.valve_len[4];
				buf[4] = uiInfo.valve_len[5];
				buf[5] = uiInfo.valve_len[6];
				buf[6] = uiInfo.valve_len[7];
			} else {
				buf[1] = mode << 7 
							 | (uiInfo.valve_sub_rc[4] << 4) 
							 | mode << 3 
							 | uiInfo.valve_sub_rc[5];
				buf[2] = mode << 7 
							 | (uiInfo.valve_sub_rc[6] << 4) 
							 | mode << 3 
							 | uiInfo.valve_sub_rc[7];
				buf[3] = uiInfo.valve_sub_len[4];
				buf[4] = uiInfo.valve_sub_len[5];
				buf[5] = uiInfo.valve_sub_len[6];
				buf[6] = uiInfo.valve_sub_len[7];
			}
			
		break;
	}
}

// 설정
void rc_ptc_make_setting(uint8_t *buf) {
	uint8_t i;
	uint8_t mode = uiInfo.controlMode;
	
	buf[0] = BYTE_START_RC_SETTING | cur_set_page;
	
	rc_ptc_make_baseSetting(buf, cur_set_page, mode);

	makeChecksum(buf);
}

#define DR_ALL_OUT_COUNT 	1
uint8_t dr_out_count = DR_ALL_OUT_COUNT;

// 일반응답
void rc_ptc_make_normal(uint8_t *buf) {
	
	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
	buf[1] = _disp_mode2;
	buf[2] = uiInfo.tCurr;
	buf[3] = 0x00;
	buf[4] = 0x00;
	buf[5] = 0x00;
	buf[6] = 0x00;
	
	if (uiInfo.mode == SETTING_MODE_MASTER) {
		buf[4] = _boiler_water_heat;
		buf[6] = __boiler_shower[5] == 1 ? 1 : 0; // 온수모드   
		buf[6] |= (_boiler_water_shower << 1);					// 온수
	} 
	
	switch(buf[1]) {
		case RC_MODE_HEAT:
			buf[3] = uiInfo.tSetup;
			break;
		case RC_MODE_OUT:
			buf[5] = dr_mode_out;
			
#if defined (_RC_DR_)					// 2015.10.26 대림 : All out + each return
			buf[3] = 0x1E;					// 외출 온도 15도
			
			if (dr_mode_out == 0) {
				if (dr_out_count != 0) {
					dr_out_count--;
				} else {
					dr_mode_out = 1;
				}
			} else {
				dr_out_count = DR_ALL_OUT_COUNT;
			}
#elif defined (_RC_DW_)
			buf[3] = 0x14;				//	10'
#endif

			break;
		case RC_MODE_STOP:
			break;
		case RC_MODE_REPEAT:
			if(_timFlag == 0) {
				buf[3] = MAX_REPEAT_TEMP;
			}
			
			buf[5] = uiInfo.repeat;
			//buf[6] = MODE_REPEAT_TIME;
			break;
		case RC_MODE_RESERVE:
			buf[5] = uiInfo.reserve;
			break;
		default:
			break;
	}
	
	makeChecksum(buf);
	
	if (disp_mode_preview != _disp_mode2){
		if (uiInfo.mode == SETTING_MODE_SUB) {
//			if (_disp_mode2 != RC_MODE_OUT) {      // 2015.11.02 모든 모드 저장
				UPDATE_BIT(BIT_DISPMODE);
				disp_mode_preview = _disp_mode2;
//			}
		} else {
			UPDATE_BIT(BIT_DISPMODE);
			disp_mode_preview = _disp_mode2;
		}
	}
	
	only_one++;
}

// 마스터 룸콘 일때 서브 룸콘 검사
uint8_t rc_ptc_check_subRC(void) {
	uint8_t i;
	uint8_t ch;
	uint8_t num;
	
	if (_remote == 1) {
		return 0xFF;
	}
	
	ch = 0;
	if (rcSubDataInfo.mode_heat[uiInfo.id - 1] != 0xFF) {
		ch = 1;
	}
	
	rcSubDataInfo.mode_heat[uiInfo.id - 1] = _disp_mode2;
	rcSubDataInfo.cur_temp[uiInfo.id - 1] = uiInfo.tCurr;
	rcSubDataInfo.set_temp[uiInfo.id - 1] = uiInfo.tSetup;
	rcSubDataInfo.time[uiInfo.id - 1] = uiInfo.reserve;
	rcSubDataInfo.banb[uiInfo.id - 1] = uiInfo.repeat;
	
	uiInfo.remote_mode[uiInfo.id - 1] = _disp_mode2;
	uiInfo.tempCurr[uiInfo.id - 1] = uiInfo.tCurr;
	uiInfo.tempSetup[uiInfo.id - 1] = uiInfo.tSetup;
	uiInfo.remote_time[uiInfo.id - 1] = uiInfo.reserve;
	uiInfo.remote_banb[uiInfo.id - 1] = uiInfo.repeat;
	
	if (ch == 0) {
		//before setting
		return 0xFF;
	}
	
	num = 0xFF;
	for (i = 0 ; i < 8 ; i++) {
		if (rcSubDataInfo.set_temp[i] == 0xAA) {
			continue;
		}
		
		if (uiInfo.remote_mode[i] != rcSubDataInfo.mode_heat[i]) {
			num = i;
			break;
		}
		
		switch (rcSubDataInfo.mode_heat[i]) {
			case RC_MODE_HEAT:
				if (uiInfo.tempSetup[i] != rcSubDataInfo.set_temp[i]) {
					num = i;
				}
				break;
			case RC_MODE_OUT:
			case RC_MODE_STOP:
				break;
			case RC_MODE_REPEAT:
				if (uiInfo.remote_banb[i] != rcSubDataInfo.banb[i]) {
					num = i;
				}
				break;
			case RC_MODE_RESERVE:
				if (uiInfo.remote_time[i] != rcSubDataInfo.time[i]) {
					num = i;
				}
				break;
		}
	}
	
	if (num == 0xFF) {
		ret_count = MAX_REPEAT_ERROR_COUNT;
		cur_src = 0;
		return num;
	}
	
	if (cur_src == num) {
		ret_count--;
		
		if (ret_count == 0) {
			rcSubDataInfo.mode_heat[num] = uiInfo.remote_mode[num];
			rcSubDataInfo.cur_temp[num] = uiInfo.tempCurr[num];
			rcSubDataInfo.set_temp[num] = uiInfo.tempSetup[num];
			rcSubDataInfo.time[num] = uiInfo.remote_time[num];
			rcSubDataInfo.banb[num] = uiInfo.remote_banb[num];
			
			ret_count = MAX_REPEAT_ERROR_COUNT;
			num = 0xFF;
		}
	} else {
		cur_src = num;
		ret_count = MAX_REPEAT_ERROR_COUNT;
	}

	return num;
}

// 서브룸콘 조작
void rc_ptc_make_subRC(uint8_t *buf, uint8_t num) {
	buf[0] = BYTE_START_RC_SUBRC | num + 1;
	buf[1] = uiInfo.remote_mode[num];
	buf[2] = 0x00;
	if (uiInfo.remote_mode[num] == RC_MODE_HEAT) {
		buf[3] = uiInfo.tempSetup[num];
	} else {
		buf[3] = 0x00;
	}
	
	buf[4] = 0x00;
	
	if (uiInfo.remote_mode[num] == RC_MODE_REPEAT) {
		buf[5] = uiInfo.remote_banb[num];
	} else if(uiInfo.remote_mode[num] == RC_MODE_RESERVE){
		buf[5] = uiInfo.remote_time[num];
	} else {
		buf[5] = 0x00;
	}
	
	buf[6] = 0x00;
	
	makeChecksum(buf);
}

void rc_ptc_make_error(uint8_t *buf) {
	buf[0] = BYTE_START_RC_ERROR | uiInfo.id;
	buf[1] = error;
	buf[2] = mode_recover;
	buf[3] = 0x00;
	buf[4] = 0x00;
	buf[5] = 0x00;
	buf[6] = 0x00;
	
	makeChecksum(buf);
}

void rc_ptc_make_command(uint8_t *buf) {
	buf[0] = BYTE_START_RC_NORMAL | uiInfo.id;
	buf[1] = 0x20;
	buf[2] = 0x00;
	buf[3] = 0x00;
	buf[4] = 0x00;
	buf[5] = 0x00;
	buf[6] = 0x00;
}

#define PKT_CMD_MIRROR			1
#define PKT_CMD_DL1				2
#define PKT_CMD_DL2				3
#define PKT_CMD_FACTORY			4
#define PKT_CMD_RESET			5
#define PKT_CMD_BOILER_HOT_MODE	6


void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1)
{
	rc_ptc_make_command(buf);
	switch( cmd )
	{
	case PKT_CMD_MIRROR:
		buf[2] = COMMAND_MODE_MIRROR;
		buf[3] = p1;
		break;
/*		
	case PKT_CMD_DL1:
		buf[2] = COMMAND_MODE_MIRROR;
		buf[3] = p1;
		break;
	case PKT_CMD_DL2:
		buf[2] = COMMAND_MODE_MIRROR;
		buf[3] = p1;
		break;
*/
	case PKT_CMD_FACTORY:
		buf[2] = COMMAND_MODE_FACTORY;
		buf[3] = p1;
		break;
	case PKT_CMD_RESET:
		buf[2] = COMMAND_MODE_RESET;
		buf[3] = p1;
		break;
	case PKT_CMD_BOILER_HOT_MODE:
		buf[2] = COMMAND_MODE_HOTWATER;
		buf[3] = p1;
		break;
	}
	
	makeChecksum(buf);
}
/*
void rc_ptc_make_command_mirror(uint8_t *buf) {
	rc_ptc_make_command(buf);
	buf[2] = COMMAND_MODE_MIRROR;
	buf[3] = mode_mirror;
	
	makeChecksum(buf);
}

void rc_ptc_make_command_factory(uint8_t *buf) {
	rc_ptc_make_command(buf);
	buf[2] = COMMAND_MODE_FACTORY;
	buf[3] = mode_factory;
	
	makeChecksum(buf);
}

void rc_ptc_make_command_hotwater(uint8_t *buf) {
	rc_ptc_make_command(buf);
	buf[2] = COMMAND_MODE_HOTWATER;
	buf[3] = mode_hotwater;
	
	makeChecksum(buf);
}

void rc_ptc_make_command_reset(uint8_t *buf) {
	rc_ptc_make_command(buf);
	buf[2] = COMMAND_MODE_RESET;
	buf[3] = mode_reset;
	
	makeChecksum(buf);
}
*/

// 제어기 mirror의 응답
void rc_ptc_make_mirror(uint8_t *buf) {
	uint8_t mode;
	buf[0] = BYTE_START_RC_MIRROR | cur_mirror_page;
	
	mode = mode_mirror == 1 ? CNT_MODE_MAIN : CNT_MODE_SUB;
	rc_ptc_make_baseSetting(buf, cur_mirror_page, mode);
	
	makeChecksum(buf);
	
	if (cur_mirror_page == 2) {
		cur_mirror_page = 0;
		mode_mirror = 0;
	}
}

void rc_ptc_make(uint8_t *buf) {
	uint8_t num;
	
	//error 검사
	if (error != 0 && error_type != 0) {
		rc_ptc_make_error(buf);
		return;
	} else {
		if (mode_recover == 1) {
			rc_ptc_make_error(buf);
			return;
		}
	}
	
	switch (uiInfo.mode) {
		case SETTING_MODE_MASTER:
			
			if (getSettingChange() == 1) {
				rc_ptc_make_setting(buf);
				return;
			}
			
			//command check
			if (mode_mirror != 0) {
				rc_ptc_make_command_packet(buf, PKT_CMD_MIRROR, mode_mirror);
				return;
			}
			
			if (mode_factory != 0) {
//				rc_ptc_make_command_factory(buf);
				rc_ptc_make_command_packet(buf, PKT_CMD_FACTORY, mode_factory);
				mode_factory = 0;
				return;
			}
			
			if (mode_hotwater != 0) {
//				rc_ptc_make_command_hotwater(buf);
				rc_ptc_make_command_packet(buf, PKT_CMD_BOILER_HOT_MODE, mode_hotwater);
				return;
			}
			
			if (mode_reset != 0) {
//				rc_ptc_make_command_reset(buf);
				rc_ptc_make_command_packet(buf, PKT_CMD_RESET, mode_reset);
				return;
			}
			
			// sub rc 제어
			num = rc_ptc_check_subRC();
			if ( num == 0xFF) {
				rc_ptc_make_normal(buf);
				return;
			}
			
			if (_remote == 1) {
				rc_ptc_make_normal(buf);
			} else {
				rc_ptc_make_subRC(buf, num);
			}
			break;
		case SETTING_MODE_SUB:
			rc_ptc_make_normal(buf);
			break;
	}
}

// -------------------------  func --------------------------------
void func_rc_command(uint8_t com1, uint8_t com2) {
	mode_mirror = 0;
	mode_factory = 0;
	mode_hotwater = 0;
	mode_reset = 0;
	
	switch(com1) {
		case COMMAND_MODE_MIRROR:
			mode_mirror = com2;
			break;
		case COMMAND_MODE_HOTWATER:
			mode_hotwater = com2;
			break;
		case COMMAND_MODE_RESET:
			mode_reset = com2;
			break;
		case COMMAND_MODE_FACTORY:
			mode_factory = com2;
			break;
	}
}

void func_rc_recover(uint8_t com) {
	mode_recover = com;
}

void func_rc_setting(void) {
	setSettingChange(1);
}

uint8_t	__func_rc_settingCb = 0;

void func_rc_settingCb(uint8_t ch) {
	__func_rc_settingCb = ch;
}

