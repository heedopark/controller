   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 44 uint8_t ITC_GetCPUCC(void)
  51                     ; 45 {
  53                     .text:	section	.text,new
  54  0000               _ITC_GetCPUCC:
  58                     ; 47   _asm("push cc");
  61  0000 8a            	push	cc
  63                     ; 48   _asm("pop a");
  66  0001 84            	pop	a
  68                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  71  0002 81            	ret	
  94                     ; 74 void ITC_DeInit(void)
  94                     ; 75 {
  95                     .text:	section	.text,new
  96  0000               _ITC_DeInit:
 100                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 102  0000 35ff7f70      	mov	32624,#255
 103                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 105  0004 35ff7f71      	mov	32625,#255
 106                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 108  0008 35ff7f72      	mov	32626,#255
 109                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 111  000c 35ff7f73      	mov	32627,#255
 112                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 114  0010 35ff7f74      	mov	32628,#255
 115                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 117  0014 35ff7f75      	mov	32629,#255
 118                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 120  0018 35ff7f76      	mov	32630,#255
 121                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 123  001c 35ff7f77      	mov	32631,#255
 124                     ; 84 }
 127  0020 81            	ret	
 152                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 152                     ; 92 {
 153                     .text:	section	.text,new
 154  0000               _ITC_GetSoftIntStatus:
 158                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 160  0000 cd0000        	call	_ITC_GetCPUCC
 162  0003 a428          	and	a,#40
 165  0005 81            	ret	
 410                     .const:	section	.text
 411  0000               L42:
 412  0000 0021          	dc.w	L14
 413  0002 0021          	dc.w	L14
 414  0004 0021          	dc.w	L14
 415  0006 0021          	dc.w	L14
 416  0008 0026          	dc.w	L34
 417  000a 0026          	dc.w	L34
 418  000c 0026          	dc.w	L34
 419  000e 0026          	dc.w	L34
 420  0010 0046          	dc.w	L771
 421  0012 0046          	dc.w	L771
 422  0014 002b          	dc.w	L54
 423  0016 002b          	dc.w	L54
 424  0018 0030          	dc.w	L74
 425  001a 0030          	dc.w	L74
 426  001c 0030          	dc.w	L74
 427  001e 0030          	dc.w	L74
 428  0020 0035          	dc.w	L15
 429  0022 0035          	dc.w	L15
 430  0024 0035          	dc.w	L15
 431  0026 0035          	dc.w	L15
 432  0028 0046          	dc.w	L771
 433  002a 0046          	dc.w	L771
 434  002c 003a          	dc.w	L35
 435  002e 003a          	dc.w	L35
 436  0030 003f          	dc.w	L55
 437                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 437                     ; 102 {
 438                     .text:	section	.text,new
 439  0000               _ITC_GetSoftwarePriority:
 441  0000 88            	push	a
 442  0001 89            	pushw	x
 443       00000002      OFST:	set	2
 446                     ; 104     uint8_t Value = 0;
 448  0002 0f02          	clr	(OFST+0,sp)
 450                     ; 105     uint8_t Mask = 0;
 452                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 454                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 456  0004 a403          	and	a,#3
 457  0006 48            	sll	a
 458  0007 5f            	clrw	x
 459  0008 97            	ld	xl,a
 460  0009 a603          	ld	a,#3
 461  000b 5d            	tnzw	x
 462  000c 2704          	jreq	L61
 463  000e               L02:
 464  000e 48            	sll	a
 465  000f 5a            	decw	x
 466  0010 26fc          	jrne	L02
 467  0012               L61:
 468  0012 6b01          	ld	(OFST-1,sp),a
 470                     ; 113     switch (IrqNum)
 472  0014 7b03          	ld	a,(OFST+1,sp)
 474                     ; 185     default:
 474                     ; 186         break;
 475  0016 a119          	cp	a,#25
 476  0018 242c          	jruge	L771
 477  001a 5f            	clrw	x
 478  001b 97            	ld	xl,a
 479  001c 58            	sllw	x
 480  001d de0000        	ldw	x,(L42,x)
 481  0020 fc            	jp	(x)
 482  0021               L14:
 483                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 483                     ; 116     case ITC_IRQ_AWU:
 483                     ; 117     case ITC_IRQ_CLK:
 483                     ; 118     case ITC_IRQ_PORTA:
 483                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 485  0021 c67f70        	ld	a,32624
 486                     ; 120         break;
 488  0024 201c          	jp	LC001
 489  0026               L34:
 490                     ; 121     case ITC_IRQ_PORTB:
 490                     ; 122     case ITC_IRQ_PORTC:
 490                     ; 123     case ITC_IRQ_PORTD:
 490                     ; 124     case ITC_IRQ_PORTE:
 490                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 492  0026 c67f71        	ld	a,32625
 493                     ; 126         break;
 495  0029 2017          	jp	LC001
 496  002b               L54:
 497                     ; 136     case ITC_IRQ_SPI:
 497                     ; 137     case ITC_IRQ_TIM1_OVF:
 497                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 499  002b c67f72        	ld	a,32626
 500                     ; 139         break;
 502  002e 2012          	jp	LC001
 503  0030               L74:
 504                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 504                     ; 141 #ifdef STM8S903
 504                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 504                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 504                     ; 144 #else
 504                     ; 145     case ITC_IRQ_TIM2_OVF:
 504                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 504                     ; 147 #endif /*STM8S903*/
 504                     ; 148 
 504                     ; 149     case ITC_IRQ_TIM3_OVF:
 504                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 506  0030 c67f73        	ld	a,32627
 507                     ; 151         break;
 509  0033 200d          	jp	LC001
 510  0035               L15:
 511                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 511                     ; 153     case ITC_IRQ_UART1_TX:
 511                     ; 154     case ITC_IRQ_UART1_RX:
 511                     ; 155     case ITC_IRQ_I2C:
 511                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 513  0035 c67f74        	ld	a,32628
 514                     ; 157         break;
 516  0038 2008          	jp	LC001
 517  003a               L35:
 518                     ; 172     case ITC_IRQ_ADC1:
 518                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 518                     ; 174 
 518                     ; 175 #ifdef STM8S903
 518                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 518                     ; 177 #else
 518                     ; 178     case ITC_IRQ_TIM4_OVF:
 518                     ; 179 #endif /*STM8S903*/
 518                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 520  003a c67f75        	ld	a,32629
 521                     ; 181         break;
 523  003d 2003          	jp	LC001
 524  003f               L55:
 525                     ; 182     case ITC_IRQ_EEPROM_EEC:
 525                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 527  003f c67f76        	ld	a,32630
 528  0042               LC001:
 529  0042 1401          	and	a,(OFST-1,sp)
 530  0044 6b02          	ld	(OFST+0,sp),a
 532                     ; 184         break;
 534                     ; 185     default:
 534                     ; 186         break;
 536  0046               L771:
 537                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 539  0046 7b03          	ld	a,(OFST+1,sp)
 540  0048 a403          	and	a,#3
 541  004a 48            	sll	a
 542  004b 5f            	clrw	x
 543  004c 97            	ld	xl,a
 544  004d 7b02          	ld	a,(OFST+0,sp)
 545  004f 5d            	tnzw	x
 546  0050 2704          	jreq	L62
 547  0052               L03:
 548  0052 44            	srl	a
 549  0053 5a            	decw	x
 550  0054 26fc          	jrne	L03
 551  0056               L62:
 553                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 557  0056 5b03          	addw	sp,#3
 558  0058 81            	ret	
 618                     	switch	.const
 619  0032               L64:
 620  0032 0036          	dc.w	L102
 621  0034 0036          	dc.w	L102
 622  0036 0036          	dc.w	L102
 623  0038 0036          	dc.w	L102
 624  003a 0048          	dc.w	L302
 625  003c 0048          	dc.w	L302
 626  003e 0048          	dc.w	L302
 627  0040 0048          	dc.w	L302
 628  0042 00b2          	dc.w	L152
 629  0044 00b2          	dc.w	L152
 630  0046 005a          	dc.w	L502
 631  0048 005a          	dc.w	L502
 632  004a 006c          	dc.w	L702
 633  004c 006c          	dc.w	L702
 634  004e 006c          	dc.w	L702
 635  0050 006c          	dc.w	L702
 636  0052 007e          	dc.w	L112
 637  0054 007e          	dc.w	L112
 638  0056 007e          	dc.w	L112
 639  0058 007e          	dc.w	L112
 640  005a 00b2          	dc.w	L152
 641  005c 00b2          	dc.w	L152
 642  005e 0090          	dc.w	L312
 643  0060 0090          	dc.w	L312
 644  0062 00a2          	dc.w	L512
 645                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 645                     ; 209 {
 646                     .text:	section	.text,new
 647  0000               _ITC_SetSoftwarePriority:
 649  0000 89            	pushw	x
 650  0001 89            	pushw	x
 651       00000002      OFST:	set	2
 654                     ; 211     uint8_t Mask = 0;
 656                     ; 212     uint8_t NewPriority = 0;
 658                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 660                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 662                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 664                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 666  0002 9e            	ld	a,xh
 667  0003 a403          	and	a,#3
 668  0005 48            	sll	a
 669  0006 5f            	clrw	x
 670  0007 97            	ld	xl,a
 671  0008 a603          	ld	a,#3
 672  000a 5d            	tnzw	x
 673  000b 2704          	jreq	L43
 674  000d               L63:
 675  000d 48            	sll	a
 676  000e 5a            	decw	x
 677  000f 26fc          	jrne	L63
 678  0011               L43:
 679  0011 43            	cpl	a
 680  0012 6b01          	ld	(OFST-1,sp),a
 682                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 684  0014 7b03          	ld	a,(OFST+1,sp)
 685  0016 a403          	and	a,#3
 686  0018 48            	sll	a
 687  0019 5f            	clrw	x
 688  001a 97            	ld	xl,a
 689  001b 7b04          	ld	a,(OFST+2,sp)
 690  001d 5d            	tnzw	x
 691  001e 2704          	jreq	L04
 692  0020               L24:
 693  0020 48            	sll	a
 694  0021 5a            	decw	x
 695  0022 26fc          	jrne	L24
 696  0024               L04:
 697  0024 6b02          	ld	(OFST+0,sp),a
 699                     ; 228     switch (IrqNum)
 701  0026 7b03          	ld	a,(OFST+1,sp)
 703                     ; 314     default:
 703                     ; 315         break;
 704  0028 a119          	cp	a,#25
 705  002a 2503cc00b2    	jruge	L152
 706  002f 5f            	clrw	x
 707  0030 97            	ld	xl,a
 708  0031 58            	sllw	x
 709  0032 de0032        	ldw	x,(L64,x)
 710  0035 fc            	jp	(x)
 711  0036               L102:
 712                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 712                     ; 232     case ITC_IRQ_AWU:
 712                     ; 233     case ITC_IRQ_CLK:
 712                     ; 234     case ITC_IRQ_PORTA:
 712                     ; 235         ITC->ISPR1 &= Mask;
 714  0036 c67f70        	ld	a,32624
 715  0039 1401          	and	a,(OFST-1,sp)
 716  003b c77f70        	ld	32624,a
 717                     ; 236         ITC->ISPR1 |= NewPriority;
 719  003e c67f70        	ld	a,32624
 720  0041 1a02          	or	a,(OFST+0,sp)
 721  0043 c77f70        	ld	32624,a
 722                     ; 237         break;
 724  0046 206a          	jra	L152
 725  0048               L302:
 726                     ; 239     case ITC_IRQ_PORTB:
 726                     ; 240     case ITC_IRQ_PORTC:
 726                     ; 241     case ITC_IRQ_PORTD:
 726                     ; 242     case ITC_IRQ_PORTE:
 726                     ; 243         ITC->ISPR2 &= Mask;
 728  0048 c67f71        	ld	a,32625
 729  004b 1401          	and	a,(OFST-1,sp)
 730  004d c77f71        	ld	32625,a
 731                     ; 244         ITC->ISPR2 |= NewPriority;
 733  0050 c67f71        	ld	a,32625
 734  0053 1a02          	or	a,(OFST+0,sp)
 735  0055 c77f71        	ld	32625,a
 736                     ; 245         break;
 738  0058 2058          	jra	L152
 739  005a               L502:
 740                     ; 255     case ITC_IRQ_SPI:
 740                     ; 256     case ITC_IRQ_TIM1_OVF:
 740                     ; 257         ITC->ISPR3 &= Mask;
 742  005a c67f72        	ld	a,32626
 743  005d 1401          	and	a,(OFST-1,sp)
 744  005f c77f72        	ld	32626,a
 745                     ; 258         ITC->ISPR3 |= NewPriority;
 747  0062 c67f72        	ld	a,32626
 748  0065 1a02          	or	a,(OFST+0,sp)
 749  0067 c77f72        	ld	32626,a
 750                     ; 259         break;
 752  006a 2046          	jra	L152
 753  006c               L702:
 754                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 754                     ; 262 #ifdef STM8S903
 754                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 754                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 754                     ; 265 #else
 754                     ; 266     case ITC_IRQ_TIM2_OVF:
 754                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 754                     ; 268 #endif /*STM8S903*/
 754                     ; 269 
 754                     ; 270     case ITC_IRQ_TIM3_OVF:
 754                     ; 271         ITC->ISPR4 &= Mask;
 756  006c c67f73        	ld	a,32627
 757  006f 1401          	and	a,(OFST-1,sp)
 758  0071 c77f73        	ld	32627,a
 759                     ; 272         ITC->ISPR4 |= NewPriority;
 761  0074 c67f73        	ld	a,32627
 762  0077 1a02          	or	a,(OFST+0,sp)
 763  0079 c77f73        	ld	32627,a
 764                     ; 273         break;
 766  007c 2034          	jra	L152
 767  007e               L112:
 768                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 768                     ; 276     case ITC_IRQ_UART1_TX:
 768                     ; 277     case ITC_IRQ_UART1_RX:
 768                     ; 278     case ITC_IRQ_I2C:
 768                     ; 279         ITC->ISPR5 &= Mask;
 770  007e c67f74        	ld	a,32628
 771  0081 1401          	and	a,(OFST-1,sp)
 772  0083 c77f74        	ld	32628,a
 773                     ; 280         ITC->ISPR5 |= NewPriority;
 775  0086 c67f74        	ld	a,32628
 776  0089 1a02          	or	a,(OFST+0,sp)
 777  008b c77f74        	ld	32628,a
 778                     ; 281         break;
 780  008e 2022          	jra	L152
 781  0090               L312:
 782                     ; 297     case ITC_IRQ_ADC1:
 782                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 782                     ; 299 
 782                     ; 300 #ifdef STM8S903
 782                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 782                     ; 302 #else
 782                     ; 303     case ITC_IRQ_TIM4_OVF:
 782                     ; 304 #endif /*STM8S903*/
 782                     ; 305         ITC->ISPR6 &= Mask;
 784  0090 c67f75        	ld	a,32629
 785  0093 1401          	and	a,(OFST-1,sp)
 786  0095 c77f75        	ld	32629,a
 787                     ; 306         ITC->ISPR6 |= NewPriority;
 789  0098 c67f75        	ld	a,32629
 790  009b 1a02          	or	a,(OFST+0,sp)
 791  009d c77f75        	ld	32629,a
 792                     ; 307         break;
 794  00a0 2010          	jra	L152
 795  00a2               L512:
 796                     ; 309     case ITC_IRQ_EEPROM_EEC:
 796                     ; 310         ITC->ISPR7 &= Mask;
 798  00a2 c67f76        	ld	a,32630
 799  00a5 1401          	and	a,(OFST-1,sp)
 800  00a7 c77f76        	ld	32630,a
 801                     ; 311         ITC->ISPR7 |= NewPriority;
 803  00aa c67f76        	ld	a,32630
 804  00ad 1a02          	or	a,(OFST+0,sp)
 805  00af c77f76        	ld	32630,a
 806                     ; 312         break;
 808                     ; 314     default:
 808                     ; 315         break;
 810  00b2               L152:
 811                     ; 319 }
 814  00b2 5b04          	addw	sp,#4
 815  00b4 81            	ret	
 828                     	xdef	_ITC_GetSoftwarePriority
 829                     	xdef	_ITC_SetSoftwarePriority
 830                     	xdef	_ITC_GetSoftIntStatus
 831                     	xdef	_ITC_DeInit
 832                     	xdef	_ITC_GetCPUCC
 851                     	end
