#ifndef _RC_PROTOCOL_H_
#define _RC_PROTOCOL_H_

typedef struct tagSubData {
	uint8_t	cur_temp[8];
	uint8_t	set_temp[8];
	uint8_t	mode_heat[8];
	uint8_t heat_state[8];
	uint8_t time[8];
	uint8_t banb[8];
}	RCSUBDATAINFO;

typedef struct tagBoilerInfo {
	uint8_t	state;
	uint8_t	hotwater;
	uint8_t	heatwater;
}	BOILERINFO;

extern RCSUBDATAINFO rcSubDataInfo;
extern BOILERINFO boiler_info;

extern uint8_t mode_mirror;
extern uint8_t mode_factory;
extern uint8_t mode_recover;
extern uint8_t mode_hotwater;
extern uint8_t mode_reset;

extern uint8_t set_changed;
enum {
	RC_STATE_NONE = 0,
	RC_STATE_NORMAL,
	RC_STATE_SETTING,
	RC_STATE_SUBRC,
	RC_STATE_ERROR,
	RC_STATE_FACTORY,
	RC_STATE_MIRROR
};

enum ERROR_TYPE {
	ERROR_TYPE_BOILER = 1,
	ERROR_TYPE_CNT,
	ERROR_TYPE_RC,
	ERROR_TYPE_HN,
	ERROR_TYPE_EEPROM
};

enum RC_MODE{
	RC_MODE_HEAT = 0x01,
	RC_MODE_OUT = 0x02,
	RC_MODE_STOP = 0x04,
	RC_MODE_RESERVE = 0x08,
	RC_MODE_REPEAT = 0x10,
	RC_MODE_COMMAND = 0x20,
	RC_MODE_OFF = 0x40
};

enum {
	SETTING_MODE_SUB,
	SETTING_MODE_MASTER,
	SETTING_MODE_NONE
};

enum {
	CNT_MODE_MAIN,
	CNT_MODE_SUB
};

enum COMMAND_MODE{
	COMMAND_MODE_MIRROR = 0x01,
	COMMAND_MODE_HOTWATER = 0x02,
	COMMAND_MODE_RESET = 0x04,
	COMMAND_MODE_FACTORY = 0x08,
	COMMAND_MODE_RECOVER = 0x01
};

uint8_t getHexToBin(uint8_t hex, uint8_t idx);
void rc_ptc_baseSet(void);
void rc_ptc_check(uint8_t *buf);
void setSettingChange(uint8_t ch);
uint8_t getSettingChange(void);
void setSubRCChange(uint8_t ch);
uint8_t getSubRCChange(void);
uint8_t getState_check(void);
void setState_check(uint8_t st);
void rc_ptc_make_normal(uint8_t *buf);
void rc_ptc_make_setting(uint8_t *buf);
void rc_ptc_make_subRC(uint8_t *buf, uint8_t num);
void rc_ptc_make(uint8_t *buf);
void rc_ptc_make_mirror(uint8_t *buf);
void rc_ptc_make_factory(uint8_t *buf);
void rc_ptc_make_hotwater(uint8_t *buf);
void rc_ptc_make_reset(uint8_t *buf);

//------------------- func-----------------
void func_rc_command(uint8_t com1, uint8_t com2);
void func_rc_recover(uint8_t com);
void func_rc_setting(void);
void func_rc_settingCb(uint8_t ch);

extern uint8_t	__rc_max;

typedef struct tagRCINFO
{
	uint8_t	type;
	uint8_t	out_temp;
}	_RCINFO, *_LPRCINFO;

_LPRCINFO	get_rcInfo(void);
void	rcInfoSet(uint8_t id, uint8_t temp);

#endif