   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  17                     .const:	section	.text
  18  0000               _APR_Array:
  19  0000 00            	dc.b	0
  20  0001 1e            	dc.b	30
  21  0002 1e            	dc.b	30
  22  0003 1e            	dc.b	30
  23  0004 1e            	dc.b	30
  24  0005 1e            	dc.b	30
  25  0006 1e            	dc.b	30
  26  0007 1e            	dc.b	30
  27  0008 1e            	dc.b	30
  28  0009 1e            	dc.b	30
  29  000a 1e            	dc.b	30
  30  000b 1e            	dc.b	30
  31  000c 1e            	dc.b	30
  32  000d 3d            	dc.b	61
  33  000e 17            	dc.b	23
  34  000f 17            	dc.b	23
  35  0010 3e            	dc.b	62
  36  0011               _TBR_Array:
  37  0011 00            	dc.b	0
  38  0012 01            	dc.b	1
  39  0013 02            	dc.b	2
  40  0014 03            	dc.b	3
  41  0015 04            	dc.b	4
  42  0016 05            	dc.b	5
  43  0017 06            	dc.b	6
  44  0018 07            	dc.b	7
  45  0019 08            	dc.b	8
  46  001a 09            	dc.b	9
  47  001b 0a            	dc.b	10
  48  001c 0b            	dc.b	11
  49  001d 0c            	dc.b	12
  50  001e 0c            	dc.b	12
  51  001f 0e            	dc.b	14
  52  0020 0f            	dc.b	15
  53  0021 0f            	dc.b	15
  82                     ; 67 void AWU_DeInit(void)
  82                     ; 68 {
  84                     	switch	.text
  85  0000               _AWU_DeInit:
  89                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  91  0000 725f50f0      	clr	20720
  92                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  94  0004 353f50f1      	mov	20721,#63
  95                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  97  0008 725f50f2      	clr	20722
  98                     ; 72 }
 101  000c 81            	ret
 263                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 263                     ; 83 {
 264                     	switch	.text
 265  000d               _AWU_Init:
 267  000d 88            	push	a
 268       00000000      OFST:	set	0
 271                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 273                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 275  000e 721850f0      	bset	20720,#4
 276                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 278  0012 c650f2        	ld	a,20722
 279  0015 a4f0          	and	a,#240
 280  0017 c750f2        	ld	20722,a
 281                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 283  001a 7b01          	ld	a,(OFST+1,sp)
 284  001c 5f            	clrw	x
 285  001d 97            	ld	xl,a
 286  001e c650f2        	ld	a,20722
 287  0021 da0011        	or	a,(_TBR_Array,x)
 288  0024 c750f2        	ld	20722,a
 289                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 291  0027 c650f1        	ld	a,20721
 292  002a a4c0          	and	a,#192
 293  002c c750f1        	ld	20721,a
 294                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 296  002f 7b01          	ld	a,(OFST+1,sp)
 297  0031 5f            	clrw	x
 298  0032 97            	ld	xl,a
 299  0033 c650f1        	ld	a,20721
 300  0036 da0000        	or	a,(_APR_Array,x)
 301  0039 c750f1        	ld	20721,a
 302                     ; 99 }
 305  003c 84            	pop	a
 306  003d 81            	ret
 361                     ; 108 void AWU_Cmd(FunctionalState NewState)
 361                     ; 109 {
 362                     	switch	.text
 363  003e               _AWU_Cmd:
 367                     ; 110     if (NewState != DISABLE)
 369  003e 4d            	tnz	a
 370  003f 2706          	jreq	L331
 371                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 373  0041 721850f0      	bset	20720,#4
 375  0045 2004          	jra	L531
 376  0047               L331:
 377                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 379  0047 721950f0      	bres	20720,#4
 380  004b               L531:
 381                     ; 120 }
 384  004b 81            	ret
 437                     	switch	.const
 438  0022               L41:
 439  0022 000003e8      	dc.l	1000
 440                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 440                     ; 136 {
 441                     	switch	.text
 442  004c               _AWU_LSICalibrationConfig:
 444  004c 5206          	subw	sp,#6
 445       00000006      OFST:	set	6
 448                     ; 138     uint16_t lsifreqkhz = 0x0;
 450                     ; 139     uint16_t A = 0x0;
 452                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 454                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 456  004e 96            	ldw	x,sp
 457  004f 1c0009        	addw	x,#OFST+3
 458  0052 cd0000        	call	c_ltor
 460  0055 ae0022        	ldw	x,#L41
 461  0058 cd0000        	call	c_ludv
 463  005b be02          	ldw	x,c_lreg+2
 464  005d 1f03          	ldw	(OFST-3,sp),x
 466                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 468  005f 1e03          	ldw	x,(OFST-3,sp)
 469  0061 54            	srlw	x
 470  0062 54            	srlw	x
 471  0063 1f05          	ldw	(OFST-1,sp),x
 473                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 475  0065 1e05          	ldw	x,(OFST-1,sp)
 476  0067 58            	sllw	x
 477  0068 58            	sllw	x
 478  0069 1f01          	ldw	(OFST-5,sp),x
 480  006b 1e03          	ldw	x,(OFST-3,sp)
 481  006d 72f001        	subw	x,(OFST-5,sp)
 482  0070 1605          	ldw	y,(OFST-1,sp)
 483  0072 9058          	sllw	y
 484  0074 905c          	incw	y
 485  0076 cd0000        	call	c_imul
 487  0079 1605          	ldw	y,(OFST-1,sp)
 488  007b 9058          	sllw	y
 489  007d 9058          	sllw	y
 490  007f bf00          	ldw	c_x,x
 491  0081 90b300        	cpw	y,c_x
 492  0084 2509          	jrult	L561
 493                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 495  0086 7b06          	ld	a,(OFST+0,sp)
 496  0088 a002          	sub	a,#2
 497  008a c750f1        	ld	20721,a
 499  008d 2006          	jra	L761
 500  008f               L561:
 501                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 503  008f 7b06          	ld	a,(OFST+0,sp)
 504  0091 4a            	dec	a
 505  0092 c750f1        	ld	20721,a
 506  0095               L761:
 507                     ; 158 }
 510  0095 5b06          	addw	sp,#6
 511  0097 81            	ret
 534                     ; 165 void AWU_IdleModeEnable(void)
 534                     ; 166 {
 535                     	switch	.text
 536  0098               _AWU_IdleModeEnable:
 540                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 542  0098 721950f0      	bres	20720,#4
 543                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 545  009c 35f050f2      	mov	20722,#240
 546                     ; 172 }
 549  00a0 81            	ret
 593                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 593                     ; 181 {
 594                     	switch	.text
 595  00a1               _AWU_GetFlagStatus:
 599                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 601  00a1 c650f0        	ld	a,20720
 602  00a4 a520          	bcp	a,#32
 603  00a6 2603          	jrne	L22
 604  00a8 4f            	clr	a
 605  00a9 2002          	jra	L42
 606  00ab               L22:
 607  00ab a601          	ld	a,#1
 608  00ad               L42:
 611  00ad 81            	ret
 646                     	xdef	_TBR_Array
 647                     	xdef	_APR_Array
 648                     	xdef	_AWU_GetFlagStatus
 649                     	xdef	_AWU_IdleModeEnable
 650                     	xdef	_AWU_LSICalibrationConfig
 651                     	xdef	_AWU_Cmd
 652                     	xdef	_AWU_Init
 653                     	xdef	_AWU_DeInit
 654                     	xref.b	c_lreg
 655                     	xref.b	c_x
 674                     	xref	c_imul
 675                     	xref	c_ludv
 676                     	xref	c_ltor
 677                     	end
