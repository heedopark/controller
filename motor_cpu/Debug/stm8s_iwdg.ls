   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  86                     ; 42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  86                     ; 43 {
  88                     .text:	section	.text,new
  89  0000               _IWDG_WriteAccessCmd:
  93                     ; 45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  95                     ; 47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  97  0000 c750e0        	ld	20704,a
  98                     ; 48 }
 101  0003 81            	ret	
 191                     ; 57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 191                     ; 58 {
 192                     .text:	section	.text,new
 193  0000               _IWDG_SetPrescaler:
 197                     ; 60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 199                     ; 62     IWDG->PR = (uint8_t)IWDG_Prescaler;
 201  0000 c750e1        	ld	20705,a
 202                     ; 63 }
 205  0003 81            	ret	
 237                     ; 72 void IWDG_SetReload(uint8_t IWDG_Reload)
 237                     ; 73 {
 238                     .text:	section	.text,new
 239  0000               _IWDG_SetReload:
 243                     ; 74     IWDG->RLR = IWDG_Reload;
 245  0000 c750e2        	ld	20706,a
 246                     ; 75 }
 249  0003 81            	ret	
 272                     ; 83 void IWDG_ReloadCounter(void)
 272                     ; 84 {
 273                     .text:	section	.text,new
 274  0000               _IWDG_ReloadCounter:
 278                     ; 85     IWDG->KR = IWDG_KEY_REFRESH;
 280  0000 35aa50e0      	mov	20704,#170
 281                     ; 86 }
 284  0004 81            	ret	
 307                     ; 93 void IWDG_Enable(void)
 307                     ; 94 {
 308                     .text:	section	.text,new
 309  0000               _IWDG_Enable:
 313                     ; 95     IWDG->KR = IWDG_KEY_ENABLE;
 315  0000 35cc50e0      	mov	20704,#204
 316                     ; 96 }
 319  0004 81            	ret	
 332                     	xdef	_IWDG_Enable
 333                     	xdef	_IWDG_ReloadCounter
 334                     	xdef	_IWDG_SetReload
 335                     	xdef	_IWDG_SetPrescaler
 336                     	xdef	_IWDG_WriteAccessCmd
 355                     	end
