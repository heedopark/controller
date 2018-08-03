   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  80                     ; 42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  80                     ; 43 {
  82                     	switch	.text
  83  0000               _IWDG_WriteAccessCmd:
  87                     ; 45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  89                     ; 47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  91  0000 c750e0        	ld	20704,a
  92                     ; 48 }
  95  0003 81            	ret
 185                     ; 57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 185                     ; 58 {
 186                     	switch	.text
 187  0004               _IWDG_SetPrescaler:
 191                     ; 60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 193                     ; 62     IWDG->PR = (uint8_t)IWDG_Prescaler;
 195  0004 c750e1        	ld	20705,a
 196                     ; 63 }
 199  0007 81            	ret
 233                     ; 72 void IWDG_SetReload(uint8_t IWDG_Reload)
 233                     ; 73 {
 234                     	switch	.text
 235  0008               _IWDG_SetReload:
 239                     ; 74     IWDG->RLR = IWDG_Reload;
 241  0008 c750e2        	ld	20706,a
 242                     ; 75 }
 245  000b 81            	ret
 268                     ; 83 void IWDG_ReloadCounter(void)
 268                     ; 84 {
 269                     	switch	.text
 270  000c               _IWDG_ReloadCounter:
 274                     ; 85     IWDG->KR = IWDG_KEY_REFRESH;
 276  000c 35aa50e0      	mov	20704,#170
 277                     ; 86 }
 280  0010 81            	ret
 303                     ; 93 void IWDG_Enable(void)
 303                     ; 94 {
 304                     	switch	.text
 305  0011               _IWDG_Enable:
 309                     ; 95     IWDG->KR = IWDG_KEY_ENABLE;
 311  0011 35cc50e0      	mov	20704,#204
 312                     ; 96 }
 315  0015 81            	ret
 328                     	xdef	_IWDG_Enable
 329                     	xdef	_IWDG_ReloadCounter
 330                     	xdef	_IWDG_SetReload
 331                     	xdef	_IWDG_SetPrescaler
 332                     	xdef	_IWDG_WriteAccessCmd
 351                     	end
