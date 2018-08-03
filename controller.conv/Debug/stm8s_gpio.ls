   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
 111                     ; 47 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 111                     ; 48 {
 113                     	switch	.text
 114  0000               _GPIO_DeInit:
 118                     ; 49     GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 120  0000 7f            	clr	(x)
 121                     ; 50     GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 123  0001 6f02          	clr	(2,x)
 124                     ; 51     GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 126  0003 6f03          	clr	(3,x)
 127                     ; 52     GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 129  0005 6f04          	clr	(4,x)
 130                     ; 53 }
 133  0007 81            	ret
 373                     ; 65 void GPIO_Init(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 373                     ; 66 {
 374                     	switch	.text
 375  0008               _GPIO_Init:
 377  0008 89            	pushw	x
 378       00000000      OFST:	set	0
 381                     ; 71     assert_param(IS_GPIO_MODE_OK(GPIO_Mode));
 383                     ; 72     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
 385                     ; 75   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 387  0009 7b05          	ld	a,(OFST+5,sp)
 388  000b 43            	cpl	a
 389  000c e404          	and	a,(4,x)
 390  000e e704          	ld	(4,x),a
 391                     ; 81     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 393  0010 7b06          	ld	a,(OFST+6,sp)
 394  0012 a580          	bcp	a,#128
 395  0014 271d          	jreq	L771
 396                     ; 83         if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 398  0016 7b06          	ld	a,(OFST+6,sp)
 399  0018 a510          	bcp	a,#16
 400  001a 2706          	jreq	L102
 401                     ; 85             GPIOx->ODR |= (uint8_t)GPIO_Pin;
 403  001c f6            	ld	a,(x)
 404  001d 1a05          	or	a,(OFST+5,sp)
 405  001f f7            	ld	(x),a
 407  0020 2007          	jra	L302
 408  0022               L102:
 409                     ; 89             GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 411  0022 1e01          	ldw	x,(OFST+1,sp)
 412  0024 7b05          	ld	a,(OFST+5,sp)
 413  0026 43            	cpl	a
 414  0027 f4            	and	a,(x)
 415  0028 f7            	ld	(x),a
 416  0029               L302:
 417                     ; 92         GPIOx->DDR |= (uint8_t)GPIO_Pin;
 419  0029 1e01          	ldw	x,(OFST+1,sp)
 420  002b e602          	ld	a,(2,x)
 421  002d 1a05          	or	a,(OFST+5,sp)
 422  002f e702          	ld	(2,x),a
 424  0031 2009          	jra	L502
 425  0033               L771:
 426                     ; 97         GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 428  0033 1e01          	ldw	x,(OFST+1,sp)
 429  0035 7b05          	ld	a,(OFST+5,sp)
 430  0037 43            	cpl	a
 431  0038 e402          	and	a,(2,x)
 432  003a e702          	ld	(2,x),a
 433  003c               L502:
 434                     ; 104     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 436  003c 7b06          	ld	a,(OFST+6,sp)
 437  003e a540          	bcp	a,#64
 438  0040 270a          	jreq	L702
 439                     ; 106         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
 441  0042 1e01          	ldw	x,(OFST+1,sp)
 442  0044 e603          	ld	a,(3,x)
 443  0046 1a05          	or	a,(OFST+5,sp)
 444  0048 e703          	ld	(3,x),a
 446  004a 2009          	jra	L112
 447  004c               L702:
 448                     ; 110         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 450  004c 1e01          	ldw	x,(OFST+1,sp)
 451  004e 7b05          	ld	a,(OFST+5,sp)
 452  0050 43            	cpl	a
 453  0051 e403          	and	a,(3,x)
 454  0053 e703          	ld	(3,x),a
 455  0055               L112:
 456                     ; 117     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 458  0055 7b06          	ld	a,(OFST+6,sp)
 459  0057 a520          	bcp	a,#32
 460  0059 270a          	jreq	L312
 461                     ; 119         GPIOx->CR2 |= (uint8_t)GPIO_Pin;
 463  005b 1e01          	ldw	x,(OFST+1,sp)
 464  005d e604          	ld	a,(4,x)
 465  005f 1a05          	or	a,(OFST+5,sp)
 466  0061 e704          	ld	(4,x),a
 468  0063 2009          	jra	L512
 469  0065               L312:
 470                     ; 123         GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 472  0065 1e01          	ldw	x,(OFST+1,sp)
 473  0067 7b05          	ld	a,(OFST+5,sp)
 474  0069 43            	cpl	a
 475  006a e404          	and	a,(4,x)
 476  006c e704          	ld	(4,x),a
 477  006e               L512:
 478                     ; 125 }
 481  006e 85            	popw	x
 482  006f 81            	ret
 528                     ; 135 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t PortVal)
 528                     ; 136 {
 529                     	switch	.text
 530  0070               _GPIO_Write:
 532  0070 89            	pushw	x
 533       00000000      OFST:	set	0
 536                     ; 137     GPIOx->ODR = PortVal;
 538  0071 7b05          	ld	a,(OFST+5,sp)
 539  0073 1e01          	ldw	x,(OFST+1,sp)
 540  0075 f7            	ld	(x),a
 541                     ; 138 }
 544  0076 85            	popw	x
 545  0077 81            	ret
 592                     ; 148 void GPIO_WriteHigh(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 592                     ; 149 {
 593                     	switch	.text
 594  0078               _GPIO_WriteHigh:
 596  0078 89            	pushw	x
 597       00000000      OFST:	set	0
 600                     ; 150     GPIOx->ODR |= (uint8_t)PortPins;
 602  0079 f6            	ld	a,(x)
 603  007a 1a05          	or	a,(OFST+5,sp)
 604  007c f7            	ld	(x),a
 605                     ; 151 }
 608  007d 85            	popw	x
 609  007e 81            	ret
 656                     ; 161 void GPIO_WriteLow(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 656                     ; 162 {
 657                     	switch	.text
 658  007f               _GPIO_WriteLow:
 660  007f 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 163     GPIOx->ODR &= (uint8_t)(~PortPins);
 666  0080 7b05          	ld	a,(OFST+5,sp)
 667  0082 43            	cpl	a
 668  0083 f4            	and	a,(x)
 669  0084 f7            	ld	(x),a
 670                     ; 164 }
 673  0085 85            	popw	x
 674  0086 81            	ret
 721                     ; 174 void GPIO_WriteReverse(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef PortPins)
 721                     ; 175 {
 722                     	switch	.text
 723  0087               _GPIO_WriteReverse:
 725  0087 89            	pushw	x
 726       00000000      OFST:	set	0
 729                     ; 176     GPIOx->ODR ^= (uint8_t)PortPins;
 731  0088 f6            	ld	a,(x)
 732  0089 1805          	xor	a,	(OFST+5,sp)
 733  008b f7            	ld	(x),a
 734                     ; 177 }
 737  008c 85            	popw	x
 738  008d 81            	ret
 776                     ; 185 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
 776                     ; 186 {
 777                     	switch	.text
 778  008e               _GPIO_ReadOutputData:
 782                     ; 187     return ((uint8_t)GPIOx->ODR);
 784  008e f6            	ld	a,(x)
 787  008f 81            	ret
 824                     ; 196 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 824                     ; 197 {
 825                     	switch	.text
 826  0090               _GPIO_ReadInputData:
 830                     ; 198     return ((uint8_t)GPIOx->IDR);
 832  0090 e601          	ld	a,(1,x)
 835  0092 81            	ret
 903                     ; 207 BitStatus GPIO_ReadInputPin(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
 903                     ; 208 {
 904                     	switch	.text
 905  0093               _GPIO_ReadInputPin:
 907  0093 89            	pushw	x
 908       00000000      OFST:	set	0
 911                     ; 209     return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
 913  0094 e601          	ld	a,(1,x)
 914  0096 1405          	and	a,(OFST+5,sp)
 917  0098 85            	popw	x
 918  0099 81            	ret
 996                     ; 219 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, FunctionalState NewState)
 996                     ; 220 {
 997                     	switch	.text
 998  009a               _GPIO_ExternalPullUpConfig:
1000  009a 89            	pushw	x
1001       00000000      OFST:	set	0
1004                     ; 222     assert_param(IS_GPIO_PIN_OK(GPIO_Pin));
1006                     ; 223     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1008                     ; 225     if (NewState != DISABLE) /* External Pull-Up Set*/
1010  009b 0d06          	tnz	(OFST+6,sp)
1011  009d 2708          	jreq	L374
1012                     ; 227         GPIOx->CR1 |= (uint8_t)GPIO_Pin;
1014  009f e603          	ld	a,(3,x)
1015  00a1 1a05          	or	a,(OFST+5,sp)
1016  00a3 e703          	ld	(3,x),a
1018  00a5 2009          	jra	L574
1019  00a7               L374:
1020                     ; 230         GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
1022  00a7 1e01          	ldw	x,(OFST+1,sp)
1023  00a9 7b05          	ld	a,(OFST+5,sp)
1024  00ab 43            	cpl	a
1025  00ac e403          	and	a,(3,x)
1026  00ae e703          	ld	(3,x),a
1027  00b0               L574:
1028                     ; 232 }
1031  00b0 85            	popw	x
1032  00b1 81            	ret
1045                     	xdef	_GPIO_ExternalPullUpConfig
1046                     	xdef	_GPIO_ReadInputPin
1047                     	xdef	_GPIO_ReadOutputData
1048                     	xdef	_GPIO_ReadInputData
1049                     	xdef	_GPIO_WriteReverse
1050                     	xdef	_GPIO_WriteLow
1051                     	xdef	_GPIO_WriteHigh
1052                     	xdef	_GPIO_Write
1053                     	xdef	_GPIO_Init
1054                     	xdef	_GPIO_DeInit
1073                     	end
