   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  23                     	switch	.data
  24  0000               _IO_LED:
  25  0000 5005          	dc.w	20485
  26  0002 10            	dc.b	16
  27  0003               _IO_ORG:
  28  0003 5000          	dc.w	20480
  29  0005 02            	dc.b	2
  30  0006               _IO_X1:
  31  0006 5000          	dc.w	20480
  32  0008 08            	dc.b	8
  33  0009               _IO_X2:
  34  0009 500f          	dc.w	20495
  35  000b 40            	dc.b	64
  36  000c               _IO_Y1:
  37  000c 500a          	dc.w	20490
  38  000e 20            	dc.b	32
  39  000f               _IO_Y2:
  40  000f 5000          	dc.w	20480
  41  0011 04            	dc.b	4
  42  0012               _IO_ADJ:
  43  0012 500a          	dc.w	20490
  44  0014 10            	dc.b	16
  45  0015               _IO_SEN:
  46  0015 500f          	dc.w	20495
  47  0017 04            	dc.b	4
  48  0018               _IO_POWER:
  49  0018 500f          	dc.w	20495
  50  001a 20            	dc.b	32
  51  001b               _IO_MOD:
  52  001b 500f          	dc.w	20495
  53  001d 10            	dc.b	16
  54  001e               _IO_BAT:
  55  001e 500f          	dc.w	20495
  56  0020 08            	dc.b	8
  57  0021               _IO_BOOST:
  58  0021 500f          	dc.w	20495
  59  0023 40            	dc.b	64
  60  0024               _IO_CHARGE:
  61  0024 5000          	dc.w	20480
  62  0026 08            	dc.b	8
 115                     ; 22 void	factory(uint8_t mode)
 115                     ; 23 {
 117                     .text:	section	.text,new
 118  0000               _factory:
 120  0000 5204          	subw	sp,#4
 121       00000004      OFST:	set	4
 124                     ; 24 	uint16_t t = 0, _t = 0;
 126  0002 5f            	clrw	x
 127  0003 1f01          	ldw	(OFST-3,sp),x
 131  0005 1f03          	ldw	(OFST-1,sp),x
 133                     ; 25 	if( mode == 0 )
 135  0007 4d            	tnz	a
 136  0008 2603          	jrne	L33
 137                     ; 26 		return;
 140  000a 5b04          	addw	sp,#4
 141  000c 81            	ret	
 142  000d               L33:
 143                     ; 31 		if( Ticks_1mS == _t )
 145  000d ce0000        	ldw	x,_Ticks_1mS
 146  0010 1303          	cpw	x,(OFST-1,sp)
 147  0012 27f9          	jreq	L33
 148                     ; 32 			continue;
 150                     ; 33 		_t = Ticks_1mS;
 152  0014 1f03          	ldw	(OFST-1,sp),x
 154                     ; 34 		t++;
 156  0016 1e01          	ldw	x,(OFST-3,sp)
 157  0018 5c            	incw	x
 158  0019 1f01          	ldw	(OFST-3,sp),x
 160                     ; 35 		if( t > 200 )
 162  001b 20f0          	jra	L33
 187                     ; 44 void configClock(void)
 187                     ; 45 {
 188                     .text:	section	.text,new
 189  0000               _configClock:
 193                     ; 46 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
 195  0000 4f            	clr	a
 196  0001 cd0000        	call	_CLK_SYSCLKConfig
 198                     ; 47 	CLK_HSICmd(ENABLE);
 200  0004 a601          	ld	a,#1
 202                     ; 48 }
 205  0006 cc0000        	jp	_CLK_HSICmd
 246                     ; 51 void configGpioMode(void)
 246                     ; 52 {
 247                     .text:	section	.text,new
 248  0000               _configGpioMode:
 250  0000 89            	pushw	x
 251       00000002      OFST:	set	2
 254                     ; 53 	uint8_t t = 0;
 256  0001 0f01          	clr	(OFST-1,sp)
 258                     ; 54 	uint8_t prev = 0;
 260  0003 0f02          	clr	(OFST+0,sp)
 262                     ; 59 	Drive.DeviceType = TYPE_MD24;
 264  0005 35010016      	mov	_Drive+22,#1
 265                     ; 60 	Ticks_1mS = 0;
 267  0009 5f            	clrw	x
 268  000a cf0000        	ldw	_Ticks_1mS,x
 269                     ; 61 	return;
 272  000d 85            	popw	x
 273  000e 81            	ret	
 310                     ; 108 void configGpio(void)
 310                     ; 109 {
 311                     .text:	section	.text,new
 312  0000               _configGpio:
 316                     ; 110 	configGpioMode();
 318  0000 cd0000        	call	_configGpioMode
 320                     ; 112 	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
 322  0003 4be0          	push	#224
 323  0005 3b0002        	push	_IO_LED+2
 324  0008 ce0000        	ldw	x,_IO_LED
 325  000b cd0000        	call	_GPIO_Init
 327  000e 85            	popw	x
 328                     ; 113 	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
 330  000f 4b00          	push	#0
 331  0011 3b0005        	push	_IO_ORG+2
 332  0014 ce0003        	ldw	x,_IO_ORG
 333  0017 cd0000        	call	_GPIO_Init
 335  001a 85            	popw	x
 336                     ; 114 	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
 338  001b 4be0          	push	#224
 339  001d 3b0008        	push	_IO_X1+2
 340  0020 ce0006        	ldw	x,_IO_X1
 341  0023 cd0000        	call	_GPIO_Init
 343  0026 85            	popw	x
 344                     ; 115 	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
 346  0027 4be0          	push	#224
 347  0029 3b000b        	push	_IO_X2+2
 348  002c ce0009        	ldw	x,_IO_X2
 349  002f cd0000        	call	_GPIO_Init
 351  0032 85            	popw	x
 352                     ; 116 	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
 354  0033 4be0          	push	#224
 355  0035 3b000e        	push	_IO_Y1+2
 356  0038 ce000c        	ldw	x,_IO_Y1
 357  003b cd0000        	call	_GPIO_Init
 359  003e 85            	popw	x
 360                     ; 117 	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
 362  003f 4be0          	push	#224
 363  0041 3b0011        	push	_IO_Y2+2
 364  0044 ce000f        	ldw	x,_IO_Y2
 365  0047 cd0000        	call	_GPIO_Init
 367  004a 85            	popw	x
 368                     ; 119 	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
 370  004b 4b00          	push	#0
 371  004d 3b0014        	push	_IO_ADJ+2
 372  0050 ce0012        	ldw	x,_IO_ADJ
 373  0053 cd0000        	call	_GPIO_Init
 375  0056 85            	popw	x
 376                     ; 120 	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
 378  0057 4b00          	push	#0
 379  0059 3b0017        	push	_IO_SEN+2
 380  005c ce0015        	ldw	x,_IO_SEN
 381  005f cd0000        	call	_GPIO_Init
 383  0062 85            	popw	x
 384                     ; 121 	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
 386  0063 4b00          	push	#0
 387  0065 3b001a        	push	_IO_POWER+2
 388  0068 ce0018        	ldw	x,_IO_POWER
 389  006b cd0000        	call	_GPIO_Init
 391  006e c60016        	ld	a,_Drive+22
 392  0071 4a            	dec	a
 393  0072 85            	popw	x
 394                     ; 122 	if( Drive.DeviceType == TYPE_MD24 )
 396  0073 2601          	jrne	L101
 397                     ; 124 		return;
 400  0075 81            	ret	
 401  0076               L101:
 402                     ; 127 	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
 404  0076 4b00          	push	#0
 405  0078 3b0020        	push	_IO_BAT+2
 406  007b ce001e        	ldw	x,_IO_BAT
 407  007e cd0000        	call	_GPIO_Init
 409  0081 c60016        	ld	a,_Drive+22
 410  0084 a102          	cp	a,#2
 411  0086 85            	popw	x
 412                     ; 129 	if( Drive.DeviceType == TYPE_MD12 )
 414  0087 2618          	jrne	L301
 415                     ; 131 		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
 417  0089 4b00          	push	#0
 418  008b 3b0023        	push	_IO_BOOST+2
 419  008e ce0021        	ldw	x,_IO_BOOST
 420  0091 cd0000        	call	_GPIO_Init
 422  0094 85            	popw	x
 423                     ; 132 		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
 425  0095 4b00          	push	#0
 426  0097 3b001a        	push	_IO_POWER+2
 427  009a ce0018        	ldw	x,_IO_POWER
 428  009d cd0000        	call	_GPIO_Init
 430  00a0 85            	popw	x
 431  00a1               L301:
 432                     ; 134 }
 435  00a1 81            	ret	
 469                     ; 137 void configTimer(void)
 469                     ; 138 {
 470                     .text:	section	.text,new
 471  0000               _configTimer:
 475                     ; 141 	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);
 477  0000 ae0432        	ldw	x,#1074
 478  0003 cd0000        	call	_TIM4_TimeBaseInit
 480                     ; 142 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 482  0006 ae0101        	ldw	x,#257
 483  0009 cd0000        	call	_TIM4_ITConfig
 485                     ; 143   	TIM4_Cmd(ENABLE);
 487  000c a601          	ld	a,#1
 488  000e cd0000        	call	_TIM4_Cmd
 490                     ; 147 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 492  0011 ae0701        	ldw	x,#1793
 493  0014 cd0000        	call	_CLK_PeripheralClockConfig
 495                     ; 148 	TIM1_TimeBaseInit(0x02, TIM1_COUNTERMODE_UP, 0xffff, 0);	//	4 -> 0.25us
 497  0017 4b00          	push	#0
 498  0019 aeffff        	ldw	x,#65535
 499  001c 89            	pushw	x
 500  001d 4b00          	push	#0
 501  001f ae0002        	ldw	x,#2
 502  0022 cd0000        	call	_TIM1_TimeBaseInit
 504  0025 5b04          	addw	sp,#4
 505                     ; 149 	TIM1_PWMIConfig(TIM1_CHANNEL_2, 
 505                     ; 150 			TIM1_ICPOLARITY_RISING, //TIM1_ICPOLARITY_FALLING, 
 505                     ; 151 			TIM1_ICSELECTION_DIRECTTI, 
 505                     ; 152 			TIM1_ICPSC_DIV1, 0);
 507  0027 4b00          	push	#0
 508  0029 4b00          	push	#0
 509  002b 4b01          	push	#1
 510  002d ae0100        	ldw	x,#256
 511  0030 cd0000        	call	_TIM1_PWMIConfig
 513  0033 5b03          	addw	sp,#3
 514                     ; 153 	TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
 516  0035 a650          	ld	a,#80
 517  0037 cd0000        	call	_TIM1_SelectInputTrigger
 519                     ; 154 	TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET);
 521  003a a604          	ld	a,#4
 522  003c cd0000        	call	_TIM1_SelectSlaveMode
 524                     ; 155 	TIM1_ITConfig(TIM1_IT_UPDATE | TIM1_IT_CC1 | TIM1_IT_CC2, ENABLE);
 526  003f ae0701        	ldw	x,#1793
 527  0042 cd0000        	call	_TIM1_ITConfig
 529                     ; 156 	TIM1_SetCounter(0xffff);
 531  0045 aeffff        	ldw	x,#65535
 532  0048 cd0000        	call	_TIM1_SetCounter
 534                     ; 157 	TIM1_Cmd(ENABLE);
 536  004b a601          	ld	a,#1
 538                     ; 160 }
 541  004d cc0000        	jp	_TIM1_Cmd
 588                     ; 163 uint8_t  Diff(uint16_t time, uint16_t diff)
 588                     ; 164 {
 589                     .text:	section	.text,new
 590  0000               _Diff:
 592  0000 89            	pushw	x
 593  0001 89            	pushw	x
 594       00000002      OFST:	set	2
 597                     ; 165 	uint16_t t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
 599  0002 c30000        	cpw	x,_Ticks_1mS
 600  0005 2208          	jrugt	L401
 601  0007 ce0000        	ldw	x,_Ticks_1mS
 602  000a 72f003        	subw	x,(OFST+1,sp)
 603  000d 200a          	jra	L601
 604  000f               L401:
 605  000f aeffff        	ldw	x,#65535
 606  0012 72f003        	subw	x,(OFST+1,sp)
 607  0015 72bb0000      	addw	x,_Ticks_1mS
 608  0019               L601:
 609  0019 1f01          	ldw	(OFST-1,sp),x
 611                     ; 166 	return t > diff ? 1 : 0;
 613  001b 1307          	cpw	x,(OFST+5,sp)
 614  001d 2304          	jrule	L011
 615  001f a601          	ld	a,#1
 616  0021 2001          	jra	L211
 617  0023               L011:
 618  0023 4f            	clr	a
 619  0024               L211:
 622  0024 5b04          	addw	sp,#4
 623  0026 81            	ret	
 655                     ; 170 uint16_t CPulse(uint8_t step)
 655                     ; 171 {
 656                     .text:	section	.text,new
 657  0000               _CPulse:
 661                     ; 172 	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
 663  0000 5f            	clrw	x
 664  0001 97            	ld	xl,a
 665  0002 90ae001a      	ldw	y,#26
 669  0006 cc0000        	jp	c_imul
 705                     ; 176 void	waitPowerDelay(uint16_t time)
 705                     ; 177 {
 706                     .text:	section	.text,new
 707  0000               _waitPowerDelay:
 709  0000 89            	pushw	x
 710       00000000      OFST:	set	0
 713                     ; 178 	LightOn
 715  0001 3b0002        	push	_IO_LED+2
 716  0004 ce0000        	ldw	x,_IO_LED
 717  0007 cd0000        	call	_GPIO_WriteLow
 719  000a ce0000        	ldw	x,_Ticks_1mS
 720  000d 84            	pop	a
 722  000e               L761:
 723                     ; 179 	while(Ticks_1mS < time)
 725  000e 1301          	cpw	x,(OFST+1,sp)
 726  0010 25fc          	jrult	L761
 727                     ; 181 	LightOff
 729  0012 3b0002        	push	_IO_LED+2
 730  0015 ce0000        	ldw	x,_IO_LED
 731  0018 cd0000        	call	_GPIO_WriteHigh
 733  001b 84            	pop	a
 734                     ; 183 }
 737  001c 85            	popw	x
 738  001d 81            	ret	
1064                     	xdef	_configGpioMode
1065                     	xdef	_factory
1066                     	xdef	_configGpio
1067                     	xdef	_configTimer
1068                     	xdef	_configClock
1069                     	xdef	_waitPowerDelay
1070                     	xdef	_CPulse
1071                     	xdef	_Diff
1072                     	xref	_Ticks_1mS
1073                     	xdef	_IO_CHARGE
1074                     	xdef	_IO_BOOST
1075                     	xdef	_IO_BAT
1076                     	xdef	_IO_MOD
1077                     	xdef	_IO_POWER
1078                     	xdef	_IO_SEN
1079                     	xdef	_IO_ADJ
1080                     	xdef	_IO_ORG
1081                     	xdef	_IO_LED
1082                     	xdef	_IO_Y2
1083                     	xdef	_IO_Y1
1084                     	xdef	_IO_X2
1085                     	xdef	_IO_X1
1086                     	xref	_Drive
1087                     	xref	_TIM4_ITConfig
1088                     	xref	_TIM4_Cmd
1089                     	xref	_TIM4_TimeBaseInit
1090                     	xref	_TIM1_SetCounter
1091                     	xref	_TIM1_SelectSlaveMode
1092                     	xref	_TIM1_SelectInputTrigger
1093                     	xref	_TIM1_ITConfig
1094                     	xref	_TIM1_Cmd
1095                     	xref	_TIM1_PWMIConfig
1096                     	xref	_TIM1_TimeBaseInit
1097                     	xref	_GPIO_WriteLow
1098                     	xref	_GPIO_WriteHigh
1099                     	xref	_GPIO_Init
1100                     	xref	_CLK_SYSCLKConfig
1101                     	xref	_CLK_PeripheralClockConfig
1102                     	xref	_CLK_HSICmd
1103                     	xref.b	c_x
1122                     	xref	c_imul
1123                     	end
