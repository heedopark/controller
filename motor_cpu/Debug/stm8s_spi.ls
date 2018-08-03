   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 44 void SPI_DeInit(void)
  51                     ; 45 {
  53                     .text:	section	.text,new
  54  0000               _SPI_DeInit:
  58                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  60  0000 725f5200      	clr	20992
  61                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  63  0004 725f5201      	clr	20993
  64                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  66  0008 725f5202      	clr	20994
  67                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  69  000c 35025203      	mov	20995,#2
  70                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  72  0010 35075205      	mov	20997,#7
  73                     ; 51 }
  76  0014 81            	ret	
 390                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 390                     ; 73 {
 391                     .text:	section	.text,new
 392  0000               _SPI_Init:
 394  0000 89            	pushw	x
 395  0001 88            	push	a
 396       00000001      OFST:	set	1
 399                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 401                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 403                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 405                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 407                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 409                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 411                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 413                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 415                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 415                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 417  0002 7b07          	ld	a,(OFST+6,sp)
 418  0004 1a08          	or	a,(OFST+7,sp)
 419  0006 6b01          	ld	(OFST+0,sp),a
 421  0008 9f            	ld	a,xl
 422  0009 1a02          	or	a,(OFST+1,sp)
 423  000b 1a01          	or	a,(OFST+0,sp)
 424  000d c75200        	ld	20992,a
 425                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 427  0010 7b09          	ld	a,(OFST+8,sp)
 428  0012 1a0a          	or	a,(OFST+9,sp)
 429  0014 c75201        	ld	20993,a
 430                     ; 91     if (Mode == SPI_MODE_MASTER)
 432  0017 7b06          	ld	a,(OFST+5,sp)
 433  0019 a104          	cp	a,#4
 434  001b 2606          	jrne	L102
 435                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 437  001d 72105201      	bset	20993,#0
 439  0021 2004          	jra	L302
 440  0023               L102:
 441                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 443  0023 72115201      	bres	20993,#0
 444  0027               L302:
 445                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 447  0027 c65200        	ld	a,20992
 448  002a 1a06          	or	a,(OFST+5,sp)
 449  002c c75200        	ld	20992,a
 450                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 452  002f 7b0b          	ld	a,(OFST+10,sp)
 453  0031 c75205        	ld	20997,a
 454                     ; 105 }
 457  0034 5b03          	addw	sp,#3
 458  0036 81            	ret	
 513                     ; 113 void SPI_Cmd(FunctionalState NewState)
 513                     ; 114 {
 514                     .text:	section	.text,new
 515  0000               _SPI_Cmd:
 519                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 521                     ; 118     if (NewState != DISABLE)
 523  0000 4d            	tnz	a
 524  0001 2705          	jreq	L332
 525                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 527  0003 721c5200      	bset	20992,#6
 530  0007 81            	ret	
 531  0008               L332:
 532                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 534  0008 721d5200      	bres	20992,#6
 535                     ; 126 }
 538  000c 81            	ret	
 645                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 645                     ; 136 {
 646                     .text:	section	.text,new
 647  0000               _SPI_ITConfig:
 649  0000 89            	pushw	x
 650  0001 88            	push	a
 651       00000001      OFST:	set	1
 654                     ; 137     uint8_t itpos = 0;
 656                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 658                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 660                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 662  0002 9e            	ld	a,xh
 663  0003 a40f          	and	a,#15
 664  0005 5f            	clrw	x
 665  0006 97            	ld	xl,a
 666  0007 a601          	ld	a,#1
 667  0009 5d            	tnzw	x
 668  000a 2704          	jreq	L41
 669  000c               L61:
 670  000c 48            	sll	a
 671  000d 5a            	decw	x
 672  000e 26fc          	jrne	L61
 673  0010               L41:
 674  0010 6b01          	ld	(OFST+0,sp),a
 676                     ; 145     if (NewState != DISABLE)
 678  0012 0d03          	tnz	(OFST+2,sp)
 679  0014 2707          	jreq	L503
 680                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 682  0016 c65202        	ld	a,20994
 683  0019 1a01          	or	a,(OFST+0,sp)
 685  001b 2004          	jra	L703
 686  001d               L503:
 687                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 689  001d 43            	cpl	a
 690  001e c45202        	and	a,20994
 691  0021               L703:
 692  0021 c75202        	ld	20994,a
 693                     ; 153 }
 696  0024 5b03          	addw	sp,#3
 697  0026 81            	ret	
 729                     ; 159 void SPI_SendData(uint8_t Data)
 729                     ; 160 {
 730                     .text:	section	.text,new
 731  0000               _SPI_SendData:
 735                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 737  0000 c75204        	ld	20996,a
 738                     ; 162 }
 741  0003 81            	ret	
 764                     ; 169 uint8_t SPI_ReceiveData(void)
 764                     ; 170 {
 765                     .text:	section	.text,new
 766  0000               _SPI_ReceiveData:
 770                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 772  0000 c65204        	ld	a,20996
 775  0003 81            	ret	
 811                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 811                     ; 181 {
 812                     .text:	section	.text,new
 813  0000               _SPI_NSSInternalSoftwareCmd:
 817                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 819                     ; 185     if (NewState != DISABLE)
 821  0000 4d            	tnz	a
 822  0001 2705          	jreq	L353
 823                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 825  0003 72105201      	bset	20993,#0
 828  0007 81            	ret	
 829  0008               L353:
 830                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 832  0008 72115201      	bres	20993,#0
 833                     ; 193 }
 836  000c 81            	ret	
 859                     ; 200 void SPI_TransmitCRC(void)
 859                     ; 201 {
 860                     .text:	section	.text,new
 861  0000               _SPI_TransmitCRC:
 865                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 867  0000 72185201      	bset	20993,#4
 868                     ; 203 }
 871  0004 81            	ret	
 907                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
 907                     ; 212 {
 908                     .text:	section	.text,new
 909  0000               _SPI_CalculateCRCCmd:
 913                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 915                     ; 216     if (NewState != DISABLE)
 917  0000 4d            	tnz	a
 918  0001 2705          	jreq	L504
 919                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 921  0003 721a5201      	bset	20993,#5
 924  0007 81            	ret	
 925  0008               L504:
 926                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 928  0008 721b5201      	bres	20993,#5
 929                     ; 224 }
 932  000c 81            	ret	
 994                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 994                     ; 232 {
 995                     .text:	section	.text,new
 996  0000               _SPI_GetCRC:
 998  0000 88            	push	a
 999       00000001      OFST:	set	1
1002                     ; 233     uint8_t crcreg = 0;
1004                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1006                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1008  0001 4d            	tnz	a
1009  0002 2705          	jreq	L144
1010                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1012  0004 c65207        	ld	a,20999
1015  0007 2003          	jra	L344
1016  0009               L144:
1017                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1019  0009 c65206        	ld	a,20998
1021  000c               L344:
1022                     ; 248     return crcreg;
1026  000c 5b01          	addw	sp,#1
1027  000e 81            	ret	
1052                     ; 256 void SPI_ResetCRC(void)
1052                     ; 257 {
1053                     .text:	section	.text,new
1054  0000               _SPI_ResetCRC:
1058                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1060  0000 a601          	ld	a,#1
1061  0002 cd0000        	call	_SPI_CalculateCRCCmd
1063                     ; 263     SPI_Cmd(ENABLE);
1065  0005 a601          	ld	a,#1
1067                     ; 264 }
1070  0007 cc0000        	jp	_SPI_Cmd
1094                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1094                     ; 272 {
1095                     .text:	section	.text,new
1096  0000               _SPI_GetCRCPolynomial:
1100                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1102  0000 c65205        	ld	a,20997
1105  0003 81            	ret	
1161                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1161                     ; 282 {
1162                     .text:	section	.text,new
1163  0000               _SPI_BiDirectionalLineConfig:
1167                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1169                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1171  0000 4d            	tnz	a
1172  0001 2705          	jreq	L315
1173                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1175  0003 721c5201      	bset	20993,#6
1178  0007 81            	ret	
1179  0008               L315:
1180                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1182  0008 721d5201      	bres	20993,#6
1183                     ; 294 }
1186  000c 81            	ret	
1307                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1307                     ; 305 {
1308                     .text:	section	.text,new
1309  0000               _SPI_GetFlagStatus:
1311  0000 88            	push	a
1312       00000001      OFST:	set	1
1315                     ; 306     FlagStatus status = RESET;
1317                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1319                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1321  0001 c45203        	and	a,20995
1322  0004 2702          	jreq	L375
1323                     ; 313         status = SET; /* SPI_FLAG is set */
1325  0006 a601          	ld	a,#1
1328  0008               L375:
1329                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1332                     ; 321     return status;
1336  0008 5b01          	addw	sp,#1
1337  000a 81            	ret	
1372                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1372                     ; 340 {
1373                     .text:	section	.text,new
1374  0000               _SPI_ClearFlag:
1378                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1380                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1382  0000 43            	cpl	a
1383  0001 c75203        	ld	20995,a
1384                     ; 344 }
1387  0004 81            	ret	
1461                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1461                     ; 360 {
1462                     .text:	section	.text,new
1463  0000               _SPI_GetITStatus:
1465  0000 88            	push	a
1466  0001 89            	pushw	x
1467       00000002      OFST:	set	2
1470                     ; 361     ITStatus pendingbitstatus = RESET;
1472                     ; 362     uint8_t itpos = 0;
1474                     ; 363     uint8_t itmask1 = 0;
1476                     ; 364     uint8_t itmask2 = 0;
1478                     ; 365     uint8_t enablestatus = 0;
1480                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1482                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1484  0002 a40f          	and	a,#15
1485  0004 5f            	clrw	x
1486  0005 97            	ld	xl,a
1487  0006 a601          	ld	a,#1
1488  0008 5d            	tnzw	x
1489  0009 2704          	jreq	L45
1490  000b               L65:
1491  000b 48            	sll	a
1492  000c 5a            	decw	x
1493  000d 26fc          	jrne	L65
1494  000f               L45:
1495  000f 6b01          	ld	(OFST-1,sp),a
1497                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1499  0011 7b03          	ld	a,(OFST+1,sp)
1500  0013 4e            	swap	a
1501  0014 a40f          	and	a,#15
1502  0016 6b02          	ld	(OFST+0,sp),a
1504                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1506  0018 5f            	clrw	x
1507  0019 97            	ld	xl,a
1508  001a a601          	ld	a,#1
1509  001c 5d            	tnzw	x
1510  001d 2704          	jreq	L06
1511  001f               L26:
1512  001f 48            	sll	a
1513  0020 5a            	decw	x
1514  0021 26fc          	jrne	L26
1515  0023               L06:
1517                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1519  0023 c45203        	and	a,20995
1520  0026 6b02          	ld	(OFST+0,sp),a
1522                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1524  0028 c65202        	ld	a,20994
1525  002b 1501          	bcp	a,(OFST-1,sp)
1526  002d 2708          	jreq	L746
1528  002f 7b02          	ld	a,(OFST+0,sp)
1529  0031 2704          	jreq	L746
1530                     ; 380         pendingbitstatus = SET;
1532  0033 a601          	ld	a,#1
1535  0035 2001          	jra	L156
1536  0037               L746:
1537                     ; 385         pendingbitstatus = RESET;
1539  0037 4f            	clr	a
1541  0038               L156:
1542                     ; 388     return  pendingbitstatus;
1546  0038 5b03          	addw	sp,#3
1547  003a 81            	ret	
1590                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1590                     ; 405 {
1591                     .text:	section	.text,new
1592  0000               _SPI_ClearITPendingBit:
1594  0000 88            	push	a
1595       00000001      OFST:	set	1
1598                     ; 406     uint8_t itpos = 0;
1600                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1602                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1604  0001 4e            	swap	a
1605  0002 a40f          	and	a,#15
1606  0004 5f            	clrw	x
1607  0005 97            	ld	xl,a
1608  0006 a601          	ld	a,#1
1609  0008 5d            	tnzw	x
1610  0009 2704          	jreq	L66
1611  000b               L07:
1612  000b 48            	sll	a
1613  000c 5a            	decw	x
1614  000d 26fc          	jrne	L07
1615  000f               L66:
1617                     ; 414     SPI->SR = (uint8_t)(~itpos);
1619  000f 43            	cpl	a
1620  0010 c75203        	ld	20995,a
1621                     ; 416 }
1624  0013 84            	pop	a
1625  0014 81            	ret	
1638                     	xdef	_SPI_ClearITPendingBit
1639                     	xdef	_SPI_GetITStatus
1640                     	xdef	_SPI_ClearFlag
1641                     	xdef	_SPI_GetFlagStatus
1642                     	xdef	_SPI_BiDirectionalLineConfig
1643                     	xdef	_SPI_GetCRCPolynomial
1644                     	xdef	_SPI_ResetCRC
1645                     	xdef	_SPI_GetCRC
1646                     	xdef	_SPI_CalculateCRCCmd
1647                     	xdef	_SPI_TransmitCRC
1648                     	xdef	_SPI_NSSInternalSoftwareCmd
1649                     	xdef	_SPI_ReceiveData
1650                     	xdef	_SPI_SendData
1651                     	xdef	_SPI_ITConfig
1652                     	xdef	_SPI_Cmd
1653                     	xdef	_SPI_Init
1654                     	xdef	_SPI_DeInit
1673                     	end
