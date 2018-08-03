   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 46 void TIM2_DeInit(void)
  45                     ; 47 {
  47                     	switch	.text
  48  0000               _TIM2_DeInit:
  52                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  54  0000 725f5300      	clr	21248
  55                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  57  0004 725f5301      	clr	21249
  58                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  60  0008 725f5303      	clr	21251
  61                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  63  000c 725f5308      	clr	21256
  64                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  66  0010 725f5309      	clr	21257
  67                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  69  0014 725f5308      	clr	21256
  70                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  72  0018 725f5309      	clr	21257
  73                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  75  001c 725f5305      	clr	21253
  76                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  78  0020 725f5306      	clr	21254
  79                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  81  0024 725f5307      	clr	21255
  82                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  84  0028 725f530a      	clr	21258
  85                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  87  002c 725f530b      	clr	21259
  88                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  90  0030 725f530c      	clr	21260
  91                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  93  0034 35ff530d      	mov	21261,#255
  94                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  96  0038 35ff530e      	mov	21262,#255
  97                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  99  003c 725f530f      	clr	21263
 100                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 102  0040 725f5310      	clr	21264
 103                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 105  0044 725f5311      	clr	21265
 106                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 108  0048 725f5312      	clr	21266
 109                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 111  004c 725f5313      	clr	21267
 112                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 114  0050 725f5314      	clr	21268
 115                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 117  0054 725f5302      	clr	21250
 118                     ; 76 }
 121  0058 81            	ret
 289                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 289                     ; 86                         uint16_t TIM2_Period)
 289                     ; 87 {
 290                     	switch	.text
 291  0059               _TIM2_TimeBaseInit:
 293  0059 88            	push	a
 294       00000000      OFST:	set	0
 297                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 299  005a c7530c        	ld	21260,a
 300                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 302  005d 7b04          	ld	a,(OFST+4,sp)
 303  005f c7530d        	ld	21261,a
 304                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 306  0062 7b05          	ld	a,(OFST+5,sp)
 307  0064 c7530e        	ld	21262,a
 308                     ; 93 }
 311  0067 84            	pop	a
 312  0068 81            	ret
 469                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 469                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 469                     ; 106                   uint16_t TIM2_Pulse,
 469                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 469                     ; 108 {
 470                     	switch	.text
 471  0069               _TIM2_OC1Init:
 473  0069 89            	pushw	x
 474  006a 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 480                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 482                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 484                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 486  006b c65308        	ld	a,21256
 487  006e a4fc          	and	a,#252
 488  0070 c75308        	ld	21256,a
 489                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 489                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 491  0073 7b08          	ld	a,(OFST+7,sp)
 492  0075 a402          	and	a,#2
 493  0077 6b01          	ld	(OFST+0,sp),a
 495  0079 9f            	ld	a,xl
 496  007a a401          	and	a,#1
 497  007c 1a01          	or	a,(OFST+0,sp)
 498  007e ca5308        	or	a,21256
 499  0081 c75308        	ld	21256,a
 500                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 500                     ; 122                             (uint8_t)TIM2_OCMode);
 502  0084 c65305        	ld	a,21253
 503  0087 a48f          	and	a,#143
 504  0089 1a02          	or	a,(OFST+1,sp)
 505  008b c75305        	ld	21253,a
 506                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 508  008e 7b06          	ld	a,(OFST+5,sp)
 509  0090 c7530f        	ld	21263,a
 510                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 512  0093 7b07          	ld	a,(OFST+6,sp)
 513  0095 c75310        	ld	21264,a
 514                     ; 127 }
 517  0098 5b03          	addw	sp,#3
 518  009a 81            	ret
 582                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 582                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 582                     ; 140                   uint16_t TIM2_Pulse,
 582                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 582                     ; 142 {
 583                     	switch	.text
 584  009b               _TIM2_OC2Init:
 586  009b 89            	pushw	x
 587  009c 88            	push	a
 588       00000001      OFST:	set	1
 591                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 593                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 595                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 597                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 599  009d c65308        	ld	a,21256
 600  00a0 a4cf          	and	a,#207
 601  00a2 c75308        	ld	21256,a
 602                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 602                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 604  00a5 7b08          	ld	a,(OFST+7,sp)
 605  00a7 a420          	and	a,#32
 606  00a9 6b01          	ld	(OFST+0,sp),a
 608  00ab 9f            	ld	a,xl
 609  00ac a410          	and	a,#16
 610  00ae 1a01          	or	a,(OFST+0,sp)
 611  00b0 ca5308        	or	a,21256
 612  00b3 c75308        	ld	21256,a
 613                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 613                     ; 158                             (uint8_t)TIM2_OCMode);
 615  00b6 c65306        	ld	a,21254
 616  00b9 a48f          	and	a,#143
 617  00bb 1a02          	or	a,(OFST+1,sp)
 618  00bd c75306        	ld	21254,a
 619                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 621  00c0 7b06          	ld	a,(OFST+5,sp)
 622  00c2 c75311        	ld	21265,a
 623                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 625  00c5 7b07          	ld	a,(OFST+6,sp)
 626  00c7 c75312        	ld	21266,a
 627                     ; 164 }
 630  00ca 5b03          	addw	sp,#3
 631  00cc 81            	ret
 695                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 695                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 695                     ; 177                   uint16_t TIM2_Pulse,
 695                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 695                     ; 179 {
 696                     	switch	.text
 697  00cd               _TIM2_OC3Init:
 699  00cd 89            	pushw	x
 700  00ce 88            	push	a
 701       00000001      OFST:	set	1
 704                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 706                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 708                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 710                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 712  00cf c65309        	ld	a,21257
 713  00d2 a4fc          	and	a,#252
 714  00d4 c75309        	ld	21257,a
 715                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 715                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 717  00d7 7b08          	ld	a,(OFST+7,sp)
 718  00d9 a402          	and	a,#2
 719  00db 6b01          	ld	(OFST+0,sp),a
 721  00dd 9f            	ld	a,xl
 722  00de a401          	and	a,#1
 723  00e0 1a01          	or	a,(OFST+0,sp)
 724  00e2 ca5309        	or	a,21257
 725  00e5 c75309        	ld	21257,a
 726                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 726                     ; 192                             (uint8_t)TIM2_OCMode);
 728  00e8 c65307        	ld	a,21255
 729  00eb a48f          	and	a,#143
 730  00ed 1a02          	or	a,(OFST+1,sp)
 731  00ef c75307        	ld	21255,a
 732                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 734  00f2 7b06          	ld	a,(OFST+5,sp)
 735  00f4 c75313        	ld	21267,a
 736                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 738  00f7 7b07          	ld	a,(OFST+6,sp)
 739  00f9 c75314        	ld	21268,a
 740                     ; 198 }
 743  00fc 5b03          	addw	sp,#3
 744  00fe 81            	ret
 937                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 937                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 937                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 937                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 937                     ; 214                  uint8_t TIM2_ICFilter)
 937                     ; 215 {
 938                     	switch	.text
 939  00ff               _TIM2_ICInit:
 941  00ff 89            	pushw	x
 942       00000000      OFST:	set	0
 945                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 947                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 949                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 951                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 953                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 955                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 957  0100 9e            	ld	a,xh
 958  0101 4d            	tnz	a
 959  0102 2614          	jrne	L104
 960                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 960                     ; 227                    (uint8_t)TIM2_ICSelection,
 960                     ; 228                    (uint8_t)TIM2_ICFilter);
 962  0104 7b07          	ld	a,(OFST+7,sp)
 963  0106 88            	push	a
 964  0107 7b06          	ld	a,(OFST+6,sp)
 965  0109 97            	ld	xl,a
 966  010a 7b03          	ld	a,(OFST+3,sp)
 967  010c 95            	ld	xh,a
 968  010d cd044a        	call	L3_TI1_Config
 970  0110 84            	pop	a
 971                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 973  0111 7b06          	ld	a,(OFST+6,sp)
 974  0113 cd0340        	call	_TIM2_SetIC1Prescaler
 977  0116 202c          	jra	L304
 978  0118               L104:
 979                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 981  0118 7b01          	ld	a,(OFST+1,sp)
 982  011a a101          	cp	a,#1
 983  011c 2614          	jrne	L504
 984                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 984                     ; 237                    (uint8_t)TIM2_ICSelection,
 984                     ; 238                    (uint8_t)TIM2_ICFilter);
 986  011e 7b07          	ld	a,(OFST+7,sp)
 987  0120 88            	push	a
 988  0121 7b06          	ld	a,(OFST+6,sp)
 989  0123 97            	ld	xl,a
 990  0124 7b03          	ld	a,(OFST+3,sp)
 991  0126 95            	ld	xh,a
 992  0127 cd047a        	call	L5_TI2_Config
 994  012a 84            	pop	a
 995                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 997  012b 7b06          	ld	a,(OFST+6,sp)
 998  012d cd034d        	call	_TIM2_SetIC2Prescaler
1001  0130 2012          	jra	L304
1002  0132               L504:
1003                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
1003                     ; 247                    (uint8_t)TIM2_ICSelection,
1003                     ; 248                    (uint8_t)TIM2_ICFilter);
1005  0132 7b07          	ld	a,(OFST+7,sp)
1006  0134 88            	push	a
1007  0135 7b06          	ld	a,(OFST+6,sp)
1008  0137 97            	ld	xl,a
1009  0138 7b03          	ld	a,(OFST+3,sp)
1010  013a 95            	ld	xh,a
1011  013b cd04aa        	call	L7_TI3_Config
1013  013e 84            	pop	a
1014                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1016  013f 7b06          	ld	a,(OFST+6,sp)
1017  0141 cd035a        	call	_TIM2_SetIC3Prescaler
1019  0144               L304:
1020                     ; 253 }
1023  0144 85            	popw	x
1024  0145 81            	ret
1120                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1120                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1120                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1120                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1120                     ; 269                      uint8_t TIM2_ICFilter)
1120                     ; 270 {
1121                     	switch	.text
1122  0146               _TIM2_PWMIConfig:
1124  0146 89            	pushw	x
1125  0147 89            	pushw	x
1126       00000002      OFST:	set	2
1129                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1131                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1133                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1135                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1137                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1139                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1141                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1143  0148 9f            	ld	a,xl
1144  0149 a144          	cp	a,#68
1145  014b 2706          	jreq	L754
1146                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1148  014d a644          	ld	a,#68
1149  014f 6b01          	ld	(OFST-1,sp),a
1152  0151 2002          	jra	L164
1153  0153               L754:
1154                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1156  0153 0f01          	clr	(OFST-1,sp)
1158  0155               L164:
1159                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1161  0155 7b07          	ld	a,(OFST+5,sp)
1162  0157 a101          	cp	a,#1
1163  0159 2606          	jrne	L364
1164                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1166  015b a602          	ld	a,#2
1167  015d 6b02          	ld	(OFST+0,sp),a
1170  015f 2004          	jra	L564
1171  0161               L364:
1172                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1174  0161 a601          	ld	a,#1
1175  0163 6b02          	ld	(OFST+0,sp),a
1177  0165               L564:
1178                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1180  0165 0d03          	tnz	(OFST+1,sp)
1181  0167 2626          	jrne	L764
1182                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1182                     ; 304                    (uint8_t)TIM2_ICFilter);
1184  0169 7b09          	ld	a,(OFST+7,sp)
1185  016b 88            	push	a
1186  016c 7b08          	ld	a,(OFST+6,sp)
1187  016e 97            	ld	xl,a
1188  016f 7b05          	ld	a,(OFST+3,sp)
1189  0171 95            	ld	xh,a
1190  0172 cd044a        	call	L3_TI1_Config
1192  0175 84            	pop	a
1193                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1195  0176 7b08          	ld	a,(OFST+6,sp)
1196  0178 cd0340        	call	_TIM2_SetIC1Prescaler
1198                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1200  017b 7b09          	ld	a,(OFST+7,sp)
1201  017d 88            	push	a
1202  017e 7b03          	ld	a,(OFST+1,sp)
1203  0180 97            	ld	xl,a
1204  0181 7b02          	ld	a,(OFST+0,sp)
1205  0183 95            	ld	xh,a
1206  0184 cd047a        	call	L5_TI2_Config
1208  0187 84            	pop	a
1209                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1211  0188 7b08          	ld	a,(OFST+6,sp)
1212  018a cd034d        	call	_TIM2_SetIC2Prescaler
1215  018d 2024          	jra	L174
1216  018f               L764:
1217                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1217                     ; 319                    (uint8_t)TIM2_ICFilter);
1219  018f 7b09          	ld	a,(OFST+7,sp)
1220  0191 88            	push	a
1221  0192 7b08          	ld	a,(OFST+6,sp)
1222  0194 97            	ld	xl,a
1223  0195 7b05          	ld	a,(OFST+3,sp)
1224  0197 95            	ld	xh,a
1225  0198 cd047a        	call	L5_TI2_Config
1227  019b 84            	pop	a
1228                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1230  019c 7b08          	ld	a,(OFST+6,sp)
1231  019e cd034d        	call	_TIM2_SetIC2Prescaler
1233                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1235  01a1 7b09          	ld	a,(OFST+7,sp)
1236  01a3 88            	push	a
1237  01a4 7b03          	ld	a,(OFST+1,sp)
1238  01a6 97            	ld	xl,a
1239  01a7 7b02          	ld	a,(OFST+0,sp)
1240  01a9 95            	ld	xh,a
1241  01aa cd044a        	call	L3_TI1_Config
1243  01ad 84            	pop	a
1244                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1246  01ae 7b08          	ld	a,(OFST+6,sp)
1247  01b0 cd0340        	call	_TIM2_SetIC1Prescaler
1249  01b3               L174:
1250                     ; 330 }
1253  01b3 5b04          	addw	sp,#4
1254  01b5 81            	ret
1309                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1309                     ; 340 {
1310                     	switch	.text
1311  01b6               _TIM2_Cmd:
1315                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1317                     ; 345     if (NewState != DISABLE)
1319  01b6 4d            	tnz	a
1320  01b7 2706          	jreq	L125
1321                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1323  01b9 72105300      	bset	21248,#0
1325  01bd 2004          	jra	L325
1326  01bf               L125:
1327                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1329  01bf 72115300      	bres	21248,#0
1330  01c3               L325:
1331                     ; 353 }
1334  01c3 81            	ret
1413                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1413                     ; 370 {
1414                     	switch	.text
1415  01c4               _TIM2_ITConfig:
1417  01c4 89            	pushw	x
1418       00000000      OFST:	set	0
1421                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1423                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1425                     ; 375     if (NewState != DISABLE)
1427  01c5 9f            	ld	a,xl
1428  01c6 4d            	tnz	a
1429  01c7 2709          	jreq	L365
1430                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1432  01c9 9e            	ld	a,xh
1433  01ca ca5301        	or	a,21249
1434  01cd c75301        	ld	21249,a
1436  01d0 2009          	jra	L565
1437  01d2               L365:
1438                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1440  01d2 7b01          	ld	a,(OFST+1,sp)
1441  01d4 43            	cpl	a
1442  01d5 c45301        	and	a,21249
1443  01d8 c75301        	ld	21249,a
1444  01db               L565:
1445                     ; 385 }
1448  01db 85            	popw	x
1449  01dc 81            	ret
1485                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1485                     ; 395 {
1486                     	switch	.text
1487  01dd               _TIM2_UpdateDisableConfig:
1491                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1493                     ; 400     if (NewState != DISABLE)
1495  01dd 4d            	tnz	a
1496  01de 2706          	jreq	L506
1497                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1499  01e0 72125300      	bset	21248,#1
1501  01e4 2004          	jra	L706
1502  01e6               L506:
1503                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1505  01e6 72135300      	bres	21248,#1
1506  01ea               L706:
1507                     ; 408 }
1510  01ea 81            	ret
1568                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1568                     ; 419 {
1569                     	switch	.text
1570  01eb               _TIM2_UpdateRequestConfig:
1574                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1576                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1578  01eb 4d            	tnz	a
1579  01ec 2706          	jreq	L736
1580                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1582  01ee 72145300      	bset	21248,#2
1584  01f2 2004          	jra	L146
1585  01f4               L736:
1586                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1588  01f4 72155300      	bres	21248,#2
1589  01f8               L146:
1590                     ; 432 }
1593  01f8 81            	ret
1650                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1650                     ; 444 {
1651                     	switch	.text
1652  01f9               _TIM2_SelectOnePulseMode:
1656                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1658                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1660  01f9 4d            	tnz	a
1661  01fa 2706          	jreq	L176
1662                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1664  01fc 72165300      	bset	21248,#3
1666  0200 2004          	jra	L376
1667  0202               L176:
1668                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1670  0202 72175300      	bres	21248,#3
1671  0206               L376:
1672                     ; 458 }
1675  0206 81            	ret
1743                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1743                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1743                     ; 491 {
1744                     	switch	.text
1745  0207               _TIM2_PrescalerConfig:
1749                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1751                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1753                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1755  0207 9e            	ld	a,xh
1756  0208 c7530c        	ld	21260,a
1757                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1759  020b 9f            	ld	a,xl
1760  020c c75304        	ld	21252,a
1761                     ; 501 }
1764  020f 81            	ret
1822                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1822                     ; 513 {
1823                     	switch	.text
1824  0210               _TIM2_ForcedOC1Config:
1826  0210 88            	push	a
1827       00000000      OFST:	set	0
1830                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1832                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1832                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1834  0211 c65305        	ld	a,21253
1835  0214 a48f          	and	a,#143
1836  0216 1a01          	or	a,(OFST+1,sp)
1837  0218 c75305        	ld	21253,a
1838                     ; 520 }
1841  021b 84            	pop	a
1842  021c 81            	ret
1878                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1878                     ; 532 {
1879                     	switch	.text
1880  021d               _TIM2_ForcedOC2Config:
1882  021d 88            	push	a
1883       00000000      OFST:	set	0
1886                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1888                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1888                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1890  021e c65306        	ld	a,21254
1891  0221 a48f          	and	a,#143
1892  0223 1a01          	or	a,(OFST+1,sp)
1893  0225 c75306        	ld	21254,a
1894                     ; 539 }
1897  0228 84            	pop	a
1898  0229 81            	ret
1934                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1934                     ; 551 {
1935                     	switch	.text
1936  022a               _TIM2_ForcedOC3Config:
1938  022a 88            	push	a
1939       00000000      OFST:	set	0
1942                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1944                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1944                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1946  022b c65307        	ld	a,21255
1947  022e a48f          	and	a,#143
1948  0230 1a01          	or	a,(OFST+1,sp)
1949  0232 c75307        	ld	21255,a
1950                     ; 558 }
1953  0235 84            	pop	a
1954  0236 81            	ret
1990                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1990                     ; 568 {
1991                     	switch	.text
1992  0237               _TIM2_ARRPreloadConfig:
1996                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1998                     ; 573     if (NewState != DISABLE)
2000  0237 4d            	tnz	a
2001  0238 2706          	jreq	L7201
2002                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2004  023a 721e5300      	bset	21248,#7
2006  023e 2004          	jra	L1301
2007  0240               L7201:
2008                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2010  0240 721f5300      	bres	21248,#7
2011  0244               L1301:
2012                     ; 581 }
2015  0244 81            	ret
2051                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2051                     ; 591 {
2052                     	switch	.text
2053  0245               _TIM2_OC1PreloadConfig:
2057                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2059                     ; 596     if (NewState != DISABLE)
2061  0245 4d            	tnz	a
2062  0246 2706          	jreq	L1501
2063                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2065  0248 72165305      	bset	21253,#3
2067  024c 2004          	jra	L3501
2068  024e               L1501:
2069                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2071  024e 72175305      	bres	21253,#3
2072  0252               L3501:
2073                     ; 604 }
2076  0252 81            	ret
2112                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2112                     ; 614 {
2113                     	switch	.text
2114  0253               _TIM2_OC2PreloadConfig:
2118                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2120                     ; 619     if (NewState != DISABLE)
2122  0253 4d            	tnz	a
2123  0254 2706          	jreq	L3701
2124                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2126  0256 72165306      	bset	21254,#3
2128  025a 2004          	jra	L5701
2129  025c               L3701:
2130                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2132  025c 72175306      	bres	21254,#3
2133  0260               L5701:
2134                     ; 627 }
2137  0260 81            	ret
2173                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2173                     ; 637 {
2174                     	switch	.text
2175  0261               _TIM2_OC3PreloadConfig:
2179                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2181                     ; 642     if (NewState != DISABLE)
2183  0261 4d            	tnz	a
2184  0262 2706          	jreq	L5111
2185                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2187  0264 72165307      	bset	21255,#3
2189  0268 2004          	jra	L7111
2190  026a               L5111:
2191                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2193  026a 72175307      	bres	21255,#3
2194  026e               L7111:
2195                     ; 650 }
2198  026e 81            	ret
2271                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2271                     ; 664 {
2272                     	switch	.text
2273  026f               _TIM2_GenerateEvent:
2277                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2279                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2281  026f c75304        	ld	21252,a
2282                     ; 670 }
2285  0272 81            	ret
2321                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2321                     ; 682 {
2322                     	switch	.text
2323  0273               _TIM2_OC1PolarityConfig:
2327                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2329                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2331  0273 4d            	tnz	a
2332  0274 2706          	jreq	L1711
2333                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2335  0276 72125308      	bset	21256,#1
2337  027a 2004          	jra	L3711
2338  027c               L1711:
2339                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2341  027c 72135308      	bres	21256,#1
2342  0280               L3711:
2343                     ; 695 }
2346  0280 81            	ret
2382                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2382                     ; 707 {
2383                     	switch	.text
2384  0281               _TIM2_OC2PolarityConfig:
2388                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2390                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2392  0281 4d            	tnz	a
2393  0282 2706          	jreq	L3121
2394                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2396  0284 721a5308      	bset	21256,#5
2398  0288 2004          	jra	L5121
2399  028a               L3121:
2400                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2402  028a 721b5308      	bres	21256,#5
2403  028e               L5121:
2404                     ; 720 }
2407  028e 81            	ret
2443                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2443                     ; 732 {
2444                     	switch	.text
2445  028f               _TIM2_OC3PolarityConfig:
2449                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2451                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2453  028f 4d            	tnz	a
2454  0290 2706          	jreq	L5321
2455                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2457  0292 72125309      	bset	21257,#1
2459  0296 2004          	jra	L7321
2460  0298               L5321:
2461                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2463  0298 72135309      	bres	21257,#1
2464  029c               L7321:
2465                     ; 745 }
2468  029c 81            	ret
2513                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2513                     ; 760 {
2514                     	switch	.text
2515  029d               _TIM2_CCxCmd:
2517  029d 89            	pushw	x
2518       00000000      OFST:	set	0
2521                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2523                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2525                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2527  029e 9e            	ld	a,xh
2528  029f 4d            	tnz	a
2529  02a0 2610          	jrne	L3621
2530                     ; 768         if (NewState != DISABLE)
2532  02a2 9f            	ld	a,xl
2533  02a3 4d            	tnz	a
2534  02a4 2706          	jreq	L5621
2535                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2537  02a6 72105308      	bset	21256,#0
2539  02aa 202a          	jra	L1721
2540  02ac               L5621:
2541                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2543  02ac 72115308      	bres	21256,#0
2544  02b0 2024          	jra	L1721
2545  02b2               L3621:
2546                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2548  02b2 7b01          	ld	a,(OFST+1,sp)
2549  02b4 a101          	cp	a,#1
2550  02b6 2610          	jrne	L3721
2551                     ; 781         if (NewState != DISABLE)
2553  02b8 0d02          	tnz	(OFST+2,sp)
2554  02ba 2706          	jreq	L5721
2555                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2557  02bc 72185308      	bset	21256,#4
2559  02c0 2014          	jra	L1721
2560  02c2               L5721:
2561                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2563  02c2 72195308      	bres	21256,#4
2564  02c6 200e          	jra	L1721
2565  02c8               L3721:
2566                     ; 793         if (NewState != DISABLE)
2568  02c8 0d02          	tnz	(OFST+2,sp)
2569  02ca 2706          	jreq	L3031
2570                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2572  02cc 72105309      	bset	21257,#0
2574  02d0 2004          	jra	L1721
2575  02d2               L3031:
2576                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2578  02d2 72115309      	bres	21257,#0
2579  02d6               L1721:
2580                     ; 802 }
2583  02d6 85            	popw	x
2584  02d7 81            	ret
2629                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2629                     ; 825 {
2630                     	switch	.text
2631  02d8               _TIM2_SelectOCxM:
2633  02d8 89            	pushw	x
2634       00000000      OFST:	set	0
2637                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2639                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2641                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2643  02d9 9e            	ld	a,xh
2644  02da 4d            	tnz	a
2645  02db 2610          	jrne	L1331
2646                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2648  02dd 72115308      	bres	21256,#0
2649                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2649                     ; 837                                | (uint8_t)TIM2_OCMode);
2651  02e1 c65305        	ld	a,21253
2652  02e4 a48f          	and	a,#143
2653  02e6 1a02          	or	a,(OFST+2,sp)
2654  02e8 c75305        	ld	21253,a
2656  02eb 2024          	jra	L3331
2657  02ed               L1331:
2658                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2660  02ed 7b01          	ld	a,(OFST+1,sp)
2661  02ef a101          	cp	a,#1
2662  02f1 2610          	jrne	L5331
2663                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2665  02f3 72195308      	bres	21256,#4
2666                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2666                     ; 846                                 | (uint8_t)TIM2_OCMode);
2668  02f7 c65306        	ld	a,21254
2669  02fa a48f          	and	a,#143
2670  02fc 1a02          	or	a,(OFST+2,sp)
2671  02fe c75306        	ld	21254,a
2673  0301 200e          	jra	L3331
2674  0303               L5331:
2675                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2677  0303 72115309      	bres	21257,#0
2678                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2678                     ; 855                                 | (uint8_t)TIM2_OCMode);
2680  0307 c65307        	ld	a,21255
2681  030a a48f          	and	a,#143
2682  030c 1a02          	or	a,(OFST+2,sp)
2683  030e c75307        	ld	21255,a
2684  0311               L3331:
2685                     ; 857 }
2688  0311 85            	popw	x
2689  0312 81            	ret
2723                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2723                     ; 867 {
2724                     	switch	.text
2725  0313               _TIM2_SetCounter:
2729                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2731  0313 9e            	ld	a,xh
2732  0314 c7530a        	ld	21258,a
2733                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2735  0317 9f            	ld	a,xl
2736  0318 c7530b        	ld	21259,a
2737                     ; 872 }
2740  031b 81            	ret
2774                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2774                     ; 882 {
2775                     	switch	.text
2776  031c               _TIM2_SetAutoreload:
2780                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2782  031c 9e            	ld	a,xh
2783  031d c7530d        	ld	21261,a
2784                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2786  0320 9f            	ld	a,xl
2787  0321 c7530e        	ld	21262,a
2788                     ; 888 }
2791  0324 81            	ret
2825                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2825                     ; 898 {
2826                     	switch	.text
2827  0325               _TIM2_SetCompare1:
2831                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2833  0325 9e            	ld	a,xh
2834  0326 c7530f        	ld	21263,a
2835                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2837  0329 9f            	ld	a,xl
2838  032a c75310        	ld	21264,a
2839                     ; 903 }
2842  032d 81            	ret
2876                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2876                     ; 913 {
2877                     	switch	.text
2878  032e               _TIM2_SetCompare2:
2882                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2884  032e 9e            	ld	a,xh
2885  032f c75311        	ld	21265,a
2886                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2888  0332 9f            	ld	a,xl
2889  0333 c75312        	ld	21266,a
2890                     ; 918 }
2893  0336 81            	ret
2927                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2927                     ; 928 {
2928                     	switch	.text
2929  0337               _TIM2_SetCompare3:
2933                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2935  0337 9e            	ld	a,xh
2936  0338 c75313        	ld	21267,a
2937                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2939  033b 9f            	ld	a,xl
2940  033c c75314        	ld	21268,a
2941                     ; 933 }
2944  033f 81            	ret
2980                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2980                     ; 947 {
2981                     	switch	.text
2982  0340               _TIM2_SetIC1Prescaler:
2984  0340 88            	push	a
2985       00000000      OFST:	set	0
2988                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2990                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2990                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2992  0341 c65305        	ld	a,21253
2993  0344 a4f3          	and	a,#243
2994  0346 1a01          	or	a,(OFST+1,sp)
2995  0348 c75305        	ld	21253,a
2996                     ; 954 }
2999  034b 84            	pop	a
3000  034c 81            	ret
3036                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3036                     ; 967 {
3037                     	switch	.text
3038  034d               _TIM2_SetIC2Prescaler:
3040  034d 88            	push	a
3041       00000000      OFST:	set	0
3044                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3046                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3046                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3048  034e c65306        	ld	a,21254
3049  0351 a4f3          	and	a,#243
3050  0353 1a01          	or	a,(OFST+1,sp)
3051  0355 c75306        	ld	21254,a
3052                     ; 974 }
3055  0358 84            	pop	a
3056  0359 81            	ret
3092                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3092                     ; 987 {
3093                     	switch	.text
3094  035a               _TIM2_SetIC3Prescaler:
3096  035a 88            	push	a
3097       00000000      OFST:	set	0
3100                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3102                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3102                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3104  035b c65307        	ld	a,21255
3105  035e a4f3          	and	a,#243
3106  0360 1a01          	or	a,(OFST+1,sp)
3107  0362 c75307        	ld	21255,a
3108                     ; 994 }
3111  0365 84            	pop	a
3112  0366 81            	ret
3164                     ; 1001 uint16_t TIM2_GetCapture1(void)
3164                     ; 1002 {
3165                     	switch	.text
3166  0367               _TIM2_GetCapture1:
3168  0367 5204          	subw	sp,#4
3169       00000004      OFST:	set	4
3172                     ; 1004     uint16_t tmpccr1 = 0;
3174                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3178                     ; 1007     tmpccr1h = TIM2->CCR1H;
3180  0369 c6530f        	ld	a,21263
3181  036c 6b02          	ld	(OFST-2,sp),a
3183                     ; 1008     tmpccr1l = TIM2->CCR1L;
3185  036e c65310        	ld	a,21264
3186  0371 6b01          	ld	(OFST-3,sp),a
3188                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3190  0373 7b01          	ld	a,(OFST-3,sp)
3191  0375 5f            	clrw	x
3192  0376 97            	ld	xl,a
3193  0377 1f03          	ldw	(OFST-1,sp),x
3195                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3197  0379 7b02          	ld	a,(OFST-2,sp)
3198  037b 5f            	clrw	x
3199  037c 97            	ld	xl,a
3200  037d 4f            	clr	a
3201  037e 02            	rlwa	x,a
3202  037f 01            	rrwa	x,a
3203  0380 1a04          	or	a,(OFST+0,sp)
3204  0382 01            	rrwa	x,a
3205  0383 1a03          	or	a,(OFST-1,sp)
3206  0385 01            	rrwa	x,a
3207  0386 1f03          	ldw	(OFST-1,sp),x
3209                     ; 1013     return (uint16_t)tmpccr1;
3211  0388 1e03          	ldw	x,(OFST-1,sp)
3214  038a 5b04          	addw	sp,#4
3215  038c 81            	ret
3267                     ; 1021 uint16_t TIM2_GetCapture2(void)
3267                     ; 1022 {
3268                     	switch	.text
3269  038d               _TIM2_GetCapture2:
3271  038d 5204          	subw	sp,#4
3272       00000004      OFST:	set	4
3275                     ; 1024     uint16_t tmpccr2 = 0;
3277                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3281                     ; 1027     tmpccr2h = TIM2->CCR2H;
3283  038f c65311        	ld	a,21265
3284  0392 6b02          	ld	(OFST-2,sp),a
3286                     ; 1028     tmpccr2l = TIM2->CCR2L;
3288  0394 c65312        	ld	a,21266
3289  0397 6b01          	ld	(OFST-3,sp),a
3291                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3293  0399 7b01          	ld	a,(OFST-3,sp)
3294  039b 5f            	clrw	x
3295  039c 97            	ld	xl,a
3296  039d 1f03          	ldw	(OFST-1,sp),x
3298                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3300  039f 7b02          	ld	a,(OFST-2,sp)
3301  03a1 5f            	clrw	x
3302  03a2 97            	ld	xl,a
3303  03a3 4f            	clr	a
3304  03a4 02            	rlwa	x,a
3305  03a5 01            	rrwa	x,a
3306  03a6 1a04          	or	a,(OFST+0,sp)
3307  03a8 01            	rrwa	x,a
3308  03a9 1a03          	or	a,(OFST-1,sp)
3309  03ab 01            	rrwa	x,a
3310  03ac 1f03          	ldw	(OFST-1,sp),x
3312                     ; 1033     return (uint16_t)tmpccr2;
3314  03ae 1e03          	ldw	x,(OFST-1,sp)
3317  03b0 5b04          	addw	sp,#4
3318  03b2 81            	ret
3370                     ; 1041 uint16_t TIM2_GetCapture3(void)
3370                     ; 1042 {
3371                     	switch	.text
3372  03b3               _TIM2_GetCapture3:
3374  03b3 5204          	subw	sp,#4
3375       00000004      OFST:	set	4
3378                     ; 1044     uint16_t tmpccr3 = 0;
3380                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3384                     ; 1047     tmpccr3h = TIM2->CCR3H;
3386  03b5 c65313        	ld	a,21267
3387  03b8 6b02          	ld	(OFST-2,sp),a
3389                     ; 1048     tmpccr3l = TIM2->CCR3L;
3391  03ba c65314        	ld	a,21268
3392  03bd 6b01          	ld	(OFST-3,sp),a
3394                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3396  03bf 7b01          	ld	a,(OFST-3,sp)
3397  03c1 5f            	clrw	x
3398  03c2 97            	ld	xl,a
3399  03c3 1f03          	ldw	(OFST-1,sp),x
3401                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3403  03c5 7b02          	ld	a,(OFST-2,sp)
3404  03c7 5f            	clrw	x
3405  03c8 97            	ld	xl,a
3406  03c9 4f            	clr	a
3407  03ca 02            	rlwa	x,a
3408  03cb 01            	rrwa	x,a
3409  03cc 1a04          	or	a,(OFST+0,sp)
3410  03ce 01            	rrwa	x,a
3411  03cf 1a03          	or	a,(OFST-1,sp)
3412  03d1 01            	rrwa	x,a
3413  03d2 1f03          	ldw	(OFST-1,sp),x
3415                     ; 1053     return (uint16_t)tmpccr3;
3417  03d4 1e03          	ldw	x,(OFST-1,sp)
3420  03d6 5b04          	addw	sp,#4
3421  03d8 81            	ret
3455                     ; 1061 uint16_t TIM2_GetCounter(void)
3455                     ; 1062 {
3456                     	switch	.text
3457  03d9               _TIM2_GetCounter:
3459  03d9 89            	pushw	x
3460       00000002      OFST:	set	2
3463                     ; 1063      uint16_t tmpcntr = 0;
3465                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3467  03da c6530a        	ld	a,21258
3468  03dd 5f            	clrw	x
3469  03de 97            	ld	xl,a
3470  03df 4f            	clr	a
3471  03e0 02            	rlwa	x,a
3472  03e1 1f01          	ldw	(OFST-1,sp),x
3474                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3476  03e3 c6530b        	ld	a,21259
3477  03e6 5f            	clrw	x
3478  03e7 97            	ld	xl,a
3479  03e8 01            	rrwa	x,a
3480  03e9 1a02          	or	a,(OFST+0,sp)
3481  03eb 01            	rrwa	x,a
3482  03ec 1a01          	or	a,(OFST-1,sp)
3483  03ee 01            	rrwa	x,a
3486  03ef 5b02          	addw	sp,#2
3487  03f1 81            	ret
3511                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3511                     ; 1077 {
3512                     	switch	.text
3513  03f2               _TIM2_GetPrescaler:
3517                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3519  03f2 c6530c        	ld	a,21260
3522  03f5 81            	ret
3661                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3661                     ; 1097 {
3662                     	switch	.text
3663  03f6               _TIM2_GetFlagStatus:
3665  03f6 89            	pushw	x
3666  03f7 89            	pushw	x
3667       00000002      OFST:	set	2
3670                     ; 1098     FlagStatus bitstatus = RESET;
3672                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3676                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3678                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3680  03f8 9f            	ld	a,xl
3681  03f9 c45302        	and	a,21250
3682  03fc 6b01          	ld	(OFST-1,sp),a
3684                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3686  03fe 7b03          	ld	a,(OFST+1,sp)
3687  0400 6b02          	ld	(OFST+0,sp),a
3689                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3691  0402 c65303        	ld	a,21251
3692  0405 1402          	and	a,(OFST+0,sp)
3693  0407 1a01          	or	a,(OFST-1,sp)
3694  0409 2706          	jreq	L5371
3695                     ; 1109         bitstatus = SET;
3697  040b a601          	ld	a,#1
3698  040d 6b02          	ld	(OFST+0,sp),a
3701  040f 2002          	jra	L7371
3702  0411               L5371:
3703                     ; 1113         bitstatus = RESET;
3705  0411 0f02          	clr	(OFST+0,sp)
3707  0413               L7371:
3708                     ; 1115     return (FlagStatus)bitstatus;
3710  0413 7b02          	ld	a,(OFST+0,sp)
3713  0415 5b04          	addw	sp,#4
3714  0417 81            	ret
3749                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3749                     ; 1133 {
3750                     	switch	.text
3751  0418               _TIM2_ClearFlag:
3755                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3757                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3759  0418 9f            	ld	a,xl
3760  0419 43            	cpl	a
3761  041a c75302        	ld	21250,a
3762                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3764  041d 35ff5303      	mov	21251,#255
3765                     ; 1140 }
3768  0421 81            	ret
3832                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3832                     ; 1155 {
3833                     	switch	.text
3834  0422               _TIM2_GetITStatus:
3836  0422 88            	push	a
3837  0423 89            	pushw	x
3838       00000002      OFST:	set	2
3841                     ; 1156     ITStatus bitstatus = RESET;
3843                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3847                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3849                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3851  0424 c45302        	and	a,21250
3852  0427 6b01          	ld	(OFST-1,sp),a
3854                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3856  0429 c65301        	ld	a,21249
3857  042c 1403          	and	a,(OFST+1,sp)
3858  042e 6b02          	ld	(OFST+0,sp),a
3860                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3862  0430 0d01          	tnz	(OFST-1,sp)
3863  0432 270a          	jreq	L1102
3865  0434 0d02          	tnz	(OFST+0,sp)
3866  0436 2706          	jreq	L1102
3867                     ; 1168         bitstatus = SET;
3869  0438 a601          	ld	a,#1
3870  043a 6b02          	ld	(OFST+0,sp),a
3873  043c 2002          	jra	L3102
3874  043e               L1102:
3875                     ; 1172         bitstatus = RESET;
3877  043e 0f02          	clr	(OFST+0,sp)
3879  0440               L3102:
3880                     ; 1174     return (ITStatus)(bitstatus);
3882  0440 7b02          	ld	a,(OFST+0,sp)
3885  0442 5b03          	addw	sp,#3
3886  0444 81            	ret
3922                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3922                     ; 1189 {
3923                     	switch	.text
3924  0445               _TIM2_ClearITPendingBit:
3928                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3930                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3932  0445 43            	cpl	a
3933  0446 c75302        	ld	21250,a
3934                     ; 1195 }
3937  0449 81            	ret
3989                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3989                     ; 1215                        uint8_t TIM2_ICSelection,
3989                     ; 1216                        uint8_t TIM2_ICFilter)
3989                     ; 1217 {
3990                     	switch	.text
3991  044a               L3_TI1_Config:
3993  044a 89            	pushw	x
3994  044b 88            	push	a
3995       00000001      OFST:	set	1
3998                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4000  044c 72115308      	bres	21256,#0
4001                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4001                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4003  0450 7b06          	ld	a,(OFST+5,sp)
4004  0452 97            	ld	xl,a
4005  0453 a610          	ld	a,#16
4006  0455 42            	mul	x,a
4007  0456 9f            	ld	a,xl
4008  0457 1a03          	or	a,(OFST+2,sp)
4009  0459 6b01          	ld	(OFST+0,sp),a
4011  045b c65305        	ld	a,21253
4012  045e a40c          	and	a,#12
4013  0460 1a01          	or	a,(OFST+0,sp)
4014  0462 c75305        	ld	21253,a
4015                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4017  0465 0d02          	tnz	(OFST+1,sp)
4018  0467 2706          	jreq	L1602
4019                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
4021  0469 72125308      	bset	21256,#1
4023  046d 2004          	jra	L3602
4024  046f               L1602:
4025                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4027  046f 72135308      	bres	21256,#1
4028  0473               L3602:
4029                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
4031  0473 72105308      	bset	21256,#0
4032                     ; 1236 }
4035  0477 5b03          	addw	sp,#3
4036  0479 81            	ret
4088                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
4088                     ; 1256                        uint8_t TIM2_ICSelection,
4088                     ; 1257                        uint8_t TIM2_ICFilter)
4088                     ; 1258 {
4089                     	switch	.text
4090  047a               L5_TI2_Config:
4092  047a 89            	pushw	x
4093  047b 88            	push	a
4094       00000001      OFST:	set	1
4097                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4099  047c 72195308      	bres	21256,#4
4100                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4100                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4102  0480 7b06          	ld	a,(OFST+5,sp)
4103  0482 97            	ld	xl,a
4104  0483 a610          	ld	a,#16
4105  0485 42            	mul	x,a
4106  0486 9f            	ld	a,xl
4107  0487 1a03          	or	a,(OFST+2,sp)
4108  0489 6b01          	ld	(OFST+0,sp),a
4110  048b c65306        	ld	a,21254
4111  048e a40c          	and	a,#12
4112  0490 1a01          	or	a,(OFST+0,sp)
4113  0492 c75306        	ld	21254,a
4114                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4116  0495 0d02          	tnz	(OFST+1,sp)
4117  0497 2706          	jreq	L3112
4118                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4120  0499 721a5308      	bset	21256,#5
4122  049d 2004          	jra	L5112
4123  049f               L3112:
4124                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4126  049f 721b5308      	bres	21256,#5
4127  04a3               L5112:
4128                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4130  04a3 72185308      	bset	21256,#4
4131                     ; 1280 }
4134  04a7 5b03          	addw	sp,#3
4135  04a9 81            	ret
4187                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4187                     ; 1297                        uint8_t TIM2_ICFilter)
4187                     ; 1298 {
4188                     	switch	.text
4189  04aa               L7_TI3_Config:
4191  04aa 89            	pushw	x
4192  04ab 88            	push	a
4193       00000001      OFST:	set	1
4196                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4198  04ac 72115309      	bres	21257,#0
4199                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4199                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4201  04b0 7b06          	ld	a,(OFST+5,sp)
4202  04b2 97            	ld	xl,a
4203  04b3 a610          	ld	a,#16
4204  04b5 42            	mul	x,a
4205  04b6 9f            	ld	a,xl
4206  04b7 1a03          	or	a,(OFST+2,sp)
4207  04b9 6b01          	ld	(OFST+0,sp),a
4209  04bb c65307        	ld	a,21255
4210  04be a40c          	and	a,#12
4211  04c0 1a01          	or	a,(OFST+0,sp)
4212  04c2 c75307        	ld	21255,a
4213                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4215  04c5 0d02          	tnz	(OFST+1,sp)
4216  04c7 2706          	jreq	L5412
4217                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4219  04c9 72125309      	bset	21257,#1
4221  04cd 2004          	jra	L7412
4222  04cf               L5412:
4223                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4225  04cf 72135309      	bres	21257,#1
4226  04d3               L7412:
4227                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4229  04d3 72105309      	bset	21257,#0
4230                     ; 1318 }
4233  04d7 5b03          	addw	sp,#3
4234  04d9 81            	ret
4247                     	xdef	_TIM2_ClearITPendingBit
4248                     	xdef	_TIM2_GetITStatus
4249                     	xdef	_TIM2_ClearFlag
4250                     	xdef	_TIM2_GetFlagStatus
4251                     	xdef	_TIM2_GetPrescaler
4252                     	xdef	_TIM2_GetCounter
4253                     	xdef	_TIM2_GetCapture3
4254                     	xdef	_TIM2_GetCapture2
4255                     	xdef	_TIM2_GetCapture1
4256                     	xdef	_TIM2_SetIC3Prescaler
4257                     	xdef	_TIM2_SetIC2Prescaler
4258                     	xdef	_TIM2_SetIC1Prescaler
4259                     	xdef	_TIM2_SetCompare3
4260                     	xdef	_TIM2_SetCompare2
4261                     	xdef	_TIM2_SetCompare1
4262                     	xdef	_TIM2_SetAutoreload
4263                     	xdef	_TIM2_SetCounter
4264                     	xdef	_TIM2_SelectOCxM
4265                     	xdef	_TIM2_CCxCmd
4266                     	xdef	_TIM2_OC3PolarityConfig
4267                     	xdef	_TIM2_OC2PolarityConfig
4268                     	xdef	_TIM2_OC1PolarityConfig
4269                     	xdef	_TIM2_GenerateEvent
4270                     	xdef	_TIM2_OC3PreloadConfig
4271                     	xdef	_TIM2_OC2PreloadConfig
4272                     	xdef	_TIM2_OC1PreloadConfig
4273                     	xdef	_TIM2_ARRPreloadConfig
4274                     	xdef	_TIM2_ForcedOC3Config
4275                     	xdef	_TIM2_ForcedOC2Config
4276                     	xdef	_TIM2_ForcedOC1Config
4277                     	xdef	_TIM2_PrescalerConfig
4278                     	xdef	_TIM2_SelectOnePulseMode
4279                     	xdef	_TIM2_UpdateRequestConfig
4280                     	xdef	_TIM2_UpdateDisableConfig
4281                     	xdef	_TIM2_ITConfig
4282                     	xdef	_TIM2_Cmd
4283                     	xdef	_TIM2_PWMIConfig
4284                     	xdef	_TIM2_ICInit
4285                     	xdef	_TIM2_OC3Init
4286                     	xdef	_TIM2_OC2Init
4287                     	xdef	_TIM2_OC1Init
4288                     	xdef	_TIM2_TimeBaseInit
4289                     	xdef	_TIM2_DeInit
4308                     	end
