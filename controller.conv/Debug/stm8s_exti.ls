   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 47 void EXTI_DeInit(void)
  45                     ; 48 {
  47                     	switch	.text
  48  0000               _EXTI_DeInit:
  52                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  54  0000 725f50a0      	clr	20640
  55                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  57  0004 725f50a1      	clr	20641
  58                     ; 51 }
  61  0008 81            	ret
 186                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 186                     ; 65 {
 187                     	switch	.text
 188  0009               _EXTI_SetExtIntSensitivity:
 190  0009 89            	pushw	x
 191       00000000      OFST:	set	0
 194                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 196                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 198                     ; 72     switch (Port)
 200  000a 9e            	ld	a,xh
 202                     ; 94     default:
 202                     ; 95         break;
 203  000b 4d            	tnz	a
 204  000c 270e          	jreq	L12
 205  000e 4a            	dec	a
 206  000f 271d          	jreq	L32
 207  0011 4a            	dec	a
 208  0012 272e          	jreq	L52
 209  0014 4a            	dec	a
 210  0015 2742          	jreq	L72
 211  0017 4a            	dec	a
 212  0018 2756          	jreq	L13
 213  001a 2064          	jra	L311
 214  001c               L12:
 215                     ; 74     case EXTI_PORT_GPIOA:
 215                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 217  001c c650a0        	ld	a,20640
 218  001f a4fc          	and	a,#252
 219  0021 c750a0        	ld	20640,a
 220                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 222  0024 c650a0        	ld	a,20640
 223  0027 1a02          	or	a,(OFST+2,sp)
 224  0029 c750a0        	ld	20640,a
 225                     ; 77         break;
 227  002c 2052          	jra	L311
 228  002e               L32:
 229                     ; 78     case EXTI_PORT_GPIOB:
 229                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 231  002e c650a0        	ld	a,20640
 232  0031 a4f3          	and	a,#243
 233  0033 c750a0        	ld	20640,a
 234                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 236  0036 7b02          	ld	a,(OFST+2,sp)
 237  0038 48            	sll	a
 238  0039 48            	sll	a
 239  003a ca50a0        	or	a,20640
 240  003d c750a0        	ld	20640,a
 241                     ; 81         break;
 243  0040 203e          	jra	L311
 244  0042               L52:
 245                     ; 82     case EXTI_PORT_GPIOC:
 245                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 247  0042 c650a0        	ld	a,20640
 248  0045 a4cf          	and	a,#207
 249  0047 c750a0        	ld	20640,a
 250                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 252  004a 7b02          	ld	a,(OFST+2,sp)
 253  004c 97            	ld	xl,a
 254  004d a610          	ld	a,#16
 255  004f 42            	mul	x,a
 256  0050 9f            	ld	a,xl
 257  0051 ca50a0        	or	a,20640
 258  0054 c750a0        	ld	20640,a
 259                     ; 85         break;
 261  0057 2027          	jra	L311
 262  0059               L72:
 263                     ; 86     case EXTI_PORT_GPIOD:
 263                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 265  0059 c650a0        	ld	a,20640
 266  005c a43f          	and	a,#63
 267  005e c750a0        	ld	20640,a
 268                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 270  0061 7b02          	ld	a,(OFST+2,sp)
 271  0063 97            	ld	xl,a
 272  0064 a640          	ld	a,#64
 273  0066 42            	mul	x,a
 274  0067 9f            	ld	a,xl
 275  0068 ca50a0        	or	a,20640
 276  006b c750a0        	ld	20640,a
 277                     ; 89         break;
 279  006e 2010          	jra	L311
 280  0070               L13:
 281                     ; 90     case EXTI_PORT_GPIOE:
 281                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 283  0070 c650a1        	ld	a,20641
 284  0073 a4fc          	and	a,#252
 285  0075 c750a1        	ld	20641,a
 286                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 288  0078 c650a1        	ld	a,20641
 289  007b 1a02          	or	a,(OFST+2,sp)
 290  007d c750a1        	ld	20641,a
 291                     ; 93         break;
 293  0080               L33:
 294                     ; 94     default:
 294                     ; 95         break;
 296  0080               L311:
 297                     ; 97 }
 300  0080 85            	popw	x
 301  0081 81            	ret
 359                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 359                     ; 107 {
 360                     	switch	.text
 361  0082               _EXTI_SetTLISensitivity:
 365                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 367                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 369  0082 721550a1      	bres	20641,#2
 370                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 372  0086 ca50a1        	or	a,20641
 373  0089 c750a1        	ld	20641,a
 374                     ; 114 }
 377  008c 81            	ret
 423                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 423                     ; 122 {
 424                     	switch	.text
 425  008d               _EXTI_GetExtIntSensitivity:
 427  008d 88            	push	a
 428       00000001      OFST:	set	1
 431                     ; 123     uint8_t value = 0;
 433  008e 0f01          	clr	(OFST+0,sp)
 435                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 437                     ; 128     switch (Port)
 440                     ; 145     default:
 440                     ; 146         break;
 441  0090 4d            	tnz	a
 442  0091 270e          	jreq	L341
 443  0093 4a            	dec	a
 444  0094 2714          	jreq	L541
 445  0096 4a            	dec	a
 446  0097 271c          	jreq	L741
 447  0099 4a            	dec	a
 448  009a 2725          	jreq	L151
 449  009c 4a            	dec	a
 450  009d 2730          	jreq	L351
 451  009f 2035          	jra	L302
 452  00a1               L341:
 453                     ; 130     case EXTI_PORT_GPIOA:
 453                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 455  00a1 c650a0        	ld	a,20640
 456  00a4 a403          	and	a,#3
 457  00a6 6b01          	ld	(OFST+0,sp),a
 459                     ; 132         break;
 461  00a8 202c          	jra	L302
 462  00aa               L541:
 463                     ; 133     case EXTI_PORT_GPIOB:
 463                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 465  00aa c650a0        	ld	a,20640
 466  00ad a40c          	and	a,#12
 467  00af 44            	srl	a
 468  00b0 44            	srl	a
 469  00b1 6b01          	ld	(OFST+0,sp),a
 471                     ; 135         break;
 473  00b3 2021          	jra	L302
 474  00b5               L741:
 475                     ; 136     case EXTI_PORT_GPIOC:
 475                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 477  00b5 c650a0        	ld	a,20640
 478  00b8 a430          	and	a,#48
 479  00ba 4e            	swap	a
 480  00bb a40f          	and	a,#15
 481  00bd 6b01          	ld	(OFST+0,sp),a
 483                     ; 138         break;
 485  00bf 2015          	jra	L302
 486  00c1               L151:
 487                     ; 139     case EXTI_PORT_GPIOD:
 487                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 489  00c1 c650a0        	ld	a,20640
 490  00c4 a4c0          	and	a,#192
 491  00c6 4e            	swap	a
 492  00c7 44            	srl	a
 493  00c8 44            	srl	a
 494  00c9 a403          	and	a,#3
 495  00cb 6b01          	ld	(OFST+0,sp),a
 497                     ; 141         break;
 499  00cd 2007          	jra	L302
 500  00cf               L351:
 501                     ; 142     case EXTI_PORT_GPIOE:
 501                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 503  00cf c650a1        	ld	a,20641
 504  00d2 a403          	and	a,#3
 505  00d4 6b01          	ld	(OFST+0,sp),a
 507                     ; 144         break;
 509  00d6               L551:
 510                     ; 145     default:
 510                     ; 146         break;
 512  00d6               L302:
 513                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 515  00d6 7b01          	ld	a,(OFST+0,sp)
 518  00d8 5b01          	addw	sp,#1
 519  00da 81            	ret
 555                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 555                     ; 158 {
 556                     	switch	.text
 557  00db               _EXTI_GetTLISensitivity:
 559  00db 88            	push	a
 560       00000001      OFST:	set	1
 563                     ; 160     uint8_t value = 0;
 565                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 567  00dc c650a1        	ld	a,20641
 568  00df a404          	and	a,#4
 569  00e1 6b01          	ld	(OFST+0,sp),a
 571                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 573  00e3 7b01          	ld	a,(OFST+0,sp)
 576  00e5 5b01          	addw	sp,#1
 577  00e7 81            	ret
 590                     	xdef	_EXTI_GetTLISensitivity
 591                     	xdef	_EXTI_GetExtIntSensitivity
 592                     	xdef	_EXTI_SetTLISensitivity
 593                     	xdef	_EXTI_SetExtIntSensitivity
 594                     	xdef	_EXTI_DeInit
 613                     	end
