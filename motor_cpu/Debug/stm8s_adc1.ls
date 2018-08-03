   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 48 void ADC1_DeInit(void)
  51                     ; 49 {
  53                     .text:	section	.text,new
  54  0000               _ADC1_DeInit:
  58                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  60  0000 725f5400      	clr	21504
  61                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  63  0004 725f5401      	clr	21505
  64                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  66  0008 725f5402      	clr	21506
  67                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  69  000c 725f5403      	clr	21507
  70                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  72  0010 725f5406      	clr	21510
  73                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  75  0014 725f5407      	clr	21511
  76                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  78  0018 35ff5408      	mov	21512,#255
  79                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  81  001c 35035409      	mov	21513,#3
  82                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  84  0020 725f540a      	clr	21514
  85                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  87  0024 725f540b      	clr	21515
  88                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  90  0028 725f540e      	clr	21518
  91                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  93  002c 725f540f      	clr	21519
  94                     ; 62 }
  97  0030 81            	ret	
 548                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 548                     ; 86 {
 549                     .text:	section	.text,new
 550  0000               _ADC1_Init:
 552  0000 89            	pushw	x
 553       00000000      OFST:	set	0
 556                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 558                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 560                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 562                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 564                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 566                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 568                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 570                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 572                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 574  0001 7b08          	ld	a,(OFST+8,sp)
 575  0003 88            	push	a
 576  0004 7b02          	ld	a,(OFST+2,sp)
 577  0006 95            	ld	xh,a
 578  0007 cd0000        	call	_ADC1_ConversionConfig
 580  000a 84            	pop	a
 581                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 583  000b 7b05          	ld	a,(OFST+5,sp)
 584  000d cd0000        	call	_ADC1_PrescalerConfig
 586                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 588  0010 7b07          	ld	a,(OFST+7,sp)
 589  0012 97            	ld	xl,a
 590  0013 7b06          	ld	a,(OFST+6,sp)
 591  0015 95            	ld	xh,a
 592  0016 cd0000        	call	_ADC1_ExternalTriggerConfig
 594                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 596  0019 7b0a          	ld	a,(OFST+10,sp)
 597  001b 97            	ld	xl,a
 598  001c 7b09          	ld	a,(OFST+9,sp)
 599  001e 95            	ld	xh,a
 600  001f cd0000        	call	_ADC1_SchmittTriggerConfig
 602                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 604  0022 72105401      	bset	21505,#0
 605                     ; 118 }
 608  0026 85            	popw	x
 609  0027 81            	ret	
 644                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 644                     ; 127 {
 645                     .text:	section	.text,new
 646  0000               _ADC1_Cmd:
 650                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 652                     ; 132     if (NewState != DISABLE)
 654  0000 4d            	tnz	a
 655  0001 2705          	jreq	L362
 656                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 658  0003 72105401      	bset	21505,#0
 661  0007 81            	ret	
 662  0008               L362:
 663                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 665  0008 72115401      	bres	21505,#0
 666                     ; 141 }
 669  000c 81            	ret	
 704                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 704                     ; 149 {
 705                     .text:	section	.text,new
 706  0000               _ADC1_ScanModeCmd:
 710                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 712                     ; 154     if (NewState != DISABLE)
 714  0000 4d            	tnz	a
 715  0001 2705          	jreq	L503
 716                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 718  0003 72125402      	bset	21506,#1
 721  0007 81            	ret	
 722  0008               L503:
 723                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 725  0008 72135402      	bres	21506,#1
 726                     ; 163 }
 729  000c 81            	ret	
 764                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 764                     ; 171 {
 765                     .text:	section	.text,new
 766  0000               _ADC1_DataBufferCmd:
 770                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 772                     ; 176     if (NewState != DISABLE)
 774  0000 4d            	tnz	a
 775  0001 2705          	jreq	L723
 776                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 778  0003 721e5403      	bset	21507,#7
 781  0007 81            	ret	
 782  0008               L723:
 783                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 785  0008 721f5403      	bres	21507,#7
 786                     ; 185 }
 789  000c 81            	ret	
 945                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 945                     ; 197 {
 946                     .text:	section	.text,new
 947  0000               _ADC1_ITConfig:
 949  0000 89            	pushw	x
 950       00000000      OFST:	set	0
 953                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 955                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 957                     ; 203     if (NewState != DISABLE)
 959  0001 7b05          	ld	a,(OFST+5,sp)
 960  0003 2706          	jreq	L714
 961                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 963  0005 9f            	ld	a,xl
 964  0006 ca5400        	or	a,21504
 966  0009 2006          	jra	L124
 967  000b               L714:
 968                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 970  000b 7b02          	ld	a,(OFST+2,sp)
 971  000d 43            	cpl	a
 972  000e c45400        	and	a,21504
 973  0011               L124:
 974  0011 c75400        	ld	21504,a
 975                     ; 214 }
 978  0014 85            	popw	x
 979  0015 81            	ret	
1015                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1015                     ; 223 {
1016                     .text:	section	.text,new
1017  0000               _ADC1_PrescalerConfig:
1019  0000 88            	push	a
1020       00000000      OFST:	set	0
1023                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1025                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1027  0001 c65401        	ld	a,21505
1028  0004 a48f          	and	a,#143
1029  0006 c75401        	ld	21505,a
1030                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1032  0009 c65401        	ld	a,21505
1033  000c 1a01          	or	a,(OFST+1,sp)
1034  000e c75401        	ld	21505,a
1035                     ; 233 }
1038  0011 84            	pop	a
1039  0012 81            	ret	
1086                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1086                     ; 245 {
1087                     .text:	section	.text,new
1088  0000               _ADC1_SchmittTriggerConfig:
1090  0000 89            	pushw	x
1091       00000000      OFST:	set	0
1094                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1096                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1098                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1100  0001 9e            	ld	a,xh
1101  0002 4c            	inc	a
1102  0003 261d          	jrne	L364
1103                     ; 253         if (NewState != DISABLE)
1105  0005 9f            	ld	a,xl
1106  0006 4d            	tnz	a
1107  0007 270a          	jreq	L564
1108                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1110  0009 725f5407      	clr	21511
1111                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1113  000d 725f5406      	clr	21510
1115  0011 2059          	jra	L174
1116  0013               L564:
1117                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1119  0013 c65407        	ld	a,21511
1120  0016 aaff          	or	a,#255
1121  0018 c75407        	ld	21511,a
1122                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1124  001b c65406        	ld	a,21510
1125  001e aaff          	or	a,#255
1126  0020 2047          	jp	LC001
1127  0022               L364:
1128                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1130  0022 7b01          	ld	a,(OFST+1,sp)
1131  0024 a108          	cp	a,#8
1132  0026 0d02          	tnz	(OFST+2,sp)
1133  0028 2420          	jruge	L374
1134                     ; 266         if (NewState != DISABLE)
1136  002a 2711          	jreq	L574
1137                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1139  002c ad40          	call	LC003
1140  002e 2704          	jreq	L43
1141  0030               L63:
1142  0030 48            	sll	a
1143  0031 5a            	decw	x
1144  0032 26fc          	jrne	L63
1145  0034               L43:
1146  0034 43            	cpl	a
1147  0035 c45407        	and	a,21511
1148  0038               LC002:
1149  0038 c75407        	ld	21511,a
1151  003b 202f          	jra	L174
1152  003d               L574:
1153                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1155  003d ad2f          	call	LC003
1156  003f 2704          	jreq	L04
1157  0041               L24:
1158  0041 48            	sll	a
1159  0042 5a            	decw	x
1160  0043 26fc          	jrne	L24
1161  0045               L04:
1162  0045 ca5407        	or	a,21511
1163  0048 20ee          	jp	LC002
1164  004a               L374:
1165                     ; 277         if (NewState != DISABLE)
1167  004a 2710          	jreq	L305
1168                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1170  004c a008          	sub	a,#8
1171  004e ad1e          	call	LC003
1172  0050 2704          	jreq	L44
1173  0052               L64:
1174  0052 48            	sll	a
1175  0053 5a            	decw	x
1176  0054 26fc          	jrne	L64
1177  0056               L44:
1178  0056 43            	cpl	a
1179  0057 c45406        	and	a,21510
1181  005a 200d          	jp	LC001
1182  005c               L305:
1183                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1185  005c a008          	sub	a,#8
1186  005e ad0e          	call	LC003
1187  0060 2704          	jreq	L05
1188  0062               L25:
1189  0062 48            	sll	a
1190  0063 5a            	decw	x
1191  0064 26fc          	jrne	L25
1192  0066               L05:
1193  0066 ca5406        	or	a,21510
1194  0069               LC001:
1195  0069 c75406        	ld	21510,a
1196  006c               L174:
1197                     ; 287 }
1200  006c 85            	popw	x
1201  006d 81            	ret	
1202  006e               LC003:
1203  006e 5f            	clrw	x
1204  006f 97            	ld	xl,a
1205  0070 a601          	ld	a,#1
1206  0072 5d            	tnzw	x
1207  0073 81            	ret	
1264                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1264                     ; 301 {
1265                     .text:	section	.text,new
1266  0000               _ADC1_ConversionConfig:
1268  0000 89            	pushw	x
1269       00000000      OFST:	set	0
1272                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1274                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1276                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1278                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1280  0001 72175402      	bres	21506,#3
1281                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1283  0005 c65402        	ld	a,21506
1284  0008 1a05          	or	a,(OFST+5,sp)
1285  000a c75402        	ld	21506,a
1286                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1288  000d 9e            	ld	a,xh
1289  000e 4a            	dec	a
1290  000f 2606          	jrne	L535
1291                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1293  0011 72125401      	bset	21505,#1
1295  0015 2004          	jra	L735
1296  0017               L535:
1297                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1299  0017 72135401      	bres	21505,#1
1300  001b               L735:
1301                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1303  001b c65400        	ld	a,21504
1304  001e a4f0          	and	a,#240
1305  0020 c75400        	ld	21504,a
1306                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1308  0023 c65400        	ld	a,21504
1309  0026 1a02          	or	a,(OFST+2,sp)
1310  0028 c75400        	ld	21504,a
1311                     ; 329 }
1314  002b 85            	popw	x
1315  002c 81            	ret	
1361                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1361                     ; 343 {
1362                     .text:	section	.text,new
1363  0000               _ADC1_ExternalTriggerConfig:
1365  0000 89            	pushw	x
1366       00000000      OFST:	set	0
1369                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1371                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1373                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1375  0001 c65402        	ld	a,21506
1376  0004 a4cf          	and	a,#207
1377  0006 c75402        	ld	21506,a
1378                     ; 352     if (NewState != DISABLE)
1380  0009 9f            	ld	a,xl
1381  000a 4d            	tnz	a
1382  000b 2706          	jreq	L365
1383                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1385  000d 721c5402      	bset	21506,#6
1387  0011 2004          	jra	L565
1388  0013               L365:
1389                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1391  0013 721d5402      	bres	21506,#6
1392  0017               L565:
1393                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1395  0017 c65402        	ld	a,21506
1396  001a 1a01          	or	a,(OFST+1,sp)
1397  001c c75402        	ld	21506,a
1398                     ; 366 }
1401  001f 85            	popw	x
1402  0020 81            	ret	
1426                     ; 378 void ADC1_StartConversion(void)
1426                     ; 379 {
1427                     .text:	section	.text,new
1428  0000               _ADC1_StartConversion:
1432                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1434  0000 72105401      	bset	21505,#0
1435                     ; 381 }
1438  0004 81            	ret	
1478                     ; 390 uint16_t ADC1_GetConversionValue(void)
1478                     ; 391 {
1479                     .text:	section	.text,new
1480  0000               _ADC1_GetConversionValue:
1482  0000 5205          	subw	sp,#5
1483       00000005      OFST:	set	5
1486                     ; 393     uint16_t temph = 0;
1488                     ; 394     uint8_t templ = 0;
1490                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1492  0002 720754020e    	btjf	21506,#3,L516
1493                     ; 399         templ = ADC1->DRL;
1495  0007 c65405        	ld	a,21509
1496  000a 6b03          	ld	(OFST-2,sp),a
1498                     ; 401         temph = ADC1->DRH;
1500  000c c65404        	ld	a,21508
1501  000f 97            	ld	xl,a
1503                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1505  0010 7b03          	ld	a,(OFST-2,sp)
1506  0012 02            	rlwa	x,a
1509  0013 201a          	jra	L716
1510  0015               L516:
1511                     ; 408         temph = ADC1->DRH;
1513  0015 c65404        	ld	a,21508
1514  0018 97            	ld	xl,a
1516                     ; 410         templ = ADC1->DRL;
1518  0019 c65405        	ld	a,21509
1519  001c 6b03          	ld	(OFST-2,sp),a
1521                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1523  001e 4f            	clr	a
1524  001f 02            	rlwa	x,a
1525  0020 1f01          	ldw	(OFST-4,sp),x
1527  0022 7b03          	ld	a,(OFST-2,sp)
1528  0024 97            	ld	xl,a
1529  0025 a640          	ld	a,#64
1530  0027 42            	mul	x,a
1531  0028 01            	rrwa	x,a
1532  0029 1a02          	or	a,(OFST-3,sp)
1533  002b 01            	rrwa	x,a
1534  002c 1a01          	or	a,(OFST-4,sp)
1535  002e 01            	rrwa	x,a
1537  002f               L716:
1538                     ; 415     return ((uint16_t)temph);
1542  002f 5b05          	addw	sp,#5
1543  0031 81            	ret	
1589                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1589                     ; 428 {
1590                     .text:	section	.text,new
1591  0000               _ADC1_AWDChannelConfig:
1593  0000 89            	pushw	x
1594       00000000      OFST:	set	0
1597                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1599                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1601                     ; 433     if (Channel < (uint8_t)8)
1603  0001 9e            	ld	a,xh
1604  0002 a108          	cp	a,#8
1605  0004 2425          	jruge	L346
1606                     ; 435         if (NewState != DISABLE)
1608  0006 9f            	ld	a,xl
1609  0007 4d            	tnz	a
1610  0008 270e          	jreq	L546
1611                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1613  000a 9e            	ld	a,xh
1614  000b ad48          	call	LC006
1615  000d 2704          	jreq	L66
1616  000f               L07:
1617  000f 48            	sll	a
1618  0010 5a            	decw	x
1619  0011 26fc          	jrne	L07
1620  0013               L66:
1621  0013 ca540f        	or	a,21519
1623  0016 200e          	jp	LC005
1624  0018               L546:
1625                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1627  0018 7b01          	ld	a,(OFST+1,sp)
1628  001a ad39          	call	LC006
1629  001c 2704          	jreq	L27
1630  001e               L47:
1631  001e 48            	sll	a
1632  001f 5a            	decw	x
1633  0020 26fc          	jrne	L47
1634  0022               L27:
1635  0022 43            	cpl	a
1636  0023 c4540f        	and	a,21519
1637  0026               LC005:
1638  0026 c7540f        	ld	21519,a
1639  0029 2028          	jra	L156
1640  002b               L346:
1641                     ; 446         if (NewState != DISABLE)
1643  002b 7b02          	ld	a,(OFST+2,sp)
1644  002d 2711          	jreq	L356
1645                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1647  002f 7b01          	ld	a,(OFST+1,sp)
1648  0031 a008          	sub	a,#8
1649  0033 ad20          	call	LC006
1650  0035 2704          	jreq	L67
1651  0037               L001:
1652  0037 48            	sll	a
1653  0038 5a            	decw	x
1654  0039 26fc          	jrne	L001
1655  003b               L67:
1656  003b ca540e        	or	a,21518
1658  003e 2010          	jp	LC004
1659  0040               L356:
1660                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1662  0040 7b01          	ld	a,(OFST+1,sp)
1663  0042 a008          	sub	a,#8
1664  0044 ad0f          	call	LC006
1665  0046 2704          	jreq	L201
1666  0048               L401:
1667  0048 48            	sll	a
1668  0049 5a            	decw	x
1669  004a 26fc          	jrne	L401
1670  004c               L201:
1671  004c 43            	cpl	a
1672  004d c4540e        	and	a,21518
1673  0050               LC004:
1674  0050 c7540e        	ld	21518,a
1675  0053               L156:
1676                     ; 455 }
1679  0053 85            	popw	x
1680  0054 81            	ret	
1681  0055               LC006:
1682  0055 5f            	clrw	x
1683  0056 97            	ld	xl,a
1684  0057 a601          	ld	a,#1
1685  0059 5d            	tnzw	x
1686  005a 81            	ret	
1719                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1719                     ; 464 {
1720                     .text:	section	.text,new
1721  0000               _ADC1_SetHighThreshold:
1723  0000 89            	pushw	x
1724       00000000      OFST:	set	0
1727                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1729  0001 54            	srlw	x
1730  0002 54            	srlw	x
1731  0003 9f            	ld	a,xl
1732  0004 c75408        	ld	21512,a
1733                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1735  0007 7b02          	ld	a,(OFST+2,sp)
1736  0009 c75409        	ld	21513,a
1737                     ; 467 }
1740  000c 85            	popw	x
1741  000d 81            	ret	
1774                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1774                     ; 476 {
1775                     .text:	section	.text,new
1776  0000               _ADC1_SetLowThreshold:
1780                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1782  0000 9f            	ld	a,xl
1783  0001 c7540b        	ld	21515,a
1784                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1786  0004 54            	srlw	x
1787  0005 54            	srlw	x
1788  0006 9f            	ld	a,xl
1789  0007 c7540a        	ld	21514,a
1790                     ; 479 }
1793  000a 81            	ret	
1840                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1840                     ; 489 {
1841                     .text:	section	.text,new
1842  0000               _ADC1_GetBufferValue:
1844  0000 88            	push	a
1845  0001 5205          	subw	sp,#5
1846       00000005      OFST:	set	5
1849                     ; 491     uint16_t temph = 0;
1851                     ; 492     uint8_t templ = 0;
1853                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1855                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1857  0003 48            	sll	a
1858  0004 5f            	clrw	x
1859  0005 97            	ld	xl,a
1860  0006 7207540213    	btjf	21506,#3,L727
1861                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1863  000b d653e1        	ld	a,(21473,x)
1864  000e 6b03          	ld	(OFST-2,sp),a
1866                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1868  0010 7b06          	ld	a,(OFST+1,sp)
1869  0012 48            	sll	a
1870  0013 5f            	clrw	x
1871  0014 97            	ld	xl,a
1872  0015 d653e0        	ld	a,(21472,x)
1873  0018 97            	ld	xl,a
1875                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1877  0019 7b03          	ld	a,(OFST-2,sp)
1878  001b 02            	rlwa	x,a
1881  001c 2024          	jra	L137
1882  001e               L727:
1883                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1885  001e d653e0        	ld	a,(21472,x)
1886  0021 5f            	clrw	x
1887  0022 97            	ld	xl,a
1888  0023 1f04          	ldw	(OFST-1,sp),x
1890                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1892  0025 7b06          	ld	a,(OFST+1,sp)
1893  0027 48            	sll	a
1894  0028 5f            	clrw	x
1895  0029 97            	ld	xl,a
1896  002a d653e1        	ld	a,(21473,x)
1897  002d 6b03          	ld	(OFST-2,sp),a
1899                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1901  002f 4f            	clr	a
1902  0030 1e04          	ldw	x,(OFST-1,sp)
1903  0032 02            	rlwa	x,a
1904  0033 1f01          	ldw	(OFST-4,sp),x
1906  0035 7b03          	ld	a,(OFST-2,sp)
1907  0037 97            	ld	xl,a
1908  0038 a640          	ld	a,#64
1909  003a 42            	mul	x,a
1910  003b 01            	rrwa	x,a
1911  003c 1a02          	or	a,(OFST-3,sp)
1912  003e 01            	rrwa	x,a
1913  003f 1a01          	or	a,(OFST-4,sp)
1914  0041 01            	rrwa	x,a
1916  0042               L137:
1917                     ; 516     return ((uint16_t)temph);
1921  0042 5b06          	addw	sp,#6
1922  0044 81            	ret	
1986                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
1986                     ; 527 {
1987                     .text:	section	.text,new
1988  0000               _ADC1_GetAWDChannelStatus:
1990  0000 88            	push	a
1991  0001 88            	push	a
1992       00000001      OFST:	set	1
1995                     ; 528     uint8_t status = 0;
1997                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1999                     ; 533     if (Channel < (uint8_t)8)
2001  0002 a108          	cp	a,#8
2002  0004 2410          	jruge	L367
2003                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2005  0006 5f            	clrw	x
2006  0007 97            	ld	xl,a
2007  0008 a601          	ld	a,#1
2008  000a 5d            	tnzw	x
2009  000b 2704          	jreq	L611
2010  000d               L021:
2011  000d 48            	sll	a
2012  000e 5a            	decw	x
2013  000f 26fc          	jrne	L021
2014  0011               L611:
2015  0011 c4540d        	and	a,21517
2018  0014 2010          	jra	L567
2019  0016               L367:
2020                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2022  0016 a008          	sub	a,#8
2023  0018 5f            	clrw	x
2024  0019 97            	ld	xl,a
2025  001a a601          	ld	a,#1
2026  001c 5d            	tnzw	x
2027  001d 2704          	jreq	L221
2028  001f               L421:
2029  001f 48            	sll	a
2030  0020 5a            	decw	x
2031  0021 26fc          	jrne	L421
2032  0023               L221:
2033  0023 c4540c        	and	a,21516
2035  0026               L567:
2036                     ; 542     return ((FlagStatus)status);
2040  0026 85            	popw	x
2041  0027 81            	ret	
2195                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2195                     ; 552 {
2196                     .text:	section	.text,new
2197  0000               _ADC1_GetFlagStatus:
2199  0000 88            	push	a
2200  0001 88            	push	a
2201       00000001      OFST:	set	1
2204                     ; 553     uint8_t flagstatus = 0;
2206                     ; 554     uint8_t temp = 0;
2208                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2210                     ; 559     if ((Flag & 0x0F) == 0x01)
2212  0002 a40f          	and	a,#15
2213  0004 4a            	dec	a
2214  0005 2607          	jrne	L1501
2215                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2217  0007 c65403        	ld	a,21507
2218  000a a440          	and	a,#64
2221  000c 2039          	jra	L3501
2222  000e               L1501:
2223                     ; 564     else if ((Flag & 0xF0) == 0x10)
2225  000e 7b02          	ld	a,(OFST+1,sp)
2226  0010 a4f0          	and	a,#240
2227  0012 a110          	cp	a,#16
2228  0014 262c          	jrne	L5501
2229                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2231  0016 7b02          	ld	a,(OFST+1,sp)
2232  0018 a40f          	and	a,#15
2233  001a 6b01          	ld	(OFST+0,sp),a
2235                     ; 568         if (temp < 8)
2237  001c a108          	cp	a,#8
2238  001e 2410          	jruge	L7501
2239                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2241  0020 5f            	clrw	x
2242  0021 97            	ld	xl,a
2243  0022 a601          	ld	a,#1
2244  0024 5d            	tnzw	x
2245  0025 2704          	jreq	L031
2246  0027               L231:
2247  0027 48            	sll	a
2248  0028 5a            	decw	x
2249  0029 26fc          	jrne	L231
2250  002b               L031:
2251  002b c4540d        	and	a,21517
2254  002e 2017          	jra	L3501
2255  0030               L7501:
2256                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2258  0030 a008          	sub	a,#8
2259  0032 5f            	clrw	x
2260  0033 97            	ld	xl,a
2261  0034 a601          	ld	a,#1
2262  0036 5d            	tnzw	x
2263  0037 2704          	jreq	L431
2264  0039               L631:
2265  0039 48            	sll	a
2266  003a 5a            	decw	x
2267  003b 26fc          	jrne	L631
2268  003d               L431:
2269  003d c4540c        	and	a,21516
2271  0040 2005          	jra	L3501
2272  0042               L5501:
2273                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2275  0042 c65400        	ld	a,21504
2276  0045 1402          	and	a,(OFST+1,sp)
2278  0047               L3501:
2279                     ; 581     return ((FlagStatus)flagstatus);
2283  0047 85            	popw	x
2284  0048 81            	ret	
2326                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2326                     ; 592 {
2327                     .text:	section	.text,new
2328  0000               _ADC1_ClearFlag:
2330  0000 88            	push	a
2331  0001 88            	push	a
2332       00000001      OFST:	set	1
2335                     ; 593     uint8_t temp = 0;
2337                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2339                     ; 598     if ((Flag & 0x0F) == 0x01)
2341  0002 a40f          	and	a,#15
2342  0004 4a            	dec	a
2343  0005 2606          	jrne	L5011
2344                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2346  0007 721d5403      	bres	21507,#6
2348  000b 2045          	jra	L7011
2349  000d               L5011:
2350                     ; 603     else if ((Flag & 0xF0) == 0x10)
2352  000d 7b02          	ld	a,(OFST+1,sp)
2353  000f a4f0          	and	a,#240
2354  0011 a110          	cp	a,#16
2355  0013 2634          	jrne	L1111
2356                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2358  0015 7b02          	ld	a,(OFST+1,sp)
2359  0017 a40f          	and	a,#15
2360  0019 6b01          	ld	(OFST+0,sp),a
2362                     ; 607         if (temp < 8)
2364  001b a108          	cp	a,#8
2365  001d 2414          	jruge	L3111
2366                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2368  001f 5f            	clrw	x
2369  0020 97            	ld	xl,a
2370  0021 a601          	ld	a,#1
2371  0023 5d            	tnzw	x
2372  0024 2704          	jreq	L241
2373  0026               L441:
2374  0026 48            	sll	a
2375  0027 5a            	decw	x
2376  0028 26fc          	jrne	L441
2377  002a               L241:
2378  002a 43            	cpl	a
2379  002b c4540d        	and	a,21517
2380  002e c7540d        	ld	21517,a
2382  0031 201f          	jra	L7011
2383  0033               L3111:
2384                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2386  0033 a008          	sub	a,#8
2387  0035 5f            	clrw	x
2388  0036 97            	ld	xl,a
2389  0037 a601          	ld	a,#1
2390  0039 5d            	tnzw	x
2391  003a 2704          	jreq	L641
2392  003c               L051:
2393  003c 48            	sll	a
2394  003d 5a            	decw	x
2395  003e 26fc          	jrne	L051
2396  0040               L641:
2397  0040 43            	cpl	a
2398  0041 c4540c        	and	a,21516
2399  0044 c7540c        	ld	21516,a
2400  0047 2009          	jra	L7011
2401  0049               L1111:
2402                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2404  0049 7b02          	ld	a,(OFST+1,sp)
2405  004b 43            	cpl	a
2406  004c c45400        	and	a,21504
2407  004f c75400        	ld	21504,a
2408  0052               L7011:
2409                     ; 620 }
2412  0052 85            	popw	x
2413  0053 81            	ret	
2466                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2466                     ; 641 {
2467                     .text:	section	.text,new
2468  0000               _ADC1_GetITStatus:
2470  0000 89            	pushw	x
2471  0001 88            	push	a
2472       00000001      OFST:	set	1
2475                     ; 642     ITStatus itstatus = RESET;
2477                     ; 643     uint8_t temp = 0;
2479                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2481                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2483  0002 01            	rrwa	x,a
2484  0003 a4f0          	and	a,#240
2485  0005 5f            	clrw	x
2486  0006 02            	rlwa	x,a
2487  0007 a30010        	cpw	x,#16
2488  000a 262c          	jrne	L5411
2489                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2491  000c 7b03          	ld	a,(OFST+2,sp)
2492  000e a40f          	and	a,#15
2493  0010 6b01          	ld	(OFST+0,sp),a
2495                     ; 652         if (temp < 8)
2497  0012 a108          	cp	a,#8
2498  0014 2410          	jruge	L7411
2499                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2501  0016 5f            	clrw	x
2502  0017 97            	ld	xl,a
2503  0018 a601          	ld	a,#1
2504  001a 5d            	tnzw	x
2505  001b 2704          	jreq	L451
2506  001d               L651:
2507  001d 48            	sll	a
2508  001e 5a            	decw	x
2509  001f 26fc          	jrne	L651
2510  0021               L451:
2511  0021 c4540d        	and	a,21517
2514  0024 2017          	jra	L3511
2515  0026               L7411:
2516                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2518  0026 a008          	sub	a,#8
2519  0028 5f            	clrw	x
2520  0029 97            	ld	xl,a
2521  002a a601          	ld	a,#1
2522  002c 5d            	tnzw	x
2523  002d 2704          	jreq	L061
2524  002f               L261:
2525  002f 48            	sll	a
2526  0030 5a            	decw	x
2527  0031 26fc          	jrne	L261
2528  0033               L061:
2529  0033 c4540c        	and	a,21516
2531  0036 2005          	jra	L3511
2532  0038               L5411:
2533                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2535  0038 c65400        	ld	a,21504
2536  003b 1403          	and	a,(OFST+2,sp)
2538  003d               L3511:
2539                     ; 665     return ((ITStatus)itstatus);
2543  003d 5b03          	addw	sp,#3
2544  003f 81            	ret	
2587                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2587                     ; 688 {
2588                     .text:	section	.text,new
2589  0000               _ADC1_ClearITPendingBit:
2591  0000 89            	pushw	x
2592  0001 88            	push	a
2593       00000001      OFST:	set	1
2596                     ; 689     uint8_t temp = 0;
2598                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2600                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2602  0002 01            	rrwa	x,a
2603  0003 a4f0          	and	a,#240
2604  0005 5f            	clrw	x
2605  0006 02            	rlwa	x,a
2606  0007 a30010        	cpw	x,#16
2607  000a 2634          	jrne	L5711
2608                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2610  000c 7b03          	ld	a,(OFST+2,sp)
2611  000e a40f          	and	a,#15
2612  0010 6b01          	ld	(OFST+0,sp),a
2614                     ; 698         if (temp < 8)
2616  0012 a108          	cp	a,#8
2617  0014 2414          	jruge	L7711
2618                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2620  0016 5f            	clrw	x
2621  0017 97            	ld	xl,a
2622  0018 a601          	ld	a,#1
2623  001a 5d            	tnzw	x
2624  001b 2704          	jreq	L661
2625  001d               L071:
2626  001d 48            	sll	a
2627  001e 5a            	decw	x
2628  001f 26fc          	jrne	L071
2629  0021               L661:
2630  0021 43            	cpl	a
2631  0022 c4540d        	and	a,21517
2632  0025 c7540d        	ld	21517,a
2634  0028 201f          	jra	L3021
2635  002a               L7711:
2636                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2638  002a a008          	sub	a,#8
2639  002c 5f            	clrw	x
2640  002d 97            	ld	xl,a
2641  002e a601          	ld	a,#1
2642  0030 5d            	tnzw	x
2643  0031 2704          	jreq	L271
2644  0033               L471:
2645  0033 48            	sll	a
2646  0034 5a            	decw	x
2647  0035 26fc          	jrne	L471
2648  0037               L271:
2649  0037 43            	cpl	a
2650  0038 c4540c        	and	a,21516
2651  003b c7540c        	ld	21516,a
2652  003e 2009          	jra	L3021
2653  0040               L5711:
2654                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2656  0040 7b03          	ld	a,(OFST+2,sp)
2657  0042 43            	cpl	a
2658  0043 c45400        	and	a,21504
2659  0046 c75400        	ld	21504,a
2660  0049               L3021:
2661                     ; 711 }
2664  0049 5b03          	addw	sp,#3
2665  004b 81            	ret	
2678                     	xdef	_ADC1_ClearITPendingBit
2679                     	xdef	_ADC1_GetITStatus
2680                     	xdef	_ADC1_ClearFlag
2681                     	xdef	_ADC1_GetFlagStatus
2682                     	xdef	_ADC1_GetAWDChannelStatus
2683                     	xdef	_ADC1_GetBufferValue
2684                     	xdef	_ADC1_SetLowThreshold
2685                     	xdef	_ADC1_SetHighThreshold
2686                     	xdef	_ADC1_GetConversionValue
2687                     	xdef	_ADC1_StartConversion
2688                     	xdef	_ADC1_AWDChannelConfig
2689                     	xdef	_ADC1_ExternalTriggerConfig
2690                     	xdef	_ADC1_ConversionConfig
2691                     	xdef	_ADC1_SchmittTriggerConfig
2692                     	xdef	_ADC1_PrescalerConfig
2693                     	xdef	_ADC1_ITConfig
2694                     	xdef	_ADC1_DataBufferCmd
2695                     	xdef	_ADC1_ScanModeCmd
2696                     	xdef	_ADC1_Cmd
2697                     	xdef	_ADC1_Init
2698                     	xdef	_ADC1_DeInit
2717                     	end
