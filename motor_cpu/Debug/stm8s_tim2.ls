   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 46 void TIM2_DeInit(void)
  51                     ; 47 {
  53                     .text:	section	.text,new
  54  0000               _TIM2_DeInit:
  58                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  60  0000 725f5300      	clr	21248
  61                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  63  0004 725f5303      	clr	21251
  64                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  66  0008 725f5305      	clr	21253
  67                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  69  000c 725f530a      	clr	21258
  70                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  72  0010 725f530b      	clr	21259
  73                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  75  0014 725f530a      	clr	21258
  76                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  78  0018 725f530b      	clr	21259
  79                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  81  001c 725f5307      	clr	21255
  82                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  84  0020 725f5308      	clr	21256
  85                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  87  0024 725f5309      	clr	21257
  88                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  90  0028 725f530c      	clr	21260
  91                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  93  002c 725f530d      	clr	21261
  94                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  96  0030 725f530e      	clr	21262
  97                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  99  0034 35ff530f      	mov	21263,#255
 100                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 102  0038 35ff5310      	mov	21264,#255
 103                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 105  003c 725f5311      	clr	21265
 106                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 108  0040 725f5312      	clr	21266
 109                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 111  0044 725f5313      	clr	21267
 112                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 114  0048 725f5314      	clr	21268
 115                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 117  004c 725f5315      	clr	21269
 118                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 120  0050 725f5316      	clr	21270
 121                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 123  0054 725f5304      	clr	21252
 124                     ; 76 }
 127  0058 81            	ret	
 293                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 293                     ; 86                         uint16_t TIM2_Period)
 293                     ; 87 {
 294                     .text:	section	.text,new
 295  0000               _TIM2_TimeBaseInit:
 297  0000 88            	push	a
 298       00000000      OFST:	set	0
 301                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 303  0001 c7530e        	ld	21262,a
 304                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 306  0004 7b04          	ld	a,(OFST+4,sp)
 307  0006 c7530f        	ld	21263,a
 308                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 310  0009 7b05          	ld	a,(OFST+5,sp)
 311  000b c75310        	ld	21264,a
 312                     ; 93 }
 315  000e 84            	pop	a
 316  000f 81            	ret	
 471                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 471                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 471                     ; 106                   uint16_t TIM2_Pulse,
 471                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 471                     ; 108 {
 472                     .text:	section	.text,new
 473  0000               _TIM2_OC1Init:
 475  0000 89            	pushw	x
 476  0001 88            	push	a
 477       00000001      OFST:	set	1
 480                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 482                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 484                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 486                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 488  0002 c6530a        	ld	a,21258
 489  0005 a4fc          	and	a,#252
 490  0007 c7530a        	ld	21258,a
 491                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 491                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 493  000a 7b08          	ld	a,(OFST+7,sp)
 494  000c a402          	and	a,#2
 495  000e 6b01          	ld	(OFST+0,sp),a
 497  0010 9f            	ld	a,xl
 498  0011 a401          	and	a,#1
 499  0013 1a01          	or	a,(OFST+0,sp)
 500  0015 ca530a        	or	a,21258
 501  0018 c7530a        	ld	21258,a
 502                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 502                     ; 122                             (uint8_t)TIM2_OCMode);
 504  001b c65307        	ld	a,21255
 505  001e a48f          	and	a,#143
 506  0020 1a02          	or	a,(OFST+1,sp)
 507  0022 c75307        	ld	21255,a
 508                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 510  0025 7b06          	ld	a,(OFST+5,sp)
 511  0027 c75311        	ld	21265,a
 512                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 514  002a 7b07          	ld	a,(OFST+6,sp)
 515  002c c75312        	ld	21266,a
 516                     ; 127 }
 519  002f 5b03          	addw	sp,#3
 520  0031 81            	ret	
 582                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 582                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 582                     ; 140                   uint16_t TIM2_Pulse,
 582                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 582                     ; 142 {
 583                     .text:	section	.text,new
 584  0000               _TIM2_OC2Init:
 586  0000 89            	pushw	x
 587  0001 88            	push	a
 588       00000001      OFST:	set	1
 591                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 593                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 595                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 597                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 599  0002 c6530a        	ld	a,21258
 600  0005 a4cf          	and	a,#207
 601  0007 c7530a        	ld	21258,a
 602                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 602                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 604  000a 7b08          	ld	a,(OFST+7,sp)
 605  000c a420          	and	a,#32
 606  000e 6b01          	ld	(OFST+0,sp),a
 608  0010 9f            	ld	a,xl
 609  0011 a410          	and	a,#16
 610  0013 1a01          	or	a,(OFST+0,sp)
 611  0015 ca530a        	or	a,21258
 612  0018 c7530a        	ld	21258,a
 613                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 613                     ; 158                             (uint8_t)TIM2_OCMode);
 615  001b c65308        	ld	a,21256
 616  001e a48f          	and	a,#143
 617  0020 1a02          	or	a,(OFST+1,sp)
 618  0022 c75308        	ld	21256,a
 619                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 621  0025 7b06          	ld	a,(OFST+5,sp)
 622  0027 c75313        	ld	21267,a
 623                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 625  002a 7b07          	ld	a,(OFST+6,sp)
 626  002c c75314        	ld	21268,a
 627                     ; 164 }
 630  002f 5b03          	addw	sp,#3
 631  0031 81            	ret	
 693                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 693                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 693                     ; 177                   uint16_t TIM2_Pulse,
 693                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 693                     ; 179 {
 694                     .text:	section	.text,new
 695  0000               _TIM2_OC3Init:
 697  0000 89            	pushw	x
 698  0001 88            	push	a
 699       00000001      OFST:	set	1
 702                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 704                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 706                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 708                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 710  0002 c6530b        	ld	a,21259
 711  0005 a4fc          	and	a,#252
 712  0007 c7530b        	ld	21259,a
 713                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 713                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 715  000a 7b08          	ld	a,(OFST+7,sp)
 716  000c a402          	and	a,#2
 717  000e 6b01          	ld	(OFST+0,sp),a
 719  0010 9f            	ld	a,xl
 720  0011 a401          	and	a,#1
 721  0013 1a01          	or	a,(OFST+0,sp)
 722  0015 ca530b        	or	a,21259
 723  0018 c7530b        	ld	21259,a
 724                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 724                     ; 192                             (uint8_t)TIM2_OCMode);
 726  001b c65309        	ld	a,21257
 727  001e a48f          	and	a,#143
 728  0020 1a02          	or	a,(OFST+1,sp)
 729  0022 c75309        	ld	21257,a
 730                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 732  0025 7b06          	ld	a,(OFST+5,sp)
 733  0027 c75315        	ld	21269,a
 734                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 736  002a 7b07          	ld	a,(OFST+6,sp)
 737  002c c75316        	ld	21270,a
 738                     ; 198 }
 741  002f 5b03          	addw	sp,#3
 742  0031 81            	ret	
 933                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 933                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 933                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 933                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 933                     ; 214                  uint8_t TIM2_ICFilter)
 933                     ; 215 {
 934                     .text:	section	.text,new
 935  0000               _TIM2_ICInit:
 937  0000 89            	pushw	x
 938       00000000      OFST:	set	0
 941                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 943                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 945                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 947                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 949                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 951                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 953  0001 9e            	ld	a,xh
 954  0002 4d            	tnz	a
 955  0003 2614          	jrne	L763
 956                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 956                     ; 227                    (uint8_t)TIM2_ICSelection,
 956                     ; 228                    (uint8_t)TIM2_ICFilter);
 958  0005 7b07          	ld	a,(OFST+7,sp)
 959  0007 88            	push	a
 960  0008 7b06          	ld	a,(OFST+6,sp)
 961  000a 97            	ld	xl,a
 962  000b 7b03          	ld	a,(OFST+3,sp)
 963  000d 95            	ld	xh,a
 964  000e cd0000        	call	L3_TI1_Config
 966  0011 84            	pop	a
 967                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 969  0012 7b06          	ld	a,(OFST+6,sp)
 970  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 973  0017 202b          	jra	L173
 974  0019               L763:
 975                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 977  0019 7b01          	ld	a,(OFST+1,sp)
 978  001b 4a            	dec	a
 979  001c 2614          	jrne	L373
 980                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 980                     ; 237                    (uint8_t)TIM2_ICSelection,
 980                     ; 238                    (uint8_t)TIM2_ICFilter);
 982  001e 7b07          	ld	a,(OFST+7,sp)
 983  0020 88            	push	a
 984  0021 7b06          	ld	a,(OFST+6,sp)
 985  0023 97            	ld	xl,a
 986  0024 7b03          	ld	a,(OFST+3,sp)
 987  0026 95            	ld	xh,a
 988  0027 cd0000        	call	L5_TI2_Config
 990  002a 84            	pop	a
 991                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 993  002b 7b06          	ld	a,(OFST+6,sp)
 994  002d cd0000        	call	_TIM2_SetIC2Prescaler
 997  0030 2012          	jra	L173
 998  0032               L373:
 999                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
 999                     ; 247                    (uint8_t)TIM2_ICSelection,
 999                     ; 248                    (uint8_t)TIM2_ICFilter);
1001  0032 7b07          	ld	a,(OFST+7,sp)
1002  0034 88            	push	a
1003  0035 7b06          	ld	a,(OFST+6,sp)
1004  0037 97            	ld	xl,a
1005  0038 7b03          	ld	a,(OFST+3,sp)
1006  003a 95            	ld	xh,a
1007  003b cd0000        	call	L7_TI3_Config
1009  003e 84            	pop	a
1010                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1012  003f 7b06          	ld	a,(OFST+6,sp)
1013  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1015  0044               L173:
1016                     ; 253 }
1019  0044 85            	popw	x
1020  0045 81            	ret	
1110                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1110                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1110                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1110                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1110                     ; 269                      uint8_t TIM2_ICFilter)
1110                     ; 270 {
1111                     .text:	section	.text,new
1112  0000               _TIM2_PWMIConfig:
1114  0000 89            	pushw	x
1115  0001 89            	pushw	x
1116       00000002      OFST:	set	2
1119                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1121                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1123                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1125                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1127                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1129                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1131                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1133  0002 9f            	ld	a,xl
1134  0003 a144          	cp	a,#68
1135  0005 2706          	jreq	L734
1136                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1138  0007 a644          	ld	a,#68
1139  0009 6b01          	ld	(OFST-1,sp),a
1142  000b 2002          	jra	L144
1143  000d               L734:
1144                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1146  000d 0f01          	clr	(OFST-1,sp)
1148  000f               L144:
1149                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1151  000f 7b07          	ld	a,(OFST+5,sp)
1152  0011 4a            	dec	a
1153  0012 2604          	jrne	L344
1154                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1156  0014 a602          	ld	a,#2
1158  0016 2002          	jra	L544
1159  0018               L344:
1160                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1162  0018 a601          	ld	a,#1
1163  001a               L544:
1164  001a 6b02          	ld	(OFST+0,sp),a
1166                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1168  001c 7b03          	ld	a,(OFST+1,sp)
1169  001e 2626          	jrne	L744
1170                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1170                     ; 304                    (uint8_t)TIM2_ICFilter);
1172  0020 7b09          	ld	a,(OFST+7,sp)
1173  0022 88            	push	a
1174  0023 7b08          	ld	a,(OFST+6,sp)
1175  0025 97            	ld	xl,a
1176  0026 7b05          	ld	a,(OFST+3,sp)
1177  0028 95            	ld	xh,a
1178  0029 cd0000        	call	L3_TI1_Config
1180  002c 84            	pop	a
1181                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1183  002d 7b08          	ld	a,(OFST+6,sp)
1184  002f cd0000        	call	_TIM2_SetIC1Prescaler
1186                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1188  0032 7b09          	ld	a,(OFST+7,sp)
1189  0034 88            	push	a
1190  0035 7b03          	ld	a,(OFST+1,sp)
1191  0037 97            	ld	xl,a
1192  0038 7b02          	ld	a,(OFST+0,sp)
1193  003a 95            	ld	xh,a
1194  003b cd0000        	call	L5_TI2_Config
1196  003e 84            	pop	a
1197                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1199  003f 7b08          	ld	a,(OFST+6,sp)
1200  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1203  0044 2024          	jra	L154
1204  0046               L744:
1205                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1205                     ; 319                    (uint8_t)TIM2_ICFilter);
1207  0046 7b09          	ld	a,(OFST+7,sp)
1208  0048 88            	push	a
1209  0049 7b08          	ld	a,(OFST+6,sp)
1210  004b 97            	ld	xl,a
1211  004c 7b05          	ld	a,(OFST+3,sp)
1212  004e 95            	ld	xh,a
1213  004f cd0000        	call	L5_TI2_Config
1215  0052 84            	pop	a
1216                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1218  0053 7b08          	ld	a,(OFST+6,sp)
1219  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1221                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1223  0058 7b09          	ld	a,(OFST+7,sp)
1224  005a 88            	push	a
1225  005b 7b03          	ld	a,(OFST+1,sp)
1226  005d 97            	ld	xl,a
1227  005e 7b02          	ld	a,(OFST+0,sp)
1228  0060 95            	ld	xh,a
1229  0061 cd0000        	call	L3_TI1_Config
1231  0064 84            	pop	a
1232                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1234  0065 7b08          	ld	a,(OFST+6,sp)
1235  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1237  006a               L154:
1238                     ; 330 }
1241  006a 5b04          	addw	sp,#4
1242  006c 81            	ret	
1297                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1297                     ; 340 {
1298                     .text:	section	.text,new
1299  0000               _TIM2_Cmd:
1303                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1305                     ; 345     if (NewState != DISABLE)
1307  0000 4d            	tnz	a
1308  0001 2705          	jreq	L105
1309                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1311  0003 72105300      	bset	21248,#0
1314  0007 81            	ret	
1315  0008               L105:
1316                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1318  0008 72115300      	bres	21248,#0
1319                     ; 353 }
1322  000c 81            	ret	
1401                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1401                     ; 370 {
1402                     .text:	section	.text,new
1403  0000               _TIM2_ITConfig:
1405  0000 89            	pushw	x
1406       00000000      OFST:	set	0
1409                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1411                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1413                     ; 375     if (NewState != DISABLE)
1415  0001 9f            	ld	a,xl
1416  0002 4d            	tnz	a
1417  0003 2706          	jreq	L345
1418                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1420  0005 9e            	ld	a,xh
1421  0006 ca5303        	or	a,21251
1423  0009 2006          	jra	L545
1424  000b               L345:
1425                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1427  000b 7b01          	ld	a,(OFST+1,sp)
1428  000d 43            	cpl	a
1429  000e c45303        	and	a,21251
1430  0011               L545:
1431  0011 c75303        	ld	21251,a
1432                     ; 385 }
1435  0014 85            	popw	x
1436  0015 81            	ret	
1472                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1472                     ; 395 {
1473                     .text:	section	.text,new
1474  0000               _TIM2_UpdateDisableConfig:
1478                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1480                     ; 400     if (NewState != DISABLE)
1482  0000 4d            	tnz	a
1483  0001 2705          	jreq	L565
1484                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1486  0003 72125300      	bset	21248,#1
1489  0007 81            	ret	
1490  0008               L565:
1491                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1493  0008 72135300      	bres	21248,#1
1494                     ; 408 }
1497  000c 81            	ret	
1555                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1555                     ; 419 {
1556                     .text:	section	.text,new
1557  0000               _TIM2_UpdateRequestConfig:
1561                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1563                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1565  0000 4d            	tnz	a
1566  0001 2705          	jreq	L716
1567                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1569  0003 72145300      	bset	21248,#2
1572  0007 81            	ret	
1573  0008               L716:
1574                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1576  0008 72155300      	bres	21248,#2
1577                     ; 432 }
1580  000c 81            	ret	
1637                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1637                     ; 444 {
1638                     .text:	section	.text,new
1639  0000               _TIM2_SelectOnePulseMode:
1643                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1645                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1647  0000 4d            	tnz	a
1648  0001 2705          	jreq	L156
1649                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1651  0003 72165300      	bset	21248,#3
1654  0007 81            	ret	
1655  0008               L156:
1656                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1658  0008 72175300      	bres	21248,#3
1659                     ; 458 }
1662  000c 81            	ret	
1730                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1730                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1730                     ; 491 {
1731                     .text:	section	.text,new
1732  0000               _TIM2_PrescalerConfig:
1736                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1738                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1740                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1742  0000 9e            	ld	a,xh
1743  0001 c7530e        	ld	21262,a
1744                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1746  0004 9f            	ld	a,xl
1747  0005 c75306        	ld	21254,a
1748                     ; 501 }
1751  0008 81            	ret	
1809                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1809                     ; 513 {
1810                     .text:	section	.text,new
1811  0000               _TIM2_ForcedOC1Config:
1813  0000 88            	push	a
1814       00000000      OFST:	set	0
1817                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1819                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1819                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1821  0001 c65307        	ld	a,21255
1822  0004 a48f          	and	a,#143
1823  0006 1a01          	or	a,(OFST+1,sp)
1824  0008 c75307        	ld	21255,a
1825                     ; 520 }
1828  000b 84            	pop	a
1829  000c 81            	ret	
1865                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1865                     ; 532 {
1866                     .text:	section	.text,new
1867  0000               _TIM2_ForcedOC2Config:
1869  0000 88            	push	a
1870       00000000      OFST:	set	0
1873                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1875                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1875                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1877  0001 c65308        	ld	a,21256
1878  0004 a48f          	and	a,#143
1879  0006 1a01          	or	a,(OFST+1,sp)
1880  0008 c75308        	ld	21256,a
1881                     ; 539 }
1884  000b 84            	pop	a
1885  000c 81            	ret	
1921                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1921                     ; 551 {
1922                     .text:	section	.text,new
1923  0000               _TIM2_ForcedOC3Config:
1925  0000 88            	push	a
1926       00000000      OFST:	set	0
1929                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1931                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1931                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1933  0001 c65309        	ld	a,21257
1934  0004 a48f          	and	a,#143
1935  0006 1a01          	or	a,(OFST+1,sp)
1936  0008 c75309        	ld	21257,a
1937                     ; 558 }
1940  000b 84            	pop	a
1941  000c 81            	ret	
1977                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1977                     ; 568 {
1978                     .text:	section	.text,new
1979  0000               _TIM2_ARRPreloadConfig:
1983                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1985                     ; 573     if (NewState != DISABLE)
1987  0000 4d            	tnz	a
1988  0001 2705          	jreq	L7001
1989                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1991  0003 721e5300      	bset	21248,#7
1994  0007 81            	ret	
1995  0008               L7001:
1996                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1998  0008 721f5300      	bres	21248,#7
1999                     ; 581 }
2002  000c 81            	ret	
2038                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2038                     ; 591 {
2039                     .text:	section	.text,new
2040  0000               _TIM2_OC1PreloadConfig:
2044                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2046                     ; 596     if (NewState != DISABLE)
2048  0000 4d            	tnz	a
2049  0001 2705          	jreq	L1301
2050                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2052  0003 72165307      	bset	21255,#3
2055  0007 81            	ret	
2056  0008               L1301:
2057                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2059  0008 72175307      	bres	21255,#3
2060                     ; 604 }
2063  000c 81            	ret	
2099                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2099                     ; 614 {
2100                     .text:	section	.text,new
2101  0000               _TIM2_OC2PreloadConfig:
2105                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2107                     ; 619     if (NewState != DISABLE)
2109  0000 4d            	tnz	a
2110  0001 2705          	jreq	L3501
2111                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2113  0003 72165308      	bset	21256,#3
2116  0007 81            	ret	
2117  0008               L3501:
2118                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2120  0008 72175308      	bres	21256,#3
2121                     ; 627 }
2124  000c 81            	ret	
2160                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2160                     ; 637 {
2161                     .text:	section	.text,new
2162  0000               _TIM2_OC3PreloadConfig:
2166                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2168                     ; 642     if (NewState != DISABLE)
2170  0000 4d            	tnz	a
2171  0001 2705          	jreq	L5701
2172                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2174  0003 72165309      	bset	21257,#3
2177  0007 81            	ret	
2178  0008               L5701:
2179                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2181  0008 72175309      	bres	21257,#3
2182                     ; 650 }
2185  000c 81            	ret	
2258                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2258                     ; 664 {
2259                     .text:	section	.text,new
2260  0000               _TIM2_GenerateEvent:
2264                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2266                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2268  0000 c75306        	ld	21254,a
2269                     ; 670 }
2272  0003 81            	ret	
2308                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2308                     ; 682 {
2309                     .text:	section	.text,new
2310  0000               _TIM2_OC1PolarityConfig:
2314                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2316                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2318  0000 4d            	tnz	a
2319  0001 2705          	jreq	L1511
2320                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2322  0003 7212530a      	bset	21258,#1
2325  0007 81            	ret	
2326  0008               L1511:
2327                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2329  0008 7213530a      	bres	21258,#1
2330                     ; 695 }
2333  000c 81            	ret	
2369                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2369                     ; 707 {
2370                     .text:	section	.text,new
2371  0000               _TIM2_OC2PolarityConfig:
2375                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2377                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2379  0000 4d            	tnz	a
2380  0001 2705          	jreq	L3711
2381                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2383  0003 721a530a      	bset	21258,#5
2386  0007 81            	ret	
2387  0008               L3711:
2388                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2390  0008 721b530a      	bres	21258,#5
2391                     ; 720 }
2394  000c 81            	ret	
2430                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2430                     ; 732 {
2431                     .text:	section	.text,new
2432  0000               _TIM2_OC3PolarityConfig:
2436                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2438                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2440  0000 4d            	tnz	a
2441  0001 2705          	jreq	L5121
2442                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2444  0003 7212530b      	bset	21259,#1
2447  0007 81            	ret	
2448  0008               L5121:
2449                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2451  0008 7213530b      	bres	21259,#1
2452                     ; 745 }
2455  000c 81            	ret	
2500                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2500                     ; 760 {
2501                     .text:	section	.text,new
2502  0000               _TIM2_CCxCmd:
2504  0000 89            	pushw	x
2505       00000000      OFST:	set	0
2508                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2510                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2512                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2514  0001 9e            	ld	a,xh
2515  0002 4d            	tnz	a
2516  0003 2610          	jrne	L3421
2517                     ; 768         if (NewState != DISABLE)
2519  0005 9f            	ld	a,xl
2520  0006 4d            	tnz	a
2521  0007 2706          	jreq	L5421
2522                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2524  0009 7210530a      	bset	21258,#0
2526  000d 2029          	jra	L1521
2527  000f               L5421:
2528                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2530  000f 7211530a      	bres	21258,#0
2531  0013 2023          	jra	L1521
2532  0015               L3421:
2533                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2535  0015 7b01          	ld	a,(OFST+1,sp)
2536  0017 4a            	dec	a
2537  0018 2610          	jrne	L3521
2538                     ; 781         if (NewState != DISABLE)
2540  001a 7b02          	ld	a,(OFST+2,sp)
2541  001c 2706          	jreq	L5521
2542                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2544  001e 7218530a      	bset	21258,#4
2546  0022 2014          	jra	L1521
2547  0024               L5521:
2548                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2550  0024 7219530a      	bres	21258,#4
2551  0028 200e          	jra	L1521
2552  002a               L3521:
2553                     ; 793         if (NewState != DISABLE)
2555  002a 7b02          	ld	a,(OFST+2,sp)
2556  002c 2706          	jreq	L3621
2557                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2559  002e 7210530b      	bset	21259,#0
2561  0032 2004          	jra	L1521
2562  0034               L3621:
2563                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2565  0034 7211530b      	bres	21259,#0
2566  0038               L1521:
2567                     ; 802 }
2570  0038 85            	popw	x
2571  0039 81            	ret	
2616                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2616                     ; 825 {
2617                     .text:	section	.text,new
2618  0000               _TIM2_SelectOCxM:
2620  0000 89            	pushw	x
2621       00000000      OFST:	set	0
2624                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2626                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2628                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2630  0001 9e            	ld	a,xh
2631  0002 4d            	tnz	a
2632  0003 2610          	jrne	L1131
2633                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2635  0005 7211530a      	bres	21258,#0
2636                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2636                     ; 837                                | (uint8_t)TIM2_OCMode);
2638  0009 c65307        	ld	a,21255
2639  000c a48f          	and	a,#143
2640  000e 1a02          	or	a,(OFST+2,sp)
2641  0010 c75307        	ld	21255,a
2643  0013 2023          	jra	L3131
2644  0015               L1131:
2645                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2647  0015 7b01          	ld	a,(OFST+1,sp)
2648  0017 4a            	dec	a
2649  0018 2610          	jrne	L5131
2650                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2652  001a 7219530a      	bres	21258,#4
2653                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2653                     ; 846                                 | (uint8_t)TIM2_OCMode);
2655  001e c65308        	ld	a,21256
2656  0021 a48f          	and	a,#143
2657  0023 1a02          	or	a,(OFST+2,sp)
2658  0025 c75308        	ld	21256,a
2660  0028 200e          	jra	L3131
2661  002a               L5131:
2662                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2664  002a 7211530b      	bres	21259,#0
2665                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2665                     ; 855                                 | (uint8_t)TIM2_OCMode);
2667  002e c65309        	ld	a,21257
2668  0031 a48f          	and	a,#143
2669  0033 1a02          	or	a,(OFST+2,sp)
2670  0035 c75309        	ld	21257,a
2671  0038               L3131:
2672                     ; 857 }
2675  0038 85            	popw	x
2676  0039 81            	ret	
2708                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2708                     ; 867 {
2709                     .text:	section	.text,new
2710  0000               _TIM2_SetCounter:
2714                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2716  0000 9e            	ld	a,xh
2717  0001 c7530c        	ld	21260,a
2718                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2720  0004 9f            	ld	a,xl
2721  0005 c7530d        	ld	21261,a
2722                     ; 872 }
2725  0008 81            	ret	
2757                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2757                     ; 882 {
2758                     .text:	section	.text,new
2759  0000               _TIM2_SetAutoreload:
2763                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2765  0000 9e            	ld	a,xh
2766  0001 c7530f        	ld	21263,a
2767                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2769  0004 9f            	ld	a,xl
2770  0005 c75310        	ld	21264,a
2771                     ; 888 }
2774  0008 81            	ret	
2806                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2806                     ; 898 {
2807                     .text:	section	.text,new
2808  0000               _TIM2_SetCompare1:
2812                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2814  0000 9e            	ld	a,xh
2815  0001 c75311        	ld	21265,a
2816                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2818  0004 9f            	ld	a,xl
2819  0005 c75312        	ld	21266,a
2820                     ; 903 }
2823  0008 81            	ret	
2855                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2855                     ; 913 {
2856                     .text:	section	.text,new
2857  0000               _TIM2_SetCompare2:
2861                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2863  0000 9e            	ld	a,xh
2864  0001 c75313        	ld	21267,a
2865                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2867  0004 9f            	ld	a,xl
2868  0005 c75314        	ld	21268,a
2869                     ; 918 }
2872  0008 81            	ret	
2904                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2904                     ; 928 {
2905                     .text:	section	.text,new
2906  0000               _TIM2_SetCompare3:
2910                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2912  0000 9e            	ld	a,xh
2913  0001 c75315        	ld	21269,a
2914                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2916  0004 9f            	ld	a,xl
2917  0005 c75316        	ld	21270,a
2918                     ; 933 }
2921  0008 81            	ret	
2957                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2957                     ; 947 {
2958                     .text:	section	.text,new
2959  0000               _TIM2_SetIC1Prescaler:
2961  0000 88            	push	a
2962       00000000      OFST:	set	0
2965                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2967                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2967                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2969  0001 c65307        	ld	a,21255
2970  0004 a4f3          	and	a,#243
2971  0006 1a01          	or	a,(OFST+1,sp)
2972  0008 c75307        	ld	21255,a
2973                     ; 954 }
2976  000b 84            	pop	a
2977  000c 81            	ret	
3013                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3013                     ; 967 {
3014                     .text:	section	.text,new
3015  0000               _TIM2_SetIC2Prescaler:
3017  0000 88            	push	a
3018       00000000      OFST:	set	0
3021                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3023                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3023                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3025  0001 c65308        	ld	a,21256
3026  0004 a4f3          	and	a,#243
3027  0006 1a01          	or	a,(OFST+1,sp)
3028  0008 c75308        	ld	21256,a
3029                     ; 974 }
3032  000b 84            	pop	a
3033  000c 81            	ret	
3069                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3069                     ; 987 {
3070                     .text:	section	.text,new
3071  0000               _TIM2_SetIC3Prescaler:
3073  0000 88            	push	a
3074       00000000      OFST:	set	0
3077                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3079                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3079                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3081  0001 c65309        	ld	a,21257
3082  0004 a4f3          	and	a,#243
3083  0006 1a01          	or	a,(OFST+1,sp)
3084  0008 c75309        	ld	21257,a
3085                     ; 994 }
3088  000b 84            	pop	a
3089  000c 81            	ret	
3135                     ; 1001 uint16_t TIM2_GetCapture1(void)
3135                     ; 1002 {
3136                     .text:	section	.text,new
3137  0000               _TIM2_GetCapture1:
3139  0000 5204          	subw	sp,#4
3140       00000004      OFST:	set	4
3143                     ; 1004     uint16_t tmpccr1 = 0;
3145                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3149                     ; 1007     tmpccr1h = TIM2->CCR1H;
3151  0002 c65311        	ld	a,21265
3152  0005 6b02          	ld	(OFST-2,sp),a
3154                     ; 1008     tmpccr1l = TIM2->CCR1L;
3156  0007 c65312        	ld	a,21266
3157  000a 6b01          	ld	(OFST-3,sp),a
3159                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3161  000c 5f            	clrw	x
3162  000d 97            	ld	xl,a
3163  000e 1f03          	ldw	(OFST-1,sp),x
3165                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3167  0010 5f            	clrw	x
3168  0011 7b02          	ld	a,(OFST-2,sp)
3169  0013 97            	ld	xl,a
3170  0014 7b04          	ld	a,(OFST+0,sp)
3171  0016 01            	rrwa	x,a
3172  0017 1a03          	or	a,(OFST-1,sp)
3173  0019 01            	rrwa	x,a
3175                     ; 1013     return (uint16_t)tmpccr1;
3179  001a 5b04          	addw	sp,#4
3180  001c 81            	ret	
3226                     ; 1021 uint16_t TIM2_GetCapture2(void)
3226                     ; 1022 {
3227                     .text:	section	.text,new
3228  0000               _TIM2_GetCapture2:
3230  0000 5204          	subw	sp,#4
3231       00000004      OFST:	set	4
3234                     ; 1024     uint16_t tmpccr2 = 0;
3236                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3240                     ; 1027     tmpccr2h = TIM2->CCR2H;
3242  0002 c65313        	ld	a,21267
3243  0005 6b02          	ld	(OFST-2,sp),a
3245                     ; 1028     tmpccr2l = TIM2->CCR2L;
3247  0007 c65314        	ld	a,21268
3248  000a 6b01          	ld	(OFST-3,sp),a
3250                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3252  000c 5f            	clrw	x
3253  000d 97            	ld	xl,a
3254  000e 1f03          	ldw	(OFST-1,sp),x
3256                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3258  0010 5f            	clrw	x
3259  0011 7b02          	ld	a,(OFST-2,sp)
3260  0013 97            	ld	xl,a
3261  0014 7b04          	ld	a,(OFST+0,sp)
3262  0016 01            	rrwa	x,a
3263  0017 1a03          	or	a,(OFST-1,sp)
3264  0019 01            	rrwa	x,a
3266                     ; 1033     return (uint16_t)tmpccr2;
3270  001a 5b04          	addw	sp,#4
3271  001c 81            	ret	
3317                     ; 1041 uint16_t TIM2_GetCapture3(void)
3317                     ; 1042 {
3318                     .text:	section	.text,new
3319  0000               _TIM2_GetCapture3:
3321  0000 5204          	subw	sp,#4
3322       00000004      OFST:	set	4
3325                     ; 1044     uint16_t tmpccr3 = 0;
3327                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3331                     ; 1047     tmpccr3h = TIM2->CCR3H;
3333  0002 c65315        	ld	a,21269
3334  0005 6b02          	ld	(OFST-2,sp),a
3336                     ; 1048     tmpccr3l = TIM2->CCR3L;
3338  0007 c65316        	ld	a,21270
3339  000a 6b01          	ld	(OFST-3,sp),a
3341                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3343  000c 5f            	clrw	x
3344  000d 97            	ld	xl,a
3345  000e 1f03          	ldw	(OFST-1,sp),x
3347                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3349  0010 5f            	clrw	x
3350  0011 7b02          	ld	a,(OFST-2,sp)
3351  0013 97            	ld	xl,a
3352  0014 7b04          	ld	a,(OFST+0,sp)
3353  0016 01            	rrwa	x,a
3354  0017 1a03          	or	a,(OFST-1,sp)
3355  0019 01            	rrwa	x,a
3357                     ; 1053     return (uint16_t)tmpccr3;
3361  001a 5b04          	addw	sp,#4
3362  001c 81            	ret	
3394                     ; 1061 uint16_t TIM2_GetCounter(void)
3394                     ; 1062 {
3395                     .text:	section	.text,new
3396  0000               _TIM2_GetCounter:
3398  0000 89            	pushw	x
3399       00000002      OFST:	set	2
3402                     ; 1063      uint16_t tmpcntr = 0;
3404                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3406  0001 c6530c        	ld	a,21260
3407  0004 97            	ld	xl,a
3408  0005 4f            	clr	a
3409  0006 02            	rlwa	x,a
3410  0007 1f01          	ldw	(OFST-1,sp),x
3412                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3414  0009 c6530d        	ld	a,21261
3415  000c 5f            	clrw	x
3416  000d 97            	ld	xl,a
3417  000e 01            	rrwa	x,a
3418  000f 1a02          	or	a,(OFST+0,sp)
3419  0011 01            	rrwa	x,a
3420  0012 1a01          	or	a,(OFST-1,sp)
3421  0014 01            	rrwa	x,a
3424  0015 5b02          	addw	sp,#2
3425  0017 81            	ret	
3449                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3449                     ; 1077 {
3450                     .text:	section	.text,new
3451  0000               _TIM2_GetPrescaler:
3455                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3457  0000 c6530e        	ld	a,21262
3460  0003 81            	ret	
3595                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3595                     ; 1097 {
3596                     .text:	section	.text,new
3597  0000               _TIM2_GetFlagStatus:
3599  0000 89            	pushw	x
3600  0001 89            	pushw	x
3601       00000002      OFST:	set	2
3604                     ; 1098     FlagStatus bitstatus = RESET;
3606                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3610                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3612                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3614  0002 9f            	ld	a,xl
3615  0003 c45304        	and	a,21252
3616  0006 6b01          	ld	(OFST-1,sp),a
3618                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3620  0008 7b03          	ld	a,(OFST+1,sp)
3621  000a 6b02          	ld	(OFST+0,sp),a
3623                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3625  000c c45305        	and	a,21253
3626  000f 1a01          	or	a,(OFST-1,sp)
3627  0011 2702          	jreq	L3561
3628                     ; 1109         bitstatus = SET;
3630  0013 a601          	ld	a,#1
3633  0015               L3561:
3634                     ; 1113         bitstatus = RESET;
3637                     ; 1115     return (FlagStatus)bitstatus;
3641  0015 5b04          	addw	sp,#4
3642  0017 81            	ret	
3677                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3677                     ; 1133 {
3678                     .text:	section	.text,new
3679  0000               _TIM2_ClearFlag:
3683                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3685                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3687  0000 9f            	ld	a,xl
3688  0001 43            	cpl	a
3689  0002 c75304        	ld	21252,a
3690                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3692  0005 35ff5305      	mov	21253,#255
3693                     ; 1140 }
3696  0009 81            	ret	
3756                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3756                     ; 1155 {
3757                     .text:	section	.text,new
3758  0000               _TIM2_GetITStatus:
3760  0000 88            	push	a
3761  0001 89            	pushw	x
3762       00000002      OFST:	set	2
3765                     ; 1156     ITStatus bitstatus = RESET;
3767                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3771                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3773                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3775  0002 c45304        	and	a,21252
3776  0005 6b01          	ld	(OFST-1,sp),a
3778                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3780  0007 c65303        	ld	a,21251
3781  000a 1403          	and	a,(OFST+1,sp)
3782  000c 6b02          	ld	(OFST+0,sp),a
3784                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3786  000e 7b01          	ld	a,(OFST-1,sp)
3787  0010 2708          	jreq	L3271
3789  0012 7b02          	ld	a,(OFST+0,sp)
3790  0014 2704          	jreq	L3271
3791                     ; 1168         bitstatus = SET;
3793  0016 a601          	ld	a,#1
3796  0018 2001          	jra	L5271
3797  001a               L3271:
3798                     ; 1172         bitstatus = RESET;
3800  001a 4f            	clr	a
3802  001b               L5271:
3803                     ; 1174     return (ITStatus)(bitstatus);
3807  001b 5b03          	addw	sp,#3
3808  001d 81            	ret	
3844                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3844                     ; 1189 {
3845                     .text:	section	.text,new
3846  0000               _TIM2_ClearITPendingBit:
3850                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3852                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3854  0000 43            	cpl	a
3855  0001 c75304        	ld	21252,a
3856                     ; 1195 }
3859  0004 81            	ret	
3905                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3905                     ; 1215                        uint8_t TIM2_ICSelection,
3905                     ; 1216                        uint8_t TIM2_ICFilter)
3905                     ; 1217 {
3906                     .text:	section	.text,new
3907  0000               L3_TI1_Config:
3909  0000 89            	pushw	x
3910  0001 88            	push	a
3911       00000001      OFST:	set	1
3914                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3916  0002 7211530a      	bres	21258,#0
3917                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3917                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3919  0006 7b06          	ld	a,(OFST+5,sp)
3920  0008 97            	ld	xl,a
3921  0009 a610          	ld	a,#16
3922  000b 42            	mul	x,a
3923  000c 9f            	ld	a,xl
3924  000d 1a03          	or	a,(OFST+2,sp)
3925  000f 6b01          	ld	(OFST+0,sp),a
3927  0011 c65307        	ld	a,21255
3928  0014 a40c          	and	a,#12
3929  0016 1a01          	or	a,(OFST+0,sp)
3930  0018 c75307        	ld	21255,a
3931                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3933  001b 7b02          	ld	a,(OFST+1,sp)
3934  001d 2706          	jreq	L5671
3935                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3937  001f 7212530a      	bset	21258,#1
3939  0023 2004          	jra	L7671
3940  0025               L5671:
3941                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3943  0025 7213530a      	bres	21258,#1
3944  0029               L7671:
3945                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3947  0029 7210530a      	bset	21258,#0
3948                     ; 1236 }
3951  002d 5b03          	addw	sp,#3
3952  002f 81            	ret	
3998                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
3998                     ; 1256                        uint8_t TIM2_ICSelection,
3998                     ; 1257                        uint8_t TIM2_ICFilter)
3998                     ; 1258 {
3999                     .text:	section	.text,new
4000  0000               L5_TI2_Config:
4002  0000 89            	pushw	x
4003  0001 88            	push	a
4004       00000001      OFST:	set	1
4007                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4009  0002 7219530a      	bres	21258,#4
4010                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4010                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4012  0006 7b06          	ld	a,(OFST+5,sp)
4013  0008 97            	ld	xl,a
4014  0009 a610          	ld	a,#16
4015  000b 42            	mul	x,a
4016  000c 9f            	ld	a,xl
4017  000d 1a03          	or	a,(OFST+2,sp)
4018  000f 6b01          	ld	(OFST+0,sp),a
4020  0011 c65308        	ld	a,21256
4021  0014 a40c          	and	a,#12
4022  0016 1a01          	or	a,(OFST+0,sp)
4023  0018 c75308        	ld	21256,a
4024                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4026  001b 7b02          	ld	a,(OFST+1,sp)
4027  001d 2706          	jreq	L1102
4028                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4030  001f 721a530a      	bset	21258,#5
4032  0023 2004          	jra	L3102
4033  0025               L1102:
4034                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4036  0025 721b530a      	bres	21258,#5
4037  0029               L3102:
4038                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4040  0029 7218530a      	bset	21258,#4
4041                     ; 1280 }
4044  002d 5b03          	addw	sp,#3
4045  002f 81            	ret	
4091                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4091                     ; 1297                        uint8_t TIM2_ICFilter)
4091                     ; 1298 {
4092                     .text:	section	.text,new
4093  0000               L7_TI3_Config:
4095  0000 89            	pushw	x
4096  0001 88            	push	a
4097       00000001      OFST:	set	1
4100                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4102  0002 7211530b      	bres	21259,#0
4103                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4103                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4105  0006 7b06          	ld	a,(OFST+5,sp)
4106  0008 97            	ld	xl,a
4107  0009 a610          	ld	a,#16
4108  000b 42            	mul	x,a
4109  000c 9f            	ld	a,xl
4110  000d 1a03          	or	a,(OFST+2,sp)
4111  000f 6b01          	ld	(OFST+0,sp),a
4113  0011 c65309        	ld	a,21257
4114  0014 a40c          	and	a,#12
4115  0016 1a01          	or	a,(OFST+0,sp)
4116  0018 c75309        	ld	21257,a
4117                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4119  001b 7b02          	ld	a,(OFST+1,sp)
4120  001d 2706          	jreq	L5302
4121                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4123  001f 7212530b      	bset	21259,#1
4125  0023 2004          	jra	L7302
4126  0025               L5302:
4127                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4129  0025 7213530b      	bres	21259,#1
4130  0029               L7302:
4131                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4133  0029 7210530b      	bset	21259,#0
4134                     ; 1318 }
4137  002d 5b03          	addw	sp,#3
4138  002f 81            	ret	
4151                     	xdef	_TIM2_ClearITPendingBit
4152                     	xdef	_TIM2_GetITStatus
4153                     	xdef	_TIM2_ClearFlag
4154                     	xdef	_TIM2_GetFlagStatus
4155                     	xdef	_TIM2_GetPrescaler
4156                     	xdef	_TIM2_GetCounter
4157                     	xdef	_TIM2_GetCapture3
4158                     	xdef	_TIM2_GetCapture2
4159                     	xdef	_TIM2_GetCapture1
4160                     	xdef	_TIM2_SetIC3Prescaler
4161                     	xdef	_TIM2_SetIC2Prescaler
4162                     	xdef	_TIM2_SetIC1Prescaler
4163                     	xdef	_TIM2_SetCompare3
4164                     	xdef	_TIM2_SetCompare2
4165                     	xdef	_TIM2_SetCompare1
4166                     	xdef	_TIM2_SetAutoreload
4167                     	xdef	_TIM2_SetCounter
4168                     	xdef	_TIM2_SelectOCxM
4169                     	xdef	_TIM2_CCxCmd
4170                     	xdef	_TIM2_OC3PolarityConfig
4171                     	xdef	_TIM2_OC2PolarityConfig
4172                     	xdef	_TIM2_OC1PolarityConfig
4173                     	xdef	_TIM2_GenerateEvent
4174                     	xdef	_TIM2_OC3PreloadConfig
4175                     	xdef	_TIM2_OC2PreloadConfig
4176                     	xdef	_TIM2_OC1PreloadConfig
4177                     	xdef	_TIM2_ARRPreloadConfig
4178                     	xdef	_TIM2_ForcedOC3Config
4179                     	xdef	_TIM2_ForcedOC2Config
4180                     	xdef	_TIM2_ForcedOC1Config
4181                     	xdef	_TIM2_PrescalerConfig
4182                     	xdef	_TIM2_SelectOnePulseMode
4183                     	xdef	_TIM2_UpdateRequestConfig
4184                     	xdef	_TIM2_UpdateDisableConfig
4185                     	xdef	_TIM2_ITConfig
4186                     	xdef	_TIM2_Cmd
4187                     	xdef	_TIM2_PWMIConfig
4188                     	xdef	_TIM2_ICInit
4189                     	xdef	_TIM2_OC3Init
4190                     	xdef	_TIM2_OC2Init
4191                     	xdef	_TIM2_OC1Init
4192                     	xdef	_TIM2_TimeBaseInit
4193                     	xdef	_TIM2_DeInit
4212                     	end
