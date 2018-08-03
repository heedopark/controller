   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
 117                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 117                     ; 48 {
 119                     .text:	section	.text,new
 120  0000               _GPIO_DeInit:
 124                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 126  0000 7f            	clr	(x)
 127                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 129  0001 6f02          	clr	(2,x)
 130                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 132  0003 6f03          	clr	(3,x)
 133                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 135  0005 6f04          	clr	(4,x)
 136                     ; 53 }
 139  0007 81            	ret	
 379                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 379                     ; 66 {
 380                     .text:	section	.text,new
 381  0000               _GPIO_Init:
 383  0000 89            	pushw	x
 384       00000000      OFST:	set	0
 387                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 389                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 391                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 393  0001 7b05          	ld	a,(OFST+5,sp)
 394  0003 43            	cpl	a
 395  0004 e404          	and	a,(4,x)
 396  0006 e704          	ld	(4,x),a
 397                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 399  0008 7b06          	ld	a,(OFST+6,sp)
 400  000a 2a16          	jrpl	L771
 401                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 403  000c a510          	bcp	a,#16
 404  000e 2705          	jreq	L102
 405                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 407  0010 f6            	ld	a,(x)
 408  0011 1a05          	or	a,(OFST+5,sp)
 410  0013 2004          	jra	L302
 411  0015               L102:
 412                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 414  0015 7b05          	ld	a,(OFST+5,sp)
 415  0017 43            	cpl	a
 416  0018 f4            	and	a,(x)
 417  0019               L302:
 418  0019 f7            	ld	(x),a
 419                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 421  001a 1e01          	ldw	x,(OFST+1,sp)
 422  001c e602          	ld	a,(2,x)
 423  001e 1a05          	or	a,(OFST+5,sp)
 425  0020 2005          	jra	L502
 426  0022               L771:
 427                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 429  0022 7b05          	ld	a,(OFST+5,sp)
 430  0024 43            	cpl	a
 431  0025 e402          	and	a,(2,x)
 432  0027               L502:
 433  0027 e702          	ld	(2,x),a
 434                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 436  0029 7b06          	ld	a,(OFST+6,sp)
 437  002b a540          	bcp	a,#64
 438  002d 2706          	jreq	L702
 439                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 441  002f e603          	ld	a,(3,x)
 442  0031 1a05          	or	a,(OFST+5,sp)
 444  0033 2005          	jra	L112
 445  0035               L702:
 446                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 448  0035 7b05          	ld	a,(OFST+5,sp)
 449  0037 43            	cpl	a
 450  0038 e403          	and	a,(3,x)
 451  003a               L112:
 452  003a e703          	ld	(3,x),a
 453                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 455  003c 7b06          	ld	a,(OFST+6,sp)
 456  003e a520          	bcp	a,#32
 457  0040 2706          	jreq	L312
 458                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 460  0042 e604          	ld	a,(4,x)
 461  0044 1a05          	or	a,(OFST+5,sp)
 463  0046 2005          	jra	L512
 464  0048               L312:
 465                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 467  0048 7b05          	ld	a,(OFST+5,sp)
 468  004a 43            	cpl	a
 469  004b e404          	and	a,(4,x)
 470  004d               L512:
 471  004d e704          	ld	(4,x),a
 472                     ; 125 }
 475  004f 85            	popw	x
 476  0050 81            	ret	
 520                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 520                     ; 136 {
 521                     .text:	section	.text,new
 522  0000               _GPIO_Write:
 524  0000 89            	pushw	x
 525       00000000      OFST:	set	0
 528                     ; 137     GPIOx->ODR = PortVal;
 530  0001 7b05          	ld	a,(OFST+5,sp)
 531  0003 f7            	ld	(x),a
 532                     ; 138 }
 535  0004 85            	popw	x
 536  0005 81            	ret	
 583                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 583                     ; 149 {
 584                     .text:	section	.text,new
 585  0000               _GPIO_WriteHigh:
 587  0000 89            	pushw	x
 588       00000000      OFST:	set	0
 591                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 593  0001 f6            	ld	a,(x)
 594  0002 1a05          	or	a,(OFST+5,sp)
 595  0004 f7            	ld	(x),a
 596                     ; 151 }
 599  0005 85            	popw	x
 600  0006 81            	ret	
 647                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 647                     ; 162 {
 648                     .text:	section	.text,new
 649  0000               _GPIO_WriteLow:
 651  0000 89            	pushw	x
 652       00000000      OFST:	set	0
 655                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 657  0001 7b05          	ld	a,(OFST+5,sp)
 658  0003 43            	cpl	a
 659  0004 f4            	and	a,(x)
 660  0005 f7            	ld	(x),a
 661                     ; 164 }
 664  0006 85            	popw	x
 665  0007 81            	ret	
 712                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 712                     ; 175 {
 713                     .text:	section	.text,new
 714  0000               _GPIO_WriteReverse:
 716  0000 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 722  0001 f6            	ld	a,(x)
 723  0002 1805          	xor	a,(OFST+5,sp)
 724  0004 f7            	ld	(x),a
 725                     ; 177 }
 728  0005 85            	popw	x
 729  0006 81            	ret	
 767                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 767                     ; 186 {
 768                     .text:	section	.text,new
 769  0000               _GPIO_ReadOutputData:
 773                     ; 187     return ((uint8_t)GPIOx->ODR);
 775  0000 f6            	ld	a,(x)
 778  0001 81            	ret	
 815                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 815                     ; 197 {
 816                     .text:	section	.text,new
 817  0000               _GPIO_ReadInputData:
 821                     ; 198     return ((uint8_t)GPIOx->IDR);
 823  0000 e601          	ld	a,(1,x)
 826  0002 81            	ret	
 894                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 894                     ; 208 {
 895                     .text:	section	.text,new
 896  0000               _GPIO_ReadInputPin:
 898  0000 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 904  0001 e601          	ld	a,(1,x)
 905  0003 1405          	and	a,(OFST+5,sp)
 908  0005 85            	popw	x
 909  0006 81            	ret	
 987                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 987                     ; 220 {
 988                     .text:	section	.text,new
 989  0000               _GPIO_ExternalPullUpConfig:
 991  0000 89            	pushw	x
 992       00000000      OFST:	set	0
 995                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 997                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 999                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1001  0001 7b06          	ld	a,(OFST+6,sp)
1002  0003 2706          	jreq	L174
1003                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1005  0005 e603          	ld	a,(3,x)
1006  0007 1a05          	or	a,(OFST+5,sp)
1008  0009 2005          	jra	L374
1009  000b               L174:
1010                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1012  000b 7b05          	ld	a,(OFST+5,sp)
1013  000d 43            	cpl	a
1014  000e e403          	and	a,(3,x)
1015  0010               L374:
1016  0010 e703          	ld	(3,x),a
1017                     ; 232 }
1020  0012 85            	popw	x
1021  0013 81            	ret	
1034                     	xdef	_GPIO_ExternalPullUpConfig
1035                     	xdef	_GPIO_ReadInputPin
1036                     	xdef	_GPIO_ReadOutputData
1037                     	xdef	_GPIO_ReadInputData
1038                     	xdef	_GPIO_WriteReverse
1039                     	xdef	_GPIO_WriteLow
1040                     	xdef	_GPIO_WriteHigh
1041                     	xdef	_GPIO_Write
1042                     	xdef	_GPIO_Init
1043                     	xdef	_GPIO_DeInit
1062                     	end
