   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 47 void EXTI_DeInit(void)
  51                     ; 48 {
  53                     .text:	section	.text,new
  54  0000               _EXTI_DeInit:
  58                     ; 49     EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  60  0000 725f50a0      	clr	20640
  61                     ; 50     EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  63  0004 725f50a1      	clr	20641
  64                     ; 51 }
  67  0008 81            	ret	
 192                     ; 64 void EXTI_SetExtIntSensitivity(EXTI_Port_TypeDef Port, EXTI_Sensitivity_TypeDef SensitivityValue)
 192                     ; 65 {
 193                     .text:	section	.text,new
 194  0000               _EXTI_SetExtIntSensitivity:
 196  0000 89            	pushw	x
 197       00000000      OFST:	set	0
 200                     ; 68     assert_param(IS_EXTI_PORT_OK(Port));
 202                     ; 69     assert_param(IS_EXTI_SENSITIVITY_OK(SensitivityValue));
 204                     ; 72     switch (Port)
 206  0001 9e            	ld	a,xh
 208                     ; 94     default:
 208                     ; 95         break;
 209  0002 4d            	tnz	a
 210  0003 270e          	jreq	L12
 211  0005 4a            	dec	a
 212  0006 271a          	jreq	L32
 213  0008 4a            	dec	a
 214  0009 2725          	jreq	L52
 215  000b 4a            	dec	a
 216  000c 2731          	jreq	L72
 217  000e 4a            	dec	a
 218  000f 2745          	jreq	L13
 219  0011 2053          	jra	L311
 220  0013               L12:
 221                     ; 74     case EXTI_PORT_GPIOA:
 221                     ; 75         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PAIS);
 223  0013 c650a0        	ld	a,20640
 224  0016 a4fc          	and	a,#252
 225  0018 c750a0        	ld	20640,a
 226                     ; 76         EXTI->CR1 |= (uint8_t)(SensitivityValue);
 228  001b c650a0        	ld	a,20640
 229  001e 1a02          	or	a,(OFST+2,sp)
 230                     ; 77         break;
 232  0020 202f          	jp	LC001
 233  0022               L32:
 234                     ; 78     case EXTI_PORT_GPIOB:
 234                     ; 79         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PBIS);
 236  0022 c650a0        	ld	a,20640
 237  0025 a4f3          	and	a,#243
 238  0027 c750a0        	ld	20640,a
 239                     ; 80         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 2);
 241  002a 7b02          	ld	a,(OFST+2,sp)
 242  002c 48            	sll	a
 243  002d 48            	sll	a
 244                     ; 81         break;
 246  002e 201e          	jp	LC002
 247  0030               L52:
 248                     ; 82     case EXTI_PORT_GPIOC:
 248                     ; 83         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PCIS);
 250  0030 c650a0        	ld	a,20640
 251  0033 a4cf          	and	a,#207
 252  0035 c750a0        	ld	20640,a
 253                     ; 84         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 4);
 255  0038 7b02          	ld	a,(OFST+2,sp)
 256  003a 97            	ld	xl,a
 257  003b a610          	ld	a,#16
 258                     ; 85         break;
 260  003d 200d          	jp	LC003
 261  003f               L72:
 262                     ; 86     case EXTI_PORT_GPIOD:
 262                     ; 87         EXTI->CR1 &= (uint8_t)(~EXTI_CR1_PDIS);
 264  003f c650a0        	ld	a,20640
 265  0042 a43f          	and	a,#63
 266  0044 c750a0        	ld	20640,a
 267                     ; 88         EXTI->CR1 |= (uint8_t)((uint8_t)(SensitivityValue) << 6);
 269  0047 7b02          	ld	a,(OFST+2,sp)
 270  0049 97            	ld	xl,a
 271  004a a640          	ld	a,#64
 272  004c               LC003:
 273  004c 42            	mul	x,a
 274  004d 9f            	ld	a,xl
 275  004e               LC002:
 276  004e ca50a0        	or	a,20640
 277  0051               LC001:
 278  0051 c750a0        	ld	20640,a
 279                     ; 89         break;
 281  0054 2010          	jra	L311
 282  0056               L13:
 283                     ; 90     case EXTI_PORT_GPIOE:
 283                     ; 91         EXTI->CR2 &= (uint8_t)(~EXTI_CR2_PEIS);
 285  0056 c650a1        	ld	a,20641
 286  0059 a4fc          	and	a,#252
 287  005b c750a1        	ld	20641,a
 288                     ; 92         EXTI->CR2 |= (uint8_t)(SensitivityValue);
 290  005e c650a1        	ld	a,20641
 291  0061 1a02          	or	a,(OFST+2,sp)
 292  0063 c750a1        	ld	20641,a
 293                     ; 93         break;
 295                     ; 94     default:
 295                     ; 95         break;
 297  0066               L311:
 298                     ; 97 }
 301  0066 85            	popw	x
 302  0067 81            	ret	
 360                     ; 106 void EXTI_SetTLISensitivity(EXTI_TLISensitivity_TypeDef SensitivityValue)
 360                     ; 107 {
 361                     .text:	section	.text,new
 362  0000               _EXTI_SetTLISensitivity:
 366                     ; 109     assert_param(IS_EXTI_TLISENSITIVITY_OK(SensitivityValue));
 368                     ; 112     EXTI->CR2 &= (uint8_t)(~EXTI_CR2_TLIS);
 370  0000 721550a1      	bres	20641,#2
 371                     ; 113     EXTI->CR2 |= (uint8_t)(SensitivityValue);
 373  0004 ca50a1        	or	a,20641
 374  0007 c750a1        	ld	20641,a
 375                     ; 114 }
 378  000a 81            	ret	
 422                     ; 121 EXTI_Sensitivity_TypeDef EXTI_GetExtIntSensitivity(EXTI_Port_TypeDef Port)
 422                     ; 122 {
 423                     .text:	section	.text,new
 424  0000               _EXTI_GetExtIntSensitivity:
 426  0000 88            	push	a
 427       00000001      OFST:	set	1
 430                     ; 123     uint8_t value = 0;
 432  0001 0f01          	clr	(OFST+0,sp)
 434                     ; 126     assert_param(IS_EXTI_PORT_OK(Port));
 436                     ; 128     switch (Port)
 439                     ; 145     default:
 439                     ; 146         break;
 440  0003 4d            	tnz	a
 441  0004 2710          	jreq	L341
 442  0006 4a            	dec	a
 443  0007 2712          	jreq	L541
 444  0009 4a            	dec	a
 445  000a 2718          	jreq	L741
 446  000c 4a            	dec	a
 447  000d 271b          	jreq	L151
 448  000f 4a            	dec	a
 449  0010 2722          	jreq	L351
 450  0012 7b01          	ld	a,(OFST+0,sp)
 451  0014 2023          	jra	LC004
 452  0016               L341:
 453                     ; 130     case EXTI_PORT_GPIOA:
 453                     ; 131         value = (uint8_t)(EXTI->CR1 & EXTI_CR1_PAIS);
 455  0016 c650a0        	ld	a,20640
 456                     ; 132         break;
 458  0019 201c          	jp	LC005
 459  001b               L541:
 460                     ; 133     case EXTI_PORT_GPIOB:
 460                     ; 134         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PBIS) >> 2);
 462  001b c650a0        	ld	a,20640
 463  001e a40c          	and	a,#12
 464  0020 44            	srl	a
 465  0021 44            	srl	a
 466                     ; 135         break;
 468  0022 2015          	jp	LC004
 469  0024               L741:
 470                     ; 136     case EXTI_PORT_GPIOC:
 470                     ; 137         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PCIS) >> 4);
 472  0024 c650a0        	ld	a,20640
 473  0027 4e            	swap	a
 474                     ; 138         break;
 476  0028 200d          	jp	LC005
 477  002a               L151:
 478                     ; 139     case EXTI_PORT_GPIOD:
 478                     ; 140         value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_PDIS) >> 6);
 480  002a c650a0        	ld	a,20640
 481  002d 4e            	swap	a
 482  002e a40c          	and	a,#12
 483  0030 44            	srl	a
 484  0031 44            	srl	a
 485                     ; 141         break;
 487  0032 2003          	jp	LC005
 488  0034               L351:
 489                     ; 142     case EXTI_PORT_GPIOE:
 489                     ; 143         value = (uint8_t)(EXTI->CR2 & EXTI_CR2_PEIS);
 491  0034 c650a1        	ld	a,20641
 492  0037               LC005:
 493  0037 a403          	and	a,#3
 494  0039               LC004:
 496                     ; 144         break;
 498                     ; 145     default:
 498                     ; 146         break;
 500                     ; 149     return((EXTI_Sensitivity_TypeDef)value);
 504  0039 5b01          	addw	sp,#1
 505  003b 81            	ret	
 539                     ; 157 EXTI_TLISensitivity_TypeDef EXTI_GetTLISensitivity(void)
 539                     ; 158 {
 540                     .text:	section	.text,new
 541  0000               _EXTI_GetTLISensitivity:
 543  0000 88            	push	a
 544       00000001      OFST:	set	1
 547                     ; 160     uint8_t value = 0;
 549                     ; 163     value = (uint8_t)(EXTI->CR2 & EXTI_CR2_TLIS);
 551  0001 c650a1        	ld	a,20641
 552  0004 a404          	and	a,#4
 554                     ; 165     return((EXTI_TLISensitivity_TypeDef)value);
 558  0006 5b01          	addw	sp,#1
 559  0008 81            	ret	
 572                     	xdef	_EXTI_GetTLISensitivity
 573                     	xdef	_EXTI_GetExtIntSensitivity
 574                     	xdef	_EXTI_SetTLISensitivity
 575                     	xdef	_EXTI_SetExtIntSensitivity
 576                     	xdef	_EXTI_DeInit
 595                     	end
