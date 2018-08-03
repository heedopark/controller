   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 48 void ADC1_DeInit(void)
  45                     ; 49 {
  47                     	switch	.text
  48  0000               _ADC1_DeInit:
  52                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  54  0000 725f5400      	clr	21504
  55                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  57  0004 725f5401      	clr	21505
  58                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  60  0008 725f5402      	clr	21506
  61                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  63  000c 725f5403      	clr	21507
  64                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  66  0010 725f5406      	clr	21510
  67                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  69  0014 725f5407      	clr	21511
  70                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  72  0018 35ff5408      	mov	21512,#255
  73                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  75  001c 35035409      	mov	21513,#3
  76                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  78  0020 725f540a      	clr	21514
  79                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  81  0024 725f540b      	clr	21515
  82                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  84  0028 725f540e      	clr	21518
  85                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  87  002c 725f540f      	clr	21519
  88                     ; 62 }
  91  0030 81            	ret
 542                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 542                     ; 86 {
 543                     	switch	.text
 544  0031               _ADC1_Init:
 546  0031 89            	pushw	x
 547       00000000      OFST:	set	0
 550                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 552                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 554                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 556                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 558                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 560                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 562                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 564                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 566                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 568  0032 7b08          	ld	a,(OFST+8,sp)
 569  0034 88            	push	a
 570  0035 9f            	ld	a,xl
 571  0036 97            	ld	xl,a
 572  0037 7b02          	ld	a,(OFST+2,sp)
 573  0039 95            	ld	xh,a
 574  003a cd013d        	call	_ADC1_ConversionConfig
 576  003d 84            	pop	a
 577                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 579  003e 7b05          	ld	a,(OFST+5,sp)
 580  0040 ad5a          	call	_ADC1_PrescalerConfig
 582                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 584  0042 7b07          	ld	a,(OFST+7,sp)
 585  0044 97            	ld	xl,a
 586  0045 7b06          	ld	a,(OFST+6,sp)
 587  0047 95            	ld	xh,a
 588  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 590                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 592  004b 7b0a          	ld	a,(OFST+10,sp)
 593  004d 97            	ld	xl,a
 594  004e 7b09          	ld	a,(OFST+9,sp)
 595  0050 95            	ld	xh,a
 596  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 598                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 600  0053 72105401      	bset	21505,#0
 601                     ; 118 }
 604  0057 85            	popw	x
 605  0058 81            	ret
 640                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 640                     ; 127 {
 641                     	switch	.text
 642  0059               _ADC1_Cmd:
 646                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 648                     ; 132     if (NewState != DISABLE)
 650  0059 4d            	tnz	a
 651  005a 2706          	jreq	L362
 652                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 654  005c 72105401      	bset	21505,#0
 656  0060 2004          	jra	L562
 657  0062               L362:
 658                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 660  0062 72115401      	bres	21505,#0
 661  0066               L562:
 662                     ; 141 }
 665  0066 81            	ret
 700                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 700                     ; 149 {
 701                     	switch	.text
 702  0067               _ADC1_ScanModeCmd:
 706                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 708                     ; 154     if (NewState != DISABLE)
 710  0067 4d            	tnz	a
 711  0068 2706          	jreq	L503
 712                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 714  006a 72125402      	bset	21506,#1
 716  006e 2004          	jra	L703
 717  0070               L503:
 718                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 720  0070 72135402      	bres	21506,#1
 721  0074               L703:
 722                     ; 163 }
 725  0074 81            	ret
 760                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 760                     ; 171 {
 761                     	switch	.text
 762  0075               _ADC1_DataBufferCmd:
 766                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 768                     ; 176     if (NewState != DISABLE)
 770  0075 4d            	tnz	a
 771  0076 2706          	jreq	L723
 772                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 774  0078 721e5403      	bset	21507,#7
 776  007c 2004          	jra	L133
 777  007e               L723:
 778                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 780  007e 721f5403      	bres	21507,#7
 781  0082               L133:
 782                     ; 185 }
 785  0082 81            	ret
 941                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 941                     ; 197 {
 942                     	switch	.text
 943  0083               _ADC1_ITConfig:
 945  0083 89            	pushw	x
 946       00000000      OFST:	set	0
 949                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 951                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 953                     ; 203     if (NewState != DISABLE)
 955  0084 0d05          	tnz	(OFST+5,sp)
 956  0086 2709          	jreq	L714
 957                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 959  0088 9f            	ld	a,xl
 960  0089 ca5400        	or	a,21504
 961  008c c75400        	ld	21504,a
 963  008f 2009          	jra	L124
 964  0091               L714:
 965                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 967  0091 7b02          	ld	a,(OFST+2,sp)
 968  0093 43            	cpl	a
 969  0094 c45400        	and	a,21504
 970  0097 c75400        	ld	21504,a
 971  009a               L124:
 972                     ; 214 }
 975  009a 85            	popw	x
 976  009b 81            	ret
1012                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1012                     ; 223 {
1013                     	switch	.text
1014  009c               _ADC1_PrescalerConfig:
1016  009c 88            	push	a
1017       00000000      OFST:	set	0
1020                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1022                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1024  009d c65401        	ld	a,21505
1025  00a0 a48f          	and	a,#143
1026  00a2 c75401        	ld	21505,a
1027                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1029  00a5 c65401        	ld	a,21505
1030  00a8 1a01          	or	a,(OFST+1,sp)
1031  00aa c75401        	ld	21505,a
1032                     ; 233 }
1035  00ad 84            	pop	a
1036  00ae 81            	ret
1083                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1083                     ; 245 {
1084                     	switch	.text
1085  00af               _ADC1_SchmittTriggerConfig:
1087  00af 89            	pushw	x
1088       00000000      OFST:	set	0
1091                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1093                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1095                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1097  00b0 9e            	ld	a,xh
1098  00b1 a1ff          	cp	a,#255
1099  00b3 2620          	jrne	L364
1100                     ; 253         if (NewState != DISABLE)
1102  00b5 9f            	ld	a,xl
1103  00b6 4d            	tnz	a
1104  00b7 270a          	jreq	L564
1105                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1107  00b9 725f5407      	clr	21511
1108                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1110  00bd 725f5406      	clr	21510
1112  00c1 2078          	jra	L174
1113  00c3               L564:
1114                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1116  00c3 c65407        	ld	a,21511
1117  00c6 aaff          	or	a,#255
1118  00c8 c75407        	ld	21511,a
1119                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1121  00cb c65406        	ld	a,21510
1122  00ce aaff          	or	a,#255
1123  00d0 c75406        	ld	21510,a
1124  00d3 2066          	jra	L174
1125  00d5               L364:
1126                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1128  00d5 7b01          	ld	a,(OFST+1,sp)
1129  00d7 a108          	cp	a,#8
1130  00d9 242f          	jruge	L374
1131                     ; 266         if (NewState != DISABLE)
1133  00db 0d02          	tnz	(OFST+2,sp)
1134  00dd 2716          	jreq	L574
1135                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1137  00df 7b01          	ld	a,(OFST+1,sp)
1138  00e1 5f            	clrw	x
1139  00e2 97            	ld	xl,a
1140  00e3 a601          	ld	a,#1
1141  00e5 5d            	tnzw	x
1142  00e6 2704          	jreq	L42
1143  00e8               L62:
1144  00e8 48            	sll	a
1145  00e9 5a            	decw	x
1146  00ea 26fc          	jrne	L62
1147  00ec               L42:
1148  00ec 43            	cpl	a
1149  00ed c45407        	and	a,21511
1150  00f0 c75407        	ld	21511,a
1152  00f3 2046          	jra	L174
1153  00f5               L574:
1154                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1156  00f5 7b01          	ld	a,(OFST+1,sp)
1157  00f7 5f            	clrw	x
1158  00f8 97            	ld	xl,a
1159  00f9 a601          	ld	a,#1
1160  00fb 5d            	tnzw	x
1161  00fc 2704          	jreq	L03
1162  00fe               L23:
1163  00fe 48            	sll	a
1164  00ff 5a            	decw	x
1165  0100 26fc          	jrne	L23
1166  0102               L03:
1167  0102 ca5407        	or	a,21511
1168  0105 c75407        	ld	21511,a
1169  0108 2031          	jra	L174
1170  010a               L374:
1171                     ; 277         if (NewState != DISABLE)
1173  010a 0d02          	tnz	(OFST+2,sp)
1174  010c 2718          	jreq	L305
1175                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1177  010e 7b01          	ld	a,(OFST+1,sp)
1178  0110 a008          	sub	a,#8
1179  0112 5f            	clrw	x
1180  0113 97            	ld	xl,a
1181  0114 a601          	ld	a,#1
1182  0116 5d            	tnzw	x
1183  0117 2704          	jreq	L43
1184  0119               L63:
1185  0119 48            	sll	a
1186  011a 5a            	decw	x
1187  011b 26fc          	jrne	L63
1188  011d               L43:
1189  011d 43            	cpl	a
1190  011e c45406        	and	a,21510
1191  0121 c75406        	ld	21510,a
1193  0124 2015          	jra	L174
1194  0126               L305:
1195                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1197  0126 7b01          	ld	a,(OFST+1,sp)
1198  0128 a008          	sub	a,#8
1199  012a 5f            	clrw	x
1200  012b 97            	ld	xl,a
1201  012c a601          	ld	a,#1
1202  012e 5d            	tnzw	x
1203  012f 2704          	jreq	L04
1204  0131               L24:
1205  0131 48            	sll	a
1206  0132 5a            	decw	x
1207  0133 26fc          	jrne	L24
1208  0135               L04:
1209  0135 ca5406        	or	a,21510
1210  0138 c75406        	ld	21510,a
1211  013b               L174:
1212                     ; 287 }
1215  013b 85            	popw	x
1216  013c 81            	ret
1273                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1273                     ; 301 {
1274                     	switch	.text
1275  013d               _ADC1_ConversionConfig:
1277  013d 89            	pushw	x
1278       00000000      OFST:	set	0
1281                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1283                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1285                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1287                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1289  013e 72175402      	bres	21506,#3
1290                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1292  0142 c65402        	ld	a,21506
1293  0145 1a05          	or	a,(OFST+5,sp)
1294  0147 c75402        	ld	21506,a
1295                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1297  014a 9e            	ld	a,xh
1298  014b a101          	cp	a,#1
1299  014d 2606          	jrne	L535
1300                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1302  014f 72125401      	bset	21505,#1
1304  0153 2004          	jra	L735
1305  0155               L535:
1306                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1308  0155 72135401      	bres	21505,#1
1309  0159               L735:
1310                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1312  0159 c65400        	ld	a,21504
1313  015c a4f0          	and	a,#240
1314  015e c75400        	ld	21504,a
1315                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1317  0161 c65400        	ld	a,21504
1318  0164 1a02          	or	a,(OFST+2,sp)
1319  0166 c75400        	ld	21504,a
1320                     ; 329 }
1323  0169 85            	popw	x
1324  016a 81            	ret
1370                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1370                     ; 343 {
1371                     	switch	.text
1372  016b               _ADC1_ExternalTriggerConfig:
1374  016b 89            	pushw	x
1375       00000000      OFST:	set	0
1378                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1380                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1382                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1384  016c c65402        	ld	a,21506
1385  016f a4cf          	and	a,#207
1386  0171 c75402        	ld	21506,a
1387                     ; 352     if (NewState != DISABLE)
1389  0174 9f            	ld	a,xl
1390  0175 4d            	tnz	a
1391  0176 2706          	jreq	L365
1392                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1394  0178 721c5402      	bset	21506,#6
1396  017c 2004          	jra	L565
1397  017e               L365:
1398                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1400  017e 721d5402      	bres	21506,#6
1401  0182               L565:
1402                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1404  0182 c65402        	ld	a,21506
1405  0185 1a01          	or	a,(OFST+1,sp)
1406  0187 c75402        	ld	21506,a
1407                     ; 366 }
1410  018a 85            	popw	x
1411  018b 81            	ret
1435                     ; 378 void ADC1_StartConversion(void)
1435                     ; 379 {
1436                     	switch	.text
1437  018c               _ADC1_StartConversion:
1441                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1443  018c 72105401      	bset	21505,#0
1444                     ; 381 }
1447  0190 81            	ret
1491                     ; 390 uint16_t ADC1_GetConversionValue(void)
1491                     ; 391 {
1492                     	switch	.text
1493  0191               _ADC1_GetConversionValue:
1495  0191 5205          	subw	sp,#5
1496       00000005      OFST:	set	5
1499                     ; 393     uint16_t temph = 0;
1501                     ; 394     uint8_t templ = 0;
1503                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1505  0193 c65402        	ld	a,21506
1506  0196 a508          	bcp	a,#8
1507  0198 2715          	jreq	L126
1508                     ; 399         templ = ADC1->DRL;
1510  019a c65405        	ld	a,21509
1511  019d 6b03          	ld	(OFST-2,sp),a
1513                     ; 401         temph = ADC1->DRH;
1515  019f c65404        	ld	a,21508
1516  01a2 5f            	clrw	x
1517  01a3 97            	ld	xl,a
1518  01a4 1f04          	ldw	(OFST-1,sp),x
1520                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1522  01a6 1e04          	ldw	x,(OFST-1,sp)
1523  01a8 7b03          	ld	a,(OFST-2,sp)
1524  01aa 02            	rlwa	x,a
1525  01ab 1f04          	ldw	(OFST-1,sp),x
1528  01ad 2021          	jra	L326
1529  01af               L126:
1530                     ; 408         temph = ADC1->DRH;
1532  01af c65404        	ld	a,21508
1533  01b2 5f            	clrw	x
1534  01b3 97            	ld	xl,a
1535  01b4 1f04          	ldw	(OFST-1,sp),x
1537                     ; 410         templ = ADC1->DRL;
1539  01b6 c65405        	ld	a,21509
1540  01b9 6b03          	ld	(OFST-2,sp),a
1542                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1544  01bb 1e04          	ldw	x,(OFST-1,sp)
1545  01bd 4f            	clr	a
1546  01be 02            	rlwa	x,a
1547  01bf 1f01          	ldw	(OFST-4,sp),x
1549  01c1 7b03          	ld	a,(OFST-2,sp)
1550  01c3 97            	ld	xl,a
1551  01c4 a640          	ld	a,#64
1552  01c6 42            	mul	x,a
1553  01c7 01            	rrwa	x,a
1554  01c8 1a02          	or	a,(OFST-3,sp)
1555  01ca 01            	rrwa	x,a
1556  01cb 1a01          	or	a,(OFST-4,sp)
1557  01cd 01            	rrwa	x,a
1558  01ce 1f04          	ldw	(OFST-1,sp),x
1560  01d0               L326:
1561                     ; 415     return ((uint16_t)temph);
1563  01d0 1e04          	ldw	x,(OFST-1,sp)
1566  01d2 5b05          	addw	sp,#5
1567  01d4 81            	ret
1613                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1613                     ; 428 {
1614                     	switch	.text
1615  01d5               _ADC1_AWDChannelConfig:
1617  01d5 89            	pushw	x
1618       00000000      OFST:	set	0
1621                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1623                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1625                     ; 433     if (Channel < (uint8_t)8)
1627  01d6 9e            	ld	a,xh
1628  01d7 a108          	cp	a,#8
1629  01d9 242e          	jruge	L746
1630                     ; 435         if (NewState != DISABLE)
1632  01db 9f            	ld	a,xl
1633  01dc 4d            	tnz	a
1634  01dd 2714          	jreq	L156
1635                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1637  01df 9e            	ld	a,xh
1638  01e0 5f            	clrw	x
1639  01e1 97            	ld	xl,a
1640  01e2 a601          	ld	a,#1
1641  01e4 5d            	tnzw	x
1642  01e5 2704          	jreq	L65
1643  01e7               L06:
1644  01e7 48            	sll	a
1645  01e8 5a            	decw	x
1646  01e9 26fc          	jrne	L06
1647  01eb               L65:
1648  01eb ca540f        	or	a,21519
1649  01ee c7540f        	ld	21519,a
1651  01f1 2047          	jra	L556
1652  01f3               L156:
1653                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1655  01f3 7b01          	ld	a,(OFST+1,sp)
1656  01f5 5f            	clrw	x
1657  01f6 97            	ld	xl,a
1658  01f7 a601          	ld	a,#1
1659  01f9 5d            	tnzw	x
1660  01fa 2704          	jreq	L26
1661  01fc               L46:
1662  01fc 48            	sll	a
1663  01fd 5a            	decw	x
1664  01fe 26fc          	jrne	L46
1665  0200               L26:
1666  0200 43            	cpl	a
1667  0201 c4540f        	and	a,21519
1668  0204 c7540f        	ld	21519,a
1669  0207 2031          	jra	L556
1670  0209               L746:
1671                     ; 446         if (NewState != DISABLE)
1673  0209 0d02          	tnz	(OFST+2,sp)
1674  020b 2717          	jreq	L756
1675                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1677  020d 7b01          	ld	a,(OFST+1,sp)
1678  020f a008          	sub	a,#8
1679  0211 5f            	clrw	x
1680  0212 97            	ld	xl,a
1681  0213 a601          	ld	a,#1
1682  0215 5d            	tnzw	x
1683  0216 2704          	jreq	L66
1684  0218               L07:
1685  0218 48            	sll	a
1686  0219 5a            	decw	x
1687  021a 26fc          	jrne	L07
1688  021c               L66:
1689  021c ca540e        	or	a,21518
1690  021f c7540e        	ld	21518,a
1692  0222 2016          	jra	L556
1693  0224               L756:
1694                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1696  0224 7b01          	ld	a,(OFST+1,sp)
1697  0226 a008          	sub	a,#8
1698  0228 5f            	clrw	x
1699  0229 97            	ld	xl,a
1700  022a a601          	ld	a,#1
1701  022c 5d            	tnzw	x
1702  022d 2704          	jreq	L27
1703  022f               L47:
1704  022f 48            	sll	a
1705  0230 5a            	decw	x
1706  0231 26fc          	jrne	L47
1707  0233               L27:
1708  0233 43            	cpl	a
1709  0234 c4540e        	and	a,21518
1710  0237 c7540e        	ld	21518,a
1711  023a               L556:
1712                     ; 455 }
1715  023a 85            	popw	x
1716  023b 81            	ret
1751                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1751                     ; 464 {
1752                     	switch	.text
1753  023c               _ADC1_SetHighThreshold:
1755  023c 89            	pushw	x
1756       00000000      OFST:	set	0
1759                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1761  023d 54            	srlw	x
1762  023e 54            	srlw	x
1763  023f 9f            	ld	a,xl
1764  0240 c75408        	ld	21512,a
1765                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1767  0243 7b02          	ld	a,(OFST+2,sp)
1768  0245 c75409        	ld	21513,a
1769                     ; 467 }
1772  0248 85            	popw	x
1773  0249 81            	ret
1808                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1808                     ; 476 {
1809                     	switch	.text
1810  024a               _ADC1_SetLowThreshold:
1814                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1816  024a 9f            	ld	a,xl
1817  024b c7540b        	ld	21515,a
1818                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1820  024e 54            	srlw	x
1821  024f 54            	srlw	x
1822  0250 9f            	ld	a,xl
1823  0251 c7540a        	ld	21514,a
1824                     ; 479 }
1827  0254 81            	ret
1880                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1880                     ; 489 {
1881                     	switch	.text
1882  0255               _ADC1_GetBufferValue:
1884  0255 88            	push	a
1885  0256 5205          	subw	sp,#5
1886       00000005      OFST:	set	5
1889                     ; 491     uint16_t temph = 0;
1891                     ; 492     uint8_t templ = 0;
1893                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1895                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1897  0258 c65402        	ld	a,21506
1898  025b a508          	bcp	a,#8
1899  025d 271f          	jreq	L547
1900                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1902  025f 7b06          	ld	a,(OFST+1,sp)
1903  0261 48            	sll	a
1904  0262 5f            	clrw	x
1905  0263 97            	ld	xl,a
1906  0264 d653e1        	ld	a,(21473,x)
1907  0267 6b03          	ld	(OFST-2,sp),a
1909                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1911  0269 7b06          	ld	a,(OFST+1,sp)
1912  026b 48            	sll	a
1913  026c 5f            	clrw	x
1914  026d 97            	ld	xl,a
1915  026e d653e0        	ld	a,(21472,x)
1916  0271 5f            	clrw	x
1917  0272 97            	ld	xl,a
1918  0273 1f04          	ldw	(OFST-1,sp),x
1920                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1922  0275 1e04          	ldw	x,(OFST-1,sp)
1923  0277 7b03          	ld	a,(OFST-2,sp)
1924  0279 02            	rlwa	x,a
1925  027a 1f04          	ldw	(OFST-1,sp),x
1928  027c 202b          	jra	L747
1929  027e               L547:
1930                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1932  027e 7b06          	ld	a,(OFST+1,sp)
1933  0280 48            	sll	a
1934  0281 5f            	clrw	x
1935  0282 97            	ld	xl,a
1936  0283 d653e0        	ld	a,(21472,x)
1937  0286 5f            	clrw	x
1938  0287 97            	ld	xl,a
1939  0288 1f04          	ldw	(OFST-1,sp),x
1941                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1943  028a 7b06          	ld	a,(OFST+1,sp)
1944  028c 48            	sll	a
1945  028d 5f            	clrw	x
1946  028e 97            	ld	xl,a
1947  028f d653e1        	ld	a,(21473,x)
1948  0292 6b03          	ld	(OFST-2,sp),a
1950                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1952  0294 1e04          	ldw	x,(OFST-1,sp)
1953  0296 4f            	clr	a
1954  0297 02            	rlwa	x,a
1955  0298 1f01          	ldw	(OFST-4,sp),x
1957  029a 7b03          	ld	a,(OFST-2,sp)
1958  029c 97            	ld	xl,a
1959  029d a640          	ld	a,#64
1960  029f 42            	mul	x,a
1961  02a0 01            	rrwa	x,a
1962  02a1 1a02          	or	a,(OFST-3,sp)
1963  02a3 01            	rrwa	x,a
1964  02a4 1a01          	or	a,(OFST-4,sp)
1965  02a6 01            	rrwa	x,a
1966  02a7 1f04          	ldw	(OFST-1,sp),x
1968  02a9               L747:
1969                     ; 516     return ((uint16_t)temph);
1971  02a9 1e04          	ldw	x,(OFST-1,sp)
1974  02ab 5b06          	addw	sp,#6
1975  02ad 81            	ret
2041                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2041                     ; 527 {
2042                     	switch	.text
2043  02ae               _ADC1_GetAWDChannelStatus:
2045  02ae 88            	push	a
2046  02af 88            	push	a
2047       00000001      OFST:	set	1
2050                     ; 528     uint8_t status = 0;
2052                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2054                     ; 533     if (Channel < (uint8_t)8)
2056  02b0 a108          	cp	a,#8
2057  02b2 2412          	jruge	L3001
2058                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2060  02b4 5f            	clrw	x
2061  02b5 97            	ld	xl,a
2062  02b6 a601          	ld	a,#1
2063  02b8 5d            	tnzw	x
2064  02b9 2704          	jreq	L601
2065  02bb               L011:
2066  02bb 48            	sll	a
2067  02bc 5a            	decw	x
2068  02bd 26fc          	jrne	L011
2069  02bf               L601:
2070  02bf c4540d        	and	a,21517
2071  02c2 6b01          	ld	(OFST+0,sp),a
2074  02c4 2014          	jra	L5001
2075  02c6               L3001:
2076                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2078  02c6 7b02          	ld	a,(OFST+1,sp)
2079  02c8 a008          	sub	a,#8
2080  02ca 5f            	clrw	x
2081  02cb 97            	ld	xl,a
2082  02cc a601          	ld	a,#1
2083  02ce 5d            	tnzw	x
2084  02cf 2704          	jreq	L211
2085  02d1               L411:
2086  02d1 48            	sll	a
2087  02d2 5a            	decw	x
2088  02d3 26fc          	jrne	L411
2089  02d5               L211:
2090  02d5 c4540c        	and	a,21516
2091  02d8 6b01          	ld	(OFST+0,sp),a
2093  02da               L5001:
2094                     ; 542     return ((FlagStatus)status);
2096  02da 7b01          	ld	a,(OFST+0,sp)
2099  02dc 85            	popw	x
2100  02dd 81            	ret
2258                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2258                     ; 552 {
2259                     	switch	.text
2260  02de               _ADC1_GetFlagStatus:
2262  02de 88            	push	a
2263  02df 88            	push	a
2264       00000001      OFST:	set	1
2267                     ; 553     uint8_t flagstatus = 0;
2269                     ; 554     uint8_t temp = 0;
2271                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2273                     ; 559     if ((Flag & 0x0F) == 0x01)
2275  02e0 a40f          	and	a,#15
2276  02e2 a101          	cp	a,#1
2277  02e4 2609          	jrne	L5701
2278                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2280  02e6 c65403        	ld	a,21507
2281  02e9 a440          	and	a,#64
2282  02eb 6b01          	ld	(OFST+0,sp),a
2285  02ed 2045          	jra	L7701
2286  02ef               L5701:
2287                     ; 564     else if ((Flag & 0xF0) == 0x10)
2289  02ef 7b02          	ld	a,(OFST+1,sp)
2290  02f1 a4f0          	and	a,#240
2291  02f3 a110          	cp	a,#16
2292  02f5 2636          	jrne	L1011
2293                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2295  02f7 7b02          	ld	a,(OFST+1,sp)
2296  02f9 a40f          	and	a,#15
2297  02fb 6b01          	ld	(OFST+0,sp),a
2299                     ; 568         if (temp < 8)
2301  02fd 7b01          	ld	a,(OFST+0,sp)
2302  02ff a108          	cp	a,#8
2303  0301 2414          	jruge	L3011
2304                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2306  0303 7b01          	ld	a,(OFST+0,sp)
2307  0305 5f            	clrw	x
2308  0306 97            	ld	xl,a
2309  0307 a601          	ld	a,#1
2310  0309 5d            	tnzw	x
2311  030a 2704          	jreq	L021
2312  030c               L221:
2313  030c 48            	sll	a
2314  030d 5a            	decw	x
2315  030e 26fc          	jrne	L221
2316  0310               L021:
2317  0310 c4540d        	and	a,21517
2318  0313 6b01          	ld	(OFST+0,sp),a
2321  0315 201d          	jra	L7701
2322  0317               L3011:
2323                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2325  0317 7b01          	ld	a,(OFST+0,sp)
2326  0319 a008          	sub	a,#8
2327  031b 5f            	clrw	x
2328  031c 97            	ld	xl,a
2329  031d a601          	ld	a,#1
2330  031f 5d            	tnzw	x
2331  0320 2704          	jreq	L421
2332  0322               L621:
2333  0322 48            	sll	a
2334  0323 5a            	decw	x
2335  0324 26fc          	jrne	L621
2336  0326               L421:
2337  0326 c4540c        	and	a,21516
2338  0329 6b01          	ld	(OFST+0,sp),a
2340  032b 2007          	jra	L7701
2341  032d               L1011:
2342                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2344  032d c65400        	ld	a,21504
2345  0330 1402          	and	a,(OFST+1,sp)
2346  0332 6b01          	ld	(OFST+0,sp),a
2348  0334               L7701:
2349                     ; 581     return ((FlagStatus)flagstatus);
2351  0334 7b01          	ld	a,(OFST+0,sp)
2354  0336 85            	popw	x
2355  0337 81            	ret
2399                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2399                     ; 592 {
2400                     	switch	.text
2401  0338               _ADC1_ClearFlag:
2403  0338 88            	push	a
2404  0339 88            	push	a
2405       00000001      OFST:	set	1
2408                     ; 593     uint8_t temp = 0;
2410                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2412                     ; 598     if ((Flag & 0x0F) == 0x01)
2414  033a a40f          	and	a,#15
2415  033c a101          	cp	a,#1
2416  033e 2606          	jrne	L3311
2417                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2419  0340 721d5403      	bres	21507,#6
2421  0344 204b          	jra	L5311
2422  0346               L3311:
2423                     ; 603     else if ((Flag & 0xF0) == 0x10)
2425  0346 7b02          	ld	a,(OFST+1,sp)
2426  0348 a4f0          	and	a,#240
2427  034a a110          	cp	a,#16
2428  034c 263a          	jrne	L7311
2429                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2431  034e 7b02          	ld	a,(OFST+1,sp)
2432  0350 a40f          	and	a,#15
2433  0352 6b01          	ld	(OFST+0,sp),a
2435                     ; 607         if (temp < 8)
2437  0354 7b01          	ld	a,(OFST+0,sp)
2438  0356 a108          	cp	a,#8
2439  0358 2416          	jruge	L1411
2440                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2442  035a 7b01          	ld	a,(OFST+0,sp)
2443  035c 5f            	clrw	x
2444  035d 97            	ld	xl,a
2445  035e a601          	ld	a,#1
2446  0360 5d            	tnzw	x
2447  0361 2704          	jreq	L231
2448  0363               L431:
2449  0363 48            	sll	a
2450  0364 5a            	decw	x
2451  0365 26fc          	jrne	L431
2452  0367               L231:
2453  0367 43            	cpl	a
2454  0368 c4540d        	and	a,21517
2455  036b c7540d        	ld	21517,a
2457  036e 2021          	jra	L5311
2458  0370               L1411:
2459                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2461  0370 7b01          	ld	a,(OFST+0,sp)
2462  0372 a008          	sub	a,#8
2463  0374 5f            	clrw	x
2464  0375 97            	ld	xl,a
2465  0376 a601          	ld	a,#1
2466  0378 5d            	tnzw	x
2467  0379 2704          	jreq	L631
2468  037b               L041:
2469  037b 48            	sll	a
2470  037c 5a            	decw	x
2471  037d 26fc          	jrne	L041
2472  037f               L631:
2473  037f 43            	cpl	a
2474  0380 c4540c        	and	a,21516
2475  0383 c7540c        	ld	21516,a
2476  0386 2009          	jra	L5311
2477  0388               L7311:
2478                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2480  0388 7b02          	ld	a,(OFST+1,sp)
2481  038a 43            	cpl	a
2482  038b c45400        	and	a,21504
2483  038e c75400        	ld	21504,a
2484  0391               L5311:
2485                     ; 620 }
2488  0391 85            	popw	x
2489  0392 81            	ret
2544                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2544                     ; 641 {
2545                     	switch	.text
2546  0393               _ADC1_GetITStatus:
2548  0393 89            	pushw	x
2549  0394 88            	push	a
2550       00000001      OFST:	set	1
2553                     ; 642     ITStatus itstatus = RESET;
2555                     ; 643     uint8_t temp = 0;
2557                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2559                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2561  0395 01            	rrwa	x,a
2562  0396 a4f0          	and	a,#240
2563  0398 5f            	clrw	x
2564  0399 02            	rlwa	x,a
2565  039a a30010        	cpw	x,#16
2566  039d 2636          	jrne	L5711
2567                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2569  039f 7b03          	ld	a,(OFST+2,sp)
2570  03a1 a40f          	and	a,#15
2571  03a3 6b01          	ld	(OFST+0,sp),a
2573                     ; 652         if (temp < 8)
2575  03a5 7b01          	ld	a,(OFST+0,sp)
2576  03a7 a108          	cp	a,#8
2577  03a9 2414          	jruge	L7711
2578                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2580  03ab 7b01          	ld	a,(OFST+0,sp)
2581  03ad 5f            	clrw	x
2582  03ae 97            	ld	xl,a
2583  03af a601          	ld	a,#1
2584  03b1 5d            	tnzw	x
2585  03b2 2704          	jreq	L441
2586  03b4               L641:
2587  03b4 48            	sll	a
2588  03b5 5a            	decw	x
2589  03b6 26fc          	jrne	L641
2590  03b8               L441:
2591  03b8 c4540d        	and	a,21517
2592  03bb 6b01          	ld	(OFST+0,sp),a
2595  03bd 201d          	jra	L3021
2596  03bf               L7711:
2597                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2599  03bf 7b01          	ld	a,(OFST+0,sp)
2600  03c1 a008          	sub	a,#8
2601  03c3 5f            	clrw	x
2602  03c4 97            	ld	xl,a
2603  03c5 a601          	ld	a,#1
2604  03c7 5d            	tnzw	x
2605  03c8 2704          	jreq	L051
2606  03ca               L251:
2607  03ca 48            	sll	a
2608  03cb 5a            	decw	x
2609  03cc 26fc          	jrne	L251
2610  03ce               L051:
2611  03ce c4540c        	and	a,21516
2612  03d1 6b01          	ld	(OFST+0,sp),a
2614  03d3 2007          	jra	L3021
2615  03d5               L5711:
2616                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2618  03d5 c65400        	ld	a,21504
2619  03d8 1403          	and	a,(OFST+2,sp)
2620  03da 6b01          	ld	(OFST+0,sp),a
2622  03dc               L3021:
2623                     ; 665     return ((ITStatus)itstatus);
2625  03dc 7b01          	ld	a,(OFST+0,sp)
2628  03de 5b03          	addw	sp,#3
2629  03e0 81            	ret
2674                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2674                     ; 688 {
2675                     	switch	.text
2676  03e1               _ADC1_ClearITPendingBit:
2678  03e1 89            	pushw	x
2679  03e2 88            	push	a
2680       00000001      OFST:	set	1
2683                     ; 689     uint8_t temp = 0;
2685                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2687                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2689  03e3 01            	rrwa	x,a
2690  03e4 a4f0          	and	a,#240
2691  03e6 5f            	clrw	x
2692  03e7 02            	rlwa	x,a
2693  03e8 a30010        	cpw	x,#16
2694  03eb 263a          	jrne	L7221
2695                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2697  03ed 7b03          	ld	a,(OFST+2,sp)
2698  03ef a40f          	and	a,#15
2699  03f1 6b01          	ld	(OFST+0,sp),a
2701                     ; 698         if (temp < 8)
2703  03f3 7b01          	ld	a,(OFST+0,sp)
2704  03f5 a108          	cp	a,#8
2705  03f7 2416          	jruge	L1321
2706                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2708  03f9 7b01          	ld	a,(OFST+0,sp)
2709  03fb 5f            	clrw	x
2710  03fc 97            	ld	xl,a
2711  03fd a601          	ld	a,#1
2712  03ff 5d            	tnzw	x
2713  0400 2704          	jreq	L651
2714  0402               L061:
2715  0402 48            	sll	a
2716  0403 5a            	decw	x
2717  0404 26fc          	jrne	L061
2718  0406               L651:
2719  0406 43            	cpl	a
2720  0407 c4540d        	and	a,21517
2721  040a c7540d        	ld	21517,a
2723  040d 2021          	jra	L5321
2724  040f               L1321:
2725                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2727  040f 7b01          	ld	a,(OFST+0,sp)
2728  0411 a008          	sub	a,#8
2729  0413 5f            	clrw	x
2730  0414 97            	ld	xl,a
2731  0415 a601          	ld	a,#1
2732  0417 5d            	tnzw	x
2733  0418 2704          	jreq	L261
2734  041a               L461:
2735  041a 48            	sll	a
2736  041b 5a            	decw	x
2737  041c 26fc          	jrne	L461
2738  041e               L261:
2739  041e 43            	cpl	a
2740  041f c4540c        	and	a,21516
2741  0422 c7540c        	ld	21516,a
2742  0425 2009          	jra	L5321
2743  0427               L7221:
2744                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2746  0427 7b03          	ld	a,(OFST+2,sp)
2747  0429 43            	cpl	a
2748  042a c45400        	and	a,21504
2749  042d c75400        	ld	21504,a
2750  0430               L5321:
2751                     ; 711 }
2754  0430 5b03          	addw	sp,#3
2755  0432 81            	ret
2768                     	xdef	_ADC1_ClearITPendingBit
2769                     	xdef	_ADC1_GetITStatus
2770                     	xdef	_ADC1_ClearFlag
2771                     	xdef	_ADC1_GetFlagStatus
2772                     	xdef	_ADC1_GetAWDChannelStatus
2773                     	xdef	_ADC1_GetBufferValue
2774                     	xdef	_ADC1_SetLowThreshold
2775                     	xdef	_ADC1_SetHighThreshold
2776                     	xdef	_ADC1_GetConversionValue
2777                     	xdef	_ADC1_StartConversion
2778                     	xdef	_ADC1_AWDChannelConfig
2779                     	xdef	_ADC1_ExternalTriggerConfig
2780                     	xdef	_ADC1_ConversionConfig
2781                     	xdef	_ADC1_SchmittTriggerConfig
2782                     	xdef	_ADC1_PrescalerConfig
2783                     	xdef	_ADC1_ITConfig
2784                     	xdef	_ADC1_DataBufferCmd
2785                     	xdef	_ADC1_ScanModeCmd
2786                     	xdef	_ADC1_Cmd
2787                     	xdef	_ADC1_Init
2788                     	xdef	_ADC1_DeInit
2807                     	end
