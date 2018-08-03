   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 44 uint8_t ITC_GetCPUCC(void)
  45                     ; 45 {
  47                     	switch	.text
  48  0000               _ITC_GetCPUCC:
  52                     ; 47   _asm("push cc");
  55  0000 8a            push cc
  57                     ; 48   _asm("pop a");
  60  0001 84            pop a
  62                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret
  88                     ; 74 void ITC_DeInit(void)
  88                     ; 75 {
  89                     	switch	.text
  90  0003               _ITC_DeInit:
  94                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  96  0003 35ff7f70      	mov	32624,#255
  97                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  99  0007 35ff7f71      	mov	32625,#255
 100                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 102  000b 35ff7f72      	mov	32626,#255
 103                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 105  000f 35ff7f73      	mov	32627,#255
 106                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 108  0013 35ff7f74      	mov	32628,#255
 109                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 111  0017 35ff7f75      	mov	32629,#255
 112                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 114  001b 35ff7f76      	mov	32630,#255
 115                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 117  001f 35ff7f77      	mov	32631,#255
 118                     ; 84 }
 121  0023 81            	ret
 146                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 92 {
 147                     	switch	.text
 148  0024               _ITC_GetSoftIntStatus:
 152                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 154  0024 adda          	call	_ITC_GetCPUCC
 156  0026 a428          	and	a,#40
 159  0028 81            	ret
 422                     .const:	section	.text
 423  0000               L22:
 424  0000 004c          	dc.w	L14
 425  0002 004c          	dc.w	L14
 426  0004 004c          	dc.w	L14
 427  0006 004c          	dc.w	L14
 428  0008 0055          	dc.w	L34
 429  000a 0055          	dc.w	L34
 430  000c 0055          	dc.w	L34
 431  000e 0055          	dc.w	L34
 432  0010 0089          	dc.w	L702
 433  0012 0089          	dc.w	L702
 434  0014 005e          	dc.w	L54
 435  0016 005e          	dc.w	L54
 436  0018 0067          	dc.w	L74
 437  001a 0067          	dc.w	L74
 438  001c 0067          	dc.w	L74
 439  001e 0067          	dc.w	L74
 440  0020 0070          	dc.w	L15
 441  0022 0070          	dc.w	L15
 442  0024 0070          	dc.w	L15
 443  0026 0070          	dc.w	L15
 444  0028 0079          	dc.w	L35
 445  002a 0079          	dc.w	L35
 446  002c 0079          	dc.w	L35
 447  002e 0079          	dc.w	L35
 448  0030 0082          	dc.w	L55
 449                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 449                     ; 102 {
 450                     	switch	.text
 451  0029               _ITC_GetSoftwarePriority:
 453  0029 88            	push	a
 454  002a 89            	pushw	x
 455       00000002      OFST:	set	2
 458                     ; 104     uint8_t Value = 0;
 460  002b 0f02          	clr	(OFST+0,sp)
 462                     ; 105     uint8_t Mask = 0;
 464                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 466                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 468  002d a403          	and	a,#3
 469  002f 48            	sll	a
 470  0030 5f            	clrw	x
 471  0031 97            	ld	xl,a
 472  0032 a603          	ld	a,#3
 473  0034 5d            	tnzw	x
 474  0035 2704          	jreq	L41
 475  0037               L61:
 476  0037 48            	sll	a
 477  0038 5a            	decw	x
 478  0039 26fc          	jrne	L61
 479  003b               L41:
 480  003b 6b01          	ld	(OFST-1,sp),a
 482                     ; 113     switch (IrqNum)
 484  003d 7b03          	ld	a,(OFST+1,sp)
 486                     ; 185     default:
 486                     ; 186         break;
 487  003f a119          	cp	a,#25
 488  0041 2407          	jruge	L02
 489  0043 5f            	clrw	x
 490  0044 97            	ld	xl,a
 491  0045 58            	sllw	x
 492  0046 de0000        	ldw	x,(L22,x)
 493  0049 fc            	jp	(x)
 494  004a               L02:
 495  004a 203d          	jra	L702
 496  004c               L14:
 497                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 497                     ; 116     case ITC_IRQ_AWU:
 497                     ; 117     case ITC_IRQ_CLK:
 497                     ; 118     case ITC_IRQ_PORTA:
 497                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 499  004c c67f70        	ld	a,32624
 500  004f 1401          	and	a,(OFST-1,sp)
 501  0051 6b02          	ld	(OFST+0,sp),a
 503                     ; 120         break;
 505  0053 2034          	jra	L702
 506  0055               L34:
 507                     ; 121     case ITC_IRQ_PORTB:
 507                     ; 122     case ITC_IRQ_PORTC:
 507                     ; 123     case ITC_IRQ_PORTD:
 507                     ; 124     case ITC_IRQ_PORTE:
 507                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 509  0055 c67f71        	ld	a,32625
 510  0058 1401          	and	a,(OFST-1,sp)
 511  005a 6b02          	ld	(OFST+0,sp),a
 513                     ; 126         break;
 515  005c 202b          	jra	L702
 516  005e               L54:
 517                     ; 136     case ITC_IRQ_SPI:
 517                     ; 137     case ITC_IRQ_TIM1_OVF:
 517                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 519  005e c67f72        	ld	a,32626
 520  0061 1401          	and	a,(OFST-1,sp)
 521  0063 6b02          	ld	(OFST+0,sp),a
 523                     ; 139         break;
 525  0065 2022          	jra	L702
 526  0067               L74:
 527                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 527                     ; 141 #ifdef STM8S903
 527                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 527                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 527                     ; 144 #else
 527                     ; 145     case ITC_IRQ_TIM2_OVF:
 527                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 527                     ; 147 #endif /*STM8S903*/
 527                     ; 148 
 527                     ; 149     case ITC_IRQ_TIM3_OVF:
 527                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 529  0067 c67f73        	ld	a,32627
 530  006a 1401          	and	a,(OFST-1,sp)
 531  006c 6b02          	ld	(OFST+0,sp),a
 533                     ; 151         break;
 535  006e 2019          	jra	L702
 536  0070               L15:
 537                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 537                     ; 153     case ITC_IRQ_UART1_TX:
 537                     ; 154     case ITC_IRQ_UART1_RX:
 537                     ; 155     case ITC_IRQ_I2C:
 537                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 539  0070 c67f74        	ld	a,32628
 540  0073 1401          	and	a,(OFST-1,sp)
 541  0075 6b02          	ld	(OFST+0,sp),a
 543                     ; 157         break;
 545  0077 2010          	jra	L702
 546  0079               L35:
 547                     ; 159     case ITC_IRQ_UART2_TX:
 547                     ; 160     case ITC_IRQ_UART2_RX:
 547                     ; 161 #endif /*STM8S105 or STM8AF626x*/
 547                     ; 162 
 547                     ; 163 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 547                     ; 164     defined(STM8AF62Ax)
 547                     ; 165     case ITC_IRQ_UART3_TX:
 547                     ; 166     case ITC_IRQ_UART3_RX:
 547                     ; 167     case ITC_IRQ_ADC2:
 547                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 547                     ; 169 
 547                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 547                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 547                     ; 172     case ITC_IRQ_ADC1:
 547                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 547                     ; 174 
 547                     ; 175 #ifdef STM8S903
 547                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 547                     ; 177 #else
 547                     ; 178     case ITC_IRQ_TIM4_OVF:
 547                     ; 179 #endif /*STM8S903*/
 547                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 549  0079 c67f75        	ld	a,32629
 550  007c 1401          	and	a,(OFST-1,sp)
 551  007e 6b02          	ld	(OFST+0,sp),a
 553                     ; 181         break;
 555  0080 2007          	jra	L702
 556  0082               L55:
 557                     ; 182     case ITC_IRQ_EEPROM_EEC:
 557                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 559  0082 c67f76        	ld	a,32630
 560  0085 1401          	and	a,(OFST-1,sp)
 561  0087 6b02          	ld	(OFST+0,sp),a
 563                     ; 184         break;
 565  0089               L75:
 566                     ; 185     default:
 566                     ; 186         break;
 568  0089               L702:
 569                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 571  0089 7b03          	ld	a,(OFST+1,sp)
 572  008b a403          	and	a,#3
 573  008d 48            	sll	a
 574  008e 5f            	clrw	x
 575  008f 97            	ld	xl,a
 576  0090 7b02          	ld	a,(OFST+0,sp)
 577  0092 5d            	tnzw	x
 578  0093 2704          	jreq	L42
 579  0095               L62:
 580  0095 44            	srl	a
 581  0096 5a            	decw	x
 582  0097 26fc          	jrne	L62
 583  0099               L42:
 584  0099 6b02          	ld	(OFST+0,sp),a
 586                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 588  009b 7b02          	ld	a,(OFST+0,sp)
 591  009d 5b03          	addw	sp,#3
 592  009f 81            	ret
 656                     	switch	.const
 657  0032               L44:
 658  0032 00d5          	dc.w	L112
 659  0034 00d5          	dc.w	L112
 660  0036 00d5          	dc.w	L112
 661  0038 00d5          	dc.w	L112
 662  003a 00e7          	dc.w	L312
 663  003c 00e7          	dc.w	L312
 664  003e 00e7          	dc.w	L312
 665  0040 00e7          	dc.w	L312
 666  0042 0151          	dc.w	L562
 667  0044 0151          	dc.w	L562
 668  0046 00f9          	dc.w	L512
 669  0048 00f9          	dc.w	L512
 670  004a 010b          	dc.w	L712
 671  004c 010b          	dc.w	L712
 672  004e 010b          	dc.w	L712
 673  0050 010b          	dc.w	L712
 674  0052 011d          	dc.w	L122
 675  0054 011d          	dc.w	L122
 676  0056 011d          	dc.w	L122
 677  0058 011d          	dc.w	L122
 678  005a 012f          	dc.w	L322
 679  005c 012f          	dc.w	L322
 680  005e 012f          	dc.w	L322
 681  0060 012f          	dc.w	L322
 682  0062 0141          	dc.w	L522
 683                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 683                     ; 209 {
 684                     	switch	.text
 685  00a0               _ITC_SetSoftwarePriority:
 687  00a0 89            	pushw	x
 688  00a1 89            	pushw	x
 689       00000002      OFST:	set	2
 692                     ; 211     uint8_t Mask = 0;
 694                     ; 212     uint8_t NewPriority = 0;
 696                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 698                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 700                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 702                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 704  00a2 9e            	ld	a,xh
 705  00a3 a403          	and	a,#3
 706  00a5 48            	sll	a
 707  00a6 5f            	clrw	x
 708  00a7 97            	ld	xl,a
 709  00a8 a603          	ld	a,#3
 710  00aa 5d            	tnzw	x
 711  00ab 2704          	jreq	L23
 712  00ad               L43:
 713  00ad 48            	sll	a
 714  00ae 5a            	decw	x
 715  00af 26fc          	jrne	L43
 716  00b1               L23:
 717  00b1 43            	cpl	a
 718  00b2 6b01          	ld	(OFST-1,sp),a
 720                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 722  00b4 7b03          	ld	a,(OFST+1,sp)
 723  00b6 a403          	and	a,#3
 724  00b8 48            	sll	a
 725  00b9 5f            	clrw	x
 726  00ba 97            	ld	xl,a
 727  00bb 7b04          	ld	a,(OFST+2,sp)
 728  00bd 5d            	tnzw	x
 729  00be 2704          	jreq	L63
 730  00c0               L04:
 731  00c0 48            	sll	a
 732  00c1 5a            	decw	x
 733  00c2 26fc          	jrne	L04
 734  00c4               L63:
 735  00c4 6b02          	ld	(OFST+0,sp),a
 737                     ; 228     switch (IrqNum)
 739  00c6 7b03          	ld	a,(OFST+1,sp)
 741                     ; 314     default:
 741                     ; 315         break;
 742  00c8 a119          	cp	a,#25
 743  00ca 2407          	jruge	L24
 744  00cc 5f            	clrw	x
 745  00cd 97            	ld	xl,a
 746  00ce 58            	sllw	x
 747  00cf de0032        	ldw	x,(L44,x)
 748  00d2 fc            	jp	(x)
 749  00d3               L24:
 750  00d3 207c          	jra	L562
 751  00d5               L112:
 752                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 752                     ; 232     case ITC_IRQ_AWU:
 752                     ; 233     case ITC_IRQ_CLK:
 752                     ; 234     case ITC_IRQ_PORTA:
 752                     ; 235         ITC->ISPR1 &= Mask;
 754  00d5 c67f70        	ld	a,32624
 755  00d8 1401          	and	a,(OFST-1,sp)
 756  00da c77f70        	ld	32624,a
 757                     ; 236         ITC->ISPR1 |= NewPriority;
 759  00dd c67f70        	ld	a,32624
 760  00e0 1a02          	or	a,(OFST+0,sp)
 761  00e2 c77f70        	ld	32624,a
 762                     ; 237         break;
 764  00e5 206a          	jra	L562
 765  00e7               L312:
 766                     ; 239     case ITC_IRQ_PORTB:
 766                     ; 240     case ITC_IRQ_PORTC:
 766                     ; 241     case ITC_IRQ_PORTD:
 766                     ; 242     case ITC_IRQ_PORTE:
 766                     ; 243         ITC->ISPR2 &= Mask;
 768  00e7 c67f71        	ld	a,32625
 769  00ea 1401          	and	a,(OFST-1,sp)
 770  00ec c77f71        	ld	32625,a
 771                     ; 244         ITC->ISPR2 |= NewPriority;
 773  00ef c67f71        	ld	a,32625
 774  00f2 1a02          	or	a,(OFST+0,sp)
 775  00f4 c77f71        	ld	32625,a
 776                     ; 245         break;
 778  00f7 2058          	jra	L562
 779  00f9               L512:
 780                     ; 255     case ITC_IRQ_SPI:
 780                     ; 256     case ITC_IRQ_TIM1_OVF:
 780                     ; 257         ITC->ISPR3 &= Mask;
 782  00f9 c67f72        	ld	a,32626
 783  00fc 1401          	and	a,(OFST-1,sp)
 784  00fe c77f72        	ld	32626,a
 785                     ; 258         ITC->ISPR3 |= NewPriority;
 787  0101 c67f72        	ld	a,32626
 788  0104 1a02          	or	a,(OFST+0,sp)
 789  0106 c77f72        	ld	32626,a
 790                     ; 259         break;
 792  0109 2046          	jra	L562
 793  010b               L712:
 794                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 794                     ; 262 #ifdef STM8S903
 794                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 794                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 794                     ; 265 #else
 794                     ; 266     case ITC_IRQ_TIM2_OVF:
 794                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 794                     ; 268 #endif /*STM8S903*/
 794                     ; 269 
 794                     ; 270     case ITC_IRQ_TIM3_OVF:
 794                     ; 271         ITC->ISPR4 &= Mask;
 796  010b c67f73        	ld	a,32627
 797  010e 1401          	and	a,(OFST-1,sp)
 798  0110 c77f73        	ld	32627,a
 799                     ; 272         ITC->ISPR4 |= NewPriority;
 801  0113 c67f73        	ld	a,32627
 802  0116 1a02          	or	a,(OFST+0,sp)
 803  0118 c77f73        	ld	32627,a
 804                     ; 273         break;
 806  011b 2034          	jra	L562
 807  011d               L122:
 808                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 808                     ; 276     case ITC_IRQ_UART1_TX:
 808                     ; 277     case ITC_IRQ_UART1_RX:
 808                     ; 278     case ITC_IRQ_I2C:
 808                     ; 279         ITC->ISPR5 &= Mask;
 810  011d c67f74        	ld	a,32628
 811  0120 1401          	and	a,(OFST-1,sp)
 812  0122 c77f74        	ld	32628,a
 813                     ; 280         ITC->ISPR5 |= NewPriority;
 815  0125 c67f74        	ld	a,32628
 816  0128 1a02          	or	a,(OFST+0,sp)
 817  012a c77f74        	ld	32628,a
 818                     ; 281         break;
 820  012d 2022          	jra	L562
 821  012f               L322:
 822                     ; 284     case ITC_IRQ_UART2_TX:
 822                     ; 285     case ITC_IRQ_UART2_RX:
 822                     ; 286 #endif /*STM8S105 or STM8AF626x */
 822                     ; 287 
 822                     ; 288 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 822                     ; 289     defined(STM8AF62Ax)
 822                     ; 290     case ITC_IRQ_UART3_TX:
 822                     ; 291     case ITC_IRQ_UART3_RX:
 822                     ; 292     case ITC_IRQ_ADC2:
 822                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 822                     ; 294 
 822                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 822                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 822                     ; 297     case ITC_IRQ_ADC1:
 822                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 822                     ; 299 
 822                     ; 300 #ifdef STM8S903
 822                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 822                     ; 302 #else
 822                     ; 303     case ITC_IRQ_TIM4_OVF:
 822                     ; 304 #endif /*STM8S903*/
 822                     ; 305         ITC->ISPR6 &= Mask;
 824  012f c67f75        	ld	a,32629
 825  0132 1401          	and	a,(OFST-1,sp)
 826  0134 c77f75        	ld	32629,a
 827                     ; 306         ITC->ISPR6 |= NewPriority;
 829  0137 c67f75        	ld	a,32629
 830  013a 1a02          	or	a,(OFST+0,sp)
 831  013c c77f75        	ld	32629,a
 832                     ; 307         break;
 834  013f 2010          	jra	L562
 835  0141               L522:
 836                     ; 309     case ITC_IRQ_EEPROM_EEC:
 836                     ; 310         ITC->ISPR7 &= Mask;
 838  0141 c67f76        	ld	a,32630
 839  0144 1401          	and	a,(OFST-1,sp)
 840  0146 c77f76        	ld	32630,a
 841                     ; 311         ITC->ISPR7 |= NewPriority;
 843  0149 c67f76        	ld	a,32630
 844  014c 1a02          	or	a,(OFST+0,sp)
 845  014e c77f76        	ld	32630,a
 846                     ; 312         break;
 848  0151               L722:
 849                     ; 314     default:
 849                     ; 315         break;
 851  0151               L562:
 852                     ; 319 }
 855  0151 5b04          	addw	sp,#4
 856  0153 81            	ret
 869                     	xdef	_ITC_GetSoftwarePriority
 870                     	xdef	_ITC_SetSoftwarePriority
 871                     	xdef	_ITC_GetSoftIntStatus
 872                     	xdef	_ITC_DeInit
 873                     	xdef	_ITC_GetCPUCC
 892                     	end
