   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  83                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  83                     ; 82 {
  85                     .text:	section	.text,new
  86  0000               _FLASH_Unlock:
  90                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  92                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  94  0000 a1fd          	cp	a,#253
  95  0002 2609          	jrne	L73
  96                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  98  0004 35565062      	mov	20578,#86
  99                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 101  0008 35ae5062      	mov	20578,#174
 104  000c 81            	ret	
 105  000d               L73:
 106                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 108  000d 35ae5064      	mov	20580,#174
 109                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 111  0011 35565064      	mov	20580,#86
 112                     ; 98 }
 115  0015 81            	ret	
 150                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 150                     ; 107 {
 151                     .text:	section	.text,new
 152  0000               _FLASH_Lock:
 156                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 158                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 160  0000 c4505f        	and	a,20575
 161  0003 c7505f        	ld	20575,a
 162                     ; 113 }
 165  0006 81            	ret	
 188                     ; 120 void FLASH_DeInit(void)
 188                     ; 121 {
 189                     .text:	section	.text,new
 190  0000               _FLASH_DeInit:
 194                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 196  0000 725f505a      	clr	20570
 197                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 199  0004 725f505b      	clr	20571
 200                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 202  0008 35ff505c      	mov	20572,#255
 203                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 205  000c 7217505f      	bres	20575,#3
 206                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 208  0010 7213505f      	bres	20575,#1
 209                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 211  0014 c6505f        	ld	a,20575
 212                     ; 128 }
 215  0017 81            	ret	
 270                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 270                     ; 137 {
 271                     .text:	section	.text,new
 272  0000               _FLASH_ITConfig:
 276                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 278                     ; 141     if (NewState != DISABLE)
 280  0000 4d            	tnz	a
 281  0001 2705          	jreq	L711
 282                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 284  0003 7212505a      	bset	20570,#1
 287  0007 81            	ret	
 288  0008               L711:
 289                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 291  0008 7213505a      	bres	20570,#1
 292                     ; 149 }
 295  000c 81            	ret	
 327                     ; 158 void FLASH_EraseByte(uint32_t Address)
 327                     ; 159 {
 328                     .text:	section	.text,new
 329  0000               _FLASH_EraseByte:
 331       00000000      OFST:	set	0
 334                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 336                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 338  0000 1e05          	ldw	x,(OFST+5,sp)
 339  0002 7f            	clr	(x)
 340                     ; 166 }
 343  0003 81            	ret	
 382                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 382                     ; 177 {
 383                     .text:	section	.text,new
 384  0000               _FLASH_ProgramByte:
 386       00000000      OFST:	set	0
 389                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 391                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 393  0000 1e05          	ldw	x,(OFST+5,sp)
 394  0002 7b07          	ld	a,(OFST+7,sp)
 395  0004 f7            	ld	(x),a
 396                     ; 181 }
 399  0005 81            	ret	
 431                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 431                     ; 191 {
 432                     .text:	section	.text,new
 433  0000               _FLASH_ReadByte:
 435       00000000      OFST:	set	0
 438                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 440                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 442  0000 1e05          	ldw	x,(OFST+5,sp)
 443  0002 f6            	ld	a,(x)
 446  0003 81            	ret	
 485                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 485                     ; 208 {
 486                     .text:	section	.text,new
 487  0000               _FLASH_ProgramWord:
 489       00000000      OFST:	set	0
 492                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 494                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 496  0000 721c505b      	bset	20571,#6
 497                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 499  0004 721d505c      	bres	20572,#6
 500                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 502  0008 1e05          	ldw	x,(OFST+5,sp)
 503  000a 7b07          	ld	a,(OFST+7,sp)
 504  000c f7            	ld	(x),a
 505                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 507  000d 7b08          	ld	a,(OFST+8,sp)
 508  000f e701          	ld	(1,x),a
 509                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 511  0011 7b09          	ld	a,(OFST+9,sp)
 512  0013 e702          	ld	(2,x),a
 513                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 515  0015 7b0a          	ld	a,(OFST+10,sp)
 516  0017 e703          	ld	(3,x),a
 517                     ; 224 }
 520  0019 81            	ret	
 561                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 561                     ; 233 {
 562                     .text:	section	.text,new
 563  0000               _FLASH_ProgramOptionByte:
 565  0000 89            	pushw	x
 566       00000000      OFST:	set	0
 569                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 571                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 573  0001 721e505b      	bset	20571,#7
 574                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 576  0005 721f505c      	bres	20572,#7
 577                     ; 242     if (Address == 0x4800)
 579  0009 a34800        	cpw	x,#18432
 580  000c 2605          	jrne	L522
 581                     ; 245        *((NEAR uint8_t*)Address) = Data;
 583  000e 7b05          	ld	a,(OFST+5,sp)
 584  0010 f7            	ld	(x),a
 586  0011 2006          	jra	L722
 587  0013               L522:
 588                     ; 250        *((NEAR uint8_t*)Address) = Data;
 590  0013 7b05          	ld	a,(OFST+5,sp)
 591  0015 f7            	ld	(x),a
 592                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 594  0016 43            	cpl	a
 595  0017 e701          	ld	(1,x),a
 596  0019               L722:
 597                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 599  0019 a6fd          	ld	a,#253
 600  001b cd0000        	call	_FLASH_WaitForLastOperation
 602                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 604  001e 721f505b      	bres	20571,#7
 605                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 607  0022 721e505c      	bset	20572,#7
 608                     ; 258 }
 611  0026 85            	popw	x
 612  0027 81            	ret	
 646                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 646                     ; 266 {
 647                     .text:	section	.text,new
 648  0000               _FLASH_EraseOptionByte:
 650  0000 89            	pushw	x
 651       00000000      OFST:	set	0
 654                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 656                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 658  0001 721e505b      	bset	20571,#7
 659                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 661  0005 721f505c      	bres	20572,#7
 662                     ; 275      if (Address == 0x4800)
 664  0009 a34800        	cpw	x,#18432
 665  000c 2603          	jrne	L542
 666                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 668  000e 7f            	clr	(x)
 670  000f 2005          	jra	L742
 671  0011               L542:
 672                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 674  0011 7f            	clr	(x)
 675                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 677  0012 a6ff          	ld	a,#255
 678  0014 e701          	ld	(1,x),a
 679  0016               L742:
 680                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 682  0016 a6fd          	ld	a,#253
 683  0018 cd0000        	call	_FLASH_WaitForLastOperation
 685                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 687  001b 721f505b      	bres	20571,#7
 688                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 690  001f 721e505c      	bset	20572,#7
 691                     ; 291 }
 694  0023 85            	popw	x
 695  0024 81            	ret	
 750                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 750                     ; 298 {
 751                     .text:	section	.text,new
 752  0000               _FLASH_ReadOptionByte:
 754  0000 5204          	subw	sp,#4
 755       00000004      OFST:	set	4
 758                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 760                     ; 300     uint16_t res_value = 0;
 762                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 764                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 766  0002 f6            	ld	a,(x)
 767  0003 6b02          	ld	(OFST-2,sp),a
 769                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 771  0005 e601          	ld	a,(1,x)
 772  0007 6b01          	ld	(OFST-3,sp),a
 774                     ; 310     if (Address == 0x4800)	 
 776  0009 a34800        	cpw	x,#18432
 777  000c 2606          	jrne	L372
 778                     ; 312         res_value =	 value_optbyte;
 780  000e 7b02          	ld	a,(OFST-2,sp)
 781  0010 5f            	clrw	x
 782  0011 97            	ld	xl,a
 785  0012 201c          	jra	L572
 786  0014               L372:
 787                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 789  0014 43            	cpl	a
 790  0015 1102          	cp	a,(OFST-2,sp)
 791  0017 2614          	jrne	L772
 792                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 794  0019 7b02          	ld	a,(OFST-2,sp)
 795  001b 97            	ld	xl,a
 796  001c 4f            	clr	a
 797  001d 02            	rlwa	x,a
 798  001e 1f03          	ldw	(OFST-1,sp),x
 800                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 802  0020 5f            	clrw	x
 803  0021 7b01          	ld	a,(OFST-3,sp)
 804  0023 97            	ld	xl,a
 805  0024 01            	rrwa	x,a
 806  0025 1a04          	or	a,(OFST+0,sp)
 807  0027 01            	rrwa	x,a
 808  0028 1a03          	or	a,(OFST-1,sp)
 809  002a 01            	rrwa	x,a
 812  002b 2003          	jra	L572
 813  002d               L772:
 814                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 816  002d ae5555        	ldw	x,#21845
 818  0030               L572:
 819                     ; 326     return(res_value);
 823  0030 5b04          	addw	sp,#4
 824  0032 81            	ret	
 898                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 898                     ; 336 {
 899                     .text:	section	.text,new
 900  0000               _FLASH_SetLowPowerMode:
 902  0000 88            	push	a
 903       00000000      OFST:	set	0
 906                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 908                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 910  0001 c6505a        	ld	a,20570
 911  0004 a4f3          	and	a,#243
 912  0006 c7505a        	ld	20570,a
 913                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 915  0009 c6505a        	ld	a,20570
 916  000c 1a01          	or	a,(OFST+1,sp)
 917  000e c7505a        	ld	20570,a
 918                     ; 345 }
 921  0011 84            	pop	a
 922  0012 81            	ret	
 980                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
 980                     ; 354 {
 981                     .text:	section	.text,new
 982  0000               _FLASH_SetProgrammingTime:
 986                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
 988                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
 990  0000 7211505a      	bres	20570,#0
 991                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
 993  0004 ca505a        	or	a,20570
 994  0007 c7505a        	ld	20570,a
 995                     ; 360 }
 998  000a 81            	ret	
1023                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1023                     ; 368 {
1024                     .text:	section	.text,new
1025  0000               _FLASH_GetLowPowerMode:
1029                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1031  0000 c6505a        	ld	a,20570
1032  0003 a40c          	and	a,#12
1035  0005 81            	ret	
1060                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1060                     ; 378 {
1061                     .text:	section	.text,new
1062  0000               _FLASH_GetProgrammingTime:
1066                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1068  0000 c6505a        	ld	a,20570
1069  0003 a401          	and	a,#1
1072  0005 81            	ret	
1104                     ; 387 uint32_t FLASH_GetBootSize(void)
1104                     ; 388 {
1105                     .text:	section	.text,new
1106  0000               _FLASH_GetBootSize:
1108  0000 5204          	subw	sp,#4
1109       00000004      OFST:	set	4
1112                     ; 389     uint32_t temp = 0;
1114                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1116  0002 c6505d        	ld	a,20573
1117  0005 5f            	clrw	x
1118  0006 97            	ld	xl,a
1119  0007 90ae0200      	ldw	y,#512
1120  000b cd0000        	call	c_umul
1122  000e 96            	ldw	x,sp
1123  000f 5c            	incw	x
1124  0010 cd0000        	call	c_rtol
1127                     ; 395     if (FLASH->FPR == 0xFF)
1129  0013 c6505d        	ld	a,20573
1130  0016 4c            	inc	a
1131  0017 260d          	jrne	L714
1132                     ; 397         temp += 512;
1134  0019 ae0200        	ldw	x,#512
1135  001c bf02          	ldw	c_lreg+2,x
1136  001e 5f            	clrw	x
1137  001f bf00          	ldw	c_lreg,x
1138  0021 96            	ldw	x,sp
1139  0022 5c            	incw	x
1140  0023 cd0000        	call	c_lgadd
1143  0026               L714:
1144                     ; 401     return(temp);
1146  0026 96            	ldw	x,sp
1147  0027 5c            	incw	x
1148  0028 cd0000        	call	c_ltor
1152  002b 5b04          	addw	sp,#4
1153  002d 81            	ret	
1255                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1255                     ; 413 {
1256                     .text:	section	.text,new
1257  0000               _FLASH_GetFlagStatus:
1259  0000 88            	push	a
1260       00000001      OFST:	set	1
1263                     ; 414     FlagStatus status = RESET;
1265                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1267                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1269  0001 c4505f        	and	a,20575
1270  0004 2702          	jreq	L764
1271                     ; 421         status = SET; /* FLASH_FLAG is set */
1273  0006 a601          	ld	a,#1
1276  0008               L764:
1277                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1280                     ; 429     return status;
1284  0008 5b01          	addw	sp,#1
1285  000a 81            	ret	
1366                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1366                     ; 532 {
1367                     .text:	section	.text,new
1368  0000               _FLASH_WaitForLastOperation:
1370  0000 5205          	subw	sp,#5
1371       00000005      OFST:	set	5
1374                     ; 533     uint8_t flagstatus = 0x00;
1376  0002 0f05          	clr	(OFST+0,sp)
1378                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1380  0004 aeffff        	ldw	x,#65535
1381  0007 1f03          	ldw	(OFST-2,sp),x
1382  0009 ae000f        	ldw	x,#15
1383  000c 1f01          	ldw	(OFST-4,sp),x
1386  000e 200e          	jra	L335
1387  0010               L725:
1388                     ; 560         flagstatus = (uint8_t)(FLASH->IAPSR & (FLASH_IAPSR_EOP | FLASH_IAPSR_WR_PG_DIS));
1390  0010 c6505f        	ld	a,20575
1391  0013 a405          	and	a,#5
1392  0015 6b05          	ld	(OFST+0,sp),a
1394                     ; 561         timeout--;
1396  0017 96            	ldw	x,sp
1397  0018 5c            	incw	x
1398  0019 a601          	ld	a,#1
1399  001b cd0000        	call	c_lgsbc
1402  001e               L335:
1403                     ; 558     while ((flagstatus == 0x00) && (timeout != 0x00))
1405  001e 7b05          	ld	a,(OFST+0,sp)
1406  0020 2607          	jrne	L735
1408  0022 96            	ldw	x,sp
1409  0023 5c            	incw	x
1410  0024 cd0000        	call	c_lzmp
1412  0027 26e7          	jrne	L725
1413  0029               L735:
1414                     ; 566     if (timeout == 0x00 )
1416  0029 96            	ldw	x,sp
1417  002a 5c            	incw	x
1418  002b cd0000        	call	c_lzmp
1420  002e 2604          	jrne	L145
1421                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1423  0030 a602          	ld	a,#2
1424  0032 6b05          	ld	(OFST+0,sp),a
1426  0034               L145:
1427                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1429  0034 7b05          	ld	a,(OFST+0,sp)
1432  0036 5b05          	addw	sp,#5
1433  0038 81            	ret	
1492                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1492                     ; 582 {
1493                     .text:	section	.text,new
1494  0000               _FLASH_EraseBlock:
1496  0000 89            	pushw	x
1497  0001 5206          	subw	sp,#6
1498       00000006      OFST:	set	6
1501                     ; 583   uint32_t startaddress = 0;
1503                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1505                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1507  0003 7b0b          	ld	a,(OFST+5,sp)
1508  0005 a1fd          	cp	a,#253
1509  0007 2605          	jrne	L175
1510                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1512                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1514  0009 ae8000        	ldw	x,#32768
1516  000c 2003          	jra	L375
1517  000e               L175:
1518                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1520                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1522  000e ae4000        	ldw	x,#16384
1523  0011               L375:
1524  0011 1f05          	ldw	(OFST-1,sp),x
1525  0013 5f            	clrw	x
1526  0014 1f03          	ldw	(OFST-3,sp),x
1528                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1530  0016 a640          	ld	a,#64
1531  0018 1e07          	ldw	x,(OFST+1,sp)
1532  001a cd0000        	call	c_cmulx
1534  001d 96            	ldw	x,sp
1535  001e 1c0003        	addw	x,#OFST-3
1536  0021 cd0000        	call	c_ladd
1538  0024 be02          	ldw	x,c_lreg+2
1539  0026 1f01          	ldw	(OFST-5,sp),x
1541                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1543  0028 721a505b      	bset	20571,#5
1544                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1546  002c 721b505c      	bres	20572,#5
1547                     ; 619     *pwFlash = (uint32_t)0;
1549  0030 4f            	clr	a
1550  0031 e703          	ld	(3,x),a
1551  0033 e702          	ld	(2,x),a
1552  0035 e701          	ld	(1,x),a
1553  0037 f7            	ld	(x),a
1554                     ; 627 }
1557  0038 5b08          	addw	sp,#8
1558  003a 81            	ret	
1656                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1656                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1656                     ; 640 {
1657                     .text:	section	.text,new
1658  0000               _FLASH_ProgramBlock:
1660  0000 89            	pushw	x
1661  0001 5206          	subw	sp,#6
1662       00000006      OFST:	set	6
1665                     ; 641     uint16_t Count = 0;
1667                     ; 642     uint32_t startaddress = 0;
1669                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1671                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1673                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1675  0003 7b0b          	ld	a,(OFST+5,sp)
1676  0005 a1fd          	cp	a,#253
1677  0007 2605          	jrne	L146
1678                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1680                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1682  0009 ae8000        	ldw	x,#32768
1684  000c 2003          	jra	L346
1685  000e               L146:
1686                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1688                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1690  000e ae4000        	ldw	x,#16384
1691  0011               L346:
1692  0011 1f03          	ldw	(OFST-3,sp),x
1693  0013 5f            	clrw	x
1694  0014 1f01          	ldw	(OFST-5,sp),x
1696                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1698  0016 a640          	ld	a,#64
1699  0018 1e07          	ldw	x,(OFST+1,sp)
1700  001a cd0000        	call	c_cmulx
1702  001d 96            	ldw	x,sp
1703  001e 5c            	incw	x
1704  001f cd0000        	call	c_lgadd
1707                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1709  0022 7b0c          	ld	a,(OFST+6,sp)
1710  0024 260a          	jrne	L546
1711                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1713  0026 7210505b      	bset	20571,#0
1714                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1716  002a 7211505c      	bres	20572,#0
1718  002e 2008          	jra	L746
1719  0030               L546:
1720                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1722  0030 7218505b      	bset	20571,#4
1723                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1725  0034 7219505c      	bres	20572,#4
1726  0038               L746:
1727                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1729  0038 5f            	clrw	x
1730  0039 1f05          	ldw	(OFST-1,sp),x
1732  003b               L156:
1733                     ; 682   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1735  003b 1e0d          	ldw	x,(OFST+7,sp)
1736  003d 72fb05        	addw	x,(OFST-1,sp)
1737  0040 f6            	ld	a,(x)
1738  0041 1e03          	ldw	x,(OFST-3,sp)
1739  0043 72fb05        	addw	x,(OFST-1,sp)
1740  0046 f7            	ld	(x),a
1741                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1743  0047 1e05          	ldw	x,(OFST-1,sp)
1744  0049 5c            	incw	x
1745  004a 1f05          	ldw	(OFST-1,sp),x
1749  004c a30040        	cpw	x,#64
1750  004f 25ea          	jrult	L156
1751                     ; 685 }
1754  0051 5b08          	addw	sp,#8
1755  0053 81            	ret	
1768                     	xdef	_FLASH_WaitForLastOperation
1769                     	xdef	_FLASH_ProgramBlock
1770                     	xdef	_FLASH_EraseBlock
1771                     	xdef	_FLASH_GetFlagStatus
1772                     	xdef	_FLASH_GetBootSize
1773                     	xdef	_FLASH_GetProgrammingTime
1774                     	xdef	_FLASH_GetLowPowerMode
1775                     	xdef	_FLASH_SetProgrammingTime
1776                     	xdef	_FLASH_SetLowPowerMode
1777                     	xdef	_FLASH_EraseOptionByte
1778                     	xdef	_FLASH_ProgramOptionByte
1779                     	xdef	_FLASH_ReadOptionByte
1780                     	xdef	_FLASH_ProgramWord
1781                     	xdef	_FLASH_ReadByte
1782                     	xdef	_FLASH_ProgramByte
1783                     	xdef	_FLASH_EraseByte
1784                     	xdef	_FLASH_ITConfig
1785                     	xdef	_FLASH_DeInit
1786                     	xdef	_FLASH_Lock
1787                     	xdef	_FLASH_Unlock
1788                     	xref.b	c_lreg
1789                     	xref.b	c_x
1790                     	xref.b	c_y
1809                     	xref	c_ladd
1810                     	xref	c_cmulx
1811                     	xref	c_lzmp
1812                     	xref	c_lgsbc
1813                     	xref	c_ltor
1814                     	xref	c_lgadd
1815                     	xref	c_rtol
1816                     	xref	c_umul
1817                     	end
