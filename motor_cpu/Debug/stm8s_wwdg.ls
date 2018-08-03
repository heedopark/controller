   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  67                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  67                     ; 48 {
  69                     .text:	section	.text,new
  70  0000               _WWDG_Init:
  72  0000 89            	pushw	x
  73       00000000      OFST:	set	0
  76                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  78                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  80  0001 357f50d2      	mov	20690,#127
  81                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  83  0005 9e            	ld	a,xh
  84  0006 aac0          	or	a,#192
  85  0008 c750d1        	ld	20689,a
  86                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  88  000b 7b02          	ld	a,(OFST+2,sp)
  89  000d a47f          	and	a,#127
  90  000f aa40          	or	a,#64
  91  0011 c750d2        	ld	20690,a
  92                     ; 55 }
  95  0014 85            	popw	x
  96  0015 81            	ret	
 128                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 128                     ; 64 {
 129                     .text:	section	.text,new
 130  0000               _WWDG_SetCounter:
 134                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 136                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 138  0000 a47f          	and	a,#127
 139  0002 c750d1        	ld	20689,a
 140                     ; 73 }
 143  0005 81            	ret	
 166                     ; 82 uint8_t WWDG_GetCounter(void)
 166                     ; 83 {
 167                     .text:	section	.text,new
 168  0000               _WWDG_GetCounter:
 172                     ; 84     return(WWDG->CR);
 174  0000 c650d1        	ld	a,20689
 177  0003 81            	ret	
 200                     ; 92 void WWDG_SWReset(void)
 200                     ; 93 {
 201                     .text:	section	.text,new
 202  0000               _WWDG_SWReset:
 206                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 208  0000 358050d1      	mov	20689,#128
 209                     ; 95 }
 212  0004 81            	ret	
 245                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 245                     ; 105 {
 246                     .text:	section	.text,new
 247  0000               _WWDG_SetWindowValue:
 251                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 253                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 255  0000 a47f          	and	a,#127
 256  0002 aa40          	or	a,#64
 257  0004 c750d2        	ld	20690,a
 258                     ; 110 }
 261  0007 81            	ret	
 274                     	xdef	_WWDG_SetWindowValue
 275                     	xdef	_WWDG_SWReset
 276                     	xdef	_WWDG_GetCounter
 277                     	xdef	_WWDG_SetCounter
 278                     	xdef	_WWDG_Init
 297                     	end
