   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 43 void TIM4_DeInit(void)
  51                     ; 44 {
  53                     .text:	section	.text,new
  54  0000               _TIM4_DeInit:
  58                     ; 45     TIM4->CR1 = TIM4_CR1_RESET_VALUE;
  60  0000 725f5340      	clr	21312
  61                     ; 46     TIM4->IER = TIM4_IER_RESET_VALUE;
  63  0004 725f5343      	clr	21315
  64                     ; 47     TIM4->CNTR = TIM4_CNTR_RESET_VALUE;
  66  0008 725f5346      	clr	21318
  67                     ; 48     TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  69  000c 725f5347      	clr	21319
  70                     ; 49     TIM4->ARR = TIM4_ARR_RESET_VALUE;
  72  0010 35ff5348      	mov	21320,#255
  73                     ; 50     TIM4->SR1 = TIM4_SR1_RESET_VALUE;
  75  0014 725f5344      	clr	21316
  76                     ; 51 }
  79  0018 81            	ret	
 183                     ; 59 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler, uint8_t TIM4_Period)
 183                     ; 60 {
 184                     .text:	section	.text,new
 185  0000               _TIM4_TimeBaseInit:
 189                     ; 62     assert_param(IS_TIM4_PRESCALER_OK(TIM4_Prescaler));
 191                     ; 64     TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 193  0000 9e            	ld	a,xh
 194  0001 c75347        	ld	21319,a
 195                     ; 66     TIM4->ARR = (uint8_t)(TIM4_Period);
 197  0004 9f            	ld	a,xl
 198  0005 c75348        	ld	21320,a
 199                     ; 67 }
 202  0008 81            	ret	
 257                     ; 77 void TIM4_Cmd(FunctionalState NewState)
 257                     ; 78 {
 258                     .text:	section	.text,new
 259  0000               _TIM4_Cmd:
 263                     ; 80     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 265                     ; 83     if (NewState != DISABLE)
 267  0000 4d            	tnz	a
 268  0001 2705          	jreq	L311
 269                     ; 85         TIM4->CR1 |= TIM4_CR1_CEN;
 271  0003 72105340      	bset	21312,#0
 274  0007 81            	ret	
 275  0008               L311:
 276                     ; 89         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN);
 278  0008 72115340      	bres	21312,#0
 279                     ; 91 }
 282  000c 81            	ret	
 340                     ; 103 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 340                     ; 104 {
 341                     .text:	section	.text,new
 342  0000               _TIM4_ITConfig:
 344  0000 89            	pushw	x
 345       00000000      OFST:	set	0
 348                     ; 106     assert_param(IS_TIM4_IT_OK(TIM4_IT));
 350                     ; 107     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 352                     ; 109     if (NewState != DISABLE)
 354  0001 9f            	ld	a,xl
 355  0002 4d            	tnz	a
 356  0003 2706          	jreq	L741
 357                     ; 112         TIM4->IER |= (uint8_t)TIM4_IT;
 359  0005 9e            	ld	a,xh
 360  0006 ca5343        	or	a,21315
 362  0009 2006          	jra	L151
 363  000b               L741:
 364                     ; 117         TIM4->IER &= (uint8_t)(~TIM4_IT);
 366  000b 7b01          	ld	a,(OFST+1,sp)
 367  000d 43            	cpl	a
 368  000e c45343        	and	a,21315
 369  0011               L151:
 370  0011 c75343        	ld	21315,a
 371                     ; 119 }
 374  0014 85            	popw	x
 375  0015 81            	ret	
 411                     ; 127 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 411                     ; 128 {
 412                     .text:	section	.text,new
 413  0000               _TIM4_UpdateDisableConfig:
 417                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 419                     ; 133     if (NewState != DISABLE)
 421  0000 4d            	tnz	a
 422  0001 2705          	jreq	L171
 423                     ; 135         TIM4->CR1 |= TIM4_CR1_UDIS;
 425  0003 72125340      	bset	21312,#1
 428  0007 81            	ret	
 429  0008               L171:
 430                     ; 139         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS);
 432  0008 72135340      	bres	21312,#1
 433                     ; 141 }
 436  000c 81            	ret	
 494                     ; 151 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 494                     ; 152 {
 495                     .text:	section	.text,new
 496  0000               _TIM4_UpdateRequestConfig:
 500                     ; 154     assert_param(IS_TIM4_UPDATE_SOURCE_OK(TIM4_UpdateSource));
 502                     ; 157     if (TIM4_UpdateSource != TIM4_UPDATESOURCE_GLOBAL)
 504  0000 4d            	tnz	a
 505  0001 2705          	jreq	L322
 506                     ; 159         TIM4->CR1 |= TIM4_CR1_URS;
 508  0003 72145340      	bset	21312,#2
 511  0007 81            	ret	
 512  0008               L322:
 513                     ; 163         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS);
 515  0008 72155340      	bres	21312,#2
 516                     ; 165 }
 519  000c 81            	ret	
 576                     ; 175 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 576                     ; 176 {
 577                     .text:	section	.text,new
 578  0000               _TIM4_SelectOnePulseMode:
 582                     ; 178     assert_param(IS_TIM4_OPM_MODE_OK(TIM4_OPMode));
 584                     ; 181     if (TIM4_OPMode != TIM4_OPMODE_REPETITIVE)
 586  0000 4d            	tnz	a
 587  0001 2705          	jreq	L552
 588                     ; 183         TIM4->CR1 |= TIM4_CR1_OPM;
 590  0003 72165340      	bset	21312,#3
 593  0007 81            	ret	
 594  0008               L552:
 595                     ; 187         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM);
 597  0008 72175340      	bres	21312,#3
 598                     ; 190 }
 601  000c 81            	ret	
 669                     ; 212 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler, TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 669                     ; 213 {
 670                     .text:	section	.text,new
 671  0000               _TIM4_PrescalerConfig:
 675                     ; 215     assert_param(IS_TIM4_PRESCALER_RELOAD_OK(TIM4_PSCReloadMode));
 677                     ; 216     assert_param(IS_TIM4_PRESCALER_OK(Prescaler));
 679                     ; 219     TIM4->PSCR = (uint8_t)Prescaler;
 681  0000 9e            	ld	a,xh
 682  0001 c75347        	ld	21319,a
 683                     ; 222     TIM4->EGR = (uint8_t)TIM4_PSCReloadMode;
 685  0004 9f            	ld	a,xl
 686  0005 c75345        	ld	21317,a
 687                     ; 223 }
 690  0008 81            	ret	
 726                     ; 231 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 726                     ; 232 {
 727                     .text:	section	.text,new
 728  0000               _TIM4_ARRPreloadConfig:
 732                     ; 234     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 734                     ; 237     if (NewState != DISABLE)
 736  0000 4d            	tnz	a
 737  0001 2705          	jreq	L133
 738                     ; 239         TIM4->CR1 |= TIM4_CR1_ARPE;
 740  0003 721e5340      	bset	21312,#7
 743  0007 81            	ret	
 744  0008               L133:
 745                     ; 243         TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE);
 747  0008 721f5340      	bres	21312,#7
 748                     ; 245 }
 751  000c 81            	ret	
 800                     ; 254 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
 800                     ; 255 {
 801                     .text:	section	.text,new
 802  0000               _TIM4_GenerateEvent:
 806                     ; 257     assert_param(IS_TIM4_EVENT_SOURCE_OK(TIM4_EventSource));
 808                     ; 260     TIM4->EGR = (uint8_t)(TIM4_EventSource);
 810  0000 c75345        	ld	21317,a
 811                     ; 261 }
 814  0003 81            	ret	
 846                     ; 270 void TIM4_SetCounter(uint8_t Counter)
 846                     ; 271 {
 847                     .text:	section	.text,new
 848  0000               _TIM4_SetCounter:
 852                     ; 273     TIM4->CNTR = (uint8_t)(Counter);
 854  0000 c75346        	ld	21318,a
 855                     ; 274 }
 858  0003 81            	ret	
 890                     ; 283 void TIM4_SetAutoreload(uint8_t Autoreload)
 890                     ; 284 {
 891                     .text:	section	.text,new
 892  0000               _TIM4_SetAutoreload:
 896                     ; 286     TIM4->ARR = (uint8_t)(Autoreload);
 898  0000 c75348        	ld	21320,a
 899                     ; 287 }
 902  0003 81            	ret	
 925                     ; 294 uint8_t TIM4_GetCounter(void)
 925                     ; 295 {
 926                     .text:	section	.text,new
 927  0000               _TIM4_GetCounter:
 931                     ; 297     return (uint8_t)(TIM4->CNTR);
 933  0000 c65346        	ld	a,21318
 936  0003 81            	ret	
 960                     ; 305 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 960                     ; 306 {
 961                     .text:	section	.text,new
 962  0000               _TIM4_GetPrescaler:
 966                     ; 308     return (TIM4_Prescaler_TypeDef)(TIM4->PSCR);
 968  0000 c65347        	ld	a,21319
 971  0003 81            	ret	
1050                     ; 318 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1050                     ; 319 {
1051                     .text:	section	.text,new
1052  0000               _TIM4_GetFlagStatus:
1054  0000 88            	push	a
1055       00000001      OFST:	set	1
1058                     ; 320     FlagStatus bitstatus = RESET;
1060                     ; 323     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1062                     ; 325   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1064  0001 c45344        	and	a,21316
1065  0004 2702          	jreq	L174
1066                     ; 327     bitstatus = SET;
1068  0006 a601          	ld	a,#1
1071  0008               L174:
1072                     ; 331     bitstatus = RESET;
1075                     ; 333   return ((FlagStatus)bitstatus);
1079  0008 5b01          	addw	sp,#1
1080  000a 81            	ret	
1115                     ; 343 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1115                     ; 344 {
1116                     .text:	section	.text,new
1117  0000               _TIM4_ClearFlag:
1121                     ; 346     assert_param(IS_TIM4_GET_FLAG_OK(TIM4_FLAG));
1123                     ; 349     TIM4->SR1 = (uint8_t)(~TIM4_FLAG);
1125  0000 43            	cpl	a
1126  0001 c75344        	ld	21316,a
1127                     ; 351 }
1130  0004 81            	ret	
1190                     ; 360 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1190                     ; 361 {
1191                     .text:	section	.text,new
1192  0000               _TIM4_GetITStatus:
1194  0000 88            	push	a
1195  0001 89            	pushw	x
1196       00000002      OFST:	set	2
1199                     ; 362     ITStatus bitstatus = RESET;
1201                     ; 364   uint8_t itstatus = 0x0, itenable = 0x0;
1205                     ; 367   assert_param(IS_TIM4_IT_OK(TIM4_IT));
1207                     ; 369   itstatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1209  0002 c45344        	and	a,21316
1210  0005 6b01          	ld	(OFST-1,sp),a
1212                     ; 371   itenable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1214  0007 c65343        	ld	a,21315
1215  000a 1403          	and	a,(OFST+1,sp)
1216  000c 6b02          	ld	(OFST+0,sp),a
1218                     ; 373   if ((itstatus != (uint8_t)RESET ) && (itenable != (uint8_t)RESET ))
1220  000e 7b01          	ld	a,(OFST-1,sp)
1221  0010 2708          	jreq	L145
1223  0012 7b02          	ld	a,(OFST+0,sp)
1224  0014 2704          	jreq	L145
1225                     ; 375     bitstatus = (ITStatus)SET;
1227  0016 a601          	ld	a,#1
1230  0018 2001          	jra	L345
1231  001a               L145:
1232                     ; 379     bitstatus = (ITStatus)RESET;
1234  001a 4f            	clr	a
1236  001b               L345:
1237                     ; 381   return ((ITStatus)bitstatus);
1241  001b 5b03          	addw	sp,#3
1242  001d 81            	ret	
1278                     ; 391 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1278                     ; 392 {
1279                     .text:	section	.text,new
1280  0000               _TIM4_ClearITPendingBit:
1284                     ; 394     assert_param(IS_TIM4_IT_OK(TIM4_IT));
1286                     ; 397     TIM4->SR1 = (uint8_t)(~TIM4_IT);
1288  0000 43            	cpl	a
1289  0001 c75344        	ld	21316,a
1290                     ; 398 }
1293  0004 81            	ret	
1306                     	xdef	_TIM4_ClearITPendingBit
1307                     	xdef	_TIM4_GetITStatus
1308                     	xdef	_TIM4_ClearFlag
1309                     	xdef	_TIM4_GetFlagStatus
1310                     	xdef	_TIM4_GetPrescaler
1311                     	xdef	_TIM4_GetCounter
1312                     	xdef	_TIM4_SetAutoreload
1313                     	xdef	_TIM4_SetCounter
1314                     	xdef	_TIM4_GenerateEvent
1315                     	xdef	_TIM4_ARRPreloadConfig
1316                     	xdef	_TIM4_PrescalerConfig
1317                     	xdef	_TIM4_SelectOnePulseMode
1318                     	xdef	_TIM4_UpdateRequestConfig
1319                     	xdef	_TIM4_UpdateDisableConfig
1320                     	xdef	_TIM4_ITConfig
1321                     	xdef	_TIM4_Cmd
1322                     	xdef	_TIM4_TimeBaseInit
1323                     	xdef	_TIM4_DeInit
1342                     	end
