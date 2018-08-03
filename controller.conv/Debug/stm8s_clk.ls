   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  17                     .const:	section	.text
  18  0000               _HSIDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004               _CLKPrescTable:
  24  0004 01            	dc.b	1
  25  0005 02            	dc.b	2
  26  0006 04            	dc.b	4
  27  0007 08            	dc.b	8
  28  0008 0a            	dc.b	10
  29  0009 10            	dc.b	16
  30  000a 14            	dc.b	20
  31  000b 28            	dc.b	40
  60                     ; 66 void CLK_DeInit(void)
  60                     ; 67 {
  62                     	switch	.text
  63  0000               _CLK_DeInit:
  67                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  69  0000 350150c0      	mov	20672,#1
  70                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  72  0004 725f50c1      	clr	20673
  73                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  75  0008 35e150c4      	mov	20676,#225
  76                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  78  000c 725f50c5      	clr	20677
  79                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  81  0010 351850c6      	mov	20678,#24
  82                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  84  0014 35ff50c7      	mov	20679,#255
  85                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  87  0018 35ff50ca      	mov	20682,#255
  88                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  90  001c 725f50c8      	clr	20680
  91                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  93  0020 725f50c9      	clr	20681
  95  0024               L52:
  96                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  98  0024 c650c9        	ld	a,20681
  99  0027 a501          	bcp	a,#1
 100  0029 26f9          	jrne	L52
 101                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 103  002b 725f50c9      	clr	20681
 104                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 106  002f 725f50cc      	clr	20684
 107                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 109  0033 725f50cd      	clr	20685
 110                     ; 84 }
 113  0037 81            	ret
 169                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 169                     ; 96 {
 170                     	switch	.text
 171  0038               _CLK_FastHaltWakeUpCmd:
 175                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 177                     ; 101     if (NewState != DISABLE)
 179  0038 4d            	tnz	a
 180  0039 2706          	jreq	L75
 181                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 183  003b 721450c0      	bset	20672,#2
 185  003f 2004          	jra	L16
 186  0041               L75:
 187                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 189  0041 721550c0      	bres	20672,#2
 190  0045               L16:
 191                     ; 112 }
 194  0045 81            	ret
 229                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 229                     ; 120 {
 230                     	switch	.text
 231  0046               _CLK_HSECmd:
 235                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 237                     ; 125     if (NewState != DISABLE)
 239  0046 4d            	tnz	a
 240  0047 2706          	jreq	L101
 241                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 243  0049 721050c1      	bset	20673,#0
 245  004d 2004          	jra	L301
 246  004f               L101:
 247                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 249  004f 721150c1      	bres	20673,#0
 250  0053               L301:
 251                     ; 136 }
 254  0053 81            	ret
 289                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 289                     ; 144 {
 290                     	switch	.text
 291  0054               _CLK_HSICmd:
 295                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 297                     ; 149     if (NewState != DISABLE)
 299  0054 4d            	tnz	a
 300  0055 2706          	jreq	L321
 301                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 303  0057 721050c0      	bset	20672,#0
 305  005b 2004          	jra	L521
 306  005d               L321:
 307                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 309  005d 721150c0      	bres	20672,#0
 310  0061               L521:
 311                     ; 160 }
 314  0061 81            	ret
 349                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 349                     ; 168 {
 350                     	switch	.text
 351  0062               _CLK_LSICmd:
 355                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 357                     ; 173     if (NewState != DISABLE)
 359  0062 4d            	tnz	a
 360  0063 2706          	jreq	L541
 361                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 363  0065 721650c0      	bset	20672,#3
 365  0069 2004          	jra	L741
 366  006b               L541:
 367                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 369  006b 721750c0      	bres	20672,#3
 370  006f               L741:
 371                     ; 184 }
 374  006f 81            	ret
 409                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 409                     ; 193 {
 410                     	switch	.text
 411  0070               _CLK_CCOCmd:
 415                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 417                     ; 198     if (NewState != DISABLE)
 419  0070 4d            	tnz	a
 420  0071 2706          	jreq	L761
 421                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 423  0073 721050c9      	bset	20681,#0
 425  0077 2004          	jra	L171
 426  0079               L761:
 427                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 429  0079 721150c9      	bres	20681,#0
 430  007d               L171:
 431                     ; 209 }
 434  007d 81            	ret
 469                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 469                     ; 219 {
 470                     	switch	.text
 471  007e               _CLK_ClockSwitchCmd:
 475                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 477                     ; 224     if (NewState != DISABLE )
 479  007e 4d            	tnz	a
 480  007f 2706          	jreq	L112
 481                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 483  0081 721250c5      	bset	20677,#1
 485  0085 2004          	jra	L312
 486  0087               L112:
 487                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 489  0087 721350c5      	bres	20677,#1
 490  008b               L312:
 491                     ; 235 }
 494  008b 81            	ret
 530                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 530                     ; 246 {
 531                     	switch	.text
 532  008c               _CLK_SlowActiveHaltWakeUpCmd:
 536                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 538                     ; 251     if (NewState != DISABLE)
 540  008c 4d            	tnz	a
 541  008d 2706          	jreq	L332
 542                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 544  008f 721a50c0      	bset	20672,#5
 546  0093 2004          	jra	L532
 547  0095               L332:
 548                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 550  0095 721b50c0      	bres	20672,#5
 551  0099               L532:
 552                     ; 262 }
 555  0099 81            	ret
 714                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 714                     ; 273 {
 715                     	switch	.text
 716  009a               _CLK_PeripheralClockConfig:
 718  009a 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 724                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 726                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 728  009b 9e            	ld	a,xh
 729  009c a510          	bcp	a,#16
 730  009e 2633          	jrne	L123
 731                     ; 281         if (NewState != DISABLE)
 733  00a0 0d02          	tnz	(OFST+2,sp)
 734  00a2 2717          	jreq	L323
 735                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 737  00a4 7b01          	ld	a,(OFST+1,sp)
 738  00a6 a40f          	and	a,#15
 739  00a8 5f            	clrw	x
 740  00a9 97            	ld	xl,a
 741  00aa a601          	ld	a,#1
 742  00ac 5d            	tnzw	x
 743  00ad 2704          	jreq	L62
 744  00af               L03:
 745  00af 48            	sll	a
 746  00b0 5a            	decw	x
 747  00b1 26fc          	jrne	L03
 748  00b3               L62:
 749  00b3 ca50c7        	or	a,20679
 750  00b6 c750c7        	ld	20679,a
 752  00b9 2049          	jra	L723
 753  00bb               L323:
 754                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 756  00bb 7b01          	ld	a,(OFST+1,sp)
 757  00bd a40f          	and	a,#15
 758  00bf 5f            	clrw	x
 759  00c0 97            	ld	xl,a
 760  00c1 a601          	ld	a,#1
 761  00c3 5d            	tnzw	x
 762  00c4 2704          	jreq	L23
 763  00c6               L43:
 764  00c6 48            	sll	a
 765  00c7 5a            	decw	x
 766  00c8 26fc          	jrne	L43
 767  00ca               L23:
 768  00ca 43            	cpl	a
 769  00cb c450c7        	and	a,20679
 770  00ce c750c7        	ld	20679,a
 771  00d1 2031          	jra	L723
 772  00d3               L123:
 773                     ; 294         if (NewState != DISABLE)
 775  00d3 0d02          	tnz	(OFST+2,sp)
 776  00d5 2717          	jreq	L133
 777                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 779  00d7 7b01          	ld	a,(OFST+1,sp)
 780  00d9 a40f          	and	a,#15
 781  00db 5f            	clrw	x
 782  00dc 97            	ld	xl,a
 783  00dd a601          	ld	a,#1
 784  00df 5d            	tnzw	x
 785  00e0 2704          	jreq	L63
 786  00e2               L04:
 787  00e2 48            	sll	a
 788  00e3 5a            	decw	x
 789  00e4 26fc          	jrne	L04
 790  00e6               L63:
 791  00e6 ca50ca        	or	a,20682
 792  00e9 c750ca        	ld	20682,a
 794  00ec 2016          	jra	L723
 795  00ee               L133:
 796                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 798  00ee 7b01          	ld	a,(OFST+1,sp)
 799  00f0 a40f          	and	a,#15
 800  00f2 5f            	clrw	x
 801  00f3 97            	ld	xl,a
 802  00f4 a601          	ld	a,#1
 803  00f6 5d            	tnzw	x
 804  00f7 2704          	jreq	L24
 805  00f9               L44:
 806  00f9 48            	sll	a
 807  00fa 5a            	decw	x
 808  00fb 26fc          	jrne	L44
 809  00fd               L24:
 810  00fd 43            	cpl	a
 811  00fe c450ca        	and	a,20682
 812  0101 c750ca        	ld	20682,a
 813  0104               L723:
 814                     ; 306 }
 817  0104 85            	popw	x
 818  0105 81            	ret
1006                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1006                     ; 320 {
1007                     	switch	.text
1008  0106               _CLK_ClockSwitchConfig:
1010  0106 89            	pushw	x
1011  0107 5204          	subw	sp,#4
1012       00000004      OFST:	set	4
1015                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1017  0109 ae0491        	ldw	x,#1169
1018  010c 1f03          	ldw	(OFST-1,sp),x
1020                     ; 324     ErrorStatus Swif = ERROR;
1022                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1024                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1026                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1028                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1030                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1032  010e c650c3        	ld	a,20675
1033  0111 6b01          	ld	(OFST-3,sp),a
1035                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1037  0113 7b05          	ld	a,(OFST+1,sp)
1038  0115 a101          	cp	a,#1
1039  0117 2639          	jrne	L544
1040                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1042  0119 721250c5      	bset	20677,#1
1043                     ; 343         if (ITState != DISABLE)
1045  011d 0d09          	tnz	(OFST+5,sp)
1046  011f 2706          	jreq	L744
1047                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1049  0121 721450c5      	bset	20677,#2
1051  0125 2004          	jra	L154
1052  0127               L744:
1053                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1055  0127 721550c5      	bres	20677,#2
1056  012b               L154:
1057                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1059  012b 7b06          	ld	a,(OFST+2,sp)
1060  012d c750c4        	ld	20676,a
1062  0130 2007          	jra	L754
1063  0132               L354:
1064                     ; 357             DownCounter--;
1066  0132 1e03          	ldw	x,(OFST-1,sp)
1067  0134 1d0001        	subw	x,#1
1068  0137 1f03          	ldw	(OFST-1,sp),x
1070  0139               L754:
1071                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1073  0139 c650c5        	ld	a,20677
1074  013c a501          	bcp	a,#1
1075  013e 2704          	jreq	L364
1077  0140 1e03          	ldw	x,(OFST-1,sp)
1078  0142 26ee          	jrne	L354
1079  0144               L364:
1080                     ; 360         if (DownCounter != 0)
1082  0144 1e03          	ldw	x,(OFST-1,sp)
1083  0146 2706          	jreq	L564
1084                     ; 362             Swif = SUCCESS;
1086  0148 a601          	ld	a,#1
1087  014a 6b02          	ld	(OFST-2,sp),a
1090  014c 201b          	jra	L174
1091  014e               L564:
1092                     ; 366             Swif = ERROR;
1094  014e 0f02          	clr	(OFST-2,sp)
1096  0150 2017          	jra	L174
1097  0152               L544:
1098                     ; 374         if (ITState != DISABLE)
1100  0152 0d09          	tnz	(OFST+5,sp)
1101  0154 2706          	jreq	L374
1102                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1104  0156 721450c5      	bset	20677,#2
1106  015a 2004          	jra	L574
1107  015c               L374:
1108                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1110  015c 721550c5      	bres	20677,#2
1111  0160               L574:
1112                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1114  0160 7b06          	ld	a,(OFST+2,sp)
1115  0162 c750c4        	ld	20676,a
1116                     ; 388         Swif = SUCCESS;
1118  0165 a601          	ld	a,#1
1119  0167 6b02          	ld	(OFST-2,sp),a
1121  0169               L174:
1122                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1124  0169 0d0a          	tnz	(OFST+6,sp)
1125  016b 260c          	jrne	L774
1127  016d 7b01          	ld	a,(OFST-3,sp)
1128  016f a1e1          	cp	a,#225
1129  0171 2606          	jrne	L774
1130                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1132  0173 721150c0      	bres	20672,#0
1134  0177 201e          	jra	L105
1135  0179               L774:
1136                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1138  0179 0d0a          	tnz	(OFST+6,sp)
1139  017b 260c          	jrne	L305
1141  017d 7b01          	ld	a,(OFST-3,sp)
1142  017f a1d2          	cp	a,#210
1143  0181 2606          	jrne	L305
1144                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1146  0183 721750c0      	bres	20672,#3
1148  0187 200e          	jra	L105
1149  0189               L305:
1150                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1152  0189 0d0a          	tnz	(OFST+6,sp)
1153  018b 260a          	jrne	L105
1155  018d 7b01          	ld	a,(OFST-3,sp)
1156  018f a1b4          	cp	a,#180
1157  0191 2604          	jrne	L105
1158                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1160  0193 721150c1      	bres	20673,#0
1161  0197               L105:
1162                     ; 406     return(Swif);
1164  0197 7b02          	ld	a,(OFST-2,sp)
1167  0199 5b06          	addw	sp,#6
1168  019b 81            	ret
1306                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1306                     ; 417 {
1307                     	switch	.text
1308  019c               _CLK_HSIPrescalerConfig:
1310  019c 88            	push	a
1311       00000000      OFST:	set	0
1314                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1316                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1318  019d c650c6        	ld	a,20678
1319  01a0 a4e7          	and	a,#231
1320  01a2 c750c6        	ld	20678,a
1321                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1323  01a5 c650c6        	ld	a,20678
1324  01a8 1a01          	or	a,(OFST+1,sp)
1325  01aa c750c6        	ld	20678,a
1326                     ; 428 }
1329  01ad 84            	pop	a
1330  01ae 81            	ret
1465                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1465                     ; 440 {
1466                     	switch	.text
1467  01af               _CLK_CCOConfig:
1469  01af 88            	push	a
1470       00000000      OFST:	set	0
1473                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1475                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1477  01b0 c650c9        	ld	a,20681
1478  01b3 a4e1          	and	a,#225
1479  01b5 c750c9        	ld	20681,a
1480                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1482  01b8 c650c9        	ld	a,20681
1483  01bb 1a01          	or	a,(OFST+1,sp)
1484  01bd c750c9        	ld	20681,a
1485                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1487  01c0 721050c9      	bset	20681,#0
1488                     ; 454 }
1491  01c4 84            	pop	a
1492  01c5 81            	ret
1557                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1557                     ; 465 {
1558                     	switch	.text
1559  01c6               _CLK_ITConfig:
1561  01c6 89            	pushw	x
1562       00000000      OFST:	set	0
1565                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1567                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1569                     ; 471     if (NewState != DISABLE)
1571  01c7 9f            	ld	a,xl
1572  01c8 4d            	tnz	a
1573  01c9 2719          	jreq	L507
1574                     ; 473         switch (CLK_IT)
1576  01cb 9e            	ld	a,xh
1578                     ; 481         default:
1578                     ; 482             break;
1579  01cc a00c          	sub	a,#12
1580  01ce 270a          	jreq	L146
1581  01d0 a010          	sub	a,#16
1582  01d2 2624          	jrne	L317
1583                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1583                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1585  01d4 721450c5      	bset	20677,#2
1586                     ; 477             break;
1588  01d8 201e          	jra	L317
1589  01da               L146:
1590                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1590                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1592  01da 721450c8      	bset	20680,#2
1593                     ; 480             break;
1595  01de 2018          	jra	L317
1596  01e0               L346:
1597                     ; 481         default:
1597                     ; 482             break;
1599  01e0 2016          	jra	L317
1600  01e2               L117:
1602  01e2 2014          	jra	L317
1603  01e4               L507:
1604                     ; 487         switch (CLK_IT)
1606  01e4 7b01          	ld	a,(OFST+1,sp)
1608                     ; 495         default:
1608                     ; 496             break;
1609  01e6 a00c          	sub	a,#12
1610  01e8 270a          	jreq	L746
1611  01ea a010          	sub	a,#16
1612  01ec 260a          	jrne	L317
1613                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1613                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1615  01ee 721550c5      	bres	20677,#2
1616                     ; 491             break;
1618  01f2 2004          	jra	L317
1619  01f4               L746:
1620                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1620                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1622  01f4 721550c8      	bres	20680,#2
1623                     ; 494             break;
1624  01f8               L317:
1625                     ; 500 }
1628  01f8 85            	popw	x
1629  01f9 81            	ret
1630  01fa               L156:
1631                     ; 495         default:
1631                     ; 496             break;
1633  01fa 20fc          	jra	L317
1634  01fc               L717:
1635  01fc 20fa          	jra	L317
1670                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1670                     ; 508 {
1671                     	switch	.text
1672  01fe               _CLK_SYSCLKConfig:
1674  01fe 88            	push	a
1675       00000000      OFST:	set	0
1678                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1680                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1682  01ff a580          	bcp	a,#128
1683  0201 2614          	jrne	L737
1684                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1686  0203 c650c6        	ld	a,20678
1687  0206 a4e7          	and	a,#231
1688  0208 c750c6        	ld	20678,a
1689                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1691  020b 7b01          	ld	a,(OFST+1,sp)
1692  020d a418          	and	a,#24
1693  020f ca50c6        	or	a,20678
1694  0212 c750c6        	ld	20678,a
1696  0215 2012          	jra	L147
1697  0217               L737:
1698                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1700  0217 c650c6        	ld	a,20678
1701  021a a4f8          	and	a,#248
1702  021c c750c6        	ld	20678,a
1703                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1705  021f 7b01          	ld	a,(OFST+1,sp)
1706  0221 a407          	and	a,#7
1707  0223 ca50c6        	or	a,20678
1708  0226 c750c6        	ld	20678,a
1709  0229               L147:
1710                     ; 524 }
1713  0229 84            	pop	a
1714  022a 81            	ret
1770                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1770                     ; 532 {
1771                     	switch	.text
1772  022b               _CLK_SWIMConfig:
1776                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1778                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1780  022b 4d            	tnz	a
1781  022c 2706          	jreq	L177
1782                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1784  022e 721050cd      	bset	20685,#0
1786  0232 2004          	jra	L377
1787  0234               L177:
1788                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1790  0234 721150cd      	bres	20685,#0
1791  0238               L377:
1792                     ; 548 }
1795  0238 81            	ret
1819                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1819                     ; 558 {
1820                     	switch	.text
1821  0239               _CLK_ClockSecuritySystemEnable:
1825                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1827  0239 721050c8      	bset	20680,#0
1828                     ; 561 }
1831  023d 81            	ret
1856                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1856                     ; 570 {
1857                     	switch	.text
1858  023e               _CLK_GetSYSCLKSource:
1862                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1864  023e c650c3        	ld	a,20675
1867  0241 81            	ret
1930                     ; 579 uint32_t CLK_GetClockFreq(void)
1930                     ; 580 {
1931                     	switch	.text
1932  0242               _CLK_GetClockFreq:
1934  0242 5209          	subw	sp,#9
1935       00000009      OFST:	set	9
1938                     ; 582     uint32_t clockfrequency = 0;
1940                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1942                     ; 584     uint8_t tmp = 0, presc = 0;
1946                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1948  0244 c650c3        	ld	a,20675
1949  0247 6b09          	ld	(OFST+0,sp),a
1951                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1953  0249 7b09          	ld	a,(OFST+0,sp)
1954  024b a1e1          	cp	a,#225
1955  024d 2641          	jrne	L7401
1956                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1958  024f c650c6        	ld	a,20678
1959  0252 a418          	and	a,#24
1960  0254 6b09          	ld	(OFST+0,sp),a
1962                     ; 592         tmp = (uint8_t)(tmp >> 3);
1964  0256 0409          	srl	(OFST+0,sp)
1965  0258 0409          	srl	(OFST+0,sp)
1966  025a 0409          	srl	(OFST+0,sp)
1968                     ; 593         presc = HSIDivFactor[tmp];
1970  025c 7b09          	ld	a,(OFST+0,sp)
1971  025e 5f            	clrw	x
1972  025f 97            	ld	xl,a
1973  0260 d60000        	ld	a,(_HSIDivFactor,x)
1974  0263 6b09          	ld	(OFST+0,sp),a
1976                     ; 594         clockfrequency = HSI_VALUE / presc;
1978  0265 7b09          	ld	a,(OFST+0,sp)
1979  0267 b703          	ld	c_lreg+3,a
1980  0269 3f02          	clr	c_lreg+2
1981  026b 3f01          	clr	c_lreg+1
1982  026d 3f00          	clr	c_lreg
1983  026f 96            	ldw	x,sp
1984  0270 1c0001        	addw	x,#OFST-8
1985  0273 cd0000        	call	c_rtol
1988  0276 ae2400        	ldw	x,#9216
1989  0279 bf02          	ldw	c_lreg+2,x
1990  027b ae00f4        	ldw	x,#244
1991  027e bf00          	ldw	c_lreg,x
1992  0280 96            	ldw	x,sp
1993  0281 1c0001        	addw	x,#OFST-8
1994  0284 cd0000        	call	c_ludv
1996  0287 96            	ldw	x,sp
1997  0288 1c0005        	addw	x,#OFST-4
1998  028b cd0000        	call	c_rtol
2002  028e 201c          	jra	L1501
2003  0290               L7401:
2004                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2006  0290 7b09          	ld	a,(OFST+0,sp)
2007  0292 a1d2          	cp	a,#210
2008  0294 260c          	jrne	L3501
2009                     ; 598         clockfrequency = LSI_VALUE;
2011  0296 aef400        	ldw	x,#62464
2012  0299 1f07          	ldw	(OFST-2,sp),x
2013  029b ae0001        	ldw	x,#1
2014  029e 1f05          	ldw	(OFST-4,sp),x
2017  02a0 200a          	jra	L1501
2018  02a2               L3501:
2019                     ; 602         clockfrequency = HSE_VALUE;
2021  02a2 ae2400        	ldw	x,#9216
2022  02a5 1f07          	ldw	(OFST-2,sp),x
2023  02a7 ae00f4        	ldw	x,#244
2024  02aa 1f05          	ldw	(OFST-4,sp),x
2026  02ac               L1501:
2027                     ; 605     return((uint32_t)clockfrequency);
2029  02ac 96            	ldw	x,sp
2030  02ad 1c0005        	addw	x,#OFST-4
2031  02b0 cd0000        	call	c_ltor
2035  02b3 5b09          	addw	sp,#9
2036  02b5 81            	ret
2135                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2135                     ; 617 {
2136                     	switch	.text
2137  02b6               _CLK_AdjustHSICalibrationValue:
2139  02b6 88            	push	a
2140       00000000      OFST:	set	0
2143                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2145                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2147  02b7 c650cc        	ld	a,20684
2148  02ba a4f8          	and	a,#248
2149  02bc 1a01          	or	a,(OFST+1,sp)
2150  02be c750cc        	ld	20684,a
2151                     ; 625 }
2154  02c1 84            	pop	a
2155  02c2 81            	ret
2179                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2179                     ; 637 {
2180                     	switch	.text
2181  02c3               _CLK_SYSCLKEmergencyClear:
2185                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2187  02c3 721150c5      	bres	20677,#0
2188                     ; 639 }
2191  02c7 81            	ret
2344                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2344                     ; 649 {
2345                     	switch	.text
2346  02c8               _CLK_GetFlagStatus:
2348  02c8 89            	pushw	x
2349  02c9 5203          	subw	sp,#3
2350       00000003      OFST:	set	3
2353                     ; 651     uint16_t statusreg = 0;
2355                     ; 652     uint8_t tmpreg = 0;
2357                     ; 653     FlagStatus bitstatus = RESET;
2359                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2361                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2363  02cb 01            	rrwa	x,a
2364  02cc 9f            	ld	a,xl
2365  02cd a4ff          	and	a,#255
2366  02cf 97            	ld	xl,a
2367  02d0 4f            	clr	a
2368  02d1 02            	rlwa	x,a
2369  02d2 1f01          	ldw	(OFST-2,sp),x
2370  02d4 01            	rrwa	x,a
2372                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2374  02d5 1e01          	ldw	x,(OFST-2,sp)
2375  02d7 a30100        	cpw	x,#256
2376  02da 2607          	jrne	L1221
2377                     ; 664         tmpreg = CLK->ICKR;
2379  02dc c650c0        	ld	a,20672
2380  02df 6b03          	ld	(OFST+0,sp),a
2383  02e1 202f          	jra	L3221
2384  02e3               L1221:
2385                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2387  02e3 1e01          	ldw	x,(OFST-2,sp)
2388  02e5 a30200        	cpw	x,#512
2389  02e8 2607          	jrne	L5221
2390                     ; 668         tmpreg = CLK->ECKR;
2392  02ea c650c1        	ld	a,20673
2393  02ed 6b03          	ld	(OFST+0,sp),a
2396  02ef 2021          	jra	L3221
2397  02f1               L5221:
2398                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2400  02f1 1e01          	ldw	x,(OFST-2,sp)
2401  02f3 a30300        	cpw	x,#768
2402  02f6 2607          	jrne	L1321
2403                     ; 672         tmpreg = CLK->SWCR;
2405  02f8 c650c5        	ld	a,20677
2406  02fb 6b03          	ld	(OFST+0,sp),a
2409  02fd 2013          	jra	L3221
2410  02ff               L1321:
2411                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2413  02ff 1e01          	ldw	x,(OFST-2,sp)
2414  0301 a30400        	cpw	x,#1024
2415  0304 2607          	jrne	L5321
2416                     ; 676         tmpreg = CLK->CSSR;
2418  0306 c650c8        	ld	a,20680
2419  0309 6b03          	ld	(OFST+0,sp),a
2422  030b 2005          	jra	L3221
2423  030d               L5321:
2424                     ; 680         tmpreg = CLK->CCOR;
2426  030d c650c9        	ld	a,20681
2427  0310 6b03          	ld	(OFST+0,sp),a
2429  0312               L3221:
2430                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2432  0312 7b05          	ld	a,(OFST+2,sp)
2433  0314 1503          	bcp	a,(OFST+0,sp)
2434  0316 2706          	jreq	L1421
2435                     ; 685         bitstatus = SET;
2437  0318 a601          	ld	a,#1
2438  031a 6b03          	ld	(OFST+0,sp),a
2441  031c 2002          	jra	L3421
2442  031e               L1421:
2443                     ; 689         bitstatus = RESET;
2445  031e 0f03          	clr	(OFST+0,sp)
2447  0320               L3421:
2448                     ; 693     return((FlagStatus)bitstatus);
2450  0320 7b03          	ld	a,(OFST+0,sp)
2453  0322 5b05          	addw	sp,#5
2454  0324 81            	ret
2500                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2500                     ; 704 {
2501                     	switch	.text
2502  0325               _CLK_GetITStatus:
2504  0325 88            	push	a
2505  0326 88            	push	a
2506       00000001      OFST:	set	1
2509                     ; 706     ITStatus bitstatus = RESET;
2511                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2513                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2515  0327 a11c          	cp	a,#28
2516  0329 2611          	jrne	L7621
2517                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2519  032b c450c5        	and	a,20677
2520  032e a10c          	cp	a,#12
2521  0330 2606          	jrne	L1721
2522                     ; 716             bitstatus = SET;
2524  0332 a601          	ld	a,#1
2525  0334 6b01          	ld	(OFST+0,sp),a
2528  0336 2015          	jra	L5721
2529  0338               L1721:
2530                     ; 720             bitstatus = RESET;
2532  0338 0f01          	clr	(OFST+0,sp)
2534  033a 2011          	jra	L5721
2535  033c               L7621:
2536                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2538  033c c650c8        	ld	a,20680
2539  033f 1402          	and	a,(OFST+1,sp)
2540  0341 a10c          	cp	a,#12
2541  0343 2606          	jrne	L7721
2542                     ; 728             bitstatus = SET;
2544  0345 a601          	ld	a,#1
2545  0347 6b01          	ld	(OFST+0,sp),a
2548  0349 2002          	jra	L5721
2549  034b               L7721:
2550                     ; 732             bitstatus = RESET;
2552  034b 0f01          	clr	(OFST+0,sp)
2554  034d               L5721:
2555                     ; 737     return bitstatus;
2557  034d 7b01          	ld	a,(OFST+0,sp)
2560  034f 85            	popw	x
2561  0350 81            	ret
2597                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2597                     ; 748 {
2598                     	switch	.text
2599  0351               _CLK_ClearITPendingBit:
2603                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2605                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2607  0351 a10c          	cp	a,#12
2608  0353 2606          	jrne	L1231
2609                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2611  0355 721750c8      	bres	20680,#3
2613  0359 2004          	jra	L3231
2614  035b               L1231:
2615                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2617  035b 721750c5      	bres	20677,#3
2618  035f               L3231:
2619                     ; 764 }
2622  035f 81            	ret
2657                     	xdef	_CLKPrescTable
2658                     	xdef	_HSIDivFactor
2659                     	xdef	_CLK_ClearITPendingBit
2660                     	xdef	_CLK_GetITStatus
2661                     	xdef	_CLK_GetFlagStatus
2662                     	xdef	_CLK_GetSYSCLKSource
2663                     	xdef	_CLK_GetClockFreq
2664                     	xdef	_CLK_AdjustHSICalibrationValue
2665                     	xdef	_CLK_SYSCLKEmergencyClear
2666                     	xdef	_CLK_ClockSecuritySystemEnable
2667                     	xdef	_CLK_SWIMConfig
2668                     	xdef	_CLK_SYSCLKConfig
2669                     	xdef	_CLK_ITConfig
2670                     	xdef	_CLK_CCOConfig
2671                     	xdef	_CLK_HSIPrescalerConfig
2672                     	xdef	_CLK_ClockSwitchConfig
2673                     	xdef	_CLK_PeripheralClockConfig
2674                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2675                     	xdef	_CLK_FastHaltWakeUpCmd
2676                     	xdef	_CLK_ClockSwitchCmd
2677                     	xdef	_CLK_CCOCmd
2678                     	xdef	_CLK_LSICmd
2679                     	xdef	_CLK_HSICmd
2680                     	xdef	_CLK_HSECmd
2681                     	xdef	_CLK_DeInit
2682                     	xref.b	c_lreg
2683                     	xref.b	c_x
2702                     	xref	c_ltor
2703                     	xref	c_ludv
2704                     	xref	c_rtol
2705                     	end
