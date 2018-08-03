   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  65                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  65                     ; 48 {
  67                     	switch	.text
  68  0000               _WWDG_Init:
  70  0000 89            	pushw	x
  71       00000000      OFST:	set	0
  74                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  76                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  78  0001 357f50d2      	mov	20690,#127
  79                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  81  0005 9e            	ld	a,xh
  82  0006 aac0          	or	a,#192
  83  0008 c750d1        	ld	20689,a
  84                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  86  000b 7b02          	ld	a,(OFST+2,sp)
  87  000d aa40          	or	a,#64
  88  000f a47f          	and	a,#127
  89  0011 c750d2        	ld	20690,a
  90                     ; 55 }
  93  0014 85            	popw	x
  94  0015 81            	ret
 128                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 128                     ; 64 {
 129                     	switch	.text
 130  0016               _WWDG_SetCounter:
 134                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 136                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 138  0016 a47f          	and	a,#127
 139  0018 c750d1        	ld	20689,a
 140                     ; 73 }
 143  001b 81            	ret
 166                     ; 82 uint8_t WWDG_GetCounter(void)
 166                     ; 83 {
 167                     	switch	.text
 168  001c               _WWDG_GetCounter:
 172                     ; 84     return(WWDG->CR);
 174  001c c650d1        	ld	a,20689
 177  001f 81            	ret
 200                     ; 92 void WWDG_SWReset(void)
 200                     ; 93 {
 201                     	switch	.text
 202  0020               _WWDG_SWReset:
 206                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 208  0020 358050d1      	mov	20689,#128
 209                     ; 95 }
 212  0024 81            	ret
 247                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 247                     ; 105 {
 248                     	switch	.text
 249  0025               _WWDG_SetWindowValue:
 253                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 255                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 257  0025 aa40          	or	a,#64
 258  0027 a47f          	and	a,#127
 259  0029 c750d2        	ld	20690,a
 260                     ; 110 }
 263  002c 81            	ret
 276                     	xdef	_WWDG_SetWindowValue
 277                     	xdef	_WWDG_SWReset
 278                     	xdef	_WWDG_GetCounter
 279                     	xdef	_WWDG_SetCounter
 280                     	xdef	_WWDG_Init
 299                     	end
