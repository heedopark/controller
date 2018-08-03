   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 48 void BEEP_DeInit(void)
  45                     ; 49 {
  47                     	switch	.text
  48  0000               _BEEP_DeInit:
  52                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  54  0000 351f50f3      	mov	20723,#31
  55                     ; 51 }
  58  0004 81            	ret
 123                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 123                     ; 62 {
 124                     	switch	.text
 125  0005               _BEEP_Init:
 127  0005 88            	push	a
 128       00000000      OFST:	set	0
 131                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 133                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 135  0006 c650f3        	ld	a,20723
 136  0009 a41f          	and	a,#31
 137  000b a11f          	cp	a,#31
 138  000d 2610          	jrne	L15
 139                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 141  000f c650f3        	ld	a,20723
 142  0012 a4e0          	and	a,#224
 143  0014 c750f3        	ld	20723,a
 144                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 146  0017 c650f3        	ld	a,20723
 147  001a aa0b          	or	a,#11
 148  001c c750f3        	ld	20723,a
 149  001f               L15:
 150                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 152  001f c650f3        	ld	a,20723
 153  0022 a43f          	and	a,#63
 154  0024 c750f3        	ld	20723,a
 155                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 157  0027 c650f3        	ld	a,20723
 158  002a 1a01          	or	a,(OFST+1,sp)
 159  002c c750f3        	ld	20723,a
 160                     ; 78 }
 163  002f 84            	pop	a
 164  0030 81            	ret
 219                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 219                     ; 88 {
 220                     	switch	.text
 221  0031               _BEEP_Cmd:
 225                     ; 89     if (NewState != DISABLE)
 227  0031 4d            	tnz	a
 228  0032 2706          	jreq	L101
 229                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 231  0034 721a50f3      	bset	20723,#5
 233  0038 2004          	jra	L301
 234  003a               L101:
 235                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 237  003a 721b50f3      	bres	20723,#5
 238  003e               L301:
 239                     ; 99 }
 242  003e 81            	ret
 295                     .const:	section	.text
 296  0000               L41:
 297  0000 000003e8      	dc.l	1000
 298                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 298                     ; 115 {
 299                     	switch	.text
 300  003f               _BEEP_LSICalibrationConfig:
 302  003f 5206          	subw	sp,#6
 303       00000006      OFST:	set	6
 306                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 308                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 310  0041 96            	ldw	x,sp
 311  0042 1c0009        	addw	x,#OFST+3
 312  0045 cd0000        	call	c_ltor
 314  0048 ae0000        	ldw	x,#L41
 315  004b cd0000        	call	c_ludv
 317  004e be02          	ldw	x,c_lreg+2
 318  0050 1f03          	ldw	(OFST-3,sp),x
 320                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 322  0052 c650f3        	ld	a,20723
 323  0055 a4e0          	and	a,#224
 324  0057 c750f3        	ld	20723,a
 325                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 327  005a 1e03          	ldw	x,(OFST-3,sp)
 328  005c 54            	srlw	x
 329  005d 54            	srlw	x
 330  005e 54            	srlw	x
 331  005f 1f05          	ldw	(OFST-1,sp),x
 333                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 335  0061 1e05          	ldw	x,(OFST-1,sp)
 336  0063 58            	sllw	x
 337  0064 58            	sllw	x
 338  0065 58            	sllw	x
 339  0066 1f01          	ldw	(OFST-5,sp),x
 341  0068 1e03          	ldw	x,(OFST-3,sp)
 342  006a 72f001        	subw	x,(OFST-5,sp)
 343  006d 1605          	ldw	y,(OFST-1,sp)
 344  006f 9058          	sllw	y
 345  0071 905c          	incw	y
 346  0073 cd0000        	call	c_imul
 348  0076 1605          	ldw	y,(OFST-1,sp)
 349  0078 9058          	sllw	y
 350  007a 9058          	sllw	y
 351  007c 9058          	sllw	y
 352  007e bf00          	ldw	c_x,x
 353  0080 90b300        	cpw	y,c_x
 354  0083 250c          	jrult	L331
 355                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 357  0085 7b06          	ld	a,(OFST+0,sp)
 358  0087 a002          	sub	a,#2
 359  0089 ca50f3        	or	a,20723
 360  008c c750f3        	ld	20723,a
 362  008f 2009          	jra	L531
 363  0091               L331:
 364                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 366  0091 7b06          	ld	a,(OFST+0,sp)
 367  0093 4a            	dec	a
 368  0094 ca50f3        	or	a,20723
 369  0097 c750f3        	ld	20723,a
 370  009a               L531:
 371                     ; 139 }
 374  009a 5b06          	addw	sp,#6
 375  009c 81            	ret
 388                     	xdef	_BEEP_LSICalibrationConfig
 389                     	xdef	_BEEP_Cmd
 390                     	xdef	_BEEP_Init
 391                     	xdef	_BEEP_DeInit
 392                     	xref.b	c_lreg
 393                     	xref.b	c_x
 412                     	xref	c_imul
 413                     	xref	c_ludv
 414                     	xref	c_ltor
 415                     	end
