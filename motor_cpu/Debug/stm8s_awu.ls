   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  23                     .const:	section	.text
  24  0000               _APR_Array:
  25  0000 00            	dc.b	0
  26  0001 1e            	dc.b	30
  27  0002 1e            	dc.b	30
  28  0003 1e            	dc.b	30
  29  0004 1e            	dc.b	30
  30  0005 1e            	dc.b	30
  31  0006 1e            	dc.b	30
  32  0007 1e            	dc.b	30
  33  0008 1e            	dc.b	30
  34  0009 1e            	dc.b	30
  35  000a 1e            	dc.b	30
  36  000b 1e            	dc.b	30
  37  000c 1e            	dc.b	30
  38  000d 3d            	dc.b	61
  39  000e 17            	dc.b	23
  40  000f 17            	dc.b	23
  41  0010 3e            	dc.b	62
  42  0011               _TBR_Array:
  43  0011 00            	dc.b	0
  44  0012 01            	dc.b	1
  45  0013 02            	dc.b	2
  46  0014 03            	dc.b	3
  47  0015 04            	dc.b	4
  48  0016 05            	dc.b	5
  49  0017 06            	dc.b	6
  50  0018 07            	dc.b	7
  51  0019 08            	dc.b	8
  52  001a 09            	dc.b	9
  53  001b 0a            	dc.b	10
  54  001c 0b            	dc.b	11
  55  001d 0c            	dc.b	12
  56  001e 0c            	dc.b	12
  57  001f 0e            	dc.b	14
  58  0020 0f            	dc.b	15
  59  0021 0f            	dc.b	15
  88                     ; 67 void AWU_DeInit(void)
  88                     ; 68 {
  90                     .text:	section	.text,new
  91  0000               _AWU_DeInit:
  95                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  97  0000 725f50f0      	clr	20720
  98                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
 100  0004 353f50f1      	mov	20721,#63
 101                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
 103  0008 725f50f2      	clr	20722
 104                     ; 72 }
 107  000c 81            	ret	
 269                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 269                     ; 83 {
 270                     .text:	section	.text,new
 271  0000               _AWU_Init:
 273  0000 88            	push	a
 274       00000000      OFST:	set	0
 277                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 279                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 281  0001 721850f0      	bset	20720,#4
 282                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 284  0005 c650f2        	ld	a,20722
 285  0008 a4f0          	and	a,#240
 286  000a c750f2        	ld	20722,a
 287                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 289  000d 7b01          	ld	a,(OFST+1,sp)
 290  000f 5f            	clrw	x
 291  0010 97            	ld	xl,a
 292  0011 c650f2        	ld	a,20722
 293  0014 da0011        	or	a,(_TBR_Array,x)
 294  0017 c750f2        	ld	20722,a
 295                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 297  001a c650f1        	ld	a,20721
 298  001d a4c0          	and	a,#192
 299  001f c750f1        	ld	20721,a
 300                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 302  0022 7b01          	ld	a,(OFST+1,sp)
 303  0024 5f            	clrw	x
 304  0025 97            	ld	xl,a
 305  0026 c650f1        	ld	a,20721
 306  0029 da0000        	or	a,(_APR_Array,x)
 307  002c c750f1        	ld	20721,a
 308                     ; 99 }
 311  002f 84            	pop	a
 312  0030 81            	ret	
 367                     ; 108 void AWU_Cmd(FunctionalState NewState)
 367                     ; 109 {
 368                     .text:	section	.text,new
 369  0000               _AWU_Cmd:
 373                     ; 110     if (NewState != DISABLE)
 375  0000 4d            	tnz	a
 376  0001 2705          	jreq	L331
 377                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 379  0003 721850f0      	bset	20720,#4
 382  0007 81            	ret	
 383  0008               L331:
 384                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 386  0008 721950f0      	bres	20720,#4
 387                     ; 120 }
 390  000c 81            	ret	
 437                     	switch	.const
 438  0022               L41:
 439  0022 000003e8      	dc.l	1000
 440                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 440                     ; 136 {
 441                     .text:	section	.text,new
 442  0000               _AWU_LSICalibrationConfig:
 444  0000 5206          	subw	sp,#6
 445       00000006      OFST:	set	6
 448                     ; 138     uint16_t lsifreqkhz = 0x0;
 450                     ; 139     uint16_t A = 0x0;
 452                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 454                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 456  0002 96            	ldw	x,sp
 457  0003 1c0009        	addw	x,#OFST+3
 458  0006 cd0000        	call	c_ltor
 460  0009 ae0022        	ldw	x,#L41
 461  000c cd0000        	call	c_ludv
 463  000f be02          	ldw	x,c_lreg+2
 464  0011 1f03          	ldw	(OFST-3,sp),x
 466                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 468  0013 54            	srlw	x
 469  0014 54            	srlw	x
 470  0015 1f05          	ldw	(OFST-1,sp),x
 472                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 474  0017 58            	sllw	x
 475  0018 58            	sllw	x
 476  0019 1f01          	ldw	(OFST-5,sp),x
 478  001b 1e03          	ldw	x,(OFST-3,sp)
 479  001d 72f001        	subw	x,(OFST-5,sp)
 480  0020 1605          	ldw	y,(OFST-1,sp)
 481  0022 9058          	sllw	y
 482  0024 905c          	incw	y
 483  0026 cd0000        	call	c_imul
 485  0029 1605          	ldw	y,(OFST-1,sp)
 486  002b 9058          	sllw	y
 487  002d bf00          	ldw	c_x,x
 488  002f 9058          	sllw	y
 489  0031 90b300        	cpw	y,c_x
 490  0034 7b06          	ld	a,(OFST+0,sp)
 491  0036 2504          	jrult	L751
 492                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 494  0038 a002          	sub	a,#2
 496  003a 2001          	jra	L161
 497  003c               L751:
 498                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 500  003c 4a            	dec	a
 501  003d               L161:
 502  003d c750f1        	ld	20721,a
 503                     ; 158 }
 506  0040 5b06          	addw	sp,#6
 507  0042 81            	ret	
 530                     ; 165 void AWU_IdleModeEnable(void)
 530                     ; 166 {
 531                     .text:	section	.text,new
 532  0000               _AWU_IdleModeEnable:
 536                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 538  0000 721950f0      	bres	20720,#4
 539                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 541  0004 35f050f2      	mov	20722,#240
 542                     ; 172 }
 545  0008 81            	ret	
 589                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 589                     ; 181 {
 590                     .text:	section	.text,new
 591  0000               _AWU_GetFlagStatus:
 595                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 597  0000 720a50f002    	btjt	20720,#5,L22
 598  0005 4f            	clr	a
 600  0006 81            	ret	
 601  0007               L22:
 602  0007 a601          	ld	a,#1
 605  0009 81            	ret	
 640                     	xdef	_TBR_Array
 641                     	xdef	_APR_Array
 642                     	xdef	_AWU_GetFlagStatus
 643                     	xdef	_AWU_IdleModeEnable
 644                     	xdef	_AWU_LSICalibrationConfig
 645                     	xdef	_AWU_Cmd
 646                     	xdef	_AWU_Init
 647                     	xdef	_AWU_DeInit
 648                     	xref.b	c_lreg
 649                     	xref.b	c_x
 668                     	xref	c_imul
 669                     	xref	c_ludv
 670                     	xref	c_ltor
 671                     	end
