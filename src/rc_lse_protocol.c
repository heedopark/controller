#include "stdafx.h"

#if defined (_RC_WD_)

#include "rc_lse_protocol.h"
#include "rc_protocol.h"
#include "uidef.h"

#define 	BYTE_START_LSE_CNT_NORMAL 			0x00
#define 	BYTE_START_LSE_CNT_REQ 					0x00

extern uint8_t state_check;
uint8_t lse_state_check;

// 제어기 요청
void rc_lse_ptc_check_normal(uint8_t *buf) {
	if ((buf[0] & 0x0F) != uiInfo.id) {
		setLSEState_check(RC_LSE_STATE_NONE);
		return;
	}
	
	setLSEState_check(RC_LSE_STATE_NORMAL);
	
}

// 다른 룸콘 
void rc_lse_ptc_check_rc(uint8_t *buf) {
	if (uiInfo.mode == SETTING_MODE_MASTER) {
		return;
	}
	
	setLSEState_check(RC_LSE_STATE_NONE);
	
}

//제어기 자체 응답
void rc_lse_ptc_check_cnt(uint8_t *buf) {
	setLSEState_check(RC_LSE_STATE_NONE);
}


void rc_lse_ptc_check(uint8_t *buf) {
	uint8_t start;
	uint8_t end;
	start = buf[0] & 0xF0;
	end = buf[0] & 0x0F;
	
	if (start == BYTE_START_LSE_CNT_NORMAL) {
		rc_lse_ptc_check_normal(buf);
	} else if (end == BYTE_START_LSE_CNT_REQ) {
		rc_lse_ptc_check_cnt(buf);
	} else {
		rc_lse_ptc_check_rc(buf);
	}
}
////////////////////////////////////////////////////////////
void makeLSEChecksum(uint8_t *buf) {
	uint8_t i;
	uint8_t s;
	uint8_t j;
	
	s = 0;
	for (i = 0 ; i < 7 ; i++) {
		s += buf[i];
	}
	buf[7] = s;
	/*
	for( j=0; j<8; j++ )
		disp_char(buf[j]);
	*/
}

uint8_t rc_lse_heatMode(void) {
	uint8_t val;
	
	switch (_disp_mode2) {
		case RC_MODE_HEAT:
			val = 0x00;
			break;
		case RC_MODE_OUT:
			val = 0x04;
			break;
		case RC_MODE_STOP: 
			val = 0x03;
			break;
	}
	
	return val;
}

void rc_lse_ptc_make_normal(uint8_t *buf) {
	buf[0] = 0x80 | 
					 (rc_lse_heatMode() << 4) |
					 (uiInfo.id & 0x0F);
	if (uiInfo.tCurr < uiInfo.tSetup) {
		buf[1] = 0x80;
	}
	
	buf[2] = uiInfo.tCurr;
	buf[3] = uiInfo.tSetup;
	buf[4] = 0x00;
	buf[5] = 0x00;
	buf[6] = 0x00;
	
	makeLSEChecksum(buf);
}

void rc_lse_ptc_make(uint8_t *buf) {
	if (getLSEState_check() == RC_LSE_STATE_NORMAL) {
		rc_lse_ptc_make_normal(buf);
		return;
	}
}


//////////////////////////////////////////////////////////////////////////////

uint8_t getLSEState_check(void) {
	return lse_state_check;
}

void setLSEState_check(uint8_t st) {
	lse_state_check = st;
}

#endif
