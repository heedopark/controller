   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 48 void BEEP_DeInit(void)
  51                     ; 49 {
  53                     .text:	section	.text,new
  54  0000               _BEEP_DeInit:
  58                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  60  0000 351f50f3      	mov	20723,#31
  61                     ; 51 }
  64  0004 81            	ret	
 129                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 129                     ; 62 {
 130                     .text:	section	.text,new
 131  0000               _BEEP_Init:
 133  0000 88            	push	a
 134       00000000      OFST:	set	0
 137                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 139                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 141  0001 c650f3        	ld	a,20723
 142  0004 a41f          	and	a,#31
 143  0006 a11f          	cp	a,#31
 144  0008 2610          	jrne	L15
 145                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 147  000a c650f3        	ld	a,20723
 148  000d a4e0          	and	a,#224
 149  000f c750f3        	ld	20723,a
 150                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 152  0012 c650f3        	ld	a,20723
 153  0015 aa0b          	or	a,#11
 154  0017 c750f3        	ld	20723,a
 155  001a               L15:
 156                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 158  001a c650f3        	ld	a,20723
 159  001d a43f          	and	a,#63
 160  001f c750f3        	ld	20723,a
 161                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 163  0022 c650f3        	ld	a,20723
 164  0025 1a01          	or	a,(OFST+1,sp)
 165  0027 c750f3        	ld	20723,a
 166                     ; 78 }
 169  002a 84            	pop	a
 170  002b 81            	ret	
 225                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 225                     ; 88 {
 226                     .text:	section	.text,new
 227  0000               _BEEP_Cmd:
 231                     ; 89     if (NewState != DISABLE)
 233  0000 4d            	tnz	a
 234  0001 2705          	jreq	L101
 235                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 237  0003 721a50f3      	bset	20723,#5
 240  0007 81            	ret	
 241  0008               L101:
 242                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 244  0008 721b50f3      	bres	20723,#5
 245                     ; 99 }
 248  000c 81            	ret	
 295                     .const:	section	.text
 296  0000               L41:
 297  0000 000003e8      	dc.l	1000
 298                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 298                     ; 115 {
 299                     .text:	section	.text,new
 300  0000               _BEEP_LSICalibrationConfig:
 302  0000 5206          	subw	sp,#6
 303       00000006      OFST:	set	6
 306                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 308                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 310  0002 96            	ldw	x,sp
 311  0003 1c0009        	addw	x,#OFST+3
 312  0006 cd0000        	call	c_ltor
 314  0009 ae0000        	ldw	x,#L41
 315  000c cd0000        	call	c_ludv
 317  000f be02          	ldw	x,c_lreg+2
 318  0011 1f03          	ldw	(OFST-3,sp),x
 320                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 322  0013 c650f3        	ld	a,20723
 323  0016 a4e0          	and	a,#224
 324  0018 c750f3        	ld	20723,a
 325                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 327  001b 54            	srlw	x
 328  001c 54            	srlw	x
 329  001d 54            	srlw	x
 330  001e 1f05          	ldw	(OFST-1,sp),x
 332                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 334  0020 58            	sllw	x
 335  0021 58            	sllw	x
 336  0022 58            	sllw	x
 337  0023 1f01          	ldw	(OFST-5,sp),x
 339  0025 1e03          	ldw	x,(OFST-3,sp)
 340  0027 72f001        	subw	x,(OFST-5,sp)
 341  002a 1605          	ldw	y,(OFST-1,sp)
 342  002c 9058          	sllw	y
 343  002e 905c          	incw	y
 344  0030 cd0000        	call	c_imul
 346  0033 1605          	ldw	y,(OFST-1,sp)
 347  0035 9058          	sllw	y
 348  0037 9058          	sllw	y
 349  0039 bf00          	ldw	c_x,x
 350  003b 9058          	sllw	y
 351  003d 90b300        	cpw	y,c_x
 352  0040 7b06          	ld	a,(OFST+0,sp)
 353  0042 2504          	jrult	L521
 354                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 356  0044 a002          	sub	a,#2
 358  0046 2001          	jra	L721
 359  0048               L521:
 360                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 362  0048 4a            	dec	a
 363  0049               L721:
 364  0049 ca50f3        	or	a,20723
 365  004c c750f3        	ld	20723,a
 366                     ; 139 }
 369  004f 5b06          	addw	sp,#6
 370  0051 81            	ret	
 383                     	xdef	_BEEP_LSICalibrationConfig
 384                     	xdef	_BEEP_Cmd
 385                     	xdef	_BEEP_Init
 386                     	xdef	_BEEP_DeInit
 387                     	xref.b	c_lreg
 388                     	xref.b	c_x
 407                     	xref	c_imul
 408                     	xref	c_ludv
 409                     	xref	c_ltor
 410                     	end
