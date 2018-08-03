   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 44 void SPI_DeInit(void)
  45                     ; 45 {
  47                     	switch	.text
  48  0000               _SPI_DeInit:
  52                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  54  0000 725f5200      	clr	20992
  55                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  57  0004 725f5201      	clr	20993
  58                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  60  0008 725f5202      	clr	20994
  61                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  63  000c 35025203      	mov	20995,#2
  64                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  66  0010 35075205      	mov	20997,#7
  67                     ; 51 }
  70  0014 81            	ret
 386                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 386                     ; 73 {
 387                     	switch	.text
 388  0015               _SPI_Init:
 390  0015 89            	pushw	x
 391  0016 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 397                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 399                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 401                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 403                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 405                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 407                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 409                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 411                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 411                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 413  0017 7b07          	ld	a,(OFST+6,sp)
 414  0019 1a08          	or	a,(OFST+7,sp)
 415  001b 6b01          	ld	(OFST+0,sp),a
 417  001d 9f            	ld	a,xl
 418  001e 1a02          	or	a,(OFST+1,sp)
 419  0020 1a01          	or	a,(OFST+0,sp)
 420  0022 c75200        	ld	20992,a
 421                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 423  0025 7b09          	ld	a,(OFST+8,sp)
 424  0027 1a0a          	or	a,(OFST+9,sp)
 425  0029 c75201        	ld	20993,a
 426                     ; 91     if (Mode == SPI_MODE_MASTER)
 428  002c 7b06          	ld	a,(OFST+5,sp)
 429  002e a104          	cp	a,#4
 430  0030 2606          	jrne	L302
 431                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 433  0032 72105201      	bset	20993,#0
 435  0036 2004          	jra	L502
 436  0038               L302:
 437                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 439  0038 72115201      	bres	20993,#0
 440  003c               L502:
 441                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 443  003c c65200        	ld	a,20992
 444  003f 1a06          	or	a,(OFST+5,sp)
 445  0041 c75200        	ld	20992,a
 446                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 448  0044 7b0b          	ld	a,(OFST+10,sp)
 449  0046 c75205        	ld	20997,a
 450                     ; 105 }
 453  0049 5b03          	addw	sp,#3
 454  004b 81            	ret
 509                     ; 113 void SPI_Cmd(FunctionalState NewState)
 509                     ; 114 {
 510                     	switch	.text
 511  004c               _SPI_Cmd:
 515                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 517                     ; 118     if (NewState != DISABLE)
 519  004c 4d            	tnz	a
 520  004d 2706          	jreq	L532
 521                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 523  004f 721c5200      	bset	20992,#6
 525  0053 2004          	jra	L732
 526  0055               L532:
 527                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 529  0055 721d5200      	bres	20992,#6
 530  0059               L732:
 531                     ; 126 }
 534  0059 81            	ret
 643                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 643                     ; 136 {
 644                     	switch	.text
 645  005a               _SPI_ITConfig:
 647  005a 89            	pushw	x
 648  005b 88            	push	a
 649       00000001      OFST:	set	1
 652                     ; 137     uint8_t itpos = 0;
 654                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 656                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 658                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 660  005c 9e            	ld	a,xh
 661  005d a40f          	and	a,#15
 662  005f 5f            	clrw	x
 663  0060 97            	ld	xl,a
 664  0061 a601          	ld	a,#1
 665  0063 5d            	tnzw	x
 666  0064 2704          	jreq	L41
 667  0066               L61:
 668  0066 48            	sll	a
 669  0067 5a            	decw	x
 670  0068 26fc          	jrne	L61
 671  006a               L41:
 672  006a 6b01          	ld	(OFST+0,sp),a
 674                     ; 145     if (NewState != DISABLE)
 676  006c 0d03          	tnz	(OFST+2,sp)
 677  006e 270a          	jreq	L113
 678                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 680  0070 c65202        	ld	a,20994
 681  0073 1a01          	or	a,(OFST+0,sp)
 682  0075 c75202        	ld	20994,a
 684  0078 2009          	jra	L313
 685  007a               L113:
 686                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 688  007a 7b01          	ld	a,(OFST+0,sp)
 689  007c 43            	cpl	a
 690  007d c45202        	and	a,20994
 691  0080 c75202        	ld	20994,a
 692  0083               L313:
 693                     ; 153 }
 696  0083 5b03          	addw	sp,#3
 697  0085 81            	ret
 731                     ; 159 void SPI_SendData(uint8_t Data)
 731                     ; 160 {
 732                     	switch	.text
 733  0086               _SPI_SendData:
 737                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 739  0086 c75204        	ld	20996,a
 740                     ; 162 }
 743  0089 81            	ret
 766                     ; 169 uint8_t SPI_ReceiveData(void)
 766                     ; 170 {
 767                     	switch	.text
 768  008a               _SPI_ReceiveData:
 772                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 774  008a c65204        	ld	a,20996
 777  008d 81            	ret
 813                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 813                     ; 181 {
 814                     	switch	.text
 815  008e               _SPI_NSSInternalSoftwareCmd:
 819                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 821                     ; 185     if (NewState != DISABLE)
 823  008e 4d            	tnz	a
 824  008f 2706          	jreq	L163
 825                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 827  0091 72105201      	bset	20993,#0
 829  0095 2004          	jra	L363
 830  0097               L163:
 831                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 833  0097 72115201      	bres	20993,#0
 834  009b               L363:
 835                     ; 193 }
 838  009b 81            	ret
 861                     ; 200 void SPI_TransmitCRC(void)
 861                     ; 201 {
 862                     	switch	.text
 863  009c               _SPI_TransmitCRC:
 867                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 869  009c 72185201      	bset	20993,#4
 870                     ; 203 }
 873  00a0 81            	ret
 909                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
 909                     ; 212 {
 910                     	switch	.text
 911  00a1               _SPI_CalculateCRCCmd:
 915                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 917                     ; 216     if (NewState != DISABLE)
 919  00a1 4d            	tnz	a
 920  00a2 2706          	jreq	L314
 921                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 923  00a4 721a5201      	bset	20993,#5
 925  00a8 2004          	jra	L514
 926  00aa               L314:
 927                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 929  00aa 721b5201      	bres	20993,#5
 930  00ae               L514:
 931                     ; 224 }
 934  00ae 81            	ret
 998                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 998                     ; 232 {
 999                     	switch	.text
1000  00af               _SPI_GetCRC:
1002  00af 88            	push	a
1003       00000001      OFST:	set	1
1006                     ; 233     uint8_t crcreg = 0;
1008                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1010                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1012  00b0 4d            	tnz	a
1013  00b1 2707          	jreq	L154
1014                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1016  00b3 c65207        	ld	a,20999
1017  00b6 6b01          	ld	(OFST+0,sp),a
1020  00b8 2005          	jra	L354
1021  00ba               L154:
1022                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1024  00ba c65206        	ld	a,20998
1025  00bd 6b01          	ld	(OFST+0,sp),a
1027  00bf               L354:
1028                     ; 248     return crcreg;
1030  00bf 7b01          	ld	a,(OFST+0,sp)
1033  00c1 5b01          	addw	sp,#1
1034  00c3 81            	ret
1059                     ; 256 void SPI_ResetCRC(void)
1059                     ; 257 {
1060                     	switch	.text
1061  00c4               _SPI_ResetCRC:
1065                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1067  00c4 a601          	ld	a,#1
1068  00c6 add9          	call	_SPI_CalculateCRCCmd
1070                     ; 263     SPI_Cmd(ENABLE);
1072  00c8 a601          	ld	a,#1
1073  00ca ad80          	call	_SPI_Cmd
1075                     ; 264 }
1078  00cc 81            	ret
1102                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1102                     ; 272 {
1103                     	switch	.text
1104  00cd               _SPI_GetCRCPolynomial:
1108                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1110  00cd c65205        	ld	a,20997
1113  00d0 81            	ret
1169                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1169                     ; 282 {
1170                     	switch	.text
1171  00d1               _SPI_BiDirectionalLineConfig:
1175                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1177                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1179  00d1 4d            	tnz	a
1180  00d2 2706          	jreq	L325
1181                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1183  00d4 721c5201      	bset	20993,#6
1185  00d8 2004          	jra	L525
1186  00da               L325:
1187                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1189  00da 721d5201      	bres	20993,#6
1190  00de               L525:
1191                     ; 294 }
1194  00de 81            	ret
1315                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1315                     ; 305 {
1316                     	switch	.text
1317  00df               _SPI_GetFlagStatus:
1319  00df 88            	push	a
1320       00000001      OFST:	set	1
1323                     ; 306     FlagStatus status = RESET;
1325                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1327                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1329  00e0 c45203        	and	a,20995
1330  00e3 2706          	jreq	L306
1331                     ; 313         status = SET; /* SPI_FLAG is set */
1333  00e5 a601          	ld	a,#1
1334  00e7 6b01          	ld	(OFST+0,sp),a
1337  00e9 2002          	jra	L506
1338  00eb               L306:
1339                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1341  00eb 0f01          	clr	(OFST+0,sp)
1343  00ed               L506:
1344                     ; 321     return status;
1346  00ed 7b01          	ld	a,(OFST+0,sp)
1349  00ef 5b01          	addw	sp,#1
1350  00f1 81            	ret
1385                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1385                     ; 340 {
1386                     	switch	.text
1387  00f2               _SPI_ClearFlag:
1391                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1393                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1395  00f2 43            	cpl	a
1396  00f3 c75203        	ld	20995,a
1397                     ; 344 }
1400  00f6 81            	ret
1482                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1482                     ; 360 {
1483                     	switch	.text
1484  00f7               _SPI_GetITStatus:
1486  00f7 88            	push	a
1487  00f8 89            	pushw	x
1488       00000002      OFST:	set	2
1491                     ; 361     ITStatus pendingbitstatus = RESET;
1493                     ; 362     uint8_t itpos = 0;
1495                     ; 363     uint8_t itmask1 = 0;
1497                     ; 364     uint8_t itmask2 = 0;
1499                     ; 365     uint8_t enablestatus = 0;
1501                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1503                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1505  00f9 a40f          	and	a,#15
1506  00fb 5f            	clrw	x
1507  00fc 97            	ld	xl,a
1508  00fd a601          	ld	a,#1
1509  00ff 5d            	tnzw	x
1510  0100 2704          	jreq	L05
1511  0102               L25:
1512  0102 48            	sll	a
1513  0103 5a            	decw	x
1514  0104 26fc          	jrne	L25
1515  0106               L05:
1516  0106 6b01          	ld	(OFST-1,sp),a
1518                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1520  0108 7b03          	ld	a,(OFST+1,sp)
1521  010a 4e            	swap	a
1522  010b a40f          	and	a,#15
1523  010d 6b02          	ld	(OFST+0,sp),a
1525                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1527  010f 7b02          	ld	a,(OFST+0,sp)
1528  0111 5f            	clrw	x
1529  0112 97            	ld	xl,a
1530  0113 a601          	ld	a,#1
1531  0115 5d            	tnzw	x
1532  0116 2704          	jreq	L45
1533  0118               L65:
1534  0118 48            	sll	a
1535  0119 5a            	decw	x
1536  011a 26fc          	jrne	L65
1537  011c               L45:
1538  011c 6b02          	ld	(OFST+0,sp),a
1540                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1542  011e c65203        	ld	a,20995
1543  0121 1402          	and	a,(OFST+0,sp)
1544  0123 6b02          	ld	(OFST+0,sp),a
1546                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1548  0125 c65202        	ld	a,20994
1549  0128 1501          	bcp	a,(OFST-1,sp)
1550  012a 270a          	jreq	L766
1552  012c 0d02          	tnz	(OFST+0,sp)
1553  012e 2706          	jreq	L766
1554                     ; 380         pendingbitstatus = SET;
1556  0130 a601          	ld	a,#1
1557  0132 6b02          	ld	(OFST+0,sp),a
1560  0134 2002          	jra	L176
1561  0136               L766:
1562                     ; 385         pendingbitstatus = RESET;
1564  0136 0f02          	clr	(OFST+0,sp)
1566  0138               L176:
1567                     ; 388     return  pendingbitstatus;
1569  0138 7b02          	ld	a,(OFST+0,sp)
1572  013a 5b03          	addw	sp,#3
1573  013c 81            	ret
1618                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1618                     ; 405 {
1619                     	switch	.text
1620  013d               _SPI_ClearITPendingBit:
1622  013d 88            	push	a
1623       00000001      OFST:	set	1
1626                     ; 406     uint8_t itpos = 0;
1628                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1630                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1632  013e a4f0          	and	a,#240
1633  0140 4e            	swap	a
1634  0141 a40f          	and	a,#15
1635  0143 5f            	clrw	x
1636  0144 97            	ld	xl,a
1637  0145 a601          	ld	a,#1
1638  0147 5d            	tnzw	x
1639  0148 2704          	jreq	L26
1640  014a               L46:
1641  014a 48            	sll	a
1642  014b 5a            	decw	x
1643  014c 26fc          	jrne	L46
1644  014e               L26:
1645  014e 6b01          	ld	(OFST+0,sp),a
1647                     ; 414     SPI->SR = (uint8_t)(~itpos);
1649  0150 7b01          	ld	a,(OFST+0,sp)
1650  0152 43            	cpl	a
1651  0153 c75203        	ld	20995,a
1652                     ; 416 }
1655  0156 84            	pop	a
1656  0157 81            	ret
1669                     	xdef	_SPI_ClearITPendingBit
1670                     	xdef	_SPI_GetITStatus
1671                     	xdef	_SPI_ClearFlag
1672                     	xdef	_SPI_GetFlagStatus
1673                     	xdef	_SPI_BiDirectionalLineConfig
1674                     	xdef	_SPI_GetCRCPolynomial
1675                     	xdef	_SPI_ResetCRC
1676                     	xdef	_SPI_GetCRC
1677                     	xdef	_SPI_CalculateCRCCmd
1678                     	xdef	_SPI_TransmitCRC
1679                     	xdef	_SPI_NSSInternalSoftwareCmd
1680                     	xdef	_SPI_ReceiveData
1681                     	xdef	_SPI_SendData
1682                     	xdef	_SPI_ITConfig
1683                     	xdef	_SPI_Cmd
1684                     	xdef	_SPI_Init
1685                     	xdef	_SPI_DeInit
1704                     	end
