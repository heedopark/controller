   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 47 void UART2_DeInit(void)
  45                     ; 48 {
  47                     	switch	.text
  48  0000               _UART2_DeInit:
  52                     ; 51     (void) UART2->SR;
  54  0000 c65240        	ld	a,21056
  55                     ; 52     (void)UART2->DR;
  57  0003 c65241        	ld	a,21057
  58                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  60  0006 725f5243      	clr	21059
  61                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  63  000a 725f5242      	clr	21058
  64                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  66  000e 725f5244      	clr	21060
  67                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  69  0012 725f5245      	clr	21061
  70                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  72  0016 725f5246      	clr	21062
  73                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  75  001a 725f5247      	clr	21063
  76                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  78  001e 725f5248      	clr	21064
  79                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  81  0022 725f5249      	clr	21065
  82                     ; 64 }
  85  0026 81            	ret
 406                     .const:	section	.text
 407  0000               L01:
 408  0000 00000064      	dc.l	100
 409                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 409                     ; 81 {
 410                     	switch	.text
 411  0027               _UART2_Init:
 413  0027 520e          	subw	sp,#14
 414       0000000e      OFST:	set	14
 417                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 421                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 425                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 427                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 429                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 431                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 433                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 435                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 437                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 439  0029 72195244      	bres	21060,#4
 440                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 442  002d c65244        	ld	a,21060
 443  0030 1a15          	or	a,(OFST+7,sp)
 444  0032 c75244        	ld	21060,a
 445                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 447  0035 c65246        	ld	a,21062
 448  0038 a4cf          	and	a,#207
 449  003a c75246        	ld	21062,a
 450                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 452  003d c65246        	ld	a,21062
 453  0040 1a16          	or	a,(OFST+8,sp)
 454  0042 c75246        	ld	21062,a
 455                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 457  0045 c65244        	ld	a,21060
 458  0048 a4f9          	and	a,#249
 459  004a c75244        	ld	21060,a
 460                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 462  004d c65244        	ld	a,21060
 463  0050 1a17          	or	a,(OFST+9,sp)
 464  0052 c75244        	ld	21060,a
 465                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 467  0055 725f5242      	clr	21058
 468                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 470  0059 c65243        	ld	a,21059
 471  005c a40f          	and	a,#15
 472  005e c75243        	ld	21059,a
 473                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 475  0061 c65243        	ld	a,21059
 476  0064 a4f0          	and	a,#240
 477  0066 c75243        	ld	21059,a
 478                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 480  0069 96            	ldw	x,sp
 481  006a 1c0011        	addw	x,#OFST+3
 482  006d cd0000        	call	c_ltor
 484  0070 a604          	ld	a,#4
 485  0072 cd0000        	call	c_llsh
 487  0075 96            	ldw	x,sp
 488  0076 1c0001        	addw	x,#OFST-13
 489  0079 cd0000        	call	c_rtol
 492  007c cd0000        	call	_CLK_GetClockFreq
 494  007f 96            	ldw	x,sp
 495  0080 1c0001        	addw	x,#OFST-13
 496  0083 cd0000        	call	c_ludv
 498  0086 96            	ldw	x,sp
 499  0087 1c000b        	addw	x,#OFST-3
 500  008a cd0000        	call	c_rtol
 503                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 505  008d 96            	ldw	x,sp
 506  008e 1c0011        	addw	x,#OFST+3
 507  0091 cd0000        	call	c_ltor
 509  0094 a604          	ld	a,#4
 510  0096 cd0000        	call	c_llsh
 512  0099 96            	ldw	x,sp
 513  009a 1c0001        	addw	x,#OFST-13
 514  009d cd0000        	call	c_rtol
 517  00a0 cd0000        	call	_CLK_GetClockFreq
 519  00a3 a664          	ld	a,#100
 520  00a5 cd0000        	call	c_smul
 522  00a8 96            	ldw	x,sp
 523  00a9 1c0001        	addw	x,#OFST-13
 524  00ac cd0000        	call	c_ludv
 526  00af 96            	ldw	x,sp
 527  00b0 1c0007        	addw	x,#OFST-7
 528  00b3 cd0000        	call	c_rtol
 531                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 531                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 533  00b6 96            	ldw	x,sp
 534  00b7 1c000b        	addw	x,#OFST-3
 535  00ba cd0000        	call	c_ltor
 537  00bd a664          	ld	a,#100
 538  00bf cd0000        	call	c_smul
 540  00c2 96            	ldw	x,sp
 541  00c3 1c0001        	addw	x,#OFST-13
 542  00c6 cd0000        	call	c_rtol
 545  00c9 96            	ldw	x,sp
 546  00ca 1c0007        	addw	x,#OFST-7
 547  00cd cd0000        	call	c_ltor
 549  00d0 96            	ldw	x,sp
 550  00d1 1c0001        	addw	x,#OFST-13
 551  00d4 cd0000        	call	c_lsub
 553  00d7 a604          	ld	a,#4
 554  00d9 cd0000        	call	c_llsh
 556  00dc ae0000        	ldw	x,#L01
 557  00df cd0000        	call	c_ludv
 559  00e2 b603          	ld	a,c_lreg+3
 560  00e4 a40f          	and	a,#15
 561  00e6 6b05          	ld	(OFST-9,sp),a
 563                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 565  00e8 96            	ldw	x,sp
 566  00e9 1c000b        	addw	x,#OFST-3
 567  00ec cd0000        	call	c_ltor
 569  00ef a604          	ld	a,#4
 570  00f1 cd0000        	call	c_lursh
 572  00f4 b603          	ld	a,c_lreg+3
 573  00f6 a4f0          	and	a,#240
 574  00f8 b703          	ld	c_lreg+3,a
 575  00fa 3f02          	clr	c_lreg+2
 576  00fc 3f01          	clr	c_lreg+1
 577  00fe 3f00          	clr	c_lreg
 578  0100 b603          	ld	a,c_lreg+3
 579  0102 6b06          	ld	(OFST-8,sp),a
 581                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 583  0104 7b05          	ld	a,(OFST-9,sp)
 584  0106 1a06          	or	a,(OFST-8,sp)
 585  0108 c75243        	ld	21059,a
 586                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 588  010b 7b0e          	ld	a,(OFST+0,sp)
 589  010d c75242        	ld	21058,a
 590                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 592  0110 c65245        	ld	a,21061
 593  0113 a4f3          	and	a,#243
 594  0115 c75245        	ld	21061,a
 595                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 597  0118 c65246        	ld	a,21062
 598  011b a4f8          	and	a,#248
 599  011d c75246        	ld	21062,a
 600                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 600                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 602  0120 7b18          	ld	a,(OFST+10,sp)
 603  0122 a407          	and	a,#7
 604  0124 ca5246        	or	a,21062
 605  0127 c75246        	ld	21062,a
 606                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 608  012a 7b19          	ld	a,(OFST+11,sp)
 609  012c a504          	bcp	a,#4
 610  012e 2706          	jreq	L302
 611                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 613  0130 72165245      	bset	21061,#3
 615  0134 2004          	jra	L502
 616  0136               L302:
 617                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 619  0136 72175245      	bres	21061,#3
 620  013a               L502:
 621                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 623  013a 7b19          	ld	a,(OFST+11,sp)
 624  013c a508          	bcp	a,#8
 625  013e 2706          	jreq	L702
 626                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 628  0140 72145245      	bset	21061,#2
 630  0144 2004          	jra	L112
 631  0146               L702:
 632                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 634  0146 72155245      	bres	21061,#2
 635  014a               L112:
 636                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 638  014a 7b18          	ld	a,(OFST+10,sp)
 639  014c a580          	bcp	a,#128
 640  014e 2706          	jreq	L312
 641                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 643  0150 72175246      	bres	21062,#3
 645  0154 200a          	jra	L512
 646  0156               L312:
 647                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 649  0156 7b18          	ld	a,(OFST+10,sp)
 650  0158 a408          	and	a,#8
 651  015a ca5246        	or	a,21062
 652  015d c75246        	ld	21062,a
 653  0160               L512:
 654                     ; 168 }
 657  0160 5b0e          	addw	sp,#14
 658  0162 81            	ret
 713                     ; 176 void UART2_Cmd(FunctionalState NewState)
 713                     ; 177 {
 714                     	switch	.text
 715  0163               _UART2_Cmd:
 719                     ; 179     if (NewState != DISABLE)
 721  0163 4d            	tnz	a
 722  0164 2706          	jreq	L542
 723                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 725  0166 721b5244      	bres	21060,#5
 727  016a 2004          	jra	L742
 728  016c               L542:
 729                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 731  016c 721a5244      	bset	21060,#5
 732  0170               L742:
 733                     ; 189 }
 736  0170 81            	ret
 868                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 868                     ; 207 {
 869                     	switch	.text
 870  0171               _UART2_ITConfig:
 872  0171 89            	pushw	x
 873  0172 89            	pushw	x
 874       00000002      OFST:	set	2
 877                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
 881                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 883                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 885                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 887  0173 9e            	ld	a,xh
 888  0174 6b01          	ld	(OFST-1,sp),a
 890                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 892  0176 9f            	ld	a,xl
 893  0177 a40f          	and	a,#15
 894  0179 5f            	clrw	x
 895  017a 97            	ld	xl,a
 896  017b a601          	ld	a,#1
 897  017d 5d            	tnzw	x
 898  017e 2704          	jreq	L61
 899  0180               L02:
 900  0180 48            	sll	a
 901  0181 5a            	decw	x
 902  0182 26fc          	jrne	L02
 903  0184               L61:
 904  0184 6b02          	ld	(OFST+0,sp),a
 906                     ; 220     if (NewState != DISABLE)
 908  0186 0d07          	tnz	(OFST+5,sp)
 909  0188 273a          	jreq	L133
 910                     ; 223         if (uartreg == 0x01)
 912  018a 7b01          	ld	a,(OFST-1,sp)
 913  018c a101          	cp	a,#1
 914  018e 260a          	jrne	L333
 915                     ; 225             UART2->CR1 |= itpos;
 917  0190 c65244        	ld	a,21060
 918  0193 1a02          	or	a,(OFST+0,sp)
 919  0195 c75244        	ld	21060,a
 921  0198 2066          	jra	L743
 922  019a               L333:
 923                     ; 227         else if (uartreg == 0x02)
 925  019a 7b01          	ld	a,(OFST-1,sp)
 926  019c a102          	cp	a,#2
 927  019e 260a          	jrne	L733
 928                     ; 229             UART2->CR2 |= itpos;
 930  01a0 c65245        	ld	a,21061
 931  01a3 1a02          	or	a,(OFST+0,sp)
 932  01a5 c75245        	ld	21061,a
 934  01a8 2056          	jra	L743
 935  01aa               L733:
 936                     ; 231         else if (uartreg == 0x03)
 938  01aa 7b01          	ld	a,(OFST-1,sp)
 939  01ac a103          	cp	a,#3
 940  01ae 260a          	jrne	L343
 941                     ; 233             UART2->CR4 |= itpos;
 943  01b0 c65247        	ld	a,21063
 944  01b3 1a02          	or	a,(OFST+0,sp)
 945  01b5 c75247        	ld	21063,a
 947  01b8 2046          	jra	L743
 948  01ba               L343:
 949                     ; 237             UART2->CR6 |= itpos;
 951  01ba c65249        	ld	a,21065
 952  01bd 1a02          	or	a,(OFST+0,sp)
 953  01bf c75249        	ld	21065,a
 954  01c2 203c          	jra	L743
 955  01c4               L133:
 956                     ; 243         if (uartreg == 0x01)
 958  01c4 7b01          	ld	a,(OFST-1,sp)
 959  01c6 a101          	cp	a,#1
 960  01c8 260b          	jrne	L153
 961                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
 963  01ca 7b02          	ld	a,(OFST+0,sp)
 964  01cc 43            	cpl	a
 965  01cd c45244        	and	a,21060
 966  01d0 c75244        	ld	21060,a
 968  01d3 202b          	jra	L743
 969  01d5               L153:
 970                     ; 247         else if (uartreg == 0x02)
 972  01d5 7b01          	ld	a,(OFST-1,sp)
 973  01d7 a102          	cp	a,#2
 974  01d9 260b          	jrne	L553
 975                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
 977  01db 7b02          	ld	a,(OFST+0,sp)
 978  01dd 43            	cpl	a
 979  01de c45245        	and	a,21061
 980  01e1 c75245        	ld	21061,a
 982  01e4 201a          	jra	L743
 983  01e6               L553:
 984                     ; 251         else if (uartreg == 0x03)
 986  01e6 7b01          	ld	a,(OFST-1,sp)
 987  01e8 a103          	cp	a,#3
 988  01ea 260b          	jrne	L163
 989                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
 991  01ec 7b02          	ld	a,(OFST+0,sp)
 992  01ee 43            	cpl	a
 993  01ef c45247        	and	a,21063
 994  01f2 c75247        	ld	21063,a
 996  01f5 2009          	jra	L743
 997  01f7               L163:
 998                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
1000  01f7 7b02          	ld	a,(OFST+0,sp)
1001  01f9 43            	cpl	a
1002  01fa c45249        	and	a,21065
1003  01fd c75249        	ld	21065,a
1004  0200               L743:
1005                     ; 260 }
1008  0200 5b04          	addw	sp,#4
1009  0202 81            	ret
1066                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1066                     ; 268 {
1067                     	switch	.text
1068  0203               _UART2_IrDAConfig:
1072                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1074                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1076  0203 4d            	tnz	a
1077  0204 2706          	jreq	L314
1078                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1080  0206 72145248      	bset	21064,#2
1082  020a 2004          	jra	L514
1083  020c               L314:
1084                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1086  020c 72155248      	bres	21064,#2
1087  0210               L514:
1088                     ; 279 }
1091  0210 81            	ret
1126                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1126                     ; 288 {
1127                     	switch	.text
1128  0211               _UART2_IrDACmd:
1132                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1134                     ; 292     if (NewState != DISABLE)
1136  0211 4d            	tnz	a
1137  0212 2706          	jreq	L534
1138                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1140  0214 72125248      	bset	21064,#1
1142  0218 2004          	jra	L734
1143  021a               L534:
1144                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1146  021a 72135248      	bres	21064,#1
1147  021e               L734:
1148                     ; 302 }
1151  021e 81            	ret
1210                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1210                     ; 312 {
1211                     	switch	.text
1212  021f               _UART2_LINBreakDetectionConfig:
1216                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1218                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1220  021f 4d            	tnz	a
1221  0220 2706          	jreq	L764
1222                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1224  0222 721a5247      	bset	21063,#5
1226  0226 2004          	jra	L174
1227  0228               L764:
1228                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1230  0228 721b5247      	bres	21063,#5
1231  022c               L174:
1232                     ; 324 }
1235  022c 81            	ret
1356                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1356                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1356                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1356                     ; 339 {
1357                     	switch	.text
1358  022d               _UART2_LINConfig:
1360  022d 89            	pushw	x
1361       00000000      OFST:	set	0
1364                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1366                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1368                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1370                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1372  022e 9e            	ld	a,xh
1373  022f 4d            	tnz	a
1374  0230 2706          	jreq	L155
1375                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1377  0232 721a5249      	bset	21065,#5
1379  0236 2004          	jra	L355
1380  0238               L155:
1381                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1383  0238 721b5249      	bres	21065,#5
1384  023c               L355:
1385                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1387  023c 0d02          	tnz	(OFST+2,sp)
1388  023e 2706          	jreq	L555
1389                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1391  0240 72185249      	bset	21065,#4
1393  0244 2004          	jra	L755
1394  0246               L555:
1395                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1397  0246 72195249      	bres	21065,#4
1398  024a               L755:
1399                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1401  024a 0d05          	tnz	(OFST+5,sp)
1402  024c 2706          	jreq	L165
1403                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1405  024e 721e5249      	bset	21065,#7
1407  0252 2004          	jra	L365
1408  0254               L165:
1409                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1411  0254 721f5249      	bres	21065,#7
1412  0258               L365:
1413                     ; 371 }
1416  0258 85            	popw	x
1417  0259 81            	ret
1452                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1452                     ; 380 {
1453                     	switch	.text
1454  025a               _UART2_LINCmd:
1458                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1460                     ; 383     if (NewState != DISABLE)
1462  025a 4d            	tnz	a
1463  025b 2706          	jreq	L306
1464                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1466  025d 721c5246      	bset	21062,#6
1468  0261 2004          	jra	L506
1469  0263               L306:
1470                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1472  0263 721d5246      	bres	21062,#6
1473  0267               L506:
1474                     ; 393 }
1477  0267 81            	ret
1512                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1512                     ; 401 {
1513                     	switch	.text
1514  0268               _UART2_SmartCardCmd:
1518                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1520                     ; 405     if (NewState != DISABLE)
1522  0268 4d            	tnz	a
1523  0269 2706          	jreq	L526
1524                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1526  026b 721a5248      	bset	21064,#5
1528  026f 2004          	jra	L726
1529  0271               L526:
1530                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1532  0271 721b5248      	bres	21064,#5
1533  0275               L726:
1534                     ; 415 }
1537  0275 81            	ret
1573                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1573                     ; 424 {
1574                     	switch	.text
1575  0276               _UART2_SmartCardNACKCmd:
1579                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1581                     ; 428     if (NewState != DISABLE)
1583  0276 4d            	tnz	a
1584  0277 2706          	jreq	L746
1585                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1587  0279 72185248      	bset	21064,#4
1589  027d 2004          	jra	L156
1590  027f               L746:
1591                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1593  027f 72195248      	bres	21064,#4
1594  0283               L156:
1595                     ; 438 }
1598  0283 81            	ret
1655                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1655                     ; 447 {
1656                     	switch	.text
1657  0284               _UART2_WakeUpConfig:
1661                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1663                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1665  0284 72175244      	bres	21060,#3
1666                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
1668  0288 ca5244        	or	a,21060
1669  028b c75244        	ld	21060,a
1670                     ; 452 }
1673  028e 81            	ret
1709                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1709                     ; 461 {
1710                     	switch	.text
1711  028f               _UART2_ReceiverWakeUpCmd:
1715                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1717                     ; 464     if (NewState != DISABLE)
1719  028f 4d            	tnz	a
1720  0290 2706          	jreq	L717
1721                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
1723  0292 72125245      	bset	21061,#1
1725  0296 2004          	jra	L127
1726  0298               L717:
1727                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1729  0298 72135245      	bres	21061,#1
1730  029c               L127:
1731                     ; 474 }
1734  029c 81            	ret
1757                     ; 481 uint8_t UART2_ReceiveData8(void)
1757                     ; 482 {
1758                     	switch	.text
1759  029d               _UART2_ReceiveData8:
1763                     ; 483     return ((uint8_t)UART2->DR);
1765  029d c65241        	ld	a,21057
1768  02a0 81            	ret
1802                     ; 491 uint16_t UART2_ReceiveData9(void)
1802                     ; 492 {
1803                     	switch	.text
1804  02a1               _UART2_ReceiveData9:
1806  02a1 89            	pushw	x
1807       00000002      OFST:	set	2
1810                     ; 493   uint16_t temp = 0;
1812                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1814  02a2 c65244        	ld	a,21060
1815  02a5 5f            	clrw	x
1816  02a6 a480          	and	a,#128
1817  02a8 5f            	clrw	x
1818  02a9 02            	rlwa	x,a
1819  02aa 58            	sllw	x
1820  02ab 1f01          	ldw	(OFST-1,sp),x
1822                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1824  02ad c65241        	ld	a,21057
1825  02b0 5f            	clrw	x
1826  02b1 97            	ld	xl,a
1827  02b2 01            	rrwa	x,a
1828  02b3 1a02          	or	a,(OFST+0,sp)
1829  02b5 01            	rrwa	x,a
1830  02b6 1a01          	or	a,(OFST-1,sp)
1831  02b8 01            	rrwa	x,a
1832  02b9 01            	rrwa	x,a
1833  02ba a4ff          	and	a,#255
1834  02bc 01            	rrwa	x,a
1835  02bd a401          	and	a,#1
1836  02bf 01            	rrwa	x,a
1839  02c0 5b02          	addw	sp,#2
1840  02c2 81            	ret
1874                     ; 505 void UART2_SendData8(uint8_t Data)
1874                     ; 506 {
1875                     	switch	.text
1876  02c3               _UART2_SendData8:
1880                     ; 508     UART2->DR = Data;
1882  02c3 c75241        	ld	21057,a
1883                     ; 509 }
1886  02c6 81            	ret
1920                     ; 516 void UART2_SendData9(uint16_t Data)
1920                     ; 517 {
1921                     	switch	.text
1922  02c7               _UART2_SendData9:
1924  02c7 89            	pushw	x
1925       00000000      OFST:	set	0
1928                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1930  02c8 721d5244      	bres	21060,#6
1931                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1933  02cc 54            	srlw	x
1934  02cd 54            	srlw	x
1935  02ce 9f            	ld	a,xl
1936  02cf a440          	and	a,#64
1937  02d1 ca5244        	or	a,21060
1938  02d4 c75244        	ld	21060,a
1939                     ; 525     UART2->DR   = (uint8_t)(Data);                    
1941  02d7 7b02          	ld	a,(OFST+2,sp)
1942  02d9 c75241        	ld	21057,a
1943                     ; 527 }
1946  02dc 85            	popw	x
1947  02dd 81            	ret
1970                     ; 534 void UART2_SendBreak(void)
1970                     ; 535 {
1971                     	switch	.text
1972  02de               _UART2_SendBreak:
1976                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
1978  02de 72105245      	bset	21061,#0
1979                     ; 537 }
1982  02e2 81            	ret
2016                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
2016                     ; 545 {
2017                     	switch	.text
2018  02e3               _UART2_SetAddress:
2020  02e3 88            	push	a
2021       00000000      OFST:	set	0
2024                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2026                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2028  02e4 c65247        	ld	a,21063
2029  02e7 a4f0          	and	a,#240
2030  02e9 c75247        	ld	21063,a
2031                     ; 552     UART2->CR4 |= UART2_Address;
2033  02ec c65247        	ld	a,21063
2034  02ef 1a01          	or	a,(OFST+1,sp)
2035  02f1 c75247        	ld	21063,a
2036                     ; 553 }
2039  02f4 84            	pop	a
2040  02f5 81            	ret
2074                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2074                     ; 562 {
2075                     	switch	.text
2076  02f6               _UART2_SetGuardTime:
2080                     ; 564     UART2->GTR = UART2_GuardTime;
2082  02f6 c7524a        	ld	21066,a
2083                     ; 565 }
2086  02f9 81            	ret
2120                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2120                     ; 590 {
2121                     	switch	.text
2122  02fa               _UART2_SetPrescaler:
2126                     ; 592     UART2->PSCR = UART2_Prescaler;
2128  02fa c7524b        	ld	21067,a
2129                     ; 593 }
2132  02fd 81            	ret
2289                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2289                     ; 602 {
2290                     	switch	.text
2291  02fe               _UART2_GetFlagStatus:
2293  02fe 89            	pushw	x
2294  02ff 88            	push	a
2295       00000001      OFST:	set	1
2298                     ; 603     FlagStatus status = RESET;
2300                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2302                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2304  0300 a30210        	cpw	x,#528
2305  0303 2610          	jrne	L5511
2306                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2308  0305 9f            	ld	a,xl
2309  0306 c45247        	and	a,21063
2310  0309 2706          	jreq	L7511
2311                     ; 614             status = SET;
2313  030b a601          	ld	a,#1
2314  030d 6b01          	ld	(OFST+0,sp),a
2317  030f 2039          	jra	L3611
2318  0311               L7511:
2319                     ; 619             status = RESET;
2321  0311 0f01          	clr	(OFST+0,sp)
2323  0313 2035          	jra	L3611
2324  0315               L5511:
2325                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2327  0315 1e02          	ldw	x,(OFST+1,sp)
2328  0317 a30101        	cpw	x,#257
2329  031a 2611          	jrne	L5611
2330                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2332  031c c65245        	ld	a,21061
2333  031f 1503          	bcp	a,(OFST+2,sp)
2334  0321 2706          	jreq	L7611
2335                     ; 627             status = SET;
2337  0323 a601          	ld	a,#1
2338  0325 6b01          	ld	(OFST+0,sp),a
2341  0327 2021          	jra	L3611
2342  0329               L7611:
2343                     ; 632             status = RESET;
2345  0329 0f01          	clr	(OFST+0,sp)
2347  032b 201d          	jra	L3611
2348  032d               L5611:
2349                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2351  032d 1e02          	ldw	x,(OFST+1,sp)
2352  032f a30302        	cpw	x,#770
2353  0332 2707          	jreq	L7711
2355  0334 1e02          	ldw	x,(OFST+1,sp)
2356  0336 a30301        	cpw	x,#769
2357  0339 2614          	jrne	L5711
2358  033b               L7711:
2359                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2361  033b c65249        	ld	a,21065
2362  033e 1503          	bcp	a,(OFST+2,sp)
2363  0340 2706          	jreq	L1021
2364                     ; 640             status = SET;
2366  0342 a601          	ld	a,#1
2367  0344 6b01          	ld	(OFST+0,sp),a
2370  0346 2002          	jra	L3611
2371  0348               L1021:
2372                     ; 645             status = RESET;
2374  0348 0f01          	clr	(OFST+0,sp)
2376  034a               L3611:
2377                     ; 663     return  status;
2379  034a 7b01          	ld	a,(OFST+0,sp)
2382  034c 5b03          	addw	sp,#3
2383  034e 81            	ret
2384  034f               L5711:
2385                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2387  034f c65240        	ld	a,21056
2388  0352 1503          	bcp	a,(OFST+2,sp)
2389  0354 2706          	jreq	L7021
2390                     ; 653             status = SET;
2392  0356 a601          	ld	a,#1
2393  0358 6b01          	ld	(OFST+0,sp),a
2396  035a 20ee          	jra	L3611
2397  035c               L7021:
2398                     ; 658             status = RESET;
2400  035c 0f01          	clr	(OFST+0,sp)
2402  035e 20ea          	jra	L3611
2437                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2437                     ; 694 {
2438                     	switch	.text
2439  0360               _UART2_ClearFlag:
2441  0360 89            	pushw	x
2442       00000000      OFST:	set	0
2445                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2447                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2449  0361 a30020        	cpw	x,#32
2450  0364 2606          	jrne	L1321
2451                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2453  0366 35df5240      	mov	21056,#223
2455  036a 201e          	jra	L3321
2456  036c               L1321:
2457                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2459  036c 1e01          	ldw	x,(OFST+1,sp)
2460  036e a30210        	cpw	x,#528
2461  0371 2606          	jrne	L5321
2462                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2464  0373 72195247      	bres	21063,#4
2466  0377 2011          	jra	L3321
2467  0379               L5321:
2468                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2470  0379 1e01          	ldw	x,(OFST+1,sp)
2471  037b a30302        	cpw	x,#770
2472  037e 2606          	jrne	L1421
2473                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2475  0380 72135249      	bres	21065,#1
2477  0384 2004          	jra	L3321
2478  0386               L1421:
2479                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2481  0386 72115249      	bres	21065,#0
2482  038a               L3321:
2483                     ; 717 }
2486  038a 85            	popw	x
2487  038b 81            	ret
2569                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2569                     ; 733 {
2570                     	switch	.text
2571  038c               _UART2_GetITStatus:
2573  038c 89            	pushw	x
2574  038d 89            	pushw	x
2575       00000002      OFST:	set	2
2578                     ; 734     ITStatus pendingbitstatus = RESET;
2580                     ; 735     uint8_t itpos = 0;
2582                     ; 736     uint8_t itmask1 = 0;
2584                     ; 737     uint8_t itmask2 = 0;
2586                     ; 738     uint8_t enablestatus = 0;
2588                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2590                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2592  038e 9f            	ld	a,xl
2593  038f a40f          	and	a,#15
2594  0391 5f            	clrw	x
2595  0392 97            	ld	xl,a
2596  0393 a601          	ld	a,#1
2597  0395 5d            	tnzw	x
2598  0396 2704          	jreq	L27
2599  0398               L47:
2600  0398 48            	sll	a
2601  0399 5a            	decw	x
2602  039a 26fc          	jrne	L47
2603  039c               L27:
2604  039c 6b01          	ld	(OFST-1,sp),a
2606                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2608  039e 7b04          	ld	a,(OFST+2,sp)
2609  03a0 4e            	swap	a
2610  03a1 a40f          	and	a,#15
2611  03a3 6b02          	ld	(OFST+0,sp),a
2613                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2615  03a5 7b02          	ld	a,(OFST+0,sp)
2616  03a7 5f            	clrw	x
2617  03a8 97            	ld	xl,a
2618  03a9 a601          	ld	a,#1
2619  03ab 5d            	tnzw	x
2620  03ac 2704          	jreq	L67
2621  03ae               L001:
2622  03ae 48            	sll	a
2623  03af 5a            	decw	x
2624  03b0 26fc          	jrne	L001
2625  03b2               L67:
2626  03b2 6b02          	ld	(OFST+0,sp),a
2628                     ; 751     if (UART2_IT == UART2_IT_PE)
2630  03b4 1e03          	ldw	x,(OFST+1,sp)
2631  03b6 a30100        	cpw	x,#256
2632  03b9 261c          	jrne	L7031
2633                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2635  03bb c65244        	ld	a,21060
2636  03be 1402          	and	a,(OFST+0,sp)
2637  03c0 6b02          	ld	(OFST+0,sp),a
2639                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2641  03c2 c65240        	ld	a,21056
2642  03c5 1501          	bcp	a,(OFST-1,sp)
2643  03c7 270a          	jreq	L1131
2645  03c9 0d02          	tnz	(OFST+0,sp)
2646  03cb 2706          	jreq	L1131
2647                     ; 760             pendingbitstatus = SET;
2649  03cd a601          	ld	a,#1
2650  03cf 6b02          	ld	(OFST+0,sp),a
2653  03d1 2064          	jra	L5131
2654  03d3               L1131:
2655                     ; 765             pendingbitstatus = RESET;
2657  03d3 0f02          	clr	(OFST+0,sp)
2659  03d5 2060          	jra	L5131
2660  03d7               L7031:
2661                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
2663  03d7 1e03          	ldw	x,(OFST+1,sp)
2664  03d9 a30346        	cpw	x,#838
2665  03dc 261c          	jrne	L7131
2666                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2668  03de c65247        	ld	a,21063
2669  03e1 1402          	and	a,(OFST+0,sp)
2670  03e3 6b02          	ld	(OFST+0,sp),a
2672                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2674  03e5 c65247        	ld	a,21063
2675  03e8 1501          	bcp	a,(OFST-1,sp)
2676  03ea 270a          	jreq	L1231
2678  03ec 0d02          	tnz	(OFST+0,sp)
2679  03ee 2706          	jreq	L1231
2680                     ; 776             pendingbitstatus = SET;
2682  03f0 a601          	ld	a,#1
2683  03f2 6b02          	ld	(OFST+0,sp),a
2686  03f4 2041          	jra	L5131
2687  03f6               L1231:
2688                     ; 781             pendingbitstatus = RESET;
2690  03f6 0f02          	clr	(OFST+0,sp)
2692  03f8 203d          	jra	L5131
2693  03fa               L7131:
2694                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
2696  03fa 1e03          	ldw	x,(OFST+1,sp)
2697  03fc a30412        	cpw	x,#1042
2698  03ff 261c          	jrne	L7231
2699                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2701  0401 c65249        	ld	a,21065
2702  0404 1402          	and	a,(OFST+0,sp)
2703  0406 6b02          	ld	(OFST+0,sp),a
2705                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2707  0408 c65249        	ld	a,21065
2708  040b 1501          	bcp	a,(OFST-1,sp)
2709  040d 270a          	jreq	L1331
2711  040f 0d02          	tnz	(OFST+0,sp)
2712  0411 2706          	jreq	L1331
2713                     ; 792             pendingbitstatus = SET;
2715  0413 a601          	ld	a,#1
2716  0415 6b02          	ld	(OFST+0,sp),a
2719  0417 201e          	jra	L5131
2720  0419               L1331:
2721                     ; 797             pendingbitstatus = RESET;
2723  0419 0f02          	clr	(OFST+0,sp)
2725  041b 201a          	jra	L5131
2726  041d               L7231:
2727                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2729  041d c65245        	ld	a,21061
2730  0420 1402          	and	a,(OFST+0,sp)
2731  0422 6b02          	ld	(OFST+0,sp),a
2733                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2735  0424 c65240        	ld	a,21056
2736  0427 1501          	bcp	a,(OFST-1,sp)
2737  0429 270a          	jreq	L7331
2739  042b 0d02          	tnz	(OFST+0,sp)
2740  042d 2706          	jreq	L7331
2741                     ; 808             pendingbitstatus = SET;
2743  042f a601          	ld	a,#1
2744  0431 6b02          	ld	(OFST+0,sp),a
2747  0433 2002          	jra	L5131
2748  0435               L7331:
2749                     ; 813             pendingbitstatus = RESET;
2751  0435 0f02          	clr	(OFST+0,sp)
2753  0437               L5131:
2754                     ; 817     return  pendingbitstatus;
2756  0437 7b02          	ld	a,(OFST+0,sp)
2759  0439 5b04          	addw	sp,#4
2760  043b 81            	ret
2796                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2796                     ; 847 {
2797                     	switch	.text
2798  043c               _UART2_ClearITPendingBit:
2800  043c 89            	pushw	x
2801       00000000      OFST:	set	0
2804                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2806                     ; 851     if (UART2_IT == UART2_IT_RXNE)
2808  043d a30255        	cpw	x,#597
2809  0440 2606          	jrne	L1631
2810                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2812  0442 35df5240      	mov	21056,#223
2814  0446 2011          	jra	L3631
2815  0448               L1631:
2816                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
2818  0448 1e01          	ldw	x,(OFST+1,sp)
2819  044a a30346        	cpw	x,#838
2820  044d 2606          	jrne	L5631
2821                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2823  044f 72195247      	bres	21063,#4
2825  0453 2004          	jra	L3631
2826  0455               L5631:
2827                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2829  0455 72135249      	bres	21065,#1
2830  0459               L3631:
2831                     ; 865 }
2834  0459 85            	popw	x
2835  045a 81            	ret
2848                     	xdef	_UART2_ClearITPendingBit
2849                     	xdef	_UART2_GetITStatus
2850                     	xdef	_UART2_ClearFlag
2851                     	xdef	_UART2_GetFlagStatus
2852                     	xdef	_UART2_SetPrescaler
2853                     	xdef	_UART2_SetGuardTime
2854                     	xdef	_UART2_SetAddress
2855                     	xdef	_UART2_SendBreak
2856                     	xdef	_UART2_SendData9
2857                     	xdef	_UART2_SendData8
2858                     	xdef	_UART2_ReceiveData9
2859                     	xdef	_UART2_ReceiveData8
2860                     	xdef	_UART2_ReceiverWakeUpCmd
2861                     	xdef	_UART2_WakeUpConfig
2862                     	xdef	_UART2_SmartCardNACKCmd
2863                     	xdef	_UART2_SmartCardCmd
2864                     	xdef	_UART2_LINCmd
2865                     	xdef	_UART2_LINConfig
2866                     	xdef	_UART2_LINBreakDetectionConfig
2867                     	xdef	_UART2_IrDACmd
2868                     	xdef	_UART2_IrDAConfig
2869                     	xdef	_UART2_ITConfig
2870                     	xdef	_UART2_Cmd
2871                     	xdef	_UART2_Init
2872                     	xdef	_UART2_DeInit
2873                     	xref	_CLK_GetClockFreq
2874                     	xref.b	c_lreg
2875                     	xref.b	c_x
2894                     	xref	c_lursh
2895                     	xref	c_lsub
2896                     	xref	c_smul
2897                     	xref	c_ludv
2898                     	xref	c_rtol
2899                     	xref	c_llsh
2900                     	xref	c_ltor
2901                     	end
