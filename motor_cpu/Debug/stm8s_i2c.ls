   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 61 void I2C_DeInit(void)
  51                     ; 62 {
  53                     .text:	section	.text,new
  54  0000               _I2C_DeInit:
  58                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  60  0000 725f5210      	clr	21008
  61                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  63  0004 725f5211      	clr	21009
  64                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  66  0008 725f5212      	clr	21010
  67                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  69  000c 725f5213      	clr	21011
  70                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  72  0010 725f5214      	clr	21012
  73                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  75  0014 725f521a      	clr	21018
  76                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  78  0018 725f521b      	clr	21019
  79                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  81  001c 725f521c      	clr	21020
  82                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  84  0020 3502521d      	mov	21021,#2
  85                     ; 72 }
  88  0024 81            	ret	
 255                     .const:	section	.text
 256  0000               L01:
 257  0000 000186a1      	dc.l	100001
 258  0004               L21:
 259  0004 000f4240      	dc.l	1000000
 260                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 260                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 260                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 260                     ; 93 {
 261                     .text:	section	.text,new
 262  0000               _I2C_Init:
 264  0000 5209          	subw	sp,#9
 265       00000009      OFST:	set	9
 268                     ; 94   uint16_t result = 0x0004;
 270                     ; 95   uint16_t tmpval = 0;
 272                     ; 96   uint8_t tmpccrh = 0;
 274  0002 0f07          	clr	(OFST-2,sp)
 276                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 278                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 280                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 282                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 284                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 286                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 288                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 290  0004 c65212        	ld	a,21010
 291  0007 a4c0          	and	a,#192
 292  0009 c75212        	ld	21010,a
 293                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 295  000c c65212        	ld	a,21010
 296  000f 1a15          	or	a,(OFST+12,sp)
 297  0011 c75212        	ld	21010,a
 298                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 300  0014 72115210      	bres	21008,#0
 301                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 303  0018 c6521c        	ld	a,21020
 304  001b a430          	and	a,#48
 305  001d c7521c        	ld	21020,a
 306                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 308  0020 725f521b      	clr	21019
 309                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 311  0024 96            	ldw	x,sp
 312  0025 1c000c        	addw	x,#OFST+3
 313  0028 cd0000        	call	c_ltor
 315  002b ae0000        	ldw	x,#L01
 316  002e cd0000        	call	c_lcmp
 318  0031 2560          	jrult	L511
 319                     ; 125     tmpccrh = I2C_CCRH_FS;
 321  0033 a680          	ld	a,#128
 322  0035 6b07          	ld	(OFST-2,sp),a
 324                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 326  0037 96            	ldw	x,sp
 327  0038 0d12          	tnz	(OFST+9,sp)
 328  003a 261d          	jrne	L711
 329                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 331  003c 1c000c        	addw	x,#OFST+3
 332  003f cd0000        	call	c_ltor
 334  0042 a603          	ld	a,#3
 335  0044 cd0000        	call	c_smul
 337  0047 96            	ldw	x,sp
 338  0048 5c            	incw	x
 339  0049 cd0000        	call	c_rtol
 342  004c 7b15          	ld	a,(OFST+12,sp)
 343  004e cd00f1        	call	LC001
 345  0051 96            	ldw	x,sp
 346  0052 cd00ff        	call	LC002
 347  0055 1f08          	ldw	(OFST-1,sp),x
 350  0057 2021          	jra	L121
 351  0059               L711:
 352                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 354  0059 1c000c        	addw	x,#OFST+3
 355  005c cd0000        	call	c_ltor
 357  005f a619          	ld	a,#25
 358  0061 cd0000        	call	c_smul
 360  0064 96            	ldw	x,sp
 361  0065 5c            	incw	x
 362  0066 cd0000        	call	c_rtol
 365  0069 7b15          	ld	a,(OFST+12,sp)
 366  006b cd00f1        	call	LC001
 368  006e 96            	ldw	x,sp
 369  006f cd00ff        	call	LC002
 370  0072 1f08          	ldw	(OFST-1,sp),x
 372                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 374  0074 7b07          	ld	a,(OFST-2,sp)
 375  0076 aa40          	or	a,#64
 376  0078 6b07          	ld	(OFST-2,sp),a
 378  007a               L121:
 379                     ; 141     if (result < (uint16_t)0x01)
 381  007a 1e08          	ldw	x,(OFST-1,sp)
 382  007c 2603          	jrne	L321
 383                     ; 144       result = (uint16_t)0x0001;
 385  007e 5c            	incw	x
 386  007f 1f08          	ldw	(OFST-1,sp),x
 388  0081               L321:
 389                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 391  0081 7b15          	ld	a,(OFST+12,sp)
 392  0083 97            	ld	xl,a
 393  0084 a603          	ld	a,#3
 394  0086 42            	mul	x,a
 395  0087 a60a          	ld	a,#10
 396  0089 cd0000        	call	c_sdivx
 398  008c 5c            	incw	x
 399  008d 1f05          	ldw	(OFST-4,sp),x
 401                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 403  008f 7b06          	ld	a,(OFST-3,sp)
 405  0091 2028          	jra	L521
 406  0093               L511:
 407                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 409  0093 96            	ldw	x,sp
 410  0094 1c000c        	addw	x,#OFST+3
 411  0097 cd0000        	call	c_ltor
 413  009a 3803          	sll	c_lreg+3
 414  009c 3902          	rlc	c_lreg+2
 415  009e 3901          	rlc	c_lreg+1
 416  00a0 96            	ldw	x,sp
 417  00a1 3900          	rlc	c_lreg
 418  00a3 5c            	incw	x
 419  00a4 cd0000        	call	c_rtol
 422  00a7 7b15          	ld	a,(OFST+12,sp)
 423  00a9 ad46          	call	LC001
 425  00ab 96            	ldw	x,sp
 426  00ac ad51          	call	LC002
 428                     ; 161     if (result < (uint16_t)0x0004)
 430  00ae a30004        	cpw	x,#4
 431  00b1 2403          	jruge	L721
 432                     ; 164       result = (uint16_t)0x0004;
 434  00b3 ae0004        	ldw	x,#4
 436  00b6               L721:
 437  00b6 1f08          	ldw	(OFST-1,sp),x
 438                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 440  00b8 7b15          	ld	a,(OFST+12,sp)
 441  00ba 4c            	inc	a
 442  00bb               L521:
 443  00bb c7521d        	ld	21021,a
 444                     ; 175   I2C->CCRL = (uint8_t)result;
 446  00be 7b09          	ld	a,(OFST+0,sp)
 447  00c0 c7521b        	ld	21019,a
 448                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 450  00c3 7b08          	ld	a,(OFST-1,sp)
 451  00c5 a40f          	and	a,#15
 452  00c7 1a07          	or	a,(OFST-2,sp)
 453  00c9 c7521c        	ld	21020,a
 454                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 456  00cc 72105210      	bset	21008,#0
 457                     ; 182   I2C_AcknowledgeConfig(Ack);
 459  00d0 7b13          	ld	a,(OFST+10,sp)
 460  00d2 cd0000        	call	_I2C_AcknowledgeConfig
 462                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 464  00d5 7b11          	ld	a,(OFST+8,sp)
 465  00d7 c75213        	ld	21011,a
 466                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 466                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 468  00da 1e10          	ldw	x,(OFST+7,sp)
 469  00dc 4f            	clr	a
 470  00dd 01            	rrwa	x,a
 471  00de 48            	sll	a
 472  00df 01            	rrwa	x,a
 473  00e0 49            	rlc	a
 474  00e1 a406          	and	a,#6
 475  00e3 6b04          	ld	(OFST-5,sp),a
 477  00e5 7b14          	ld	a,(OFST+11,sp)
 478  00e7 aa40          	or	a,#64
 479  00e9 1a04          	or	a,(OFST-5,sp)
 480  00eb c75214        	ld	21012,a
 481                     ; 188 }
 484  00ee 5b09          	addw	sp,#9
 485  00f0 81            	ret	
 486  00f1               LC001:
 487  00f1 b703          	ld	c_lreg+3,a
 488  00f3 3f02          	clr	c_lreg+2
 489  00f5 3f01          	clr	c_lreg+1
 490  00f7 3f00          	clr	c_lreg
 491  00f9 ae0004        	ldw	x,#L21
 492  00fc cc0000        	jp	c_lmul
 493  00ff               LC002:
 494  00ff 5c            	incw	x
 495  0100 cd0000        	call	c_ludv
 497  0103 be02          	ldw	x,c_lreg+2
 498  0105 81            	ret	
 553                     ; 196 void I2C_Cmd(FunctionalState NewState)
 553                     ; 197 {
 554                     .text:	section	.text,new
 555  0000               _I2C_Cmd:
 559                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 561                     ; 202   if (NewState != DISABLE)
 563  0000 4d            	tnz	a
 564  0001 2705          	jreq	L751
 565                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 567  0003 72105210      	bset	21008,#0
 570  0007 81            	ret	
 571  0008               L751:
 572                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 574  0008 72115210      	bres	21008,#0
 575                     ; 212 }
 578  000c 81            	ret	
 613                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 613                     ; 221 {
 614                     .text:	section	.text,new
 615  0000               _I2C_GeneralCallCmd:
 619                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 621                     ; 226   if (NewState != DISABLE)
 623  0000 4d            	tnz	a
 624  0001 2705          	jreq	L102
 625                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 627  0003 721c5210      	bset	21008,#6
 630  0007 81            	ret	
 631  0008               L102:
 632                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 634  0008 721d5210      	bres	21008,#6
 635                     ; 236 }
 638  000c 81            	ret	
 673                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 673                     ; 247 {
 674                     .text:	section	.text,new
 675  0000               _I2C_GenerateSTART:
 679                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 681                     ; 252   if (NewState != DISABLE)
 683  0000 4d            	tnz	a
 684  0001 2705          	jreq	L322
 685                     ; 255     I2C->CR2 |= I2C_CR2_START;
 687  0003 72105211      	bset	21009,#0
 690  0007 81            	ret	
 691  0008               L322:
 692                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 694  0008 72115211      	bres	21009,#0
 695                     ; 262 }
 698  000c 81            	ret	
 733                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 733                     ; 271 {
 734                     .text:	section	.text,new
 735  0000               _I2C_GenerateSTOP:
 739                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 741                     ; 276   if (NewState != DISABLE)
 743  0000 4d            	tnz	a
 744  0001 2705          	jreq	L542
 745                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 747  0003 72125211      	bset	21009,#1
 750  0007 81            	ret	
 751  0008               L542:
 752                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 754  0008 72135211      	bres	21009,#1
 755                     ; 286 }
 758  000c 81            	ret	
 794                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
 794                     ; 295 {
 795                     .text:	section	.text,new
 796  0000               _I2C_SoftwareResetCmd:
 800                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 802                     ; 299   if (NewState != DISABLE)
 804  0000 4d            	tnz	a
 805  0001 2705          	jreq	L762
 806                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
 808  0003 721e5211      	bset	21009,#7
 811  0007 81            	ret	
 812  0008               L762:
 813                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 815  0008 721f5211      	bres	21009,#7
 816                     ; 309 }
 819  000c 81            	ret	
 855                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
 855                     ; 319 {
 856                     .text:	section	.text,new
 857  0000               _I2C_StretchClockCmd:
 861                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 863                     ; 323   if (NewState != DISABLE)
 865  0000 4d            	tnz	a
 866  0001 2705          	jreq	L113
 867                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 869  0003 721f5210      	bres	21008,#7
 872  0007 81            	ret	
 873  0008               L113:
 874                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 876  0008 721e5210      	bset	21008,#7
 877                     ; 334 }
 880  000c 81            	ret	
 916                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 916                     ; 344 {
 917                     .text:	section	.text,new
 918  0000               _I2C_AcknowledgeConfig:
 920  0000 88            	push	a
 921       00000000      OFST:	set	0
 924                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
 926                     ; 349   if (Ack == I2C_ACK_NONE)
 928  0001 4d            	tnz	a
 929  0002 2606          	jrne	L333
 930                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 932  0004 72155211      	bres	21009,#2
 934  0008 2011          	jra	L533
 935  000a               L333:
 936                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
 938  000a 72145211      	bset	21009,#2
 939                     ; 359     if (Ack == I2C_ACK_CURR)
 941  000e 4a            	dec	a
 942  000f 2606          	jrne	L733
 943                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 945  0011 72175211      	bres	21009,#3
 947  0015 2004          	jra	L533
 948  0017               L733:
 949                     ; 367       I2C->CR2 |= I2C_CR2_POS;
 951  0017 72165211      	bset	21009,#3
 952  001b               L533:
 953                     ; 370 }
 956  001b 84            	pop	a
 957  001c 81            	ret	
1029                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1029                     ; 381 {
1030                     .text:	section	.text,new
1031  0000               _I2C_ITConfig:
1033  0000 89            	pushw	x
1034       00000000      OFST:	set	0
1037                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1039                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1041                     ; 387   if (NewState != DISABLE)
1043  0001 9f            	ld	a,xl
1044  0002 4d            	tnz	a
1045  0003 2706          	jreq	L773
1046                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1048  0005 9e            	ld	a,xh
1049  0006 ca521a        	or	a,21018
1051  0009 2006          	jra	L104
1052  000b               L773:
1053                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1055  000b 7b01          	ld	a,(OFST+1,sp)
1056  000d 43            	cpl	a
1057  000e c4521a        	and	a,21018
1058  0011               L104:
1059  0011 c7521a        	ld	21018,a
1060                     ; 397 }
1063  0014 85            	popw	x
1064  0015 81            	ret	
1100                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1100                     ; 406 {
1101                     .text:	section	.text,new
1102  0000               _I2C_FastModeDutyCycleConfig:
1106                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1108                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1110  0000 a140          	cp	a,#64
1111  0002 2605          	jrne	L124
1112                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1114  0004 721c521c      	bset	21020,#6
1117  0008 81            	ret	
1118  0009               L124:
1119                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1121  0009 721d521c      	bres	21020,#6
1122                     ; 421 }
1125  000d 81            	ret	
1148                     ; 428 uint8_t I2C_ReceiveData(void)
1148                     ; 429 {
1149                     .text:	section	.text,new
1150  0000               _I2C_ReceiveData:
1154                     ; 431   return ((uint8_t)I2C->DR);
1156  0000 c65216        	ld	a,21014
1159  0003 81            	ret	
1222                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1222                     ; 442 {
1223                     .text:	section	.text,new
1224  0000               _I2C_Send7bitAddress:
1226  0000 89            	pushw	x
1227       00000000      OFST:	set	0
1230                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1232                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1234                     ; 448   Address &= (uint8_t)0xFE;
1236  0001 7b01          	ld	a,(OFST+1,sp)
1237  0003 a4fe          	and	a,#254
1238  0005 6b01          	ld	(OFST+1,sp),a
1239                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1241  0007 1a02          	or	a,(OFST+2,sp)
1242  0009 c75216        	ld	21014,a
1243                     ; 452 }
1246  000c 85            	popw	x
1247  000d 81            	ret	
1279                     ; 459 void I2C_SendData(uint8_t Data)
1279                     ; 460 {
1280                     .text:	section	.text,new
1281  0000               _I2C_SendData:
1285                     ; 462   I2C->DR = Data;
1287  0000 c75216        	ld	21014,a
1288                     ; 463 }
1291  0003 81            	ret	
1511                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1511                     ; 580 {
1512                     .text:	section	.text,new
1513  0000               _I2C_CheckEvent:
1515  0000 89            	pushw	x
1516  0001 5206          	subw	sp,#6
1517       00000006      OFST:	set	6
1520                     ; 581   __IO uint16_t lastevent = 0x00;
1522  0003 5f            	clrw	x
1523  0004 1f04          	ldw	(OFST-2,sp),x
1525                     ; 582   uint8_t flag1 = 0x00 ;
1527                     ; 583   uint8_t flag2 = 0x00;
1529                     ; 584   ErrorStatus status = ERROR;
1531                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1533                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1535  0006 1e07          	ldw	x,(OFST+1,sp)
1536  0008 a30004        	cpw	x,#4
1537  000b 2609          	jrne	L506
1538                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1540  000d c65218        	ld	a,21016
1541  0010 a404          	and	a,#4
1542  0012 5f            	clrw	x
1543  0013 97            	ld	xl,a
1545  0014 201a          	jra	L706
1546  0016               L506:
1547                     ; 595     flag1 = I2C->SR1;
1549  0016 c65217        	ld	a,21015
1550  0019 6b03          	ld	(OFST-3,sp),a
1552                     ; 596     flag2 = I2C->SR3;
1554  001b c65219        	ld	a,21017
1555  001e 6b06          	ld	(OFST+0,sp),a
1557                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1559  0020 5f            	clrw	x
1560  0021 7b03          	ld	a,(OFST-3,sp)
1561  0023 97            	ld	xl,a
1562  0024 1f01          	ldw	(OFST-5,sp),x
1564  0026 5f            	clrw	x
1565  0027 7b06          	ld	a,(OFST+0,sp)
1566  0029 97            	ld	xl,a
1567  002a 7b02          	ld	a,(OFST-4,sp)
1568  002c 01            	rrwa	x,a
1569  002d 1a01          	or	a,(OFST-5,sp)
1570  002f 01            	rrwa	x,a
1571  0030               L706:
1572  0030 1f04          	ldw	(OFST-2,sp),x
1574                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1576  0032 1e04          	ldw	x,(OFST-2,sp)
1577  0034 01            	rrwa	x,a
1578  0035 1408          	and	a,(OFST+2,sp)
1579  0037 01            	rrwa	x,a
1580  0038 1407          	and	a,(OFST+1,sp)
1581  003a 01            	rrwa	x,a
1582  003b 1307          	cpw	x,(OFST+1,sp)
1583  003d 2604          	jrne	L116
1584                     ; 603     status = SUCCESS;
1586  003f a601          	ld	a,#1
1589  0041 2001          	jra	L316
1590  0043               L116:
1591                     ; 608     status = ERROR;
1593  0043 4f            	clr	a
1595  0044               L316:
1596                     ; 612   return status;
1600  0044 5b08          	addw	sp,#8
1601  0046 81            	ret	
1650                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
1650                     ; 630 {
1651                     .text:	section	.text,new
1652  0000               _I2C_GetLastEvent:
1654  0000 5206          	subw	sp,#6
1655       00000006      OFST:	set	6
1658                     ; 631   __IO uint16_t lastevent = 0;
1660  0002 5f            	clrw	x
1661  0003 1f05          	ldw	(OFST-1,sp),x
1663                     ; 632   uint16_t flag1 = 0;
1665                     ; 633   uint16_t flag2 = 0;
1667                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1669  0005 7205521805    	btjf	21016,#2,L736
1670                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1672  000a ae0004        	ldw	x,#4
1674  000d 2013          	jra	L146
1675  000f               L736:
1676                     ; 642     flag1 = I2C->SR1;
1678  000f c65217        	ld	a,21015
1679  0012 97            	ld	xl,a
1680  0013 1f01          	ldw	(OFST-5,sp),x
1682                     ; 643     flag2 = I2C->SR3;
1684  0015 c65219        	ld	a,21017
1685  0018 5f            	clrw	x
1686  0019 97            	ld	xl,a
1687  001a 1f03          	ldw	(OFST-3,sp),x
1689                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1691  001c 7b02          	ld	a,(OFST-4,sp)
1692  001e 01            	rrwa	x,a
1693  001f 1a01          	or	a,(OFST-5,sp)
1694  0021 01            	rrwa	x,a
1695  0022               L146:
1696  0022 1f05          	ldw	(OFST-1,sp),x
1698                     ; 649   return (I2C_Event_TypeDef)lastevent;
1700  0024 1e05          	ldw	x,(OFST-1,sp)
1703  0026 5b06          	addw	sp,#6
1704  0028 81            	ret	
1915                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1915                     ; 681 {
1916                     .text:	section	.text,new
1917  0000               _I2C_GetFlagStatus:
1919  0000 89            	pushw	x
1920  0001 89            	pushw	x
1921       00000002      OFST:	set	2
1924                     ; 682   uint8_t tempreg = 0;
1926  0002 0f02          	clr	(OFST+0,sp)
1928                     ; 683   uint8_t regindex = 0;
1930                     ; 684   FlagStatus bitstatus = RESET;
1932                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1934                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1936  0004 9e            	ld	a,xh
1937  0005 6b01          	ld	(OFST-1,sp),a
1939                     ; 692   switch (regindex)
1942                     ; 709     default:
1942                     ; 710       break;
1943  0007 4a            	dec	a
1944  0008 2708          	jreq	L346
1945  000a 4a            	dec	a
1946  000b 270a          	jreq	L546
1947  000d 4a            	dec	a
1948  000e 270c          	jreq	L746
1949  0010 200f          	jra	L757
1950  0012               L346:
1951                     ; 695     case 0x01:
1951                     ; 696       tempreg = (uint8_t)I2C->SR1;
1953  0012 c65217        	ld	a,21015
1954                     ; 697       break;
1956  0015 2008          	jp	LC003
1957  0017               L546:
1958                     ; 700     case 0x02:
1958                     ; 701       tempreg = (uint8_t)I2C->SR2;
1960  0017 c65218        	ld	a,21016
1961                     ; 702       break;
1963  001a 2003          	jp	LC003
1964  001c               L746:
1965                     ; 705     case 0x03:
1965                     ; 706       tempreg = (uint8_t)I2C->SR3;
1967  001c c65219        	ld	a,21017
1968  001f               LC003:
1969  001f 6b02          	ld	(OFST+0,sp),a
1971                     ; 707       break;
1973                     ; 709     default:
1973                     ; 710       break;
1975  0021               L757:
1976                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
1978  0021 7b04          	ld	a,(OFST+2,sp)
1979  0023 1502          	bcp	a,(OFST+0,sp)
1980  0025 2704          	jreq	L167
1981                     ; 717     bitstatus = SET;
1983  0027 a601          	ld	a,#1
1986  0029 2001          	jra	L367
1987  002b               L167:
1988                     ; 722     bitstatus = RESET;
1990  002b 4f            	clr	a
1992  002c               L367:
1993                     ; 725   return bitstatus;
1997  002c 5b04          	addw	sp,#4
1998  002e 81            	ret	
2040                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2040                     ; 761 {
2041                     .text:	section	.text,new
2042  0000               _I2C_ClearFlag:
2044  0000 89            	pushw	x
2045       00000002      OFST:	set	2
2048                     ; 762   uint16_t flagpos = 0;
2050                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2052                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2054  0001 01            	rrwa	x,a
2055  0002 5f            	clrw	x
2056  0003 02            	rlwa	x,a
2057  0004 1f01          	ldw	(OFST-1,sp),x
2059                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2061  0006 7b02          	ld	a,(OFST+0,sp)
2062  0008 43            	cpl	a
2063  0009 c75218        	ld	21016,a
2064                     ; 770 }
2067  000c 85            	popw	x
2068  000d 81            	ret	
2232                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2232                     ; 793 {
2233                     .text:	section	.text,new
2234  0000               _I2C_GetITStatus:
2236  0000 89            	pushw	x
2237  0001 5204          	subw	sp,#4
2238       00000004      OFST:	set	4
2241                     ; 794   ITStatus bitstatus = RESET;
2243                     ; 795   __IO uint8_t enablestatus = 0;
2245  0003 0f03          	clr	(OFST-1,sp)
2247                     ; 796   uint16_t tempregister = 0;
2249                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2251                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2253  0005 9e            	ld	a,xh
2254  0006 a407          	and	a,#7
2255  0008 5f            	clrw	x
2256  0009 97            	ld	xl,a
2257  000a 1f01          	ldw	(OFST-3,sp),x
2259                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2261  000c c6521a        	ld	a,21018
2262  000f 1402          	and	a,(OFST-2,sp)
2263  0011 6b03          	ld	(OFST-1,sp),a
2265                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2267  0013 7b05          	ld	a,(OFST+1,sp)
2268  0015 a430          	and	a,#48
2269  0017 97            	ld	xl,a
2270  0018 4f            	clr	a
2271  0019 02            	rlwa	x,a
2272  001a a30100        	cpw	x,#256
2273  001d 260d          	jrne	L1701
2274                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2276  001f c65217        	ld	a,21015
2277  0022 1506          	bcp	a,(OFST+2,sp)
2278  0024 2715          	jreq	L1011
2280  0026 0d03          	tnz	(OFST-1,sp)
2281  0028 2711          	jreq	L1011
2282                     ; 812       bitstatus = SET;
2284  002a 200b          	jp	LC005
2285                     ; 817       bitstatus = RESET;
2286  002c               L1701:
2287                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2289  002c c65218        	ld	a,21016
2290  002f 1506          	bcp	a,(OFST+2,sp)
2291  0031 2708          	jreq	L1011
2293  0033 0d03          	tnz	(OFST-1,sp)
2294  0035 2704          	jreq	L1011
2295                     ; 826       bitstatus = SET;
2297  0037               LC005:
2299  0037 a601          	ld	a,#1
2302  0039 2001          	jra	L7701
2303  003b               L1011:
2304                     ; 831       bitstatus = RESET;
2307  003b 4f            	clr	a
2309  003c               L7701:
2310                     ; 835   return  bitstatus;
2314  003c 5b06          	addw	sp,#6
2315  003e 81            	ret	
2358                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2358                     ; 874 {
2359                     .text:	section	.text,new
2360  0000               _I2C_ClearITPendingBit:
2362  0000 89            	pushw	x
2363       00000002      OFST:	set	2
2366                     ; 875   uint16_t flagpos = 0;
2368                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2370                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2372  0001 01            	rrwa	x,a
2373  0002 5f            	clrw	x
2374  0003 02            	rlwa	x,a
2375  0004 1f01          	ldw	(OFST-1,sp),x
2377                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2379  0006 7b02          	ld	a,(OFST+0,sp)
2380  0008 43            	cpl	a
2381  0009 c75218        	ld	21016,a
2382                     ; 885 }
2385  000c 85            	popw	x
2386  000d 81            	ret	
2399                     	xdef	_I2C_ClearITPendingBit
2400                     	xdef	_I2C_GetITStatus
2401                     	xdef	_I2C_ClearFlag
2402                     	xdef	_I2C_GetFlagStatus
2403                     	xdef	_I2C_GetLastEvent
2404                     	xdef	_I2C_CheckEvent
2405                     	xdef	_I2C_SendData
2406                     	xdef	_I2C_Send7bitAddress
2407                     	xdef	_I2C_ReceiveData
2408                     	xdef	_I2C_ITConfig
2409                     	xdef	_I2C_FastModeDutyCycleConfig
2410                     	xdef	_I2C_AcknowledgeConfig
2411                     	xdef	_I2C_StretchClockCmd
2412                     	xdef	_I2C_SoftwareResetCmd
2413                     	xdef	_I2C_GenerateSTOP
2414                     	xdef	_I2C_GenerateSTART
2415                     	xdef	_I2C_GeneralCallCmd
2416                     	xdef	_I2C_Cmd
2417                     	xdef	_I2C_Init
2418                     	xdef	_I2C_DeInit
2419                     	xref.b	c_lreg
2420                     	xref.b	c_x
2439                     	xref	c_sdivx
2440                     	xref	c_ludv
2441                     	xref	c_rtol
2442                     	xref	c_smul
2443                     	xref	c_lmul
2444                     	xref	c_lcmp
2445                     	xref	c_ltor
2446                     	end
