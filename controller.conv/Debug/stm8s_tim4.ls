   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 43 void TIM4_DeInit(void)
  45                     ; 44 {
  47                     	switch	.text
  48  0000               _TIM4_DeInit:
  52                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  54  0000 725f5340      	clr	21312
  55                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  57  0004 725f5341      	clr	21313
  58                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  60  0008 725f5344      	clr	21316
  61                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  63  000c 725f5345      	clr	21317
  64                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  66  0010 35ff5346      	mov	21318,#255
  67                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  69  0014 725f5342      	clr	21314
  70                     ; 51 }
  73  0018 81            	ret
 179                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 179                     ; 60 {
 180                     	switch	.text
 181  0019               _TIM4_TimeBaseInit:
 185                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 187                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 189  0019 9e            	ld	a,xh
 190  001a c75345        	ld	21317,a
 191                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 193  001d 9f            	ld	a,xl
 194  001e c75346        	ld	21318,a
 195                     ; 67 }
 198  0021 81            	ret
 253                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 253                     ; 78 {
 254                     	switch	.text
 255  0022               _TIM4_Cmd:
 259                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 261                     ; 83     if (NewState != DISABLE)
 263  0022 4d            	tnz	a
 264  0023 2706          	jreq	L511
 265                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 267  0025 72105340      	bset	21312,#0
 269  0029 2004          	jra	L711
 270  002b               L511:
 271                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 273  002b 72115340      	bres	21312,#0
 274  002f               L711:
 275                     ; 91 }
 278  002f 81            	ret
 336                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 336                     ; 104 {
 337                     	switch	.text
 338  0030               _TIM4_ITConfig:
 340  0030 89            	pushw	x
 341       00000000      OFST:	set	0
 344                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 346                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 348                     ; 109     if (NewState != DISABLE)
 350  0031 9f            	ld	a,xl
 351  0032 4d            	tnz	a
 352  0033 2709          	jreq	L151
 353                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 355  0035 9e            	ld	a,xh
 356  0036 ca5341        	or	a,21313
 357  0039 c75341        	ld	21313,a
 359  003c 2009          	jra	L351
 360  003e               L151:
 361                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 363  003e 7b01          	ld	a,(OFST+1,sp)
 364  0040 43            	cpl	a
 365  0041 c45341        	and	a,21313
 366  0044 c75341        	ld	21313,a
 367  0047               L351:
 368                     ; 119 }
 371  0047 85            	popw	x
 372  0048 81            	ret
 408                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 408                     ; 128 {
 409                     	switch	.text
 410  0049               _TIM4_UpdateDisableConfig:
 414                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 133     if (NewState != DISABLE)
 418  0049 4d            	tnz	a
 419  004a 2706          	jreq	L371
 420                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 422  004c 72125340      	bset	21312,#1
 424  0050 2004          	jra	L571
 425  0052               L371:
 426                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 428  0052 72135340      	bres	21312,#1
 429  0056               L571:
 430                     ; 141 }
 433  0056 81            	ret
 491                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 491                     ; 152 {
 492                     	switch	.text
 493  0057               _TIM4_UpdateRequestConfig:
 497                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 499                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 501  0057 4d            	tnz	a
 502  0058 2706          	jreq	L522
 503                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 505  005a 72145340      	bset	21312,#2
 507  005e 2004          	jra	L722
 508  0060               L522:
 509                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 511  0060 72155340      	bres	21312,#2
 512  0064               L722:
 513                     ; 165 }
 516  0064 81            	ret
 573                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 573                     ; 176 {
 574                     	switch	.text
 575  0065               _TIM4_SelectOnePulseMode:
 579                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 581                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 583  0065 4d            	tnz	a
 584  0066 2706          	jreq	L752
 585                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 587  0068 72165340      	bset	21312,#3
 589  006c 2004          	jra	L162
 590  006e               L752:
 591                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 593  006e 72175340      	bres	21312,#3
 594  0072               L162:
 595                     ; 190 }
 598  0072 81            	ret
 666                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 666                     ; 213 {
 667                     	switch	.text
 668  0073               _TIM4_PrescalerConfig:
 672                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 674                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 676                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 678  0073 9e            	ld	a,xh
 679  0074 c75345        	ld	21317,a
 680                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 682  0077 9f            	ld	a,xl
 683  0078 c75343        	ld	21315,a
 684                     ; 223 }
 687  007b 81            	ret
 723                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 723                     ; 232 {
 724                     	switch	.text
 725  007c               _TIM4_ARRPreloadConfig:
 729                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 731                     ; 237     if (NewState != DISABLE)
 733  007c 4d            	tnz	a
 734  007d 2706          	jreq	L333
 735                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 737  007f 721e5340      	bset	21312,#7
 739  0083 2004          	jra	L533
 740  0085               L333:
 741                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 743  0085 721f5340      	bres	21312,#7
 744  0089               L533:
 745                     ; 245 }
 748  0089 81            	ret
 797                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 797                     ; 255 {
 798                     	switch	.text
 799  008a               _TIM4_GenerateEvent:
 803                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 805                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 807  008a c75343        	ld	21315,a
 808                     ; 261 }
 811  008d 81            	ret
 845                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 845                     ; 271 {
 846                     	switch	.text
 847  008e               _TIM4_SetCounter:
 851                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 853  008e c75344        	ld	21316,a
 854                     ; 274 }
 857  0091 81            	ret
 891                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 891                     ; 284 {
 892                     	switch	.text
 893  0092               _TIM4_SetAutoreload:
 897                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 899  0092 c75346        	ld	21318,a
 900                     ; 287 }
 903  0095 81            	ret
 926                     ; 294 uint8_t TIM4_GetCounter(void)
 926                     ; 295 {
 927                     	switch	.text
 928  0096               _TIM4_GetCounter:
 932                     ; 297     return (uint8_t)(TIM4->CNTR);
 934  0096 c65344        	ld	a,21316
 937  0099 81            	ret
 961                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 961                     ; 306 {
 962                     	switch	.text
 963  009a               _TIM4_GetPrescaler:
 967                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 969  009a c65345        	ld	a,21317
 972  009d 81            	ret
1051                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1051                     ; 319 {
1052                     	switch	.text
1053  009e               _TIM4_GetFlagStatus:
1055  009e 88            	push	a
1056       00000001      OFST:	set	1
1059                     ; 320     FlagStatus bitstatus = RESET;
1061                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1063                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1065  009f c45342        	and	a,21314
1066  00a2 2706          	jreq	L774
1067                     ; 327     bitstatus = SET;
1069  00a4 a601          	ld	a,#1
1070  00a6 6b01          	ld	(OFST+0,sp),a
1073  00a8 2002          	jra	L105
1074  00aa               L774:
1075                     ; 331     bitstatus = RESET;
1077  00aa 0f01          	clr	(OFST+0,sp)
1079  00ac               L105:
1080                     ; 333   return ((FlagStatus)bitstatus);
1082  00ac 7b01          	ld	a,(OFST+0,sp)
1085  00ae 5b01          	addw	sp,#1
1086  00b0 81            	ret
1121                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1121                     ; 344 {
1122                     	switch	.text
1123  00b1               _TIM4_ClearFlag:
1127                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1129                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1131  00b1 43            	cpl	a
1132  00b2 c75342        	ld	21314,a
1133                     ; 351 }
1136  00b5 81            	ret
1200                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1200                     ; 361 {
1201                     	switch	.text
1202  00b6               _TIM4_GetITStatus:
1204  00b6 88            	push	a
1205  00b7 89            	pushw	x
1206       00000002      OFST:	set	2
1209                     ; 362     ITStatus bitstatus = RESET;
1211                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1215                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1217                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1219  00b8 c45342        	and	a,21314
1220  00bb 6b01          	ld	(OFST-1,sp),a
1222                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1224  00bd c65341        	ld	a,21313
1225  00c0 1403          	and	a,(OFST+1,sp)
1226  00c2 6b02          	ld	(OFST+0,sp),a
1228                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1230  00c4 0d01          	tnz	(OFST-1,sp)
1231  00c6 270a          	jreq	L355
1233  00c8 0d02          	tnz	(OFST+0,sp)
1234  00ca 2706          	jreq	L355
1235                     ; 375     bitstatus = (ITStatus)SET;
1237  00cc a601          	ld	a,#1
1238  00ce 6b02          	ld	(OFST+0,sp),a
1241  00d0 2002          	jra	L555
1242  00d2               L355:
1243                     ; 379     bitstatus = (ITStatus)RESET;
1245  00d2 0f02          	clr	(OFST+0,sp)
1247  00d4               L555:
1248                     ; 381   return ((ITStatus)bitstatus);
1250  00d4 7b02          	ld	a,(OFST+0,sp)
1253  00d6 5b03          	addw	sp,#3
1254  00d8 81            	ret
1290                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1290                     ; 392 {
1291                     	switch	.text
1292  00d9               _TIM4_ClearITPendingBit:
1296                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1298                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1300  00d9 43            	cpl	a
1301  00da c75342        	ld	21314,a
1302                     ; 398 }
1305  00dd 81            	ret
1318                     	xdef	_TIM4_ClearITPendingBit
1319                     	xdef	_TIM4_GetITStatus
1320                     	xdef	_TIM4_ClearFlag
1321                     	xdef	_TIM4_GetFlagStatus
1322                     	xdef	_TIM4_GetPrescaler
1323                     	xdef	_TIM4_GetCounter
1324                     	xdef	_TIM4_SetAutoreload
1325                     	xdef	_TIM4_SetCounter
1326                     	xdef	_TIM4_GenerateEvent
1327                     	xdef	_TIM4_ARRPreloadConfig
1328                     	xdef	_TIM4_PrescalerConfig
1329                     	xdef	_TIM4_SelectOnePulseMode
1330                     	xdef	_TIM4_UpdateRequestConfig
1331                     	xdef	_TIM4_UpdateDisableConfig
1332                     	xdef	_TIM4_ITConfig
1333                     	xdef	_TIM4_Cmd
1334                     	xdef	_TIM4_TimeBaseInit
1335                     	xdef	_TIM4_DeInit
1354                     	end
