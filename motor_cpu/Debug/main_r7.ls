   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  23                     	switch	.data
  24  0000               _lightBlink:
  25  0000 01f4          	dc.w	500
  71                     ; 80 uint8_t	stepCalc(uint16_t duty)
  71                     ; 81 {
  73                     .text:	section	.text,new
  74  0000               _stepCalc:
  76  0000 89            	pushw	x
  77  0001 89            	pushw	x
  78       00000002      OFST:	set	2
  81                     ; 83 	if ( dutyInfo.n < 16 )
  83  0002 c60070        	ld	a,_dutyInfo+33
  84  0005 a110          	cp	a,#16
  85  0007 2407          	jruge	L72
  86                     ; 84 		dutyInfo.n ++;
  88  0009 725c0070      	inc	_dutyInfo+33
  89  000d c60070        	ld	a,_dutyInfo+33
  90  0010               L72:
  91                     ; 85 	t = (duty / dutyInfo.n) * 2 + 1;	
  93  0010 62            	div	x,a
  94  0011 58            	sllw	x
  95  0012 5c            	incw	x
  96  0013 1f01          	ldw	(OFST-1,sp),x
  98                     ; 86 	t /= 2;
 100  0015 0401          	srl	(OFST-1,sp)
 101  0017 0602          	rrc	(OFST+0,sp)
 103                     ; 87 	if( t < 20 )	t = 20;
 105  0019 1e01          	ldw	x,(OFST-1,sp)
 106  001b a30014        	cpw	x,#20
 107  001e 2403          	jruge	L13
 110  0020 ae0014        	ldw	x,#20
 112  0023               L13:
 113                     ; 88 	if( t > 180 )	t = 180;
 115  0023 a300b5        	cpw	x,#181
 116  0026 2503          	jrult	L33
 119  0028 ae00b4        	ldw	x,#180
 121  002b               L33:
 122                     ; 90 	t = (625 * t)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
 124  002b 90ae0271      	ldw	y,#625
 125  002f cd0000        	call	c_imul
 127  0032 a60a          	ld	a,#10
 128  0034 62            	div	x,a
 129  0035 1d04e2        	subw	x,#1250
 131                     ; 91 	t = (t / 25 + 1 ) /	2;
 133  0038 a619          	ld	a,#25
 134  003a 62            	div	x,a
 135  003b 5c            	incw	x
 136  003c 54            	srlw	x
 137  003d 1f01          	ldw	(OFST-1,sp),x
 139                     ; 93 	return (uint8_t)t;
 141  003f 7b02          	ld	a,(OFST+0,sp)
 144  0041 5b04          	addw	sp,#4
 145  0043 81            	ret	
 168                     ; 96 OnTimer_1S(void) {}
 169                     .text:	section	.text,new
 170  0000               _OnTimer_1S:
 177  0000 81            	ret	
 180                     	switch	.data
 181  0002               __chan:
 182  0002 03            	dc.b	3
 183  0003 04            	dc.b	4
 184  0004 05            	dc.b	5
 185  0005 06            	dc.b	6
 186  0006 02            	dc.b	2
 187  0007               __chanSchmit:
 188  0007 03            	dc.b	3
 189  0008 04            	dc.b	4
 190  0009 05            	dc.b	5
 191  000a 06            	dc.b	6
 192  000b 02            	dc.b	2
 193  000c               __chanId:
 194  000c 01            	dc.b	1
 195  000d 02            	dc.b	2
 196  000e 03            	dc.b	3
 197  000f 04            	dc.b	4
 198  0010 00            	dc.b	0
 237                     ; 112 void	AdcGetCode(uint8_t ch)
 237                     ; 113 {
 238                     .text:	section	.text,new
 239  0000               _AdcGetCode:
 241  0000 88            	push	a
 242  0001 5203          	subw	sp,#3
 243       00000003      OFST:	set	3
 246                     ; 118 	uint8_t i = 0;
 248                     ; 120 	Adc.buf[ch].b[i] = ADC1_GetConversionValue();
 250  0003 cd0000        	call	_ADC1_GetConversionValue
 252  0006 1f01          	ldw	(OFST-2,sp),x
 254  0008 7b04          	ld	a,(OFST+1,sp)
 255  000a 97            	ld	xl,a
 256  000b a609          	ld	a,#9
 257  000d 42            	mul	x,a
 258  000e 1601          	ldw	y,(OFST-2,sp)
 259  0010 df0001        	ldw	(_Adc+1,x),y
 260                     ; 121 }
 263  0013 5b04          	addw	sp,#4
 264  0015 81            	ret	
 296                     ; 123 void Adc_Config(void)
 296                     ; 124 {
 297                     .text:	section	.text,new
 298  0000               _Adc_Config:
 302                     ; 125 	AdcGetCode(Adc.ch);
 304  0000 c60000        	ld	a,_Adc
 305  0003 cd0000        	call	_AdcGetCode
 307                     ; 126 	Adc.ch = _chanId[Adc.ch];
 309  0006 ad42          	call	LC001
 310  0008 d6000c        	ld	a,(__chanId,x)
 311  000b c70000        	ld	_Adc,a
 312                     ; 128 	if( Drive.DeviceType == TYPE_MD24 )
 314  000e c6008c        	ld	a,_Drive+22
 315  0011 4a            	dec	a
 316  0012 2614          	jrne	L37
 317                     ; 130 		if( Adc.ch == 1 ) Adc.ch = 2;
 319  0014 c60000        	ld	a,_Adc
 320  0017 a101          	cp	a,#1
 321  0019 2605          	jrne	L57
 324  001b a602          	ld	a,#2
 325  001d c70000        	ld	_Adc,a
 326  0020               L57:
 327                     ; 131 		if( Adc.ch == 3 ) Adc.ch = 4;
 329  0020 a103          	cp	a,#3
 330  0022 2604          	jrne	L37
 333  0024 35040000      	mov	_Adc,#4
 334  0028               L37:
 335                     ; 134 	ADC1_DeInit();
 337  0028 cd0000        	call	_ADC1_DeInit
 339                     ; 135 	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
 339                     ; 136 		_chan[Adc.ch], 
 339                     ; 137 		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
 339                     ; 138 		_chanSchmit[Adc.ch],
 339                     ; 139 	   	DISABLE
 339                     ; 140 		);
 341  002b 4b00          	push	#0
 342  002d ad1b          	call	LC001
 343  002f d60007        	ld	a,(__chanSchmit,x)
 344  0032 88            	push	a
 345  0033 4b08          	push	#8
 346  0035 4b00          	push	#0
 347  0037 4b00          	push	#0
 348  0039 4b00          	push	#0
 349  003b ad0d          	call	LC001
 350  003d d60002        	ld	a,(__chan,x)
 351  0040 5f            	clrw	x
 352  0041 97            	ld	xl,a
 353  0042 cd0000        	call	_ADC1_Init
 355  0045 5b06          	addw	sp,#6
 356                     ; 141 	ADC1_StartConversion();		
 359                     ; 142 }
 362  0047 cc0000        	jp	_ADC1_StartConversion
 363  004a               LC001:
 364  004a c60000        	ld	a,_Adc
 365  004d 5f            	clrw	x
 366  004e 97            	ld	xl,a
 367  004f 81            	ret	
 400                     ; 144 void	AdcGetAvg(uint8_t ch)
 400                     ; 145 {
 401                     .text:	section	.text,new
 402  0000               _AdcGetAvg:
 404  0000 88            	push	a
 405       00000000      OFST:	set	0
 408                     ; 153 	Adc.buf[ch].avg = Adc.buf[ch].b[0]>>2;
 410  0001 97            	ld	xl,a
 411  0002 a609          	ld	a,#9
 412  0004 42            	mul	x,a
 413  0005 89            	pushw	x
 414  0006 7b03          	ld	a,(OFST+3,sp)
 415  0008 97            	ld	xl,a
 416  0009 a609          	ld	a,#9
 417  000b 42            	mul	x,a
 418  000c de0001        	ldw	x,(_Adc+1,x)
 419  000f 54            	srlw	x
 420  0010 54            	srlw	x
 421  0011 9085          	popw	y
 422  0013 01            	rrwa	x,a
 423  0014 90d70009      	ld	(_Adc+9,y),a
 424                     ; 155 }
 427  0018 84            	pop	a
 428  0019 81            	ret	
 463                     ; 157 void AdcService(uint8_t ch)
 463                     ; 158 {
 464                     .text:	section	.text,new
 465  0000               _AdcService:
 467  0000 88            	push	a
 468       00000000      OFST:	set	0
 471                     ; 159 	Adc_Config();
 473  0001 cd0000        	call	_Adc_Config
 475                     ; 160 	AdcGetAvg(ch);	//	Adc.buf[ch].avg
 477  0004 7b01          	ld	a,(OFST+1,sp)
 478  0006 cd0000        	call	_AdcGetAvg
 480                     ; 161 	if( Drive.DeviceType == TYPE_MD24 )
 482                     ; 165 		if( ch == 0 ) { }
 485                     ; 166 		else if( ch == 1 ) { }
 488                     ; 167 		else if( ch == 2 ) 
 490                     ; 179 		if( ch == 0 ) { }
 493                     ; 180 		else if( ch == 1 ) { }
 496                     ; 181 		else if( ch == 2 ) { }
 499                     ; 182 		else if( ch == 3 ) { }
 502                     ; 183 		else if( ch == 4 ) { }
 504                     ; 185 }
 507  0009 84            	pop	a
 508  000a 81            	ret	
 533                     ; 187 void OnCaptureOVTim2(void)
 533                     ; 188 {
 534                     .text:	section	.text,new
 535  0000               _OnCaptureOVTim2:
 539                     ; 195 	Pwm.Overflow = 1;
 541  0000 a601          	ld	a,#1
 542  0002 c70040        	ld	_Pwm+1,a
 543                     ; 196 	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
 546                     ; 200 }	
 549  0005 cc0000        	jp	_TIM1_ClearITPendingBit
 578                     ; 202 void OnCaptureTim2(void)
 578                     ; 203 {
 579                     .text:	section	.text,new
 580  0000               _OnCaptureTim2:
 584                     ; 205 	if( TIM1_GetITStatus(TIM1_IT_CC1) == SET )
 586  0000 a602          	ld	a,#2
 587  0002 cd0000        	call	_TIM1_GetITStatus
 589  0005 4a            	dec	a
 590  0006 260b          	jrne	L112
 591                     ; 207 		Pwm.T1 = TIM1_GetCapture1();	
 593  0008 cd0000        	call	_TIM1_GetCapture1
 595  000b cf0041        	ldw	_Pwm+2,x
 596                     ; 208 		TIM1_InterruptClear(TIM1_IT_CC1)
 598  000e a602          	ld	a,#2
 599  0010 cd0000        	call	_TIM1_ClearITPendingBit
 601  0013               L112:
 602                     ; 210 	if( TIM1_GetITStatus(TIM1_IT_CC2) == SET ) 
 604  0013 a604          	ld	a,#4
 605  0015 cd0000        	call	_TIM1_GetITStatus
 607  0018 4a            	dec	a
 608  0019 262d          	jrne	L312
 609                     ; 212 		Pwm.T2 = TIM1_GetCapture2();	
 611  001b cd0000        	call	_TIM1_GetCapture2
 613  001e cf0043        	ldw	_Pwm+4,x
 614                     ; 213 		TIM1_InterruptClear(TIM1_IT_CC2)
 616  0021 a604          	ld	a,#4
 617  0023 cd0000        	call	_TIM1_ClearITPendingBit
 619                     ; 214 		TIM1_SetCounter(0u);
 621  0026 5f            	clrw	x
 622  0027 cd0000        	call	_TIM1_SetCounter
 624                     ; 215 		Pwm._t1 = Pwm.T1;
 626  002a ce0041        	ldw	x,_Pwm+2
 627  002d cf004b        	ldw	_Pwm+12,x
 628                     ; 216 		Pwm._t2 = Pwm.T2;
 630  0030 ce0043        	ldw	x,_Pwm+4
 631  0033 cf004d        	ldw	_Pwm+14,x
 632                     ; 217 		if ( Pwm.Overflow )
 634  0036 c60040        	ld	a,_Pwm+1
 635  0039 2709          	jreq	L512
 636                     ; 219 			Pwm._t1 = 0;
 638  003b 5f            	clrw	x
 639  003c cf004b        	ldw	_Pwm+12,x
 640                     ; 220 			Pwm.Overflow = 0;
 642  003f 725f0040      	clr	_Pwm+1
 645  0043 81            	ret	
 646  0044               L512:
 647                     ; 223 			Pwm.Calc = 1;
 649  0044 7214003f      	bset	_Pwm,#2
 650  0048               L312:
 651                     ; 246 }
 654  0048 81            	ret	
 677                     ; 248 void mainDeviceType(void)
 677                     ; 249 {
 678                     .text:	section	.text,new
 679  0000               _mainDeviceType:
 683  0000               L132:
 684  0000 20fe          	jra	L132
 725                     ; 253 void mtSetPos(uint16_t tPos, uint8_t overrun)
 725                     ; 254 {
 726                     .text:	section	.text,new
 727  0000               _mtSetPos:
 729  0000 89            	pushw	x
 730       00000000      OFST:	set	0
 733                     ; 255 	debug_motor_watch(tPos);
 735                     ; 257 	Drive.PreStep = Drive.Step;
 737  0001 550089008a    	mov	_Drive+20,_Drive+19
 738                     ; 258 	Drive.Step= tPos;
 740  0006 9f            	ld	a,xl
 741  0007 c70089        	ld	_Drive+19,a
 742                     ; 262 	if( Drive.Run || Drive.Position == tPos ) 
 744  000a c60077        	ld	a,_Drive+1
 745  000d 2645          	jrne	L27
 747  000f c30078        	cpw	x,_Drive+2
 748                     ; 263 		return;
 750  0012 2740          	jreq	L27
 751                     ; 265 	Drive.Run = 1;
 753  0014 35010077      	mov	_Drive+1,#1
 754                     ; 266 	Drive.Ticks = Drive.Interval;
 756  0018 5500860087    	mov	_Drive+17,_Drive+16
 757                     ; 267 	Drive.Overrun = Drive.Overrun2 = 0;
 759  001d c7007e        	ld	_Drive+8,a
 760  0020 5f            	clrw	x
 761  0021 cf007c        	ldw	_Drive+6,x
 762                     ; 269 	if( tPos == 0 )				
 764  0024 1e01          	ldw	x,(OFST+1,sp)
 765  0026 260e          	jrne	L752
 766                     ; 273 		Drive.Position += CPulse(OVER_STEP);
 768  0028 a61e          	ld	a,#30
 769  002a cd0000        	call	_CPulse
 771  002d 72bb0078      	addw	x,_Drive+2
 772  0031 cf0078        	ldw	_Drive+2,x
 774  0034 200c          	jra	L162
 775  0036               L752:
 776                     ; 278 		if(Drive.Position < tPos)
 778  0036 ce0078        	ldw	x,_Drive+2
 779  0039 1301          	cpw	x,(OFST+1,sp)
 780  003b 2405          	jruge	L162
 781                     ; 279 			Drive.Overrun2 = overrun;
 783  003d 7b05          	ld	a,(OFST+5,sp)
 784  003f c7007e        	ld	_Drive+8,a
 785  0042               L162:
 786                     ; 281 	Drive.Target = tPos + Drive.Overrun2;
 788  0042 7b01          	ld	a,(OFST+1,sp)
 789  0044 97            	ld	xl,a
 790  0045 7b02          	ld	a,(OFST+2,sp)
 791  0047 cb007e        	add	a,_Drive+8
 792  004a 2401          	jrnc	L07
 793  004c 5c            	incw	x
 794  004d               L07:
 795  004d c7007b        	ld	_Drive+5,a
 796  0050 9f            	ld	a,xl
 797  0051 c7007a        	ld	_Drive+4,a
 798                     ; 282 }
 799  0054               L27:
 802  0054 85            	popw	x
 803  0055 81            	ret	
 840                     ; 284 void mtCheckPowerOnStatus(uint8_t mode)
 840                     ; 285 {
 841                     .text:	section	.text,new
 842  0000               _mtCheckPowerOnStatus:
 844  0000 88            	push	a
 845       00000000      OFST:	set	0
 848                     ; 286 	Drive.Origin = !MotorOrigin();	//	read pos
 850  0001 3b0002        	push	_IO_ORG+2
 851  0004 ce0000        	ldw	x,_IO_ORG
 852  0007 cd0000        	call	_GPIO_ReadInputPin
 854  000a 5b01          	addw	sp,#1
 855  000c 4d            	tnz	a
 856  000d 2606          	jrne	L67
 857  000f 72140076      	bset	_Drive,#2
 858  0013 2004          	jra	L201
 859  0015               L67:
 860  0015 72150076      	bres	_Drive,#2
 861  0019               L201:
 862                     ; 287 	if( mode == 1 )
 866                     ; 295 	if( Drive.Origin == 0 ) 
 868  0019 720400760a    	btjt	_Drive,#2,L503
 869                     ; 297 		Drive.Position = CPulse(MAX_MOTOR_POS + 5);
 871  001e a6cd          	ld	a,#205
 872  0020 cd0000        	call	_CPulse
 874  0023 cf0078        	ldw	_Drive+2,x
 875                     ; 298 		return;
 878  0026 84            	pop	a
 879  0027 81            	ret	
 880  0028               L503:
 881                     ; 301 	Drive.Position = 0;
 883  0028 5f            	clrw	x
 884  0029 cf0078        	ldw	_Drive+2,x
 885                     ; 306 }
 888  002c 84            	pop	a
 889  002d 81            	ret	
 925                     ; 308 void	motorCallback(void)
 925                     ; 309 {
 926                     .text:	section	.text,new
 927  0000               _motorCallback:
 929  0000 5203          	subw	sp,#3
 930       00000003      OFST:	set	3
 933                     ; 319 	i = Drive.Target==Drive.Position ? 1 : Drive.Target > Drive.Position ? 2 : 3;
 935  0002 ce007a        	ldw	x,_Drive+4
 936  0005 c30078        	cpw	x,_Drive+2
 937  0008 2604          	jrne	L011
 938  000a a601          	ld	a,#1
 939  000c 200b          	jra	L611
 940  000e               L011:
 941  000e c30078        	cpw	x,_Drive+2
 942  0011 2304          	jrule	L411
 943  0013 a602          	ld	a,#2
 944  0015 2002          	jra	L611
 945  0017               L411:
 946  0017 a603          	ld	a,#3
 947  0019               L611:
 948  0019 6b03          	ld	(OFST+0,sp),a
 950                     ; 320 	switch(i)
 953                     ; 347 		break;
 954  001b 4a            	dec	a
 955  001c 2708          	jreq	L703
 956  001e 4a            	dec	a
 957  001f 271d          	jreq	L113
 958  0021 4a            	dec	a
 959  0022 271f          	jreq	L313
 960  0024 203d          	jra	L333
 961  0026               L703:
 962                     ; 322 	case 1:	
 962                     ; 323 		if ( Drive.Overrun2 )
 964  0026 c6007e        	ld	a,_Drive+8
 965  0029 272c          	jreq	LC002
 966                     ; 325 			Drive.Target -= Drive.Overrun2;
 968  002b 5f            	clrw	x
 969  002c 97            	ld	xl,a
 970  002d 1f01          	ldw	(OFST-2,sp),x
 972  002f ce007a        	ldw	x,_Drive+4
 973  0032 72f001        	subw	x,(OFST-2,sp)
 974  0035 cf007a        	ldw	_Drive+4,x
 975                     ; 326 			Drive.Overrun2 = 0;
 977  0038 725f007e      	clr	_Drive+8
 978                     ; 327 			break;
 980  003c 2025          	jra	L333
 981                     ; 329 		motorDriveStop();	
 983                     ; 330 		break;
 985  003e               L113:
 986                     ; 331 	case 2:
 986                     ; 332 	 	MotorStepOpen();
 988  003e cd0000        	call	_MotorStepOpen
 990                     ; 333 		break;
 992  0041 2020          	jra	L333
 993  0043               L313:
 994                     ; 334 	case 3:
 994                     ; 335 		if ( Drive.Origin )
 996  0043 7205007618    	btjf	_Drive,#2,L733
 997                     ; 338 			if( Drive.Overrun >= Drive.MaxOverrun )
 999  0048 ce007c        	ldw	x,_Drive+6
1000  004b c30082        	cpw	x,_Drive+12
1001  004e 250c          	jrult	L143
1002                     ; 340 				Drive.Position = Drive.Target = 0;
1004  0050 5f            	clrw	x
1005  0051 cf007a        	ldw	_Drive+4,x
1006  0054 cf0078        	ldw	_Drive+2,x
1007                     ; 341 				motorDriveStop();	
1009  0057               LC002:
1011  0057 cd0000        	call	_motorDriveStop
1013                     ; 342 				break;
1015  005a 2007          	jra	L333
1016  005c               L143:
1017                     ; 344 			Drive.Overrun++;
1019  005c 5c            	incw	x
1020  005d cf007c        	ldw	_Drive+6,x
1021  0060               L733:
1022                     ; 346 		MotorStepClose();
1024  0060 cd0000        	call	_MotorStepClose
1026                     ; 347 		break;
1028  0063               L333:
1029                     ; 349 }
1032  0063 5b03          	addw	sp,#3
1033  0065 81            	ret	
1061                     ; 354 void OnTimer4(void)
1061                     ; 355 {
1062                     .text:	section	.text,new
1063  0000               _OnTimer4:
1067                     ; 356 	Ticks_50uS++;
1069  0000 725c0075      	inc	_Ticks_50uS
1070                     ; 357 	if( Ticks_50uS >= 20 )
1072  0004 c60075        	ld	a,_Ticks_50uS
1073  0007 a114          	cp	a,#20
1074  0009 250b          	jrult	L353
1075                     ; 359 		Ticks_50uS = 0;
1077  000b 725f0075      	clr	_Ticks_50uS
1078                     ; 360 		Ticks_1mS++;
1080  000f ce0073        	ldw	x,_Ticks_1mS
1081  0012 5c            	incw	x
1082  0013 cf0073        	ldw	_Ticks_1mS,x
1083  0016               L353:
1084                     ; 362 	if( Drive.Ticks )
1086  0016 c60087        	ld	a,_Drive+17
1087  0019 2706          	jreq	L553
1088                     ; 363 		Drive.Ticks--;
1090  001b 725a0087      	dec	_Drive+17
1092  001f 2018          	jra	L753
1093  0021               L553:
1094                     ; 369 		Drive.Ticks = Drive.Interval;
1096  0021 5500860087    	mov	_Drive+17,_Drive+16
1097                     ; 371 		if( Drive.Enabled )
1099  0026 720100760e    	btjf	_Drive,#0,L753
1100                     ; 373 			if( Drive.Run == 1 && Drive.Enabled == 1 )
1102  002b c60077        	ld	a,_Drive+1
1103  002e 4a            	dec	a
1104  002f 2608          	jrne	L753
1106  0031 7201007603    	btjf	_Drive,#0,L753
1107                     ; 374 				motorCallback();
1109  0036 cd0000        	call	_motorCallback
1111  0039               L753:
1112                     ; 378 	TIM4_ClearFlag(TIM4_IT_UPDATE);
1114  0039 a601          	ld	a,#1
1116                     ; 379 }
1119  003b cc0000        	jp	_TIM4_ClearFlag
1161                     ; 381 void mtSetZeroPos(uint8_t offset)
1161                     ; 382 {
1162                     .text:	section	.text,new
1163  0000               _mtSetZeroPos:
1165  0000 89            	pushw	x
1166       00000002      OFST:	set	2
1169                     ; 383 	uint16_t i = 0;
1171  0001 5f            	clrw	x
1172  0002 1f01          	ldw	(OFST-1,sp),x
1174                     ; 385 	mtSetPos(0, offset);
1176  0004 88            	push	a
1177  0005 cd0000        	call	_mtSetPos
1179  0008 84            	pop	a
1181  0009 2017          	jra	L504
1182  000b               L304:
1183                     ; 388 		if( Diff(i, 60000) == 1 )
1185  000b aeea60        	ldw	x,#60000
1186  000e 89            	pushw	x
1187  000f 1e03          	ldw	x,(OFST+1,sp)
1188  0011 cd0000        	call	_Diff
1190  0014 c60076        	ld	a,_Drive
1191  0017 a504          	bcp	a,#4
1192  0019 85            	popw	x
1193                     ; 393 		if( Drive.Origin == 1 ) 
1195  001a 2706          	jreq	L504
1196                     ; 394 			break;
1197  001c               L704:
1198                     ; 400 	Drive.Stage = 1;
1200  001c 3501008b      	mov	_Drive+21,#1
1201                     ; 401 }
1204  0020 85            	popw	x
1205  0021 81            	ret	
1206  0022               L504:
1207                     ; 386 	while( Drive.Stage == 0 )
1209  0022 c6008b        	ld	a,_Drive+21
1210  0025 27e4          	jreq	L304
1211  0027 20f3          	jra	L704
1246                     ; 403 void mtPwmUpdate(void)
1246                     ; 404 {
1247                     .text:	section	.text,new
1248  0000               _mtPwmUpdate:
1250  0000 5208          	subw	sp,#8
1251       00000008      OFST:	set	8
1254  0002 2010          	jra	L334
1255  0004               L134:
1256                     ; 408 		Pwm._t1 >>= 1;
1258  0004 7254004b      	srl	_Pwm+12
1259  0008 7256004c      	rrc	_Pwm+13
1260                     ; 409 		Pwm._t2 >>= 1;
1262  000c 7254004d      	srl	_Pwm+14
1263  0010 7256004e      	rrc	_Pwm+15
1264  0014               L334:
1265                     ; 406 	while( Pwm._t2 > 0xff )
1267  0014 ce004d        	ldw	x,_Pwm+14
1268  0017 a30100        	cpw	x,#256
1269  001a 24e8          	jruge	L134
1270                     ; 412 	dt = 100. * Pwm._t1 / ( Pwm._t2);
1272  001c cd0000        	call	c_uitof
1274  001f 96            	ldw	x,sp
1275  0020 5c            	incw	x
1276  0021 cd0000        	call	c_rtol
1279  0024 ce004b        	ldw	x,_Pwm+12
1280  0027 cd0000        	call	c_uitof
1282  002a ae0000        	ldw	x,#L344
1283  002d cd0000        	call	c_fmul
1285  0030 96            	ldw	x,sp
1286  0031 5c            	incw	x
1287  0032 cd0000        	call	c_fdiv
1289  0035 96            	ldw	x,sp
1290  0036 1c0005        	addw	x,#OFST-3
1291  0039 cd0000        	call	c_rtol
1294                     ; 413 	Pwm.Duty100 = (uint16_t)dt;
1296  003c 96            	ldw	x,sp
1297  003d 1c0005        	addw	x,#OFST-3
1298  0040 cd0000        	call	c_ltor
1300  0043 cd0000        	call	c_ftoi
1302  0046 cf0049        	ldw	_Pwm+10,x
1303                     ; 414 	Pwm.Duty = Pwm.Duty100 / 100 * MAX_MOTOR_POS / 100; 
1305  0049 a664          	ld	a,#100
1306  004b 62            	div	x,a
1307  004c 58            	sllw	x
1308  004d cf0047        	ldw	_Pwm+8,x
1309                     ; 415 	mtSetPos(stepCalc(Pwm.Duty), OFFSET_OVERRUN);
1311  0050 4b00          	push	#0
1312  0052 cd0000        	call	_stepCalc
1314  0055 5f            	clrw	x
1315  0056 97            	ld	xl,a
1316  0057 cd0000        	call	_mtSetPos
1318  005a 84            	pop	a
1319                     ; 416 }
1322  005b 5b08          	addw	sp,#8
1323  005d 81            	ret	
1380                     ; 418 void main(void)
1380                     ; 419 {
1381                     .text:	section	.text,new
1382  0000               _main:
1384  0000 88            	push	a
1385       00000001      OFST:	set	1
1388                     ; 420 	uint8_t		channel = 0;
1390  0001 0f01          	clr	(OFST+0,sp)
1392                     ; 422 	Drive.MaxOverrun = MAX_ZERO_OVERRUN;
1394  0003 ae012c        	ldw	x,#300
1395  0006 cf0082        	ldw	_Drive+12,x
1396                     ; 423 	Drive.Position = Drive.Stage = 0;
1398  0009 725f008b      	clr	_Drive+21
1399  000d 5f            	clrw	x
1400  000e cf0078        	ldw	_Drive+2,x
1401                     ; 424 	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
1403  0011 350f0086      	mov	_Drive+16,#15
1404                     ; 426 	Ticks_1mS = Ticks_50uS = 0;
1406  0015 725f0075      	clr	_Ticks_50uS
1407  0019 cf0073        	ldw	_Ticks_1mS,x
1408                     ; 428 	configClock();
1410  001c cd0000        	call	_configClock
1412                     ; 429 	configGpio();
1414  001f cd0000        	call	_configGpio
1416                     ; 430 	configTimer();
1418  0022 cd0000        	call	_configTimer
1420                     ; 431 	LightOn
1422  0025 3b0002        	push	_IO_LED+2
1423  0028 ce0000        	ldw	x,_IO_LED
1424  002b cd0000        	call	_GPIO_WriteLow
1426  002e 35020000      	mov	_Adc,#2
1427  0032 84            	pop	a
1428                     ; 433 	Adc.ch = 2;
1430                     ; 434 	Adc_Config();
1432  0033 cd0000        	call	_Adc_Config
1434                     ; 436 	dutyInfo.s = dutyInfo.i = 0;
1436  0036 725f006f      	clr	_dutyInfo+32
1437  003a 5f            	clrw	x
1438  003b cf0071        	ldw	_dutyInfo+34,x
1439                     ; 437 	Pwm.Calc = Pwm.Edge = 0;
1441                     ; 438 	Pwm.Update = 1;
1443                     ; 440 	enableInterrupts();
1446  003e c6003f        	ld	a,_Pwm
1447  0041 a4fa          	and	a,#250
1448  0043 aa02          	or	a,#2
1449  0045 c7003f        	ld	_Pwm,a
1450  0048 9a            	rim	
1452                     ; 441 	waitPowerDelay(TIME_POWERDELAY);
1455  0049 ae01f3        	ldw	x,#499
1456  004c cd0000        	call	_waitPowerDelay
1458                     ; 443 	Drive.Enabled = 1;	//	motor enable
1460  004f 72100076      	bset	_Drive,#0
1461                     ; 447 	mtCheckPowerOnStatus(1);	//	open max
1463  0053 a601          	ld	a,#1
1464  0055 cd0000        	call	_mtCheckPowerOnStatus
1466                     ; 449 	Timer.Led = Timer.Adc = Ticks_1mS;
1468  0058 ce0073        	ldw	x,_Ticks_1mS
1469  005b cf0039        	ldw	_Timer+2,x
1470  005e cf0037        	ldw	_Timer,x
1471                     ; 451 	if( Drive.DeviceType == TYPE_MD12 )
1473  0061 c6008c        	ld	a,_Drive+22
1474  0064 a102          	cp	a,#2
1475  0066 2603          	jrne	L364
1476                     ; 452 		mainDeviceType();
1478  0068 cd0000        	call	_mainDeviceType
1480  006b               L364:
1481                     ; 454 	mtSetZeroPos(OFFSET_OVERRUN); 
1483  006b 4f            	clr	a
1484  006c cd0000        	call	_mtSetZeroPos
1486  006f               L564:
1487                     ; 458 		if( Diff(Timer.Led, lightBlink) == 1 )
1489  006f ce0000        	ldw	x,_lightBlink
1490  0072 89            	pushw	x
1491  0073 ce0037        	ldw	x,_Timer
1492  0076 cd0000        	call	_Diff
1494  0079 4a            	dec	a
1495  007a 85            	popw	x
1496  007b 2610          	jrne	L174
1497                     ; 460 			Timer.Led = Ticks_1mS;
1499  007d ce0073        	ldw	x,_Ticks_1mS
1500  0080 cf0037        	ldw	_Timer,x
1501                     ; 461 			LightToggle
1503  0083 ce0000        	ldw	x,_IO_LED
1504  0086 3b0002        	push	_IO_LED+2
1505  0089 cd0000        	call	_GPIO_WriteReverse
1507  008c 84            	pop	a
1508  008d               L174:
1509                     ; 463 		if( Diff(Timer.Origin, 1) == 1 )
1511  008d ae0001        	ldw	x,#1
1512  0090 89            	pushw	x
1513  0091 ce003d        	ldw	x,_Timer+6
1514  0094 cd0000        	call	_Diff
1516  0097 4a            	dec	a
1517  0098 85            	popw	x
1518  0099 261e          	jrne	L012
1519                     ; 465 			Timer.Origin = Ticks_1mS;
1521  009b ce0073        	ldw	x,_Ticks_1mS
1522  009e cf003d        	ldw	_Timer+6,x
1523                     ; 466 			Drive.Origin = !MotorOrigin();
1525  00a1 ce0000        	ldw	x,_IO_ORG
1526  00a4 3b0002        	push	_IO_ORG+2
1527  00a7 cd0000        	call	_GPIO_ReadInputPin
1529  00aa 5b01          	addw	sp,#1
1530  00ac 4d            	tnz	a
1531  00ad 2606          	jrne	L402
1532  00af 72140076      	bset	_Drive,#2
1533  00b3 2004          	jra	L012
1534  00b5               L402:
1535  00b5 72150076      	bres	_Drive,#2
1536  00b9               L012:
1538                     ; 468 		if( Diff(Timer.Adc, 10) == 1 )
1540  00b9 ae000a        	ldw	x,#10
1541  00bc 89            	pushw	x
1542  00bd ce0039        	ldw	x,_Timer+2
1543  00c0 cd0000        	call	_Diff
1545  00c3 4a            	dec	a
1546  00c4 85            	popw	x
1547  00c5 260b          	jrne	L574
1548                     ; 470 			Timer.Adc = Ticks_1mS;
1550  00c7 ce0073        	ldw	x,_Ticks_1mS
1551  00ca cf0039        	ldw	_Timer+2,x
1552                     ; 471 			AdcService(channel);
1554  00cd 7b01          	ld	a,(OFST+0,sp)
1555  00cf cd0000        	call	_AdcService
1557  00d2               L574:
1558                     ; 473 		if( Diff(Timer.PwmUpdate, 2000) == 1 )
1560  00d2 ae07d0        	ldw	x,#2000
1561  00d5 89            	pushw	x
1562  00d6 ce003b        	ldw	x,_Timer+4
1563  00d9 cd0000        	call	_Diff
1565  00dc 4a            	dec	a
1566  00dd 85            	popw	x
1567  00de 2610          	jrne	L774
1568                     ; 475 			Timer.PwmUpdate = Ticks_1mS;		
1570  00e0 ce0073        	ldw	x,_Ticks_1mS
1571  00e3 cf003b        	ldw	_Timer+4,x
1572                     ; 476 			Drive.Step = 0;
1574  00e6 725f0089      	clr	_Drive+19
1575                     ; 477 			Pwm.Update = 0;
1577  00ea 7213003f      	bres	_Pwm,#1
1579  00ee 2004          	jra	L105
1580  00f0               L774:
1581                     ; 480 			Pwm.Update = 1;
1583  00f0 7212003f      	bset	_Pwm,#1
1584  00f4               L105:
1585                     ; 482 		if( Pwm.Calc == 1 )
1587  00f4 7204003f03cc  	btjf	_Pwm,#2,L564
1588                     ; 484 			Pwm.Calc = 0;
1590  00fc 7215003f      	bres	_Pwm,#2
1591                     ; 485 			mtPwmUpdate();
1593  0100 cd0000        	call	_mtPwmUpdate
1595                     ; 487 			Timer.PwmUpdate = Ticks_1mS;		
1597  0103 ce0073        	ldw	x,_Ticks_1mS
1598  0106 cf003b        	ldw	_Timer+4,x
1599  0109 cc006f        	jra	L564
2094                     	xdef	_main
2095                     	xdef	_mtPwmUpdate
2096                     	xdef	_mtSetZeroPos
2097                     	xdef	_OnTimer4
2098                     	xdef	_motorCallback
2099                     	xdef	_mtCheckPowerOnStatus
2100                     	xdef	_mtSetPos
2101                     	xdef	_mainDeviceType
2102                     	xdef	_OnCaptureTim2
2103                     	xdef	_OnCaptureOVTim2
2104                     	xdef	_AdcService
2105                     	xdef	_AdcGetAvg
2106                     	xdef	_Adc_Config
2107                     	xdef	_AdcGetCode
2108                     	xdef	__chanId
2109                     	xdef	__chanSchmit
2110                     	xdef	__chan
2111                     	xdef	_OnTimer_1S
2112                     	xdef	_stepCalc
2113                     	switch	.bss
2114  0000               _Adc:
2115  0000 000000000000  	ds.b	46
2116                     	xdef	_Adc
2117  002e               _AdcBuf:
2118  002e 000000000000  	ds.b	9
2119                     	xdef	_AdcBuf
2120  0037               _Timer:
2121  0037 000000000000  	ds.b	8
2122                     	xdef	_Timer
2123  003f               _Pwm:
2124  003f 000000000000  	ds.b	16
2125                     	xdef	_Pwm
2126                     	xdef	_lightBlink
2127  004f               _dutyInfo:
2128  004f 000000000000  	ds.b	36
2129                     	xdef	_dutyInfo
2130                     	xref	_configGpio
2131                     	xref	_configTimer
2132                     	xref	_configClock
2133                     	xref	_waitPowerDelay
2134                     	xref	_MotorStepClose
2135                     	xref	_MotorStepOpen
2136                     	xref	_motorDriveStop
2137                     	xref	_CPulse
2138                     	xref	_Diff
2139  0073               _Ticks_1mS:
2140  0073 0000          	ds.b	2
2141                     	xdef	_Ticks_1mS
2142  0075               _Ticks_50uS:
2143  0075 00            	ds.b	1
2144                     	xdef	_Ticks_50uS
2145                     	xref	_IO_ORG
2146                     	xref	_IO_LED
2147  0076               _Drive:
2148  0076 000000000000  	ds.b	23
2149                     	xdef	_Drive
2150                     	xref	_TIM4_ClearFlag
2151                     	xref	_TIM1_ClearITPendingBit
2152                     	xref	_TIM1_GetITStatus
2153                     	xref	_TIM1_GetCapture2
2154                     	xref	_TIM1_GetCapture1
2155                     	xref	_TIM1_SetCounter
2156                     	xref	_GPIO_ReadInputPin
2157                     	xref	_GPIO_WriteReverse
2158                     	xref	_GPIO_WriteLow
2159                     	xref	_ADC1_GetConversionValue
2160                     	xref	_ADC1_StartConversion
2161                     	xref	_ADC1_Init
2162                     	xref	_ADC1_DeInit
2163                     .const:	section	.text
2164  0000               L344:
2165  0000 42c80000      	dc.w	17096,0
2166                     	xref.b	c_x
2186                     	xref	c_ftoi
2187                     	xref	c_ltor
2188                     	xref	c_fdiv
2189                     	xref	c_rtol
2190                     	xref	c_fmul
2191                     	xref	c_uitof
2192                     	xref	c_imul
2193                     	end
