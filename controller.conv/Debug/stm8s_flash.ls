   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  77                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  77                     ; 82 {
  79                     	switch	.text
  80  0000               _FLASH_Unlock:
  84                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  86                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  88  0000 a1fd          	cp	a,#253
  89  0002 260a          	jrne	L73
  90                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  92  0004 35565062      	mov	20578,#86
  93                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
  95  0008 35ae5062      	mov	20578,#174
  97  000c 2008          	jra	L14
  98  000e               L73:
  99                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 101  000e 35ae5064      	mov	20580,#174
 102                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 104  0012 35565064      	mov	20580,#86
 105  0016               L14:
 106                     ; 98 }
 109  0016 81            	ret
 144                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 144                     ; 107 {
 145                     	switch	.text
 146  0017               _FLASH_Lock:
 150                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 152                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 154  0017 c4505f        	and	a,20575
 155  001a c7505f        	ld	20575,a
 156                     ; 113 }
 159  001d 81            	ret
 182                     ; 120 void FLASH_DeInit(void)
 182                     ; 121 {
 183                     	switch	.text
 184  001e               _FLASH_DeInit:
 188                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 190  001e 725f505a      	clr	20570
 191                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 193  0022 725f505b      	clr	20571
 194                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 196  0026 35ff505c      	mov	20572,#255
 197                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 199  002a 7217505f      	bres	20575,#3
 200                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 202  002e 7213505f      	bres	20575,#1
 203                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 205  0032 c6505f        	ld	a,20575
 206                     ; 128 }
 209  0035 81            	ret
 264                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 264                     ; 137 {
 265                     	switch	.text
 266  0036               _FLASH_ITConfig:
 270                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 272                     ; 141     if (NewState != DISABLE)
 274  0036 4d            	tnz	a
 275  0037 2706          	jreq	L711
 276                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 278  0039 7212505a      	bset	20570,#1
 280  003d 2004          	jra	L121
 281  003f               L711:
 282                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 284  003f 7213505a      	bres	20570,#1
 285  0043               L121:
 286                     ; 149 }
 289  0043 81            	ret
 323                     ; 158 void FLASH_EraseByte(uint32_t Address)
 323                     ; 159 {
 324                     	switch	.text
 325  0044               _FLASH_EraseByte:
 327       00000000      OFST:	set	0
 330                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 332                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 334  0044 1e05          	ldw	x,(OFST+5,sp)
 335  0046 7f            	clr	(x)
 336                     ; 166 }
 339  0047 81            	ret
 382                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 382                     ; 177 {
 383                     	switch	.text
 384  0048               _FLASH_ProgramByte:
 386       00000000      OFST:	set	0
 389                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 391                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 393  0048 7b07          	ld	a,(OFST+7,sp)
 394  004a 1e05          	ldw	x,(OFST+5,sp)
 395  004c f7            	ld	(x),a
 396                     ; 181 }
 399  004d 81            	ret
 433                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 433                     ; 191 {
 434                     	switch	.text
 435  004e               _FLASH_ReadByte:
 437       00000000      OFST:	set	0
 440                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 442                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 444  004e 1e05          	ldw	x,(OFST+5,sp)
 445  0050 f6            	ld	a,(x)
 448  0051 81            	ret
 491                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 491                     ; 208 {
 492                     	switch	.text
 493  0052               _FLASH_ProgramWord:
 495       00000000      OFST:	set	0
 498                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 500                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 502  0052 721c505b      	bset	20571,#6
 503                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 505  0056 721d505c      	bres	20572,#6
 506                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 508  005a 7b07          	ld	a,(OFST+7,sp)
 509  005c 1e05          	ldw	x,(OFST+5,sp)
 510  005e f7            	ld	(x),a
 511                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 513  005f 7b08          	ld	a,(OFST+8,sp)
 514  0061 1e05          	ldw	x,(OFST+5,sp)
 515  0063 e701          	ld	(1,x),a
 516                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 518  0065 7b09          	ld	a,(OFST+9,sp)
 519  0067 1e05          	ldw	x,(OFST+5,sp)
 520  0069 e702          	ld	(2,x),a
 521                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 523  006b 7b0a          	ld	a,(OFST+10,sp)
 524  006d 1e05          	ldw	x,(OFST+5,sp)
 525  006f e703          	ld	(3,x),a
 526                     ; 224 }
 529  0071 81            	ret
 574                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 574                     ; 233 {
 575                     	switch	.text
 576  0072               _FLASH_ProgramOptionByte:
 578  0072 89            	pushw	x
 579       00000000      OFST:	set	0
 582                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 584                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 586  0073 721e505b      	bset	20571,#7
 587                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 589  0077 721f505c      	bres	20572,#7
 590                     ; 242     if (Address == 0x4800)
 592  007b a34800        	cpw	x,#18432
 593  007e 2607          	jrne	L542
 594                     ; 245        *((NEAR uint8_t*)Address) = Data;
 596  0080 7b05          	ld	a,(OFST+5,sp)
 597  0082 1e01          	ldw	x,(OFST+1,sp)
 598  0084 f7            	ld	(x),a
 600  0085 200c          	jra	L742
 601  0087               L542:
 602                     ; 250        *((NEAR uint8_t*)Address) = Data;
 604  0087 7b05          	ld	a,(OFST+5,sp)
 605  0089 1e01          	ldw	x,(OFST+1,sp)
 606  008b f7            	ld	(x),a
 607                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 609  008c 7b05          	ld	a,(OFST+5,sp)
 610  008e 43            	cpl	a
 611  008f 1e01          	ldw	x,(OFST+1,sp)
 612  0091 e701          	ld	(1,x),a
 613  0093               L742:
 614                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 616  0093 a6fd          	ld	a,#253
 617  0095 cd017d        	call	_FLASH_WaitForLastOperation
 619                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 621  0098 721f505b      	bres	20571,#7
 622                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 624  009c 721e505c      	bset	20572,#7
 625                     ; 258 }
 628  00a0 85            	popw	x
 629  00a1 81            	ret
 665                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 665                     ; 266 {
 666                     	switch	.text
 667  00a2               _FLASH_EraseOptionByte:
 669  00a2 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 675                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 677  00a3 721e505b      	bset	20571,#7
 678                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 680  00a7 721f505c      	bres	20572,#7
 681                     ; 275      if (Address == 0x4800)
 683  00ab a34800        	cpw	x,#18432
 684  00ae 2603          	jrne	L762
 685                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 687  00b0 7f            	clr	(x)
 689  00b1 2009          	jra	L172
 690  00b3               L762:
 691                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 693  00b3 1e01          	ldw	x,(OFST+1,sp)
 694  00b5 7f            	clr	(x)
 695                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 697  00b6 1e01          	ldw	x,(OFST+1,sp)
 698  00b8 a6ff          	ld	a,#255
 699  00ba e701          	ld	(1,x),a
 700  00bc               L172:
 701                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 703  00bc a6fd          	ld	a,#253
 704  00be cd017d        	call	_FLASH_WaitForLastOperation
 706                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 708  00c1 721f505b      	bres	20571,#7
 709                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 711  00c5 721e505c      	bset	20572,#7
 712                     ; 291 }
 715  00c9 85            	popw	x
 716  00ca 81            	ret
 779                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 779                     ; 298 {
 780                     	switch	.text
 781  00cb               _FLASH_ReadOptionByte:
 783  00cb 5204          	subw	sp,#4
 784       00000004      OFST:	set	4
 787                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 789                     ; 300     uint16_t res_value = 0;
 791                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 793                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 795  00cd f6            	ld	a,(x)
 796  00ce 6b02          	ld	(OFST-2,sp),a
 798                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 800  00d0 e601          	ld	a,(1,x)
 801  00d2 6b01          	ld	(OFST-3,sp),a
 803                     ; 310     if (Address == 0x4800)	 
 805  00d4 a34800        	cpw	x,#18432
 806  00d7 2608          	jrne	L523
 807                     ; 312         res_value =	 value_optbyte;
 809  00d9 7b02          	ld	a,(OFST-2,sp)
 810  00db 5f            	clrw	x
 811  00dc 97            	ld	xl,a
 812  00dd 1f03          	ldw	(OFST-1,sp),x
 815  00df 2023          	jra	L723
 816  00e1               L523:
 817                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 819  00e1 7b01          	ld	a,(OFST-3,sp)
 820  00e3 43            	cpl	a
 821  00e4 1102          	cp	a,(OFST-2,sp)
 822  00e6 2617          	jrne	L133
 823                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 825  00e8 7b02          	ld	a,(OFST-2,sp)
 826  00ea 5f            	clrw	x
 827  00eb 97            	ld	xl,a
 828  00ec 4f            	clr	a
 829  00ed 02            	rlwa	x,a
 830  00ee 1f03          	ldw	(OFST-1,sp),x
 832                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 834  00f0 7b01          	ld	a,(OFST-3,sp)
 835  00f2 5f            	clrw	x
 836  00f3 97            	ld	xl,a
 837  00f4 01            	rrwa	x,a
 838  00f5 1a04          	or	a,(OFST+0,sp)
 839  00f7 01            	rrwa	x,a
 840  00f8 1a03          	or	a,(OFST-1,sp)
 841  00fa 01            	rrwa	x,a
 842  00fb 1f03          	ldw	(OFST-1,sp),x
 845  00fd 2005          	jra	L723
 846  00ff               L133:
 847                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 849  00ff ae5555        	ldw	x,#21845
 850  0102 1f03          	ldw	(OFST-1,sp),x
 852  0104               L723:
 853                     ; 326     return(res_value);
 855  0104 1e03          	ldw	x,(OFST-1,sp)
 858  0106 5b04          	addw	sp,#4
 859  0108 81            	ret
 933                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 933                     ; 336 {
 934                     	switch	.text
 935  0109               _FLASH_SetLowPowerMode:
 937  0109 88            	push	a
 938       00000000      OFST:	set	0
 941                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 943                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 945  010a c6505a        	ld	a,20570
 946  010d a4f3          	and	a,#243
 947  010f c7505a        	ld	20570,a
 948                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 950  0112 c6505a        	ld	a,20570
 951  0115 1a01          	or	a,(OFST+1,sp)
 952  0117 c7505a        	ld	20570,a
 953                     ; 345 }
 956  011a 84            	pop	a
 957  011b 81            	ret
1015                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1015                     ; 354 {
1016                     	switch	.text
1017  011c               _FLASH_SetProgrammingTime:
1021                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1023                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1025  011c 7211505a      	bres	20570,#0
1026                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1028  0120 ca505a        	or	a,20570
1029  0123 c7505a        	ld	20570,a
1030                     ; 360 }
1033  0126 81            	ret
1058                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1058                     ; 368 {
1059                     	switch	.text
1060  0127               _FLASH_GetLowPowerMode:
1064                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1066  0127 c6505a        	ld	a,20570
1067  012a a40c          	and	a,#12
1070  012c 81            	ret
1095                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1095                     ; 378 {
1096                     	switch	.text
1097  012d               _FLASH_GetProgrammingTime:
1101                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1103  012d c6505a        	ld	a,20570
1104  0130 a401          	and	a,#1
1107  0132 81            	ret
1141                     ; 387 uint32_t FLASH_GetBootSize(void)
1141                     ; 388 {
1142                     	switch	.text
1143  0133               _FLASH_GetBootSize:
1145  0133 5204          	subw	sp,#4
1146       00000004      OFST:	set	4
1149                     ; 389     uint32_t temp = 0;
1151                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1153  0135 c6505d        	ld	a,20573
1154  0138 5f            	clrw	x
1155  0139 97            	ld	xl,a
1156  013a 90ae0200      	ldw	y,#512
1157  013e cd0000        	call	c_umul
1159  0141 96            	ldw	x,sp
1160  0142 1c0001        	addw	x,#OFST-3
1161  0145 cd0000        	call	c_rtol
1164                     ; 395     if (FLASH->FPR == 0xFF)
1166  0148 c6505d        	ld	a,20573
1167  014b a1ff          	cp	a,#255
1168  014d 2611          	jrne	L354
1169                     ; 397         temp += 512;
1171  014f ae0200        	ldw	x,#512
1172  0152 bf02          	ldw	c_lreg+2,x
1173  0154 ae0000        	ldw	x,#0
1174  0157 bf00          	ldw	c_lreg,x
1175  0159 96            	ldw	x,sp
1176  015a 1c0001        	addw	x,#OFST-3
1177  015d cd0000        	call	c_lgadd
1180  0160               L354:
1181                     ; 401     return(temp);
1183  0160 96            	ldw	x,sp
1184  0161 1c0001        	addw	x,#OFST-3
1185  0164 cd0000        	call	c_ltor
1189  0167 5b04          	addw	sp,#4
1190  0169 81            	ret
1299                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1299                     ; 413 {
1300                     	switch	.text
1301  016a               _FLASH_GetFlagStatus:
1303  016a 88            	push	a
1304       00000001      OFST:	set	1
1307                     ; 414     FlagStatus status = RESET;
1309                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1311                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1313  016b c4505f        	and	a,20575
1314  016e 2706          	jreq	L525
1315                     ; 421         status = SET; /* FLASH_FLAG is set */
1317  0170 a601          	ld	a,#1
1318  0172 6b01          	ld	(OFST+0,sp),a
1321  0174 2002          	jra	L725
1322  0176               L525:
1323                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1325  0176 0f01          	clr	(OFST+0,sp)
1327  0178               L725:
1328                     ; 429     return status;
1330  0178 7b01          	ld	a,(OFST+0,sp)
1333  017a 5b01          	addw	sp,#1
1334  017c 81            	ret
1427                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1427                     ; 532 {
1428                     	switch	.text
1429  017d               _FLASH_WaitForLastOperation:
1431  017d 5205          	subw	sp,#5
1432       00000005      OFST:	set	5
1435                     ; 533     uint8_t flagstatus = 0x00;
1437  017f 0f05          	clr	(OFST+0,sp)
1439                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1441  0181 aeffff        	ldw	x,#65535
1442  0184 1f03          	ldw	(OFST-2,sp),x
1443  0186 ae000f        	ldw	x,#15
1444  0189 1f01          	ldw	(OFST-4,sp),x
1446                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1448  018b a1fd          	cp	a,#253
1449  018d 2631          	jrne	L116
1451  018f 2010          	jra	L775
1452  0191               L575:
1453                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1453                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1455  0191 c6505f        	ld	a,20575
1456  0194 a405          	and	a,#5
1457  0196 6b05          	ld	(OFST+0,sp),a
1459                     ; 545             timeout--;
1461  0198 96            	ldw	x,sp
1462  0199 1c0001        	addw	x,#OFST-4
1463  019c a601          	ld	a,#1
1464  019e cd0000        	call	c_lgsbc
1467  01a1               L775:
1468                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1470  01a1 0d05          	tnz	(OFST+0,sp)
1471  01a3 2628          	jrne	L506
1473  01a5 96            	ldw	x,sp
1474  01a6 1c0001        	addw	x,#OFST-4
1475  01a9 cd0000        	call	c_lzmp
1477  01ac 26e3          	jrne	L575
1478  01ae 201d          	jra	L506
1479  01b0               L706:
1480                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1480                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1482  01b0 c6505f        	ld	a,20575
1483  01b3 a441          	and	a,#65
1484  01b5 6b05          	ld	(OFST+0,sp),a
1486                     ; 554             timeout--;
1488  01b7 96            	ldw	x,sp
1489  01b8 1c0001        	addw	x,#OFST-4
1490  01bb a601          	ld	a,#1
1491  01bd cd0000        	call	c_lgsbc
1494  01c0               L116:
1495                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1497  01c0 0d05          	tnz	(OFST+0,sp)
1498  01c2 2609          	jrne	L506
1500  01c4 96            	ldw	x,sp
1501  01c5 1c0001        	addw	x,#OFST-4
1502  01c8 cd0000        	call	c_lzmp
1504  01cb 26e3          	jrne	L706
1505  01cd               L506:
1506                     ; 566     if (timeout == 0x00 )
1508  01cd 96            	ldw	x,sp
1509  01ce 1c0001        	addw	x,#OFST-4
1510  01d1 cd0000        	call	c_lzmp
1512  01d4 2604          	jrne	L716
1513                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1515  01d6 a602          	ld	a,#2
1516  01d8 6b05          	ld	(OFST+0,sp),a
1518  01da               L716:
1519                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1521  01da 7b05          	ld	a,(OFST+0,sp)
1524  01dc 5b05          	addw	sp,#5
1525  01de 81            	ret
1588                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1588                     ; 582 {
1589                     	switch	.text
1590  01df               _FLASH_EraseBlock:
1592  01df 89            	pushw	x
1593  01e0 5206          	subw	sp,#6
1594       00000006      OFST:	set	6
1597                     ; 583   uint32_t startaddress = 0;
1599                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1601                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1603  01e2 7b0b          	ld	a,(OFST+5,sp)
1604  01e4 a1fd          	cp	a,#253
1605  01e6 260c          	jrne	L356
1606                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1608                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1610  01e8 ae8000        	ldw	x,#32768
1611  01eb 1f05          	ldw	(OFST-1,sp),x
1612  01ed ae0000        	ldw	x,#0
1613  01f0 1f03          	ldw	(OFST-3,sp),x
1616  01f2 200a          	jra	L556
1617  01f4               L356:
1618                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1620                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1622  01f4 ae4000        	ldw	x,#16384
1623  01f7 1f05          	ldw	(OFST-1,sp),x
1624  01f9 ae0000        	ldw	x,#0
1625  01fc 1f03          	ldw	(OFST-3,sp),x
1627  01fe               L556:
1628                     ; 610     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1630  01fe 1e07          	ldw	x,(OFST+1,sp)
1631  0200 a680          	ld	a,#128
1632  0202 cd0000        	call	c_cmulx
1634  0205 96            	ldw	x,sp
1635  0206 1c0003        	addw	x,#OFST-3
1636  0209 cd0000        	call	c_ladd
1638  020c be02          	ldw	x,c_lreg+2
1639  020e 1f01          	ldw	(OFST-5,sp),x
1641                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1643  0210 721a505b      	bset	20571,#5
1644                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1646  0214 721b505c      	bres	20572,#5
1647                     ; 619     *pwFlash = (uint32_t)0;
1649  0218 1e01          	ldw	x,(OFST-5,sp)
1650  021a a600          	ld	a,#0
1651  021c e703          	ld	(3,x),a
1652  021e a600          	ld	a,#0
1653  0220 e702          	ld	(2,x),a
1654  0222 a600          	ld	a,#0
1655  0224 e701          	ld	(1,x),a
1656  0226 a600          	ld	a,#0
1657  0228 f7            	ld	(x),a
1658                     ; 627 }
1661  0229 5b08          	addw	sp,#8
1662  022b 81            	ret
1766                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1766                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1766                     ; 640 {
1767                     	switch	.text
1768  022c               _FLASH_ProgramBlock:
1770  022c 89            	pushw	x
1771  022d 5206          	subw	sp,#6
1772       00000006      OFST:	set	6
1775                     ; 641     uint16_t Count = 0;
1777                     ; 642     uint32_t startaddress = 0;
1779                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1781                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1783                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1785  022f 7b0b          	ld	a,(OFST+5,sp)
1786  0231 a1fd          	cp	a,#253
1787  0233 260c          	jrne	L137
1788                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1790                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1792  0235 ae8000        	ldw	x,#32768
1793  0238 1f03          	ldw	(OFST-3,sp),x
1794  023a ae0000        	ldw	x,#0
1795  023d 1f01          	ldw	(OFST-5,sp),x
1798  023f 200a          	jra	L337
1799  0241               L137:
1800                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1802                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1804  0241 ae4000        	ldw	x,#16384
1805  0244 1f03          	ldw	(OFST-3,sp),x
1806  0246 ae0000        	ldw	x,#0
1807  0249 1f01          	ldw	(OFST-5,sp),x
1809  024b               L337:
1810                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1812  024b 1e07          	ldw	x,(OFST+1,sp)
1813  024d a680          	ld	a,#128
1814  024f cd0000        	call	c_cmulx
1816  0252 96            	ldw	x,sp
1817  0253 1c0001        	addw	x,#OFST-5
1818  0256 cd0000        	call	c_lgadd
1821                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1823  0259 0d0c          	tnz	(OFST+6,sp)
1824  025b 260a          	jrne	L537
1825                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1827  025d 7210505b      	bset	20571,#0
1828                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1830  0261 7211505c      	bres	20572,#0
1832  0265 2008          	jra	L737
1833  0267               L537:
1834                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1836  0267 7218505b      	bset	20571,#4
1837                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1839  026b 7219505c      	bres	20572,#4
1840  026f               L737:
1841                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1843  026f 5f            	clrw	x
1844  0270 1f05          	ldw	(OFST-1,sp),x
1846  0272               L147:
1847                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1849  0272 1e0d          	ldw	x,(OFST+7,sp)
1850  0274 72fb05        	addw	x,(OFST-1,sp)
1851  0277 f6            	ld	a,(x)
1852  0278 1e03          	ldw	x,(OFST-3,sp)
1853  027a 72fb05        	addw	x,(OFST-1,sp)
1854  027d f7            	ld	(x),a
1855                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1857  027e 1e05          	ldw	x,(OFST-1,sp)
1858  0280 1c0001        	addw	x,#1
1859  0283 1f05          	ldw	(OFST-1,sp),x
1863  0285 1e05          	ldw	x,(OFST-1,sp)
1864  0287 a30080        	cpw	x,#128
1865  028a 25e6          	jrult	L147
1866                     ; 685 }
1869  028c 5b08          	addw	sp,#8
1870  028e 81            	ret
1883                     	xdef	_FLASH_WaitForLastOperation
1884                     	xdef	_FLASH_ProgramBlock
1885                     	xdef	_FLASH_EraseBlock
1886                     	xdef	_FLASH_GetFlagStatus
1887                     	xdef	_FLASH_GetBootSize
1888                     	xdef	_FLASH_GetProgrammingTime
1889                     	xdef	_FLASH_GetLowPowerMode
1890                     	xdef	_FLASH_SetProgrammingTime
1891                     	xdef	_FLASH_SetLowPowerMode
1892                     	xdef	_FLASH_EraseOptionByte
1893                     	xdef	_FLASH_ProgramOptionByte
1894                     	xdef	_FLASH_ReadOptionByte
1895                     	xdef	_FLASH_ProgramWord
1896                     	xdef	_FLASH_ReadByte
1897                     	xdef	_FLASH_ProgramByte
1898                     	xdef	_FLASH_EraseByte
1899                     	xdef	_FLASH_ITConfig
1900                     	xdef	_FLASH_DeInit
1901                     	xdef	_FLASH_Lock
1902                     	xdef	_FLASH_Unlock
1903                     	xref.b	c_lreg
1904                     	xref.b	c_x
1905                     	xref.b	c_y
1924                     	xref	c_ladd
1925                     	xref	c_cmulx
1926                     	xref	c_lzmp
1927                     	xref	c_lgsbc
1928                     	xref	c_ltor
1929                     	xref	c_lgadd
1930                     	xref	c_rtol
1931                     	xref	c_umul
1932                     	end
