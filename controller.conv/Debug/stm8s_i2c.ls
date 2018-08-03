   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 61 void I2C_DeInit(void)
  45                     ; 62 {
  47                     	switch	.text
  48  0000               _I2C_DeInit:
  52                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  54  0000 725f5210      	clr	21008
  55                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  57  0004 725f5211      	clr	21009
  58                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  60  0008 725f5212      	clr	21010
  61                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  63  000c 725f5213      	clr	21011
  64                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  66  0010 725f5214      	clr	21012
  67                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  69  0014 725f521a      	clr	21018
  70                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  72  0018 725f521b      	clr	21019
  73                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  75  001c 725f521c      	clr	21020
  76                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  78  0020 3502521d      	mov	21021,#2
  79                     ; 72 }
  82  0024 81            	ret
 261                     .const:	section	.text
 262  0000               L01:
 263  0000 000186a1      	dc.l	100001
 264  0004               L21:
 265  0004 000f4240      	dc.l	1000000
 266                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 266                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 266                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 266                     ; 93 {
 267                     	switch	.text
 268  0025               _I2C_Init:
 270  0025 5209          	subw	sp,#9
 271       00000009      OFST:	set	9
 274                     ; 94   uint16_t result = 0x0004;
 276                     ; 95   uint16_t tmpval = 0;
 278                     ; 96   uint8_t tmpccrh = 0;
 280  0027 0f07          	clr	(OFST-2,sp)
 282                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 284                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 286                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 288                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 290                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 292                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 294                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 296  0029 c65212        	ld	a,21010
 297  002c a4c0          	and	a,#192
 298  002e c75212        	ld	21010,a
 299                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 301  0031 c65212        	ld	a,21010
 302  0034 1a15          	or	a,(OFST+12,sp)
 303  0036 c75212        	ld	21010,a
 304                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 306  0039 72115210      	bres	21008,#0
 307                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 309  003d c6521c        	ld	a,21020
 310  0040 a430          	and	a,#48
 311  0042 c7521c        	ld	21020,a
 312                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 314  0045 725f521b      	clr	21019
 315                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 317  0049 96            	ldw	x,sp
 318  004a 1c000c        	addw	x,#OFST+3
 319  004d cd0000        	call	c_ltor
 321  0050 ae0000        	ldw	x,#L01
 322  0053 cd0000        	call	c_lcmp
 324  0056 2403          	jruge	L41
 325  0058 cc00e5        	jp	L131
 326  005b               L41:
 327                     ; 125     tmpccrh = I2C_CCRH_FS;
 329  005b a680          	ld	a,#128
 330  005d 6b07          	ld	(OFST-2,sp),a
 332                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 334  005f 0d12          	tnz	(OFST+9,sp)
 335  0061 2630          	jrne	L331
 336                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 338  0063 96            	ldw	x,sp
 339  0064 1c000c        	addw	x,#OFST+3
 340  0067 cd0000        	call	c_ltor
 342  006a a603          	ld	a,#3
 343  006c cd0000        	call	c_smul
 345  006f 96            	ldw	x,sp
 346  0070 1c0001        	addw	x,#OFST-8
 347  0073 cd0000        	call	c_rtol
 350  0076 7b15          	ld	a,(OFST+12,sp)
 351  0078 b703          	ld	c_lreg+3,a
 352  007a 3f02          	clr	c_lreg+2
 353  007c 3f01          	clr	c_lreg+1
 354  007e 3f00          	clr	c_lreg
 355  0080 ae0004        	ldw	x,#L21
 356  0083 cd0000        	call	c_lmul
 358  0086 96            	ldw	x,sp
 359  0087 1c0001        	addw	x,#OFST-8
 360  008a cd0000        	call	c_ludv
 362  008d be02          	ldw	x,c_lreg+2
 363  008f 1f08          	ldw	(OFST-1,sp),x
 366  0091 2034          	jra	L531
 367  0093               L331:
 368                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 370  0093 96            	ldw	x,sp
 371  0094 1c000c        	addw	x,#OFST+3
 372  0097 cd0000        	call	c_ltor
 374  009a a619          	ld	a,#25
 375  009c cd0000        	call	c_smul
 377  009f 96            	ldw	x,sp
 378  00a0 1c0001        	addw	x,#OFST-8
 379  00a3 cd0000        	call	c_rtol
 382  00a6 7b15          	ld	a,(OFST+12,sp)
 383  00a8 b703          	ld	c_lreg+3,a
 384  00aa 3f02          	clr	c_lreg+2
 385  00ac 3f01          	clr	c_lreg+1
 386  00ae 3f00          	clr	c_lreg
 387  00b0 ae0004        	ldw	x,#L21
 388  00b3 cd0000        	call	c_lmul
 390  00b6 96            	ldw	x,sp
 391  00b7 1c0001        	addw	x,#OFST-8
 392  00ba cd0000        	call	c_ludv
 394  00bd be02          	ldw	x,c_lreg+2
 395  00bf 1f08          	ldw	(OFST-1,sp),x
 397                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 399  00c1 7b07          	ld	a,(OFST-2,sp)
 400  00c3 aa40          	or	a,#64
 401  00c5 6b07          	ld	(OFST-2,sp),a
 403  00c7               L531:
 404                     ; 141     if (result < (uint16_t)0x01)
 406  00c7 1e08          	ldw	x,(OFST-1,sp)
 407  00c9 2605          	jrne	L731
 408                     ; 144       result = (uint16_t)0x0001;
 410  00cb ae0001        	ldw	x,#1
 411  00ce 1f08          	ldw	(OFST-1,sp),x
 413  00d0               L731:
 414                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 416  00d0 7b15          	ld	a,(OFST+12,sp)
 417  00d2 97            	ld	xl,a
 418  00d3 a603          	ld	a,#3
 419  00d5 42            	mul	x,a
 420  00d6 a60a          	ld	a,#10
 421  00d8 cd0000        	call	c_sdivx
 423  00db 5c            	incw	x
 424  00dc 1f05          	ldw	(OFST-4,sp),x
 426                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 428  00de 7b06          	ld	a,(OFST-3,sp)
 429  00e0 c7521d        	ld	21021,a
 431  00e3 2043          	jra	L141
 432  00e5               L131:
 433                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 435  00e5 96            	ldw	x,sp
 436  00e6 1c000c        	addw	x,#OFST+3
 437  00e9 cd0000        	call	c_ltor
 439  00ec 3803          	sll	c_lreg+3
 440  00ee 3902          	rlc	c_lreg+2
 441  00f0 3901          	rlc	c_lreg+1
 442  00f2 3900          	rlc	c_lreg
 443  00f4 96            	ldw	x,sp
 444  00f5 1c0001        	addw	x,#OFST-8
 445  00f8 cd0000        	call	c_rtol
 448  00fb 7b15          	ld	a,(OFST+12,sp)
 449  00fd b703          	ld	c_lreg+3,a
 450  00ff 3f02          	clr	c_lreg+2
 451  0101 3f01          	clr	c_lreg+1
 452  0103 3f00          	clr	c_lreg
 453  0105 ae0004        	ldw	x,#L21
 454  0108 cd0000        	call	c_lmul
 456  010b 96            	ldw	x,sp
 457  010c 1c0001        	addw	x,#OFST-8
 458  010f cd0000        	call	c_ludv
 460  0112 be02          	ldw	x,c_lreg+2
 461  0114 1f08          	ldw	(OFST-1,sp),x
 463                     ; 161     if (result < (uint16_t)0x0004)
 465  0116 1e08          	ldw	x,(OFST-1,sp)
 466  0118 a30004        	cpw	x,#4
 467  011b 2405          	jruge	L341
 468                     ; 164       result = (uint16_t)0x0004;
 470  011d ae0004        	ldw	x,#4
 471  0120 1f08          	ldw	(OFST-1,sp),x
 473  0122               L341:
 474                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 476  0122 7b15          	ld	a,(OFST+12,sp)
 477  0124 4c            	inc	a
 478  0125 c7521d        	ld	21021,a
 479  0128               L141:
 480                     ; 175   I2C->CCRL = (uint8_t)result;
 482  0128 7b09          	ld	a,(OFST+0,sp)
 483  012a c7521b        	ld	21019,a
 484                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 486  012d 7b08          	ld	a,(OFST-1,sp)
 487  012f a40f          	and	a,#15
 488  0131 1a07          	or	a,(OFST-2,sp)
 489  0133 c7521c        	ld	21020,a
 490                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 492  0136 72105210      	bset	21008,#0
 493                     ; 182   I2C_AcknowledgeConfig(Ack);
 495  013a 7b13          	ld	a,(OFST+10,sp)
 496  013c ad71          	call	_I2C_AcknowledgeConfig
 498                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 500  013e 7b11          	ld	a,(OFST+8,sp)
 501  0140 c75213        	ld	21011,a
 502                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 502                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 504  0143 1e10          	ldw	x,(OFST+7,sp)
 505  0145 4f            	clr	a
 506  0146 01            	rrwa	x,a
 507  0147 48            	sll	a
 508  0148 59            	rlcw	x
 509  0149 01            	rrwa	x,a
 510  014a a406          	and	a,#6
 511  014c 5f            	clrw	x
 512  014d 6b04          	ld	(OFST-5,sp),a
 514  014f 7b14          	ld	a,(OFST+11,sp)
 515  0151 aa40          	or	a,#64
 516  0153 1a04          	or	a,(OFST-5,sp)
 517  0155 c75214        	ld	21012,a
 518                     ; 188 }
 521  0158 5b09          	addw	sp,#9
 522  015a 81            	ret
 577                     ; 196 void I2C_Cmd(FunctionalState NewState)
 577                     ; 197 {
 578                     	switch	.text
 579  015b               _I2C_Cmd:
 583                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 585                     ; 202   if (NewState != DISABLE)
 587  015b 4d            	tnz	a
 588  015c 2706          	jreq	L371
 589                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 591  015e 72105210      	bset	21008,#0
 593  0162 2004          	jra	L571
 594  0164               L371:
 595                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 597  0164 72115210      	bres	21008,#0
 598  0168               L571:
 599                     ; 212 }
 602  0168 81            	ret
 637                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 637                     ; 221 {
 638                     	switch	.text
 639  0169               _I2C_GeneralCallCmd:
 643                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 645                     ; 226   if (NewState != DISABLE)
 647  0169 4d            	tnz	a
 648  016a 2706          	jreq	L512
 649                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 651  016c 721c5210      	bset	21008,#6
 653  0170 2004          	jra	L712
 654  0172               L512:
 655                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 657  0172 721d5210      	bres	21008,#6
 658  0176               L712:
 659                     ; 236 }
 662  0176 81            	ret
 697                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 697                     ; 247 {
 698                     	switch	.text
 699  0177               _I2C_GenerateSTART:
 703                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 705                     ; 252   if (NewState != DISABLE)
 707  0177 4d            	tnz	a
 708  0178 2706          	jreq	L732
 709                     ; 255     I2C->CR2 |= I2C_CR2_START;
 711  017a 72105211      	bset	21009,#0
 713  017e 2004          	jra	L142
 714  0180               L732:
 715                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 717  0180 72115211      	bres	21009,#0
 718  0184               L142:
 719                     ; 262 }
 722  0184 81            	ret
 757                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 757                     ; 271 {
 758                     	switch	.text
 759  0185               _I2C_GenerateSTOP:
 763                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 765                     ; 276   if (NewState != DISABLE)
 767  0185 4d            	tnz	a
 768  0186 2706          	jreq	L162
 769                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 771  0188 72125211      	bset	21009,#1
 773  018c 2004          	jra	L362
 774  018e               L162:
 775                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 777  018e 72135211      	bres	21009,#1
 778  0192               L362:
 779                     ; 286 }
 782  0192 81            	ret
 818                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
 818                     ; 295 {
 819                     	switch	.text
 820  0193               _I2C_SoftwareResetCmd:
 824                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 826                     ; 299   if (NewState != DISABLE)
 828  0193 4d            	tnz	a
 829  0194 2706          	jreq	L303
 830                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
 832  0196 721e5211      	bset	21009,#7
 834  019a 2004          	jra	L503
 835  019c               L303:
 836                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 838  019c 721f5211      	bres	21009,#7
 839  01a0               L503:
 840                     ; 309 }
 843  01a0 81            	ret
 879                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
 879                     ; 319 {
 880                     	switch	.text
 881  01a1               _I2C_StretchClockCmd:
 885                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 887                     ; 323   if (NewState != DISABLE)
 889  01a1 4d            	tnz	a
 890  01a2 2706          	jreq	L523
 891                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 893  01a4 721f5210      	bres	21008,#7
 895  01a8 2004          	jra	L723
 896  01aa               L523:
 897                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 899  01aa 721e5210      	bset	21008,#7
 900  01ae               L723:
 901                     ; 334 }
 904  01ae 81            	ret
 940                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 940                     ; 344 {
 941                     	switch	.text
 942  01af               _I2C_AcknowledgeConfig:
 944  01af 88            	push	a
 945       00000000      OFST:	set	0
 948                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
 950                     ; 349   if (Ack == I2C_ACK_NONE)
 952  01b0 4d            	tnz	a
 953  01b1 2606          	jrne	L743
 954                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 956  01b3 72155211      	bres	21009,#2
 958  01b7 2014          	jra	L153
 959  01b9               L743:
 960                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
 962  01b9 72145211      	bset	21009,#2
 963                     ; 359     if (Ack == I2C_ACK_CURR)
 965  01bd 7b01          	ld	a,(OFST+1,sp)
 966  01bf a101          	cp	a,#1
 967  01c1 2606          	jrne	L353
 968                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 970  01c3 72175211      	bres	21009,#3
 972  01c7 2004          	jra	L153
 973  01c9               L353:
 974                     ; 367       I2C->CR2 |= I2C_CR2_POS;
 976  01c9 72165211      	bset	21009,#3
 977  01cd               L153:
 978                     ; 370 }
 981  01cd 84            	pop	a
 982  01ce 81            	ret
1054                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1054                     ; 381 {
1055                     	switch	.text
1056  01cf               _I2C_ITConfig:
1058  01cf 89            	pushw	x
1059       00000000      OFST:	set	0
1062                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1064                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1066                     ; 387   if (NewState != DISABLE)
1068  01d0 9f            	ld	a,xl
1069  01d1 4d            	tnz	a
1070  01d2 2709          	jreq	L314
1071                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1073  01d4 9e            	ld	a,xh
1074  01d5 ca521a        	or	a,21018
1075  01d8 c7521a        	ld	21018,a
1077  01db 2009          	jra	L514
1078  01dd               L314:
1079                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1081  01dd 7b01          	ld	a,(OFST+1,sp)
1082  01df 43            	cpl	a
1083  01e0 c4521a        	and	a,21018
1084  01e3 c7521a        	ld	21018,a
1085  01e6               L514:
1086                     ; 397 }
1089  01e6 85            	popw	x
1090  01e7 81            	ret
1126                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1126                     ; 406 {
1127                     	switch	.text
1128  01e8               _I2C_FastModeDutyCycleConfig:
1132                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1134                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1136  01e8 a140          	cp	a,#64
1137  01ea 2606          	jrne	L534
1138                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1140  01ec 721c521c      	bset	21020,#6
1142  01f0 2004          	jra	L734
1143  01f2               L534:
1144                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1146  01f2 721d521c      	bres	21020,#6
1147  01f6               L734:
1148                     ; 421 }
1151  01f6 81            	ret
1174                     ; 428 uint8_t I2C_ReceiveData(void)
1174                     ; 429 {
1175                     	switch	.text
1176  01f7               _I2C_ReceiveData:
1180                     ; 431   return ((uint8_t)I2C->DR);
1182  01f7 c65216        	ld	a,21014
1185  01fa 81            	ret
1250                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1250                     ; 442 {
1251                     	switch	.text
1252  01fb               _I2C_Send7bitAddress:
1254  01fb 89            	pushw	x
1255       00000000      OFST:	set	0
1258                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1260                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1262                     ; 448   Address &= (uint8_t)0xFE;
1264  01fc 7b01          	ld	a,(OFST+1,sp)
1265  01fe a4fe          	and	a,#254
1266  0200 6b01          	ld	(OFST+1,sp),a
1267                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1269  0202 7b01          	ld	a,(OFST+1,sp)
1270  0204 1a02          	or	a,(OFST+2,sp)
1271  0206 c75216        	ld	21014,a
1272                     ; 452 }
1275  0209 85            	popw	x
1276  020a 81            	ret
1310                     ; 459 void I2C_SendData(uint8_t Data)
1310                     ; 460 {
1311                     	switch	.text
1312  020b               _I2C_SendData:
1316                     ; 462   I2C->DR = Data;
1318  020b c75216        	ld	21014,a
1319                     ; 463 }
1322  020e 81            	ret
1546                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1546                     ; 580 {
1547                     	switch	.text
1548  020f               _I2C_CheckEvent:
1550  020f 89            	pushw	x
1551  0210 5206          	subw	sp,#6
1552       00000006      OFST:	set	6
1555                     ; 581   __IO uint16_t lastevent = 0x00;
1557  0212 5f            	clrw	x
1558  0213 1f04          	ldw	(OFST-2,sp),x
1560                     ; 582   uint8_t flag1 = 0x00 ;
1562                     ; 583   uint8_t flag2 = 0x00;
1564                     ; 584   ErrorStatus status = ERROR;
1566                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1568                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1570  0215 1e07          	ldw	x,(OFST+1,sp)
1571  0217 a30004        	cpw	x,#4
1572  021a 260b          	jrne	L136
1573                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1575  021c c65218        	ld	a,21016
1576  021f a404          	and	a,#4
1577  0221 5f            	clrw	x
1578  0222 97            	ld	xl,a
1579  0223 1f04          	ldw	(OFST-2,sp),x
1582  0225 201f          	jra	L336
1583  0227               L136:
1584                     ; 595     flag1 = I2C->SR1;
1586  0227 c65217        	ld	a,21015
1587  022a 6b03          	ld	(OFST-3,sp),a
1589                     ; 596     flag2 = I2C->SR3;
1591  022c c65219        	ld	a,21017
1592  022f 6b06          	ld	(OFST+0,sp),a
1594                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1596  0231 7b03          	ld	a,(OFST-3,sp)
1597  0233 5f            	clrw	x
1598  0234 97            	ld	xl,a
1599  0235 1f01          	ldw	(OFST-5,sp),x
1601  0237 7b06          	ld	a,(OFST+0,sp)
1602  0239 5f            	clrw	x
1603  023a 97            	ld	xl,a
1604  023b 4f            	clr	a
1605  023c 02            	rlwa	x,a
1606  023d 01            	rrwa	x,a
1607  023e 1a02          	or	a,(OFST-4,sp)
1608  0240 01            	rrwa	x,a
1609  0241 1a01          	or	a,(OFST-5,sp)
1610  0243 01            	rrwa	x,a
1611  0244 1f04          	ldw	(OFST-2,sp),x
1613  0246               L336:
1614                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1616  0246 1e04          	ldw	x,(OFST-2,sp)
1617  0248 01            	rrwa	x,a
1618  0249 1408          	and	a,(OFST+2,sp)
1619  024b 01            	rrwa	x,a
1620  024c 1407          	and	a,(OFST+1,sp)
1621  024e 01            	rrwa	x,a
1622  024f 1307          	cpw	x,(OFST+1,sp)
1623  0251 2606          	jrne	L536
1624                     ; 603     status = SUCCESS;
1626  0253 a601          	ld	a,#1
1627  0255 6b06          	ld	(OFST+0,sp),a
1630  0257 2002          	jra	L736
1631  0259               L536:
1632                     ; 608     status = ERROR;
1634  0259 0f06          	clr	(OFST+0,sp)
1636  025b               L736:
1637                     ; 612   return status;
1639  025b 7b06          	ld	a,(OFST+0,sp)
1642  025d 5b08          	addw	sp,#8
1643  025f 81            	ret
1696                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
1696                     ; 630 {
1697                     	switch	.text
1698  0260               _I2C_GetLastEvent:
1700  0260 5206          	subw	sp,#6
1701       00000006      OFST:	set	6
1704                     ; 631   __IO uint16_t lastevent = 0;
1706  0262 5f            	clrw	x
1707  0263 1f05          	ldw	(OFST-1,sp),x
1709                     ; 632   uint16_t flag1 = 0;
1711                     ; 633   uint16_t flag2 = 0;
1713                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1715  0265 c65218        	ld	a,21016
1716  0268 a504          	bcp	a,#4
1717  026a 2707          	jreq	L766
1718                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1720  026c ae0004        	ldw	x,#4
1721  026f 1f05          	ldw	(OFST-1,sp),x
1724  0271 201b          	jra	L176
1725  0273               L766:
1726                     ; 642     flag1 = I2C->SR1;
1728  0273 c65217        	ld	a,21015
1729  0276 5f            	clrw	x
1730  0277 97            	ld	xl,a
1731  0278 1f01          	ldw	(OFST-5,sp),x
1733                     ; 643     flag2 = I2C->SR3;
1735  027a c65219        	ld	a,21017
1736  027d 5f            	clrw	x
1737  027e 97            	ld	xl,a
1738  027f 1f03          	ldw	(OFST-3,sp),x
1740                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1742  0281 1e03          	ldw	x,(OFST-3,sp)
1743  0283 4f            	clr	a
1744  0284 02            	rlwa	x,a
1745  0285 01            	rrwa	x,a
1746  0286 1a02          	or	a,(OFST-4,sp)
1747  0288 01            	rrwa	x,a
1748  0289 1a01          	or	a,(OFST-5,sp)
1749  028b 01            	rrwa	x,a
1750  028c 1f05          	ldw	(OFST-1,sp),x
1752  028e               L176:
1753                     ; 649   return (I2C_Event_TypeDef)lastevent;
1755  028e 1e05          	ldw	x,(OFST-1,sp)
1758  0290 5b06          	addw	sp,#6
1759  0292 81            	ret
1974                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1974                     ; 681 {
1975                     	switch	.text
1976  0293               _I2C_GetFlagStatus:
1978  0293 89            	pushw	x
1979  0294 89            	pushw	x
1980       00000002      OFST:	set	2
1983                     ; 682   uint8_t tempreg = 0;
1985  0295 0f02          	clr	(OFST+0,sp)
1987                     ; 683   uint8_t regindex = 0;
1989                     ; 684   FlagStatus bitstatus = RESET;
1991                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1993                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1995  0297 9e            	ld	a,xh
1996  0298 6b01          	ld	(OFST-1,sp),a
1998                     ; 692   switch (regindex)
2000  029a 7b01          	ld	a,(OFST-1,sp)
2002                     ; 709     default:
2002                     ; 710       break;
2003  029c 4a            	dec	a
2004  029d 2708          	jreq	L376
2005  029f 4a            	dec	a
2006  02a0 270c          	jreq	L576
2007  02a2 4a            	dec	a
2008  02a3 2710          	jreq	L776
2009  02a5 2013          	jra	L3101
2010  02a7               L376:
2011                     ; 695     case 0x01:
2011                     ; 696       tempreg = (uint8_t)I2C->SR1;
2013  02a7 c65217        	ld	a,21015
2014  02aa 6b02          	ld	(OFST+0,sp),a
2016                     ; 697       break;
2018  02ac 200c          	jra	L3101
2019  02ae               L576:
2020                     ; 700     case 0x02:
2020                     ; 701       tempreg = (uint8_t)I2C->SR2;
2022  02ae c65218        	ld	a,21016
2023  02b1 6b02          	ld	(OFST+0,sp),a
2025                     ; 702       break;
2027  02b3 2005          	jra	L3101
2028  02b5               L776:
2029                     ; 705     case 0x03:
2029                     ; 706       tempreg = (uint8_t)I2C->SR3;
2031  02b5 c65219        	ld	a,21017
2032  02b8 6b02          	ld	(OFST+0,sp),a
2034                     ; 707       break;
2036  02ba               L107:
2037                     ; 709     default:
2037                     ; 710       break;
2039  02ba               L3101:
2040                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2042  02ba 7b04          	ld	a,(OFST+2,sp)
2043  02bc 1502          	bcp	a,(OFST+0,sp)
2044  02be 2706          	jreq	L5101
2045                     ; 717     bitstatus = SET;
2047  02c0 a601          	ld	a,#1
2048  02c2 6b02          	ld	(OFST+0,sp),a
2051  02c4 2002          	jra	L7101
2052  02c6               L5101:
2053                     ; 722     bitstatus = RESET;
2055  02c6 0f02          	clr	(OFST+0,sp)
2057  02c8               L7101:
2058                     ; 725   return bitstatus;
2060  02c8 7b02          	ld	a,(OFST+0,sp)
2063  02ca 5b04          	addw	sp,#4
2064  02cc 81            	ret
2108                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2108                     ; 761 {
2109                     	switch	.text
2110  02cd               _I2C_ClearFlag:
2112  02cd 89            	pushw	x
2113       00000002      OFST:	set	2
2116                     ; 762   uint16_t flagpos = 0;
2118                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2120                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2122  02ce 01            	rrwa	x,a
2123  02cf a4ff          	and	a,#255
2124  02d1 5f            	clrw	x
2125  02d2 02            	rlwa	x,a
2126  02d3 1f01          	ldw	(OFST-1,sp),x
2127  02d5 01            	rrwa	x,a
2129                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2131  02d6 7b02          	ld	a,(OFST+0,sp)
2132  02d8 43            	cpl	a
2133  02d9 c75218        	ld	21016,a
2134                     ; 770 }
2137  02dc 85            	popw	x
2138  02dd 81            	ret
2304                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2304                     ; 793 {
2305                     	switch	.text
2306  02de               _I2C_GetITStatus:
2308  02de 89            	pushw	x
2309  02df 5204          	subw	sp,#4
2310       00000004      OFST:	set	4
2313                     ; 794   ITStatus bitstatus = RESET;
2315                     ; 795   __IO uint8_t enablestatus = 0;
2317  02e1 0f03          	clr	(OFST-1,sp)
2319                     ; 796   uint16_t tempregister = 0;
2321                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2323                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2325  02e3 9e            	ld	a,xh
2326  02e4 a407          	and	a,#7
2327  02e6 5f            	clrw	x
2328  02e7 97            	ld	xl,a
2329  02e8 1f01          	ldw	(OFST-3,sp),x
2331                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2333  02ea c6521a        	ld	a,21018
2334  02ed 1402          	and	a,(OFST-2,sp)
2335  02ef 6b03          	ld	(OFST-1,sp),a
2337                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2339  02f1 7b05          	ld	a,(OFST+1,sp)
2340  02f3 97            	ld	xl,a
2341  02f4 7b06          	ld	a,(OFST+2,sp)
2342  02f6 9f            	ld	a,xl
2343  02f7 a430          	and	a,#48
2344  02f9 97            	ld	xl,a
2345  02fa 4f            	clr	a
2346  02fb 02            	rlwa	x,a
2347  02fc a30100        	cpw	x,#256
2348  02ff 2615          	jrne	L1311
2349                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2351  0301 c65217        	ld	a,21015
2352  0304 1506          	bcp	a,(OFST+2,sp)
2353  0306 270a          	jreq	L3311
2355  0308 0d03          	tnz	(OFST-1,sp)
2356  030a 2706          	jreq	L3311
2357                     ; 812       bitstatus = SET;
2359  030c a601          	ld	a,#1
2360  030e 6b04          	ld	(OFST+0,sp),a
2363  0310 2017          	jra	L7311
2364  0312               L3311:
2365                     ; 817       bitstatus = RESET;
2367  0312 0f04          	clr	(OFST+0,sp)
2369  0314 2013          	jra	L7311
2370  0316               L1311:
2371                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2373  0316 c65218        	ld	a,21016
2374  0319 1506          	bcp	a,(OFST+2,sp)
2375  031b 270a          	jreq	L1411
2377  031d 0d03          	tnz	(OFST-1,sp)
2378  031f 2706          	jreq	L1411
2379                     ; 826       bitstatus = SET;
2381  0321 a601          	ld	a,#1
2382  0323 6b04          	ld	(OFST+0,sp),a
2385  0325 2002          	jra	L7311
2386  0327               L1411:
2387                     ; 831       bitstatus = RESET;
2389  0327 0f04          	clr	(OFST+0,sp)
2391  0329               L7311:
2392                     ; 835   return  bitstatus;
2394  0329 7b04          	ld	a,(OFST+0,sp)
2397  032b 5b06          	addw	sp,#6
2398  032d 81            	ret
2443                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2443                     ; 874 {
2444                     	switch	.text
2445  032e               _I2C_ClearITPendingBit:
2447  032e 89            	pushw	x
2448       00000002      OFST:	set	2
2451                     ; 875   uint16_t flagpos = 0;
2453                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2455                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2457  032f 01            	rrwa	x,a
2458  0330 a4ff          	and	a,#255
2459  0332 5f            	clrw	x
2460  0333 02            	rlwa	x,a
2461  0334 1f01          	ldw	(OFST-1,sp),x
2462  0336 01            	rrwa	x,a
2464                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2466  0337 7b02          	ld	a,(OFST+0,sp)
2467  0339 43            	cpl	a
2468  033a c75218        	ld	21016,a
2469                     ; 885 }
2472  033d 85            	popw	x
2473  033e 81            	ret
2486                     	xdef	_I2C_ClearITPendingBit
2487                     	xdef	_I2C_GetITStatus
2488                     	xdef	_I2C_ClearFlag
2489                     	xdef	_I2C_GetFlagStatus
2490                     	xdef	_I2C_GetLastEvent
2491                     	xdef	_I2C_CheckEvent
2492                     	xdef	_I2C_SendData
2493                     	xdef	_I2C_Send7bitAddress
2494                     	xdef	_I2C_ReceiveData
2495                     	xdef	_I2C_ITConfig
2496                     	xdef	_I2C_FastModeDutyCycleConfig
2497                     	xdef	_I2C_AcknowledgeConfig
2498                     	xdef	_I2C_StretchClockCmd
2499                     	xdef	_I2C_SoftwareResetCmd
2500                     	xdef	_I2C_GenerateSTOP
2501                     	xdef	_I2C_GenerateSTART
2502                     	xdef	_I2C_GeneralCallCmd
2503                     	xdef	_I2C_Cmd
2504                     	xdef	_I2C_Init
2505                     	xdef	_I2C_DeInit
2506                     	xref.b	c_lreg
2507                     	xref.b	c_x
2526                     	xref	c_sdivx
2527                     	xref	c_ludv
2528                     	xref	c_rtol
2529                     	xref	c_smul
2530                     	xref	c_lmul
2531                     	xref	c_lcmp
2532                     	xref	c_ltor
2533                     	end
