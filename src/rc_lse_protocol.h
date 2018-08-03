#ifndef _RC_LSE_PROTOCOL_H_
#define _RC_LSE_PROTOCOL_H_

enum {
	RC_TYPE_NONE,
	RC_TYPE_WOODANG,
	RC_TYPE_LSE
};

enum {
	RC_LSE_STATE_NONE = 0,
	RC_LSE_STATE_NORMAL
};

extern uint8_t rc_type;

void rc_lse_ptc_check(uint8_t *buf);
uint8_t getLSEState_check(void);
void setLSEState_check(uint8_t st);
void rc_lse_ptc_make(uint8_t *buf);

#endif