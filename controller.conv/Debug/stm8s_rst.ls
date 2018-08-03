   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
 119                     ; 48 FlagStatus RST_GetFlagStatus(RST_Flag_TypeDef RST_Flag)
 119                     ; 49 {
 121                     	switch	.text
 122  0000               _RST_GetFlagStatus:
 126                     ; 51     assert_param(IS_RST_FLAG_OK(RST_Flag));
 128                     ; 55     return ((FlagStatus)((uint8_t)RST->SR & (uint8_t)RST_Flag));
 130  0000 c450b3        	and	a,20659
 133  0003 81            	ret
 168                     ; 64 void RST_ClearFlag(RST_Flag_TypeDef RST_Flag)
 168                     ; 65 {
 169                     	switch	.text
 170  0004               _RST_ClearFlag:
 174                     ; 67     assert_param(IS_RST_FLAG_OK(RST_Flag));
 176                     ; 69     RST->SR = (uint8_t)RST_Flag;
 178  0004 c750b3        	ld	20659,a
 179                     ; 70 }
 182  0007 81            	ret
 195                     	xdef	_RST_ClearFlag
 196                     	xdef	_RST_GetFlagStatus
 215                     	end
