   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
 125                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 125                     ; 49 {
 127                     .text:	section	.text,new
 128  0000               _RST_GetFlagStatus:
 132                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 134                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 136  0000 c450b3        	and	a,20659
 139  0003 81            	ret	
 174                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 174                     ; 65 {
 175                     .text:	section	.text,new
 176  0000               _RST_ClearFlag:
 180                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 182                     ; 69     RST->SR = (uint8_t)RST_Flag;
 184  0000 c750b3        	ld	20659,a
 185                     ; 70 }
 188  0003 81            	ret	
 201                     	xdef	_RST_ClearFlag
 202                     	xdef	_RST_GetFlagStatus
 221                     	end
