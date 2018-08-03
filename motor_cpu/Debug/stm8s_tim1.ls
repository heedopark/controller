   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  51                     ; 51 void TIM1_DeInit(void)
  51                     ; 52 {
  53                     .text:	section	.text,new
  54  0000               _TIM1_DeInit:
  58                     ; 53     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  60  0000 725f5250      	clr	21072
  61                     ; 54     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  63  0004 725f5251      	clr	21073
  64                     ; 55     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  66  0008 725f5252      	clr	21074
  67                     ; 56     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  69  000c 725f5253      	clr	21075
  70                     ; 57     TIM1->IER  = TIM1_IER_RESET_VALUE;
  72  0010 725f5254      	clr	21076
  73                     ; 58     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  75  0014 725f5256      	clr	21078
  76                     ; 60     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  78  0018 725f525c      	clr	21084
  79                     ; 61     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  81  001c 725f525d      	clr	21085
  82                     ; 63     TIM1->CCMR1 = 0x01;
  84  0020 35015258      	mov	21080,#1
  85                     ; 64     TIM1->CCMR2 = 0x01;
  87  0024 35015259      	mov	21081,#1
  88                     ; 65     TIM1->CCMR3 = 0x01;
  90  0028 3501525a      	mov	21082,#1
  91                     ; 66     TIM1->CCMR4 = 0x01;
  93  002c 3501525b      	mov	21083,#1
  94                     ; 68     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  96  0030 725f525c      	clr	21084
  97                     ; 69     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  99  0034 725f525d      	clr	21085
 100                     ; 70     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 102  0038 725f5258      	clr	21080
 103                     ; 71     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 105  003c 725f5259      	clr	21081
 106                     ; 72     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 108  0040 725f525a      	clr	21082
 109                     ; 73     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 111  0044 725f525b      	clr	21083
 112                     ; 74     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 114  0048 725f525e      	clr	21086
 115                     ; 75     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 117  004c 725f525f      	clr	21087
 118                     ; 76     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 120  0050 725f5260      	clr	21088
 121                     ; 77     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 123  0054 725f5261      	clr	21089
 124                     ; 78     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 126  0058 35ff5262      	mov	21090,#255
 127                     ; 79     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 129  005c 35ff5263      	mov	21091,#255
 130                     ; 80     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 132  0060 725f5265      	clr	21093
 133                     ; 81     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 135  0064 725f5266      	clr	21094
 136                     ; 82     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 138  0068 725f5267      	clr	21095
 139                     ; 83     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 141  006c 725f5268      	clr	21096
 142                     ; 84     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 144  0070 725f5269      	clr	21097
 145                     ; 85     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 147  0074 725f526a      	clr	21098
 148                     ; 86     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 150  0078 725f526b      	clr	21099
 151                     ; 87     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 153  007c 725f526c      	clr	21100
 154                     ; 88     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 156  0080 725f526f      	clr	21103
 157                     ; 89     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 159  0084 35015257      	mov	21079,#1
 160                     ; 90     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 162  0088 725f526e      	clr	21102
 163                     ; 91     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 165  008c 725f526d      	clr	21101
 166                     ; 92     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 168  0090 725f5264      	clr	21092
 169                     ; 93     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 171  0094 725f5255      	clr	21077
 172                     ; 94 }
 175  0098 81            	ret	
 278                     ; 104 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 105                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 106                        uint16_t TIM1_Period,
 278                     ; 107                        uint8_t TIM1_RepetitionCounter)
 278                     ; 108 {
 279                     .text:	section	.text,new
 280  0000               _TIM1_TimeBaseInit:
 282  0000 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 111     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288                     ; 114     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 290  0001 7b06          	ld	a,(OFST+6,sp)
 291  0003 c75262        	ld	21090,a
 292                     ; 115     TIM1->ARRL = (uint8_t)(TIM1_Period);
 294  0006 7b07          	ld	a,(OFST+7,sp)
 295  0008 c75263        	ld	21091,a
 296                     ; 118     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 298  000b 9e            	ld	a,xh
 299  000c c75260        	ld	21088,a
 300                     ; 119     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 302  000f 9f            	ld	a,xl
 303  0010 c75261        	ld	21089,a
 304                     ; 122     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 304                     ; 123                            | (uint8_t)(TIM1_CounterMode));
 306  0013 c65250        	ld	a,21072
 307  0016 a48f          	and	a,#143
 308  0018 1a05          	or	a,(OFST+5,sp)
 309  001a c75250        	ld	21072,a
 310                     ; 126     TIM1->RCR = TIM1_RepetitionCounter;
 312  001d 7b08          	ld	a,(OFST+8,sp)
 313  001f c75264        	ld	21092,a
 314                     ; 128 }
 317  0022 85            	popw	x
 318  0023 81            	ret	
 601                     ; 149 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 601                     ; 150                   TIM1_OutputState_TypeDef TIM1_OutputState,
 601                     ; 151                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 601                     ; 152                   uint16_t TIM1_Pulse,
 601                     ; 153                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 601                     ; 154                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 601                     ; 155                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 601                     ; 156                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 601                     ; 157 {
 602                     .text:	section	.text,new
 603  0000               _TIM1_OC1Init:
 605  0000 89            	pushw	x
 606  0001 5203          	subw	sp,#3
 607       00000003      OFST:	set	3
 610                     ; 159     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 612                     ; 160     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 614                     ; 161     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 616                     ; 162     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 618                     ; 163     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 620                     ; 164     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 622                     ; 165     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 624                     ; 169     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 624                     ; 170                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 626  0003 c6525c        	ld	a,21084
 627  0006 a4f0          	and	a,#240
 628  0008 c7525c        	ld	21084,a
 629                     ; 173   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 629                     ; 174                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 629                     ; 175                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 629                     ; 176                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 631  000b 7b0c          	ld	a,(OFST+9,sp)
 632  000d a408          	and	a,#8
 633  000f 6b03          	ld	(OFST+0,sp),a
 635  0011 7b0b          	ld	a,(OFST+8,sp)
 636  0013 a402          	and	a,#2
 637  0015 1a03          	or	a,(OFST+0,sp)
 638  0017 6b02          	ld	(OFST-1,sp),a
 640  0019 7b08          	ld	a,(OFST+5,sp)
 641  001b a404          	and	a,#4
 642  001d 6b01          	ld	(OFST-2,sp),a
 644  001f 9f            	ld	a,xl
 645  0020 a401          	and	a,#1
 646  0022 1a01          	or	a,(OFST-2,sp)
 647  0024 1a02          	or	a,(OFST-1,sp)
 648  0026 ca525c        	or	a,21084
 649  0029 c7525c        	ld	21084,a
 650                     ; 179     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 650                     ; 180                             (uint8_t)TIM1_OCMode);
 652  002c c65258        	ld	a,21080
 653  002f a48f          	and	a,#143
 654  0031 1a04          	or	a,(OFST+1,sp)
 655  0033 c75258        	ld	21080,a
 656                     ; 183     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 658  0036 c6526f        	ld	a,21103
 659  0039 a4fc          	and	a,#252
 660  003b c7526f        	ld	21103,a
 661                     ; 185     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 661                     ; 186                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 663  003e 7b0e          	ld	a,(OFST+11,sp)
 664  0040 a402          	and	a,#2
 665  0042 6b03          	ld	(OFST+0,sp),a
 667  0044 7b0d          	ld	a,(OFST+10,sp)
 668  0046 a401          	and	a,#1
 669  0048 1a03          	or	a,(OFST+0,sp)
 670  004a ca526f        	or	a,21103
 671  004d c7526f        	ld	21103,a
 672                     ; 189     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 674  0050 7b09          	ld	a,(OFST+6,sp)
 675  0052 c75265        	ld	21093,a
 676                     ; 190     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 678  0055 7b0a          	ld	a,(OFST+7,sp)
 679  0057 c75266        	ld	21094,a
 680                     ; 191 }
 683  005a 5b05          	addw	sp,#5
 684  005c 81            	ret	
 786                     ; 212 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 786                     ; 213                   TIM1_OutputState_TypeDef TIM1_OutputState,
 786                     ; 214                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 786                     ; 215                   uint16_t TIM1_Pulse,
 786                     ; 216                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 786                     ; 217                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 786                     ; 218                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 786                     ; 219                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 786                     ; 220 {
 787                     .text:	section	.text,new
 788  0000               _TIM1_OC2Init:
 790  0000 89            	pushw	x
 791  0001 5203          	subw	sp,#3
 792       00000003      OFST:	set	3
 795                     ; 222     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 797                     ; 223     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 799                     ; 224     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 801                     ; 225     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 803                     ; 226     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 805                     ; 227     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 807                     ; 228     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 809                     ; 232     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 809                     ; 233                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 811  0003 c6525c        	ld	a,21084
 812  0006 a40f          	and	a,#15
 813  0008 c7525c        	ld	21084,a
 814                     ; 237     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 814                     ; 238                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 814                     ; 239                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 814                     ; 240                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 816  000b 7b0c          	ld	a,(OFST+9,sp)
 817  000d a480          	and	a,#128
 818  000f 6b03          	ld	(OFST+0,sp),a
 820  0011 7b0b          	ld	a,(OFST+8,sp)
 821  0013 a420          	and	a,#32
 822  0015 1a03          	or	a,(OFST+0,sp)
 823  0017 6b02          	ld	(OFST-1,sp),a
 825  0019 7b08          	ld	a,(OFST+5,sp)
 826  001b a440          	and	a,#64
 827  001d 6b01          	ld	(OFST-2,sp),a
 829  001f 9f            	ld	a,xl
 830  0020 a410          	and	a,#16
 831  0022 1a01          	or	a,(OFST-2,sp)
 832  0024 1a02          	or	a,(OFST-1,sp)
 833  0026 ca525c        	or	a,21084
 834  0029 c7525c        	ld	21084,a
 835                     ; 243     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 835                     ; 244                              (uint8_t)TIM1_OCMode);
 837  002c c65259        	ld	a,21081
 838  002f a48f          	and	a,#143
 839  0031 1a04          	or	a,(OFST+1,sp)
 840  0033 c75259        	ld	21081,a
 841                     ; 247     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 843  0036 c6526f        	ld	a,21103
 844  0039 a4f3          	and	a,#243
 845  003b c7526f        	ld	21103,a
 846                     ; 249     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 846                     ; 250                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 848  003e 7b0e          	ld	a,(OFST+11,sp)
 849  0040 a408          	and	a,#8
 850  0042 6b03          	ld	(OFST+0,sp),a
 852  0044 7b0d          	ld	a,(OFST+10,sp)
 853  0046 a404          	and	a,#4
 854  0048 1a03          	or	a,(OFST+0,sp)
 855  004a ca526f        	or	a,21103
 856  004d c7526f        	ld	21103,a
 857                     ; 253     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 859  0050 7b09          	ld	a,(OFST+6,sp)
 860  0052 c75267        	ld	21095,a
 861                     ; 254     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 863  0055 7b0a          	ld	a,(OFST+7,sp)
 864  0057 c75268        	ld	21096,a
 865                     ; 256 }
 868  005a 5b05          	addw	sp,#5
 869  005c 81            	ret	
 971                     ; 277 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 971                     ; 278                   TIM1_OutputState_TypeDef TIM1_OutputState,
 971                     ; 279                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 971                     ; 280                   uint16_t TIM1_Pulse,
 971                     ; 281                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 971                     ; 282                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 971                     ; 283                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 971                     ; 284                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 971                     ; 285 {
 972                     .text:	section	.text,new
 973  0000               _TIM1_OC3Init:
 975  0000 89            	pushw	x
 976  0001 5203          	subw	sp,#3
 977       00000003      OFST:	set	3
 980                     ; 287     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 982                     ; 288     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 984                     ; 289     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 986                     ; 290     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 988                     ; 291     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 990                     ; 292     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 992                     ; 293     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 994                     ; 297     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 994                     ; 298                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 996  0003 c6525d        	ld	a,21085
 997  0006 a4f0          	and	a,#240
 998  0008 c7525d        	ld	21085,a
 999                     ; 301     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 999                     ; 302                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 999                     ; 303                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 999                     ; 304                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1001  000b 7b0c          	ld	a,(OFST+9,sp)
1002  000d a408          	and	a,#8
1003  000f 6b03          	ld	(OFST+0,sp),a
1005  0011 7b0b          	ld	a,(OFST+8,sp)
1006  0013 a402          	and	a,#2
1007  0015 1a03          	or	a,(OFST+0,sp)
1008  0017 6b02          	ld	(OFST-1,sp),a
1010  0019 7b08          	ld	a,(OFST+5,sp)
1011  001b a404          	and	a,#4
1012  001d 6b01          	ld	(OFST-2,sp),a
1014  001f 9f            	ld	a,xl
1015  0020 a401          	and	a,#1
1016  0022 1a01          	or	a,(OFST-2,sp)
1017  0024 1a02          	or	a,(OFST-1,sp)
1018  0026 ca525d        	or	a,21085
1019  0029 c7525d        	ld	21085,a
1020                     ; 307     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1020                     ; 308                              (uint8_t)TIM1_OCMode);
1022  002c c6525a        	ld	a,21082
1023  002f a48f          	and	a,#143
1024  0031 1a04          	or	a,(OFST+1,sp)
1025  0033 c7525a        	ld	21082,a
1026                     ; 311     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1028  0036 c6526f        	ld	a,21103
1029  0039 a4cf          	and	a,#207
1030  003b c7526f        	ld	21103,a
1031                     ; 313     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1031                     ; 314                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1033  003e 7b0e          	ld	a,(OFST+11,sp)
1034  0040 a420          	and	a,#32
1035  0042 6b03          	ld	(OFST+0,sp),a
1037  0044 7b0d          	ld	a,(OFST+10,sp)
1038  0046 a410          	and	a,#16
1039  0048 1a03          	or	a,(OFST+0,sp)
1040  004a ca526f        	or	a,21103
1041  004d c7526f        	ld	21103,a
1042                     ; 317     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1044  0050 7b09          	ld	a,(OFST+6,sp)
1045  0052 c75269        	ld	21097,a
1046                     ; 318     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1048  0055 7b0a          	ld	a,(OFST+7,sp)
1049  0057 c7526a        	ld	21098,a
1050                     ; 320 }
1053  005a 5b05          	addw	sp,#5
1054  005c 81            	ret	
1126                     ; 335 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1126                     ; 336                   TIM1_OutputState_TypeDef TIM1_OutputState,
1126                     ; 337                   uint16_t TIM1_Pulse,
1126                     ; 338                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1126                     ; 339                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1126                     ; 340 {
1127                     .text:	section	.text,new
1128  0000               _TIM1_OC4Init:
1130  0000 89            	pushw	x
1131  0001 88            	push	a
1132       00000001      OFST:	set	1
1135                     ; 342     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1137                     ; 343     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1139                     ; 344     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1141                     ; 345     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1143                     ; 348     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1145  0002 c6525d        	ld	a,21085
1146  0005 a4cf          	and	a,#207
1147  0007 c7525d        	ld	21085,a
1148                     ; 350     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1148                     ; 351                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1150  000a 7b08          	ld	a,(OFST+7,sp)
1151  000c a420          	and	a,#32
1152  000e 6b01          	ld	(OFST+0,sp),a
1154  0010 9f            	ld	a,xl
1155  0011 a410          	and	a,#16
1156  0013 1a01          	or	a,(OFST+0,sp)
1157  0015 ca525d        	or	a,21085
1158  0018 c7525d        	ld	21085,a
1159                     ; 354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1159                     ; 355                             TIM1_OCMode);
1161  001b c6525b        	ld	a,21083
1162  001e a48f          	and	a,#143
1163  0020 1a02          	or	a,(OFST+1,sp)
1164  0022 c7525b        	ld	21083,a
1165                     ; 358     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1167  0025 7b09          	ld	a,(OFST+8,sp)
1168  0027 270a          	jreq	L714
1169                     ; 360         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1171  0029 c6526f        	ld	a,21103
1172  002c aadf          	or	a,#223
1173  002e c7526f        	ld	21103,a
1175  0031 2004          	jra	L124
1176  0033               L714:
1177                     ; 364         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1179  0033 721d526f      	bres	21103,#6
1180  0037               L124:
1181                     ; 368     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1183  0037 7b06          	ld	a,(OFST+5,sp)
1184  0039 c7526b        	ld	21099,a
1185                     ; 369     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1187  003c 7b07          	ld	a,(OFST+6,sp)
1188  003e c7526c        	ld	21100,a
1189                     ; 371 }
1192  0041 5b03          	addw	sp,#3
1193  0043 81            	ret	
1396                     ; 386 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1396                     ; 387                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1396                     ; 388                      uint8_t TIM1_DeadTime,
1396                     ; 389                      TIM1_BreakState_TypeDef TIM1_Break,
1396                     ; 390                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1396                     ; 391                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1396                     ; 392 {
1397                     .text:	section	.text,new
1398  0000               _TIM1_BDTRConfig:
1400  0000 89            	pushw	x
1401  0001 88            	push	a
1402       00000001      OFST:	set	1
1405                     ; 394     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1407                     ; 395     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1409                     ; 396     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1411                     ; 397     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1413                     ; 398     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1415                     ; 400     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1417  0002 7b06          	ld	a,(OFST+5,sp)
1418  0004 c7526e        	ld	21102,a
1419                     ; 404     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1419                     ; 405                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1419                     ; 406                             (uint8_t)TIM1_AutomaticOutput));
1421  0007 7b07          	ld	a,(OFST+6,sp)
1422  0009 1a08          	or	a,(OFST+7,sp)
1423  000b 1a09          	or	a,(OFST+8,sp)
1424  000d 6b01          	ld	(OFST+0,sp),a
1426  000f 9f            	ld	a,xl
1427  0010 1a02          	or	a,(OFST+1,sp)
1428  0012 1a01          	or	a,(OFST+0,sp)
1429  0014 c7526d        	ld	21101,a
1430                     ; 408 }
1433  0017 5b03          	addw	sp,#3
1434  0019 81            	ret	
1634                     ; 422 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1634                     ; 423                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1634                     ; 424                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1634                     ; 425                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1634                     ; 426                  uint8_t TIM1_ICFilter)
1634                     ; 427 {
1635                     .text:	section	.text,new
1636  0000               _TIM1_ICInit:
1638  0000 89            	pushw	x
1639       00000000      OFST:	set	0
1642                     ; 430     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1644                     ; 431     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1646                     ; 432     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1648                     ; 433     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1650                     ; 434     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1652                     ; 436     if (TIM1_Channel == TIM1_CHANNEL_1)
1654  0001 9e            	ld	a,xh
1655  0002 4d            	tnz	a
1656  0003 2614          	jrne	L546
1657                     ; 439         TI1_Config((uint8_t)TIM1_ICPolarity,
1657                     ; 440                    (uint8_t)TIM1_ICSelection,
1657                     ; 441                    (uint8_t)TIM1_ICFilter);
1659  0005 7b07          	ld	a,(OFST+7,sp)
1660  0007 88            	push	a
1661  0008 7b06          	ld	a,(OFST+6,sp)
1662  000a 97            	ld	xl,a
1663  000b 7b03          	ld	a,(OFST+3,sp)
1664  000d 95            	ld	xh,a
1665  000e cd0000        	call	L3_TI1_Config
1667  0011 84            	pop	a
1668                     ; 443         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1670  0012 7b06          	ld	a,(OFST+6,sp)
1671  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1674  0017 2044          	jra	L746
1675  0019               L546:
1676                     ; 445     else if (TIM1_Channel == TIM1_CHANNEL_2)
1678  0019 7b01          	ld	a,(OFST+1,sp)
1679  001b a101          	cp	a,#1
1680  001d 2614          	jrne	L156
1681                     ; 448         TI2_Config((uint8_t)TIM1_ICPolarity,
1681                     ; 449                    (uint8_t)TIM1_ICSelection,
1681                     ; 450                    (uint8_t)TIM1_ICFilter);
1683  001f 7b07          	ld	a,(OFST+7,sp)
1684  0021 88            	push	a
1685  0022 7b06          	ld	a,(OFST+6,sp)
1686  0024 97            	ld	xl,a
1687  0025 7b03          	ld	a,(OFST+3,sp)
1688  0027 95            	ld	xh,a
1689  0028 cd0000        	call	L5_TI2_Config
1691  002b 84            	pop	a
1692                     ; 452         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1694  002c 7b06          	ld	a,(OFST+6,sp)
1695  002e cd0000        	call	_TIM1_SetIC2Prescaler
1698  0031 202a          	jra	L746
1699  0033               L156:
1700                     ; 454     else if (TIM1_Channel == TIM1_CHANNEL_3)
1702  0033 a102          	cp	a,#2
1703  0035 2614          	jrne	L556
1704                     ; 457         TI3_Config((uint8_t)TIM1_ICPolarity,
1704                     ; 458                    (uint8_t)TIM1_ICSelection,
1704                     ; 459                    (uint8_t)TIM1_ICFilter);
1706  0037 7b07          	ld	a,(OFST+7,sp)
1707  0039 88            	push	a
1708  003a 7b06          	ld	a,(OFST+6,sp)
1709  003c 97            	ld	xl,a
1710  003d 7b03          	ld	a,(OFST+3,sp)
1711  003f 95            	ld	xh,a
1712  0040 cd0000        	call	L7_TI3_Config
1714  0043 84            	pop	a
1715                     ; 461         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1717  0044 7b06          	ld	a,(OFST+6,sp)
1718  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1721  0049 2012          	jra	L746
1722  004b               L556:
1723                     ; 466         TI4_Config((uint8_t)TIM1_ICPolarity,
1723                     ; 467                    (uint8_t)TIM1_ICSelection,
1723                     ; 468                    (uint8_t)TIM1_ICFilter);
1725  004b 7b07          	ld	a,(OFST+7,sp)
1726  004d 88            	push	a
1727  004e 7b06          	ld	a,(OFST+6,sp)
1728  0050 97            	ld	xl,a
1729  0051 7b03          	ld	a,(OFST+3,sp)
1730  0053 95            	ld	xh,a
1731  0054 cd0000        	call	L11_TI4_Config
1733  0057 84            	pop	a
1734                     ; 470         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1736  0058 7b06          	ld	a,(OFST+6,sp)
1737  005a cd0000        	call	_TIM1_SetIC4Prescaler
1739  005d               L746:
1740                     ; 473 }
1743  005d 85            	popw	x
1744  005e 81            	ret	
1834                     ; 489 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1834                     ; 490                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1834                     ; 491                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1834                     ; 492                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1834                     ; 493                      uint8_t TIM1_ICFilter)
1834                     ; 494 {
1835                     .text:	section	.text,new
1836  0000               _TIM1_PWMIConfig:
1838  0000 89            	pushw	x
1839  0001 89            	pushw	x
1840       00000002      OFST:	set	2
1843                     ; 495     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1845                     ; 496     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1847                     ; 499     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1849                     ; 500     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1851                     ; 501     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1853                     ; 502     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1855                     ; 505     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1857  0002 9f            	ld	a,xl
1858  0003 4a            	dec	a
1859  0004 2702          	jreq	L127
1860                     ; 507         icpolarity = TIM1_ICPOLARITY_FALLING;
1862  0006 a601          	ld	a,#1
1864  0008               L127:
1865                     ; 511         icpolarity = TIM1_ICPOLARITY_RISING;
1867  0008 6b01          	ld	(OFST-1,sp),a
1869                     ; 515     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1871  000a 7b07          	ld	a,(OFST+5,sp)
1872  000c 4a            	dec	a
1873  000d 2604          	jrne	L527
1874                     ; 517         icselection = TIM1_ICSELECTION_INDIRECTTI;
1876  000f a602          	ld	a,#2
1878  0011 2002          	jra	L727
1879  0013               L527:
1880                     ; 521         icselection = TIM1_ICSELECTION_DIRECTTI;
1882  0013 a601          	ld	a,#1
1883  0015               L727:
1884  0015 6b02          	ld	(OFST+0,sp),a
1886                     ; 524     if (TIM1_Channel == TIM1_CHANNEL_1)
1888  0017 7b03          	ld	a,(OFST+1,sp)
1889  0019 2626          	jrne	L137
1890                     ; 527         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1890                     ; 528                    (uint8_t)TIM1_ICFilter);
1892  001b 7b09          	ld	a,(OFST+7,sp)
1893  001d 88            	push	a
1894  001e 7b08          	ld	a,(OFST+6,sp)
1895  0020 97            	ld	xl,a
1896  0021 7b05          	ld	a,(OFST+3,sp)
1897  0023 95            	ld	xh,a
1898  0024 cd0000        	call	L3_TI1_Config
1900  0027 84            	pop	a
1901                     ; 531         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1903  0028 7b08          	ld	a,(OFST+6,sp)
1904  002a cd0000        	call	_TIM1_SetIC1Prescaler
1906                     ; 534         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1908  002d 7b09          	ld	a,(OFST+7,sp)
1909  002f 88            	push	a
1910  0030 7b03          	ld	a,(OFST+1,sp)
1911  0032 97            	ld	xl,a
1912  0033 7b02          	ld	a,(OFST+0,sp)
1913  0035 95            	ld	xh,a
1914  0036 cd0000        	call	L5_TI2_Config
1916  0039 84            	pop	a
1917                     ; 537         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1919  003a 7b08          	ld	a,(OFST+6,sp)
1920  003c cd0000        	call	_TIM1_SetIC2Prescaler
1923  003f 2024          	jra	L337
1924  0041               L137:
1925                     ; 542         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1925                     ; 543                    (uint8_t)TIM1_ICFilter);
1927  0041 7b09          	ld	a,(OFST+7,sp)
1928  0043 88            	push	a
1929  0044 7b08          	ld	a,(OFST+6,sp)
1930  0046 97            	ld	xl,a
1931  0047 7b05          	ld	a,(OFST+3,sp)
1932  0049 95            	ld	xh,a
1933  004a cd0000        	call	L5_TI2_Config
1935  004d 84            	pop	a
1936                     ; 546         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1938  004e 7b08          	ld	a,(OFST+6,sp)
1939  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1941                     ; 549         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1943  0053 7b09          	ld	a,(OFST+7,sp)
1944  0055 88            	push	a
1945  0056 7b03          	ld	a,(OFST+1,sp)
1946  0058 97            	ld	xl,a
1947  0059 7b02          	ld	a,(OFST+0,sp)
1948  005b 95            	ld	xh,a
1949  005c cd0000        	call	L3_TI1_Config
1951  005f 84            	pop	a
1952                     ; 552         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1954  0060 7b08          	ld	a,(OFST+6,sp)
1955  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1957  0065               L337:
1958                     ; 554 }
1961  0065 5b04          	addw	sp,#4
1962  0067 81            	ret	
2017                     ; 562 void TIM1_Cmd(FunctionalState NewState)
2017                     ; 563 {
2018                     .text:	section	.text,new
2019  0000               _TIM1_Cmd:
2023                     ; 565     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2025                     ; 568     if (NewState != DISABLE)
2027  0000 4d            	tnz	a
2028  0001 2705          	jreq	L367
2029                     ; 570         TIM1->CR1 |= TIM1_CR1_CEN;
2031  0003 72105250      	bset	21072,#0
2034  0007 81            	ret	
2035  0008               L367:
2036                     ; 574         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2038  0008 72115250      	bres	21072,#0
2039                     ; 576 }
2042  000c 81            	ret	
2078                     ; 584 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2078                     ; 585 {
2079                     .text:	section	.text,new
2080  0000               _TIM1_CtrlPWMOutputs:
2084                     ; 587     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2086                     ; 591     if (NewState != DISABLE)
2088  0000 4d            	tnz	a
2089  0001 2705          	jreq	L5001
2090                     ; 593         TIM1->BKR |= TIM1_BKR_MOE;
2092  0003 721e526d      	bset	21101,#7
2095  0007 81            	ret	
2096  0008               L5001:
2097                     ; 597         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2099  0008 721f526d      	bres	21101,#7
2100                     ; 599 }
2103  000c 81            	ret	
2210                     ; 618 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2210                     ; 619 {
2211                     .text:	section	.text,new
2212  0000               _TIM1_ITConfig:
2214  0000 89            	pushw	x
2215       00000000      OFST:	set	0
2218                     ; 621     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2220                     ; 622     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2222                     ; 624     if (NewState != DISABLE)
2224  0001 9f            	ld	a,xl
2225  0002 4d            	tnz	a
2226  0003 2706          	jreq	L7501
2227                     ; 627         TIM1->IER |= (uint8_t)TIM1_IT;
2229  0005 9e            	ld	a,xh
2230  0006 ca5254        	or	a,21076
2232  0009 2006          	jra	L1601
2233  000b               L7501:
2234                     ; 632         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2236  000b 7b01          	ld	a,(OFST+1,sp)
2237  000d 43            	cpl	a
2238  000e c45254        	and	a,21076
2239  0011               L1601:
2240  0011 c75254        	ld	21076,a
2241                     ; 634 }
2244  0014 85            	popw	x
2245  0015 81            	ret	
2269                     ; 641 void TIM1_InternalClockConfig(void)
2269                     ; 642 {
2270                     .text:	section	.text,new
2271  0000               _TIM1_InternalClockConfig:
2275                     ; 644     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2277  0000 c65252        	ld	a,21074
2278  0003 a4f8          	and	a,#248
2279  0005 c75252        	ld	21074,a
2280                     ; 645 }
2283  0008 81            	ret	
2398                     ; 663 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2398                     ; 664                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2398                     ; 665                               uint8_t ExtTRGFilter)
2398                     ; 666 {
2399                     .text:	section	.text,new
2400  0000               _TIM1_ETRClockMode1Config:
2402  0000 89            	pushw	x
2403       00000000      OFST:	set	0
2406                     ; 668     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2408                     ; 669     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2410                     ; 672     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2412  0001 7b05          	ld	a,(OFST+5,sp)
2413  0003 88            	push	a
2414  0004 7b02          	ld	a,(OFST+2,sp)
2415  0006 95            	ld	xh,a
2416  0007 cd0000        	call	_TIM1_ETRConfig
2418  000a 84            	pop	a
2419                     ; 675     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2419                     ; 676                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2421  000b c65252        	ld	a,21074
2422  000e aa77          	or	a,#119
2423  0010 c75252        	ld	21074,a
2424                     ; 677 }
2427  0013 85            	popw	x
2428  0014 81            	ret	
2484                     ; 695 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2484                     ; 696                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2484                     ; 697                               uint8_t ExtTRGFilter)
2484                     ; 698 {
2485                     .text:	section	.text,new
2486  0000               _TIM1_ETRClockMode2Config:
2488  0000 89            	pushw	x
2489       00000000      OFST:	set	0
2492                     ; 700     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2494                     ; 701     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2496                     ; 704     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2498  0001 7b05          	ld	a,(OFST+5,sp)
2499  0003 88            	push	a
2500  0004 7b02          	ld	a,(OFST+2,sp)
2501  0006 95            	ld	xh,a
2502  0007 cd0000        	call	_TIM1_ETRConfig
2504  000a 721c5253      	bset	21075,#6
2505  000e 84            	pop	a
2506                     ; 707     TIM1->ETR |= TIM1_ETR_ECE;
2508                     ; 708 }
2511  000f 85            	popw	x
2512  0010 81            	ret	
2566                     ; 726 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2566                     ; 727                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2566                     ; 728                     uint8_t ExtTRGFilter)
2566                     ; 729 {
2567                     .text:	section	.text,new
2568  0000               _TIM1_ETRConfig:
2570  0000 89            	pushw	x
2571       00000000      OFST:	set	0
2574                     ; 731     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2576                     ; 733     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2576                     ; 734                       (uint8_t)ExtTRGFilter );
2578  0001 9f            	ld	a,xl
2579  0002 1a01          	or	a,(OFST+1,sp)
2580  0004 1a05          	or	a,(OFST+5,sp)
2581  0006 ca5253        	or	a,21075
2582  0009 c75253        	ld	21075,a
2583                     ; 735 }
2586  000c 85            	popw	x
2587  000d 81            	ret	
2674                     ; 752 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2674                     ; 753                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2674                     ; 754                                  uint8_t ICFilter)
2674                     ; 755 {
2675                     .text:	section	.text,new
2676  0000               _TIM1_TIxExternalClockConfig:
2678  0000 89            	pushw	x
2679       00000000      OFST:	set	0
2682                     ; 757     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2684                     ; 758     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2686                     ; 759     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2688                     ; 762     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2690  0001 9e            	ld	a,xh
2691  0002 a160          	cp	a,#96
2692  0004 260d          	jrne	L1521
2693                     ; 764         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2695  0006 7b05          	ld	a,(OFST+5,sp)
2696  0008 88            	push	a
2697  0009 9f            	ld	a,xl
2698  000a ae0001        	ldw	x,#1
2699  000d 95            	ld	xh,a
2700  000e cd0000        	call	L5_TI2_Config
2703  0011 200c          	jra	L3521
2704  0013               L1521:
2705                     ; 768         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2707  0013 7b05          	ld	a,(OFST+5,sp)
2708  0015 88            	push	a
2709  0016 7b03          	ld	a,(OFST+3,sp)
2710  0018 ae0001        	ldw	x,#1
2711  001b 95            	ld	xh,a
2712  001c cd0000        	call	L3_TI1_Config
2714  001f               L3521:
2715  001f 84            	pop	a
2716                     ; 772     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2718  0020 7b01          	ld	a,(OFST+1,sp)
2719  0022 cd0000        	call	_TIM1_SelectInputTrigger
2721                     ; 775     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2723  0025 c65252        	ld	a,21074
2724  0028 aa07          	or	a,#7
2725  002a c75252        	ld	21074,a
2726                     ; 776 }
2729  002d 85            	popw	x
2730  002e 81            	ret	
2815                     ; 788 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2815                     ; 789 {
2816                     .text:	section	.text,new
2817  0000               _TIM1_SelectInputTrigger:
2819  0000 88            	push	a
2820       00000000      OFST:	set	0
2823                     ; 791     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2825                     ; 794     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2827  0001 c65252        	ld	a,21074
2828  0004 a48f          	and	a,#143
2829  0006 1a01          	or	a,(OFST+1,sp)
2830  0008 c75252        	ld	21074,a
2831                     ; 795 }
2834  000b 84            	pop	a
2835  000c 81            	ret	
2871                     ; 805 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2871                     ; 806 {
2872                     .text:	section	.text,new
2873  0000               _TIM1_UpdateDisableConfig:
2877                     ; 808     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2879                     ; 811     if (NewState != DISABLE)
2881  0000 4d            	tnz	a
2882  0001 2705          	jreq	L1331
2883                     ; 813         TIM1->CR1 |= TIM1_CR1_UDIS;
2885  0003 72125250      	bset	21072,#1
2888  0007 81            	ret	
2889  0008               L1331:
2890                     ; 817         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2892  0008 72135250      	bres	21072,#1
2893                     ; 819 }
2896  000c 81            	ret	
2954                     ; 829 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2954                     ; 830 {
2955                     .text:	section	.text,new
2956  0000               _TIM1_UpdateRequestConfig:
2960                     ; 832     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2962                     ; 835     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2964  0000 4d            	tnz	a
2965  0001 2705          	jreq	L3631
2966                     ; 837         TIM1->CR1 |= TIM1_CR1_URS;
2968  0003 72145250      	bset	21072,#2
2971  0007 81            	ret	
2972  0008               L3631:
2973                     ; 841         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2975  0008 72155250      	bres	21072,#2
2976                     ; 843 }
2979  000c 81            	ret	
3015                     ; 852 void TIM1_SelectHallSensor(FunctionalState NewState)
3015                     ; 853 {
3016                     .text:	section	.text,new
3017  0000               _TIM1_SelectHallSensor:
3021                     ; 855     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3023                     ; 858     if (NewState != DISABLE)
3025  0000 4d            	tnz	a
3026  0001 2705          	jreq	L5041
3027                     ; 860         TIM1->CR2 |= TIM1_CR2_TI1S;
3029  0003 721e5251      	bset	21073,#7
3032  0007 81            	ret	
3033  0008               L5041:
3034                     ; 864         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3036  0008 721f5251      	bres	21073,#7
3037                     ; 866 }
3040  000c 81            	ret	
3097                     ; 877 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3097                     ; 878 {
3098                     .text:	section	.text,new
3099  0000               _TIM1_SelectOnePulseMode:
3103                     ; 880     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3105                     ; 883     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3107  0000 4d            	tnz	a
3108  0001 2705          	jreq	L7341
3109                     ; 885         TIM1->CR1 |= TIM1_CR1_OPM;
3111  0003 72165250      	bset	21072,#3
3114  0007 81            	ret	
3115  0008               L7341:
3116                     ; 889         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3118  0008 72175250      	bres	21072,#3
3119                     ; 892 }
3122  000c 81            	ret	
3220                     ; 908 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3220                     ; 909 {
3221                     .text:	section	.text,new
3222  0000               _TIM1_SelectOutputTrigger:
3224  0000 88            	push	a
3225       00000000      OFST:	set	0
3228                     ; 911     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3230                     ; 914     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3230                     ; 915                           (uint8_t) TIM1_TRGOSource);
3232  0001 c65251        	ld	a,21073
3233  0004 a48f          	and	a,#143
3234  0006 1a01          	or	a,(OFST+1,sp)
3235  0008 c75251        	ld	21073,a
3236                     ; 916 }
3239  000b 84            	pop	a
3240  000c 81            	ret	
3314                     ; 928 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3314                     ; 929 {
3315                     .text:	section	.text,new
3316  0000               _TIM1_SelectSlaveMode:
3318  0000 88            	push	a
3319       00000000      OFST:	set	0
3322                     ; 932     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3324                     ; 935     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3324                     ; 936                            (uint8_t)TIM1_SlaveMode);
3326  0001 c65252        	ld	a,21074
3327  0004 a4f8          	and	a,#248
3328  0006 1a01          	or	a,(OFST+1,sp)
3329  0008 c75252        	ld	21074,a
3330                     ; 938 }
3333  000b 84            	pop	a
3334  000c 81            	ret	
3370                     ; 946 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3370                     ; 947 {
3371                     .text:	section	.text,new
3372  0000               _TIM1_SelectMasterSlaveMode:
3376                     ; 949     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3378                     ; 952     if (NewState != DISABLE)
3380  0000 4d            	tnz	a
3381  0001 2705          	jreq	L3551
3382                     ; 954         TIM1->SMCR |= TIM1_SMCR_MSM;
3384  0003 721e5252      	bset	21074,#7
3387  0007 81            	ret	
3388  0008               L3551:
3389                     ; 958         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3391  0008 721f5252      	bres	21074,#7
3392                     ; 960 }
3395  000c 81            	ret	
3481                     ; 982 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3481                     ; 983                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3481                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3481                     ; 985 {
3482                     .text:	section	.text,new
3483  0000               _TIM1_EncoderInterfaceConfig:
3485  0000 89            	pushw	x
3486       00000000      OFST:	set	0
3489                     ; 989     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3491                     ; 990     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3493                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3495                     ; 994     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3497  0001 9f            	ld	a,xl
3498  0002 4d            	tnz	a
3499  0003 2706          	jreq	L7161
3500                     ; 996         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3502  0005 7212525c      	bset	21084,#1
3504  0009 2004          	jra	L1261
3505  000b               L7161:
3506                     ; 1000         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3508  000b 7213525c      	bres	21084,#1
3509  000f               L1261:
3510                     ; 1003     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3512  000f 7b05          	ld	a,(OFST+5,sp)
3513  0011 2706          	jreq	L3261
3514                     ; 1005         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3516  0013 721a525c      	bset	21084,#5
3518  0017 2004          	jra	L5261
3519  0019               L3261:
3520                     ; 1009         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3522  0019 721b525c      	bres	21084,#5
3523  001d               L5261:
3524                     ; 1012     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3524                     ; 1013                            | (uint8_t) TIM1_EncoderMode);
3526  001d c65252        	ld	a,21074
3527  0020 a4f0          	and	a,#240
3528  0022 1a01          	or	a,(OFST+1,sp)
3529  0024 c75252        	ld	21074,a
3530                     ; 1016     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3530                     ; 1017                             | (uint8_t) CCMR_TIxDirect_Set);
3532  0027 c65258        	ld	a,21080
3533  002a a4fc          	and	a,#252
3534  002c aa01          	or	a,#1
3535  002e c75258        	ld	21080,a
3536                     ; 1018     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3536                     ; 1019                             | (uint8_t) CCMR_TIxDirect_Set);
3538  0031 c65259        	ld	a,21081
3539  0034 a4fc          	and	a,#252
3540  0036 aa01          	or	a,#1
3541  0038 c75259        	ld	21081,a
3542                     ; 1021 }
3545  003b 85            	popw	x
3546  003c 81            	ret	
3611                     ; 1034 void TIM1_PrescalerConfig(uint16_t Prescaler,
3611                     ; 1035                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3611                     ; 1036 {
3612                     .text:	section	.text,new
3613  0000               _TIM1_PrescalerConfig:
3615  0000 89            	pushw	x
3616       00000000      OFST:	set	0
3619                     ; 1038     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3621                     ; 1041     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3623  0001 9e            	ld	a,xh
3624  0002 c75260        	ld	21088,a
3625                     ; 1042     TIM1->PSCRL = (uint8_t)(Prescaler);
3627  0005 9f            	ld	a,xl
3628  0006 c75261        	ld	21089,a
3629                     ; 1045     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3631  0009 7b05          	ld	a,(OFST+5,sp)
3632  000b c75257        	ld	21079,a
3633                     ; 1047 }
3636  000e 85            	popw	x
3637  000f 81            	ret	
3673                     ; 1060 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3673                     ; 1061 {
3674                     .text:	section	.text,new
3675  0000               _TIM1_CounterModeConfig:
3677  0000 88            	push	a
3678       00000000      OFST:	set	0
3681                     ; 1063     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3683                     ; 1067     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3683                     ; 1068                           | (uint8_t)TIM1_CounterMode);
3685  0001 c65250        	ld	a,21072
3686  0004 a48f          	and	a,#143
3687  0006 1a01          	or	a,(OFST+1,sp)
3688  0008 c75250        	ld	21072,a
3689                     ; 1069 }
3692  000b 84            	pop	a
3693  000c 81            	ret	
3751                     ; 1080 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3751                     ; 1081 {
3752                     .text:	section	.text,new
3753  0000               _TIM1_ForcedOC1Config:
3755  0000 88            	push	a
3756       00000000      OFST:	set	0
3759                     ; 1083     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3761                     ; 1086     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3761                     ; 1087                              (uint8_t)TIM1_ForcedAction);
3763  0001 c65258        	ld	a,21080
3764  0004 a48f          	and	a,#143
3765  0006 1a01          	or	a,(OFST+1,sp)
3766  0008 c75258        	ld	21080,a
3767                     ; 1088 }
3770  000b 84            	pop	a
3771  000c 81            	ret	
3807                     ; 1099 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3807                     ; 1100 {
3808                     .text:	section	.text,new
3809  0000               _TIM1_ForcedOC2Config:
3811  0000 88            	push	a
3812       00000000      OFST:	set	0
3815                     ; 1102     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3817                     ; 1105     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3817                     ; 1106                               | (uint8_t)TIM1_ForcedAction);
3819  0001 c65259        	ld	a,21081
3820  0004 a48f          	and	a,#143
3821  0006 1a01          	or	a,(OFST+1,sp)
3822  0008 c75259        	ld	21081,a
3823                     ; 1107 }
3826  000b 84            	pop	a
3827  000c 81            	ret	
3863                     ; 1119 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3863                     ; 1120 {
3864                     .text:	section	.text,new
3865  0000               _TIM1_ForcedOC3Config:
3867  0000 88            	push	a
3868       00000000      OFST:	set	0
3871                     ; 1122     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3873                     ; 1125     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3873                     ; 1126                               | (uint8_t)TIM1_ForcedAction);
3875  0001 c6525a        	ld	a,21082
3876  0004 a48f          	and	a,#143
3877  0006 1a01          	or	a,(OFST+1,sp)
3878  0008 c7525a        	ld	21082,a
3879                     ; 1127 }
3882  000b 84            	pop	a
3883  000c 81            	ret	
3919                     ; 1139 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3919                     ; 1140 {
3920                     .text:	section	.text,new
3921  0000               _TIM1_ForcedOC4Config:
3923  0000 88            	push	a
3924       00000000      OFST:	set	0
3927                     ; 1142     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3929                     ; 1145     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3929                     ; 1146                               | (uint8_t)TIM1_ForcedAction);
3931  0001 c6525b        	ld	a,21083
3932  0004 a48f          	and	a,#143
3933  0006 1a01          	or	a,(OFST+1,sp)
3934  0008 c7525b        	ld	21083,a
3935                     ; 1147 }
3938  000b 84            	pop	a
3939  000c 81            	ret	
3975                     ; 1156 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3975                     ; 1157 {
3976                     .text:	section	.text,new
3977  0000               _TIM1_ARRPreloadConfig:
3981                     ; 1159     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3983                     ; 1162     if (NewState != DISABLE)
3985  0000 4d            	tnz	a
3986  0001 2705          	jreq	L3102
3987                     ; 1164         TIM1->CR1 |= TIM1_CR1_ARPE;
3989  0003 721e5250      	bset	21072,#7
3992  0007 81            	ret	
3993  0008               L3102:
3994                     ; 1168         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3996  0008 721f5250      	bres	21072,#7
3997                     ; 1170 }
4000  000c 81            	ret	
4035                     ; 1179 void TIM1_SelectCOM(FunctionalState NewState)
4035                     ; 1180 {
4036                     .text:	section	.text,new
4037  0000               _TIM1_SelectCOM:
4041                     ; 1182     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4043                     ; 1185     if (NewState != DISABLE)
4045  0000 4d            	tnz	a
4046  0001 2705          	jreq	L5302
4047                     ; 1187         TIM1->CR2 |= TIM1_CR2_COMS;
4049  0003 72145251      	bset	21073,#2
4052  0007 81            	ret	
4053  0008               L5302:
4054                     ; 1191         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4056  0008 72155251      	bres	21073,#2
4057                     ; 1193 }
4060  000c 81            	ret	
4096                     ; 1201 void TIM1_CCPreloadControl(FunctionalState NewState)
4096                     ; 1202 {
4097                     .text:	section	.text,new
4098  0000               _TIM1_CCPreloadControl:
4102                     ; 1204     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4104                     ; 1207     if (NewState != DISABLE)
4106  0000 4d            	tnz	a
4107  0001 2705          	jreq	L7502
4108                     ; 1209         TIM1->CR2 |= TIM1_CR2_CCPC;
4110  0003 72105251      	bset	21073,#0
4113  0007 81            	ret	
4114  0008               L7502:
4115                     ; 1213         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4117  0008 72115251      	bres	21073,#0
4118                     ; 1215 }
4121  000c 81            	ret	
4157                     ; 1224 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4157                     ; 1225 {
4158                     .text:	section	.text,new
4159  0000               _TIM1_OC1PreloadConfig:
4163                     ; 1227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4165                     ; 1230     if (NewState != DISABLE)
4167  0000 4d            	tnz	a
4168  0001 2705          	jreq	L1012
4169                     ; 1232         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4171  0003 72165258      	bset	21080,#3
4174  0007 81            	ret	
4175  0008               L1012:
4176                     ; 1236         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4178  0008 72175258      	bres	21080,#3
4179                     ; 1238 }
4182  000c 81            	ret	
4218                     ; 1247 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4218                     ; 1248 {
4219                     .text:	section	.text,new
4220  0000               _TIM1_OC2PreloadConfig:
4224                     ; 1250     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4226                     ; 1253     if (NewState != DISABLE)
4228  0000 4d            	tnz	a
4229  0001 2705          	jreq	L3212
4230                     ; 1255         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4232  0003 72165259      	bset	21081,#3
4235  0007 81            	ret	
4236  0008               L3212:
4237                     ; 1259         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4239  0008 72175259      	bres	21081,#3
4240                     ; 1261 }
4243  000c 81            	ret	
4279                     ; 1270 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4279                     ; 1271 {
4280                     .text:	section	.text,new
4281  0000               _TIM1_OC3PreloadConfig:
4285                     ; 1273     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4287                     ; 1276     if (NewState != DISABLE)
4289  0000 4d            	tnz	a
4290  0001 2705          	jreq	L5412
4291                     ; 1278         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4293  0003 7216525a      	bset	21082,#3
4296  0007 81            	ret	
4297  0008               L5412:
4298                     ; 1282         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4300  0008 7217525a      	bres	21082,#3
4301                     ; 1284 }
4304  000c 81            	ret	
4340                     ; 1294 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4340                     ; 1295 {
4341                     .text:	section	.text,new
4342  0000               _TIM1_OC4PreloadConfig:
4346                     ; 1297     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4348                     ; 1300     if (NewState != DISABLE)
4350  0000 4d            	tnz	a
4351  0001 2705          	jreq	L7612
4352                     ; 1302         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4354  0003 7216525b      	bset	21083,#3
4357  0007 81            	ret	
4358  0008               L7612:
4359                     ; 1306         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4361  0008 7217525b      	bres	21083,#3
4362                     ; 1308 }
4365  000c 81            	ret	
4400                     ; 1316 void TIM1_OC1FastConfig(FunctionalState NewState)
4400                     ; 1317 {
4401                     .text:	section	.text,new
4402  0000               _TIM1_OC1FastConfig:
4406                     ; 1319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4408                     ; 1322     if (NewState != DISABLE)
4410  0000 4d            	tnz	a
4411  0001 2705          	jreq	L1122
4412                     ; 1324         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4414  0003 72145258      	bset	21080,#2
4417  0007 81            	ret	
4418  0008               L1122:
4419                     ; 1328         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4421  0008 72155258      	bres	21080,#2
4422                     ; 1330 }
4425  000c 81            	ret	
4460                     ; 1340 void TIM1_OC2FastConfig(FunctionalState NewState)
4460                     ; 1341 {
4461                     .text:	section	.text,new
4462  0000               _TIM1_OC2FastConfig:
4466                     ; 1343     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4468                     ; 1346     if (NewState != DISABLE)
4470  0000 4d            	tnz	a
4471  0001 2705          	jreq	L3322
4472                     ; 1348         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4474  0003 72145259      	bset	21081,#2
4477  0007 81            	ret	
4478  0008               L3322:
4479                     ; 1352         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4481  0008 72155259      	bres	21081,#2
4482                     ; 1354 }
4485  000c 81            	ret	
4520                     ; 1363 void TIM1_OC3FastConfig(FunctionalState NewState)
4520                     ; 1364 {
4521                     .text:	section	.text,new
4522  0000               _TIM1_OC3FastConfig:
4526                     ; 1366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4528                     ; 1369     if (NewState != DISABLE)
4530  0000 4d            	tnz	a
4531  0001 2705          	jreq	L5522
4532                     ; 1371         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4534  0003 7214525a      	bset	21082,#2
4537  0007 81            	ret	
4538  0008               L5522:
4539                     ; 1375         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4541  0008 7215525a      	bres	21082,#2
4542                     ; 1377 }
4545  000c 81            	ret	
4580                     ; 1386 void TIM1_OC4FastConfig(FunctionalState NewState)
4580                     ; 1387 {
4581                     .text:	section	.text,new
4582  0000               _TIM1_OC4FastConfig:
4586                     ; 1389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4588                     ; 1392     if (NewState != DISABLE)
4590  0000 4d            	tnz	a
4591  0001 2705          	jreq	L7722
4592                     ; 1394         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4594  0003 7214525b      	bset	21083,#2
4597  0007 81            	ret	
4598  0008               L7722:
4599                     ; 1398         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4601  0008 7215525b      	bres	21083,#2
4602                     ; 1400 }
4605  000c 81            	ret	
4710                     ; 1417 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4710                     ; 1418 {
4711                     .text:	section	.text,new
4712  0000               _TIM1_GenerateEvent:
4716                     ; 1420     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4718                     ; 1423     TIM1->EGR = (uint8_t)TIM1_EventSource;
4720  0000 c75257        	ld	21079,a
4721                     ; 1424 }
4724  0003 81            	ret	
4760                     ; 1435 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4760                     ; 1436 {
4761                     .text:	section	.text,new
4762  0000               _TIM1_OC1PolarityConfig:
4766                     ; 1438     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4768                     ; 1441     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4770  0000 4d            	tnz	a
4771  0001 2705          	jreq	L3632
4772                     ; 1443         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4774  0003 7212525c      	bset	21084,#1
4777  0007 81            	ret	
4778  0008               L3632:
4779                     ; 1447         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4781  0008 7213525c      	bres	21084,#1
4782                     ; 1449 }
4785  000c 81            	ret	
4821                     ; 1460 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4821                     ; 1461 {
4822                     .text:	section	.text,new
4823  0000               _TIM1_OC1NPolarityConfig:
4827                     ; 1463     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4829                     ; 1466     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4831  0000 4d            	tnz	a
4832  0001 2705          	jreq	L5042
4833                     ; 1468         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4835  0003 7216525c      	bset	21084,#3
4838  0007 81            	ret	
4839  0008               L5042:
4840                     ; 1472         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4842  0008 7217525c      	bres	21084,#3
4843                     ; 1474 }
4846  000c 81            	ret	
4882                     ; 1485 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4882                     ; 1486 {
4883                     .text:	section	.text,new
4884  0000               _TIM1_OC2PolarityConfig:
4888                     ; 1488     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4890                     ; 1491     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4892  0000 4d            	tnz	a
4893  0001 2705          	jreq	L7242
4894                     ; 1493         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4896  0003 721a525c      	bset	21084,#5
4899  0007 81            	ret	
4900  0008               L7242:
4901                     ; 1497         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4903  0008 721b525c      	bres	21084,#5
4904                     ; 1499 }
4907  000c 81            	ret	
4943                     ; 1509 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4943                     ; 1510 {
4944                     .text:	section	.text,new
4945  0000               _TIM1_OC2NPolarityConfig:
4949                     ; 1512     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4951                     ; 1515     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4953  0000 4d            	tnz	a
4954  0001 2705          	jreq	L1542
4955                     ; 1517         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4957  0003 721e525c      	bset	21084,#7
4960  0007 81            	ret	
4961  0008               L1542:
4962                     ; 1521         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4964  0008 721f525c      	bres	21084,#7
4965                     ; 1523 }
4968  000c 81            	ret	
5004                     ; 1534 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5004                     ; 1535 {
5005                     .text:	section	.text,new
5006  0000               _TIM1_OC3PolarityConfig:
5010                     ; 1537     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5012                     ; 1540     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5014  0000 4d            	tnz	a
5015  0001 2705          	jreq	L3742
5016                     ; 1542         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5018  0003 7212525d      	bset	21085,#1
5021  0007 81            	ret	
5022  0008               L3742:
5023                     ; 1546         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5025  0008 7213525d      	bres	21085,#1
5026                     ; 1548 }
5029  000c 81            	ret	
5065                     ; 1559 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5065                     ; 1560 {
5066                     .text:	section	.text,new
5067  0000               _TIM1_OC3NPolarityConfig:
5071                     ; 1562     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5073                     ; 1565     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5075  0000 4d            	tnz	a
5076  0001 2705          	jreq	L5152
5077                     ; 1567         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5079  0003 7216525d      	bset	21085,#3
5082  0007 81            	ret	
5083  0008               L5152:
5084                     ; 1571         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5086  0008 7217525d      	bres	21085,#3
5087                     ; 1573 }
5090  000c 81            	ret	
5126                     ; 1583 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5126                     ; 1584 {
5127                     .text:	section	.text,new
5128  0000               _TIM1_OC4PolarityConfig:
5132                     ; 1586     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5134                     ; 1589     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5136  0000 4d            	tnz	a
5137  0001 2705          	jreq	L7352
5138                     ; 1591         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5140  0003 721a525d      	bset	21085,#5
5143  0007 81            	ret	
5144  0008               L7352:
5145                     ; 1595         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5147  0008 721b525d      	bres	21085,#5
5148                     ; 1597 }
5151  000c 81            	ret	
5196                     ; 1612 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5196                     ; 1613 {
5197                     .text:	section	.text,new
5198  0000               _TIM1_CCxCmd:
5200  0000 89            	pushw	x
5201       00000000      OFST:	set	0
5204                     ; 1615     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5206                     ; 1616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5208                     ; 1618     if (TIM1_Channel == TIM1_CHANNEL_1)
5210  0001 9e            	ld	a,xh
5211  0002 4d            	tnz	a
5212  0003 2610          	jrne	L5652
5213                     ; 1621         if (NewState != DISABLE)
5215  0005 9f            	ld	a,xl
5216  0006 4d            	tnz	a
5217  0007 2706          	jreq	L7652
5218                     ; 1623             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5220  0009 7210525c      	bset	21084,#0
5222  000d 203e          	jra	L3752
5223  000f               L7652:
5224                     ; 1627             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5226  000f 7211525c      	bres	21084,#0
5227  0013 2038          	jra	L3752
5228  0015               L5652:
5229                     ; 1631     else if (TIM1_Channel == TIM1_CHANNEL_2)
5231  0015 7b01          	ld	a,(OFST+1,sp)
5232  0017 a101          	cp	a,#1
5233  0019 2610          	jrne	L5752
5234                     ; 1634         if (NewState != DISABLE)
5236  001b 7b02          	ld	a,(OFST+2,sp)
5237  001d 2706          	jreq	L7752
5238                     ; 1636             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5240  001f 7218525c      	bset	21084,#4
5242  0023 2028          	jra	L3752
5243  0025               L7752:
5244                     ; 1640             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5246  0025 7219525c      	bres	21084,#4
5247  0029 2022          	jra	L3752
5248  002b               L5752:
5249                     ; 1643     else if (TIM1_Channel == TIM1_CHANNEL_3)
5251  002b a102          	cp	a,#2
5252  002d 2610          	jrne	L5062
5253                     ; 1646         if (NewState != DISABLE)
5255  002f 7b02          	ld	a,(OFST+2,sp)
5256  0031 2706          	jreq	L7062
5257                     ; 1648             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5259  0033 7210525d      	bset	21085,#0
5261  0037 2014          	jra	L3752
5262  0039               L7062:
5263                     ; 1652             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5265  0039 7211525d      	bres	21085,#0
5266  003d 200e          	jra	L3752
5267  003f               L5062:
5268                     ; 1658         if (NewState != DISABLE)
5270  003f 7b02          	ld	a,(OFST+2,sp)
5271  0041 2706          	jreq	L5162
5272                     ; 1660             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5274  0043 7218525d      	bset	21085,#4
5276  0047 2004          	jra	L3752
5277  0049               L5162:
5278                     ; 1664             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5280  0049 7219525d      	bres	21085,#4
5281  004d               L3752:
5282                     ; 1667 }
5285  004d 85            	popw	x
5286  004e 81            	ret	
5331                     ; 1680 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5331                     ; 1681 {
5332                     .text:	section	.text,new
5333  0000               _TIM1_CCxNCmd:
5335  0000 89            	pushw	x
5336       00000000      OFST:	set	0
5339                     ; 1683     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5341                     ; 1684     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5343                     ; 1686     if (TIM1_Channel == TIM1_CHANNEL_1)
5345  0001 9e            	ld	a,xh
5346  0002 4d            	tnz	a
5347  0003 2610          	jrne	L3462
5348                     ; 1689         if (NewState != DISABLE)
5350  0005 9f            	ld	a,xl
5351  0006 4d            	tnz	a
5352  0007 2706          	jreq	L5462
5353                     ; 1691             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5355  0009 7214525c      	bset	21084,#2
5357  000d 2029          	jra	L1562
5358  000f               L5462:
5359                     ; 1695             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5361  000f 7215525c      	bres	21084,#2
5362  0013 2023          	jra	L1562
5363  0015               L3462:
5364                     ; 1698     else if (TIM1_Channel == TIM1_CHANNEL_2)
5366  0015 7b01          	ld	a,(OFST+1,sp)
5367  0017 4a            	dec	a
5368  0018 2610          	jrne	L3562
5369                     ; 1701         if (NewState != DISABLE)
5371  001a 7b02          	ld	a,(OFST+2,sp)
5372  001c 2706          	jreq	L5562
5373                     ; 1703             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5375  001e 721c525c      	bset	21084,#6
5377  0022 2014          	jra	L1562
5378  0024               L5562:
5379                     ; 1707             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5381  0024 721d525c      	bres	21084,#6
5382  0028 200e          	jra	L1562
5383  002a               L3562:
5384                     ; 1713         if (NewState != DISABLE)
5386  002a 7b02          	ld	a,(OFST+2,sp)
5387  002c 2706          	jreq	L3662
5388                     ; 1715             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5390  002e 7214525d      	bset	21085,#2
5392  0032 2004          	jra	L1562
5393  0034               L3662:
5394                     ; 1719             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5396  0034 7215525d      	bres	21085,#2
5397  0038               L1562:
5398                     ; 1722 }
5401  0038 85            	popw	x
5402  0039 81            	ret	
5447                     ; 1746 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5447                     ; 1747 {
5448                     .text:	section	.text,new
5449  0000               _TIM1_SelectOCxM:
5451  0000 89            	pushw	x
5452       00000000      OFST:	set	0
5455                     ; 1749     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5457                     ; 1750     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5459                     ; 1752     if (TIM1_Channel == TIM1_CHANNEL_1)
5461  0001 9e            	ld	a,xh
5462  0002 4d            	tnz	a
5463  0003 2610          	jrne	L1172
5464                     ; 1755         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5466  0005 7211525c      	bres	21084,#0
5467                     ; 1758         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5467                     ; 1759                                 | (uint8_t)TIM1_OCMode);
5469  0009 c65258        	ld	a,21080
5470  000c a48f          	and	a,#143
5471  000e 1a02          	or	a,(OFST+2,sp)
5472  0010 c75258        	ld	21080,a
5474  0013 2038          	jra	L3172
5475  0015               L1172:
5476                     ; 1761     else if (TIM1_Channel == TIM1_CHANNEL_2)
5478  0015 7b01          	ld	a,(OFST+1,sp)
5479  0017 a101          	cp	a,#1
5480  0019 2610          	jrne	L5172
5481                     ; 1764         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5483  001b 7219525c      	bres	21084,#4
5484                     ; 1767         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5484                     ; 1768                                 | (uint8_t)TIM1_OCMode);
5486  001f c65259        	ld	a,21081
5487  0022 a48f          	and	a,#143
5488  0024 1a02          	or	a,(OFST+2,sp)
5489  0026 c75259        	ld	21081,a
5491  0029 2022          	jra	L3172
5492  002b               L5172:
5493                     ; 1770     else if (TIM1_Channel == TIM1_CHANNEL_3)
5495  002b a102          	cp	a,#2
5496  002d 2610          	jrne	L1272
5497                     ; 1773         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5499  002f 7211525d      	bres	21085,#0
5500                     ; 1776         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5500                     ; 1777                                 | (uint8_t)TIM1_OCMode);
5502  0033 c6525a        	ld	a,21082
5503  0036 a48f          	and	a,#143
5504  0038 1a02          	or	a,(OFST+2,sp)
5505  003a c7525a        	ld	21082,a
5507  003d 200e          	jra	L3172
5508  003f               L1272:
5509                     ; 1782         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5511  003f 7219525d      	bres	21085,#4
5512                     ; 1785         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5512                     ; 1786                                 | (uint8_t)TIM1_OCMode);
5514  0043 c6525b        	ld	a,21083
5515  0046 a48f          	and	a,#143
5516  0048 1a02          	or	a,(OFST+2,sp)
5517  004a c7525b        	ld	21083,a
5518  004d               L3172:
5519                     ; 1788 }
5522  004d 85            	popw	x
5523  004e 81            	ret	
5555                     ; 1797 void TIM1_SetCounter(uint16_t Counter)
5555                     ; 1798 {
5556                     .text:	section	.text,new
5557  0000               _TIM1_SetCounter:
5561                     ; 1800     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5563  0000 9e            	ld	a,xh
5564  0001 c7525e        	ld	21086,a
5565                     ; 1801     TIM1->CNTRL = (uint8_t)(Counter);
5567  0004 9f            	ld	a,xl
5568  0005 c7525f        	ld	21087,a
5569                     ; 1803 }
5572  0008 81            	ret	
5604                     ; 1812 void TIM1_SetAutoreload(uint16_t Autoreload)
5604                     ; 1813 {
5605                     .text:	section	.text,new
5606  0000               _TIM1_SetAutoreload:
5610                     ; 1816     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5612  0000 9e            	ld	a,xh
5613  0001 c75262        	ld	21090,a
5614                     ; 1817     TIM1->ARRL = (uint8_t)(Autoreload);
5616  0004 9f            	ld	a,xl
5617  0005 c75263        	ld	21091,a
5618                     ; 1819 }
5621  0008 81            	ret	
5653                     ; 1828 void TIM1_SetCompare1(uint16_t Compare1)
5653                     ; 1829 {
5654                     .text:	section	.text,new
5655  0000               _TIM1_SetCompare1:
5659                     ; 1831     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5661  0000 9e            	ld	a,xh
5662  0001 c75265        	ld	21093,a
5663                     ; 1832     TIM1->CCR1L = (uint8_t)(Compare1);
5665  0004 9f            	ld	a,xl
5666  0005 c75266        	ld	21094,a
5667                     ; 1834 }
5670  0008 81            	ret	
5702                     ; 1843 void TIM1_SetCompare2(uint16_t Compare2)
5702                     ; 1844 {
5703                     .text:	section	.text,new
5704  0000               _TIM1_SetCompare2:
5708                     ; 1846     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5710  0000 9e            	ld	a,xh
5711  0001 c75267        	ld	21095,a
5712                     ; 1847     TIM1->CCR2L = (uint8_t)(Compare2);
5714  0004 9f            	ld	a,xl
5715  0005 c75268        	ld	21096,a
5716                     ; 1849 }
5719  0008 81            	ret	
5751                     ; 1858 void TIM1_SetCompare3(uint16_t Compare3)
5751                     ; 1859 {
5752                     .text:	section	.text,new
5753  0000               _TIM1_SetCompare3:
5757                     ; 1861     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5759  0000 9e            	ld	a,xh
5760  0001 c75269        	ld	21097,a
5761                     ; 1862     TIM1->CCR3L = (uint8_t)(Compare3);
5763  0004 9f            	ld	a,xl
5764  0005 c7526a        	ld	21098,a
5765                     ; 1864 }
5768  0008 81            	ret	
5800                     ; 1873 void TIM1_SetCompare4(uint16_t Compare4)
5800                     ; 1874 {
5801                     .text:	section	.text,new
5802  0000               _TIM1_SetCompare4:
5806                     ; 1876     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5808  0000 9e            	ld	a,xh
5809  0001 c7526b        	ld	21099,a
5810                     ; 1877     TIM1->CCR4L = (uint8_t)(Compare4);
5812  0004 9f            	ld	a,xl
5813  0005 c7526c        	ld	21100,a
5814                     ; 1878 }
5817  0008 81            	ret	
5853                     ; 1891 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5853                     ; 1892 {
5854                     .text:	section	.text,new
5855  0000               _TIM1_SetIC1Prescaler:
5857  0000 88            	push	a
5858       00000000      OFST:	set	0
5861                     ; 1894     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5863                     ; 1897     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5863                     ; 1898                             | (uint8_t)TIM1_IC1Prescaler);
5865  0001 c65258        	ld	a,21080
5866  0004 a4f3          	and	a,#243
5867  0006 1a01          	or	a,(OFST+1,sp)
5868  0008 c75258        	ld	21080,a
5869                     ; 1900 }
5872  000b 84            	pop	a
5873  000c 81            	ret	
5909                     ; 1912 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5909                     ; 1913 {
5910                     .text:	section	.text,new
5911  0000               _TIM1_SetIC2Prescaler:
5913  0000 88            	push	a
5914       00000000      OFST:	set	0
5917                     ; 1916     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5919                     ; 1919     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5919                     ; 1920                             | (uint8_t)TIM1_IC2Prescaler);
5921  0001 c65259        	ld	a,21081
5922  0004 a4f3          	and	a,#243
5923  0006 1a01          	or	a,(OFST+1,sp)
5924  0008 c75259        	ld	21081,a
5925                     ; 1921 }
5928  000b 84            	pop	a
5929  000c 81            	ret	
5965                     ; 1934 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5965                     ; 1935 {
5966                     .text:	section	.text,new
5967  0000               _TIM1_SetIC3Prescaler:
5969  0000 88            	push	a
5970       00000000      OFST:	set	0
5973                     ; 1938     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5975                     ; 1941     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5975                     ; 1942                             (uint8_t)TIM1_IC3Prescaler);
5977  0001 c6525a        	ld	a,21082
5978  0004 a4f3          	and	a,#243
5979  0006 1a01          	or	a,(OFST+1,sp)
5980  0008 c7525a        	ld	21082,a
5981                     ; 1943 }
5984  000b 84            	pop	a
5985  000c 81            	ret	
6021                     ; 1955 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6021                     ; 1956 {
6022                     .text:	section	.text,new
6023  0000               _TIM1_SetIC4Prescaler:
6025  0000 88            	push	a
6026       00000000      OFST:	set	0
6029                     ; 1959     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6031                     ; 1962     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6031                     ; 1963                             (uint8_t)TIM1_IC4Prescaler);
6033  0001 c6525b        	ld	a,21083
6034  0004 a4f3          	and	a,#243
6035  0006 1a01          	or	a,(OFST+1,sp)
6036  0008 c7525b        	ld	21083,a
6037                     ; 1964 }
6040  000b 84            	pop	a
6041  000c 81            	ret	
6087                     ; 1971 uint16_t TIM1_GetCapture1(void)
6087                     ; 1972 {
6088                     .text:	section	.text,new
6089  0000               _TIM1_GetCapture1:
6091  0000 5204          	subw	sp,#4
6092       00000004      OFST:	set	4
6095                     ; 1975     uint16_t tmpccr1 = 0;
6097                     ; 1976     uint8_t tmpccr1l=0, tmpccr1h=0;
6101                     ; 1978     tmpccr1h = TIM1->CCR1H;
6103  0002 c65265        	ld	a,21093
6104  0005 6b02          	ld	(OFST-2,sp),a
6106                     ; 1979     tmpccr1l = TIM1->CCR1L;
6108  0007 c65266        	ld	a,21094
6109  000a 6b01          	ld	(OFST-3,sp),a
6111                     ; 1981     tmpccr1 = (uint16_t)(tmpccr1l);
6113  000c 5f            	clrw	x
6114  000d 97            	ld	xl,a
6115  000e 1f03          	ldw	(OFST-1,sp),x
6117                     ; 1982     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6119  0010 5f            	clrw	x
6120  0011 7b02          	ld	a,(OFST-2,sp)
6121  0013 97            	ld	xl,a
6122  0014 7b04          	ld	a,(OFST+0,sp)
6123  0016 01            	rrwa	x,a
6124  0017 1a03          	or	a,(OFST-1,sp)
6125  0019 01            	rrwa	x,a
6127                     ; 1984     return (uint16_t)tmpccr1;
6131  001a 5b04          	addw	sp,#4
6132  001c 81            	ret	
6178                     ; 1992 uint16_t TIM1_GetCapture2(void)
6178                     ; 1993 {
6179                     .text:	section	.text,new
6180  0000               _TIM1_GetCapture2:
6182  0000 5204          	subw	sp,#4
6183       00000004      OFST:	set	4
6186                     ; 1996     uint16_t tmpccr2 = 0;
6188                     ; 1997     uint8_t tmpccr2l=0, tmpccr2h=0;
6192                     ; 1999     tmpccr2h = TIM1->CCR2H;
6194  0002 c65267        	ld	a,21095
6195  0005 6b02          	ld	(OFST-2,sp),a
6197                     ; 2000     tmpccr2l = TIM1->CCR2L;
6199  0007 c65268        	ld	a,21096
6200  000a 6b01          	ld	(OFST-3,sp),a
6202                     ; 2002     tmpccr2 = (uint16_t)(tmpccr2l);
6204  000c 5f            	clrw	x
6205  000d 97            	ld	xl,a
6206  000e 1f03          	ldw	(OFST-1,sp),x
6208                     ; 2003     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6210  0010 5f            	clrw	x
6211  0011 7b02          	ld	a,(OFST-2,sp)
6212  0013 97            	ld	xl,a
6213  0014 7b04          	ld	a,(OFST+0,sp)
6214  0016 01            	rrwa	x,a
6215  0017 1a03          	or	a,(OFST-1,sp)
6216  0019 01            	rrwa	x,a
6218                     ; 2005     return (uint16_t)tmpccr2;
6222  001a 5b04          	addw	sp,#4
6223  001c 81            	ret	
6269                     ; 2013 uint16_t TIM1_GetCapture3(void)
6269                     ; 2014 {
6270                     .text:	section	.text,new
6271  0000               _TIM1_GetCapture3:
6273  0000 5204          	subw	sp,#4
6274       00000004      OFST:	set	4
6277                     ; 2016     uint16_t tmpccr3 = 0;
6279                     ; 2017     uint8_t tmpccr3l=0, tmpccr3h=0;
6283                     ; 2019     tmpccr3h = TIM1->CCR3H;
6285  0002 c65269        	ld	a,21097
6286  0005 6b02          	ld	(OFST-2,sp),a
6288                     ; 2020     tmpccr3l = TIM1->CCR3L;
6290  0007 c6526a        	ld	a,21098
6291  000a 6b01          	ld	(OFST-3,sp),a
6293                     ; 2022     tmpccr3 = (uint16_t)(tmpccr3l);
6295  000c 5f            	clrw	x
6296  000d 97            	ld	xl,a
6297  000e 1f03          	ldw	(OFST-1,sp),x
6299                     ; 2023     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6301  0010 5f            	clrw	x
6302  0011 7b02          	ld	a,(OFST-2,sp)
6303  0013 97            	ld	xl,a
6304  0014 7b04          	ld	a,(OFST+0,sp)
6305  0016 01            	rrwa	x,a
6306  0017 1a03          	or	a,(OFST-1,sp)
6307  0019 01            	rrwa	x,a
6309                     ; 2025     return (uint16_t)tmpccr3;
6313  001a 5b04          	addw	sp,#4
6314  001c 81            	ret	
6360                     ; 2033 uint16_t TIM1_GetCapture4(void)
6360                     ; 2034 {
6361                     .text:	section	.text,new
6362  0000               _TIM1_GetCapture4:
6364  0000 5204          	subw	sp,#4
6365       00000004      OFST:	set	4
6368                     ; 2036     uint16_t tmpccr4 = 0;
6370                     ; 2037     uint8_t tmpccr4l=0, tmpccr4h=0;
6374                     ; 2039     tmpccr4h = TIM1->CCR4H;
6376  0002 c6526b        	ld	a,21099
6377  0005 6b02          	ld	(OFST-2,sp),a
6379                     ; 2040     tmpccr4l = TIM1->CCR4L;
6381  0007 c6526c        	ld	a,21100
6382  000a 6b01          	ld	(OFST-3,sp),a
6384                     ; 2042     tmpccr4 = (uint16_t)(tmpccr4l);
6386  000c 5f            	clrw	x
6387  000d 97            	ld	xl,a
6388  000e 1f03          	ldw	(OFST-1,sp),x
6390                     ; 2043     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6392  0010 5f            	clrw	x
6393  0011 7b02          	ld	a,(OFST-2,sp)
6394  0013 97            	ld	xl,a
6395  0014 7b04          	ld	a,(OFST+0,sp)
6396  0016 01            	rrwa	x,a
6397  0017 1a03          	or	a,(OFST-1,sp)
6398  0019 01            	rrwa	x,a
6400                     ; 2045     return (uint16_t)tmpccr4;
6404  001a 5b04          	addw	sp,#4
6405  001c 81            	ret	
6437                     ; 2053 uint16_t TIM1_GetCounter(void)
6437                     ; 2054 {
6438                     .text:	section	.text,new
6439  0000               _TIM1_GetCounter:
6441  0000 89            	pushw	x
6442       00000002      OFST:	set	2
6445                     ; 2055   uint16_t tmpcntr = 0;
6447                     ; 2057   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6449  0001 c6525e        	ld	a,21086
6450  0004 97            	ld	xl,a
6451  0005 4f            	clr	a
6452  0006 02            	rlwa	x,a
6453  0007 1f01          	ldw	(OFST-1,sp),x
6455                     ; 2060     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6457  0009 c6525f        	ld	a,21087
6458  000c 5f            	clrw	x
6459  000d 97            	ld	xl,a
6460  000e 01            	rrwa	x,a
6461  000f 1a02          	or	a,(OFST+0,sp)
6462  0011 01            	rrwa	x,a
6463  0012 1a01          	or	a,(OFST-1,sp)
6464  0014 01            	rrwa	x,a
6467  0015 5b02          	addw	sp,#2
6468  0017 81            	ret	
6500                     ; 2068 uint16_t TIM1_GetPrescaler(void)
6500                     ; 2069 {
6501                     .text:	section	.text,new
6502  0000               _TIM1_GetPrescaler:
6504  0000 89            	pushw	x
6505       00000002      OFST:	set	2
6508                     ; 2070    uint16_t temp = 0;
6510                     ; 2072    temp = ((uint16_t)TIM1->PSCRH << 8);
6512  0001 c65260        	ld	a,21088
6513  0004 97            	ld	xl,a
6514  0005 4f            	clr	a
6515  0006 02            	rlwa	x,a
6516  0007 1f01          	ldw	(OFST-1,sp),x
6518                     ; 2075     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6520  0009 c65261        	ld	a,21089
6521  000c 5f            	clrw	x
6522  000d 97            	ld	xl,a
6523  000e 01            	rrwa	x,a
6524  000f 1a02          	or	a,(OFST+0,sp)
6525  0011 01            	rrwa	x,a
6526  0012 1a01          	or	a,(OFST-1,sp)
6527  0014 01            	rrwa	x,a
6530  0015 5b02          	addw	sp,#2
6531  0017 81            	ret	
6701                     ; 2096 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6701                     ; 2097 {
6702                     .text:	section	.text,new
6703  0000               _TIM1_GetFlagStatus:
6705  0000 89            	pushw	x
6706  0001 89            	pushw	x
6707       00000002      OFST:	set	2
6710                     ; 2098     FlagStatus bitstatus = RESET;
6712                     ; 2099     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6716                     ; 2102     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6718                     ; 2104     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6720  0002 9f            	ld	a,xl
6721  0003 c45255        	and	a,21077
6722  0006 6b01          	ld	(OFST-1,sp),a
6724                     ; 2105     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6726  0008 7b03          	ld	a,(OFST+1,sp)
6727  000a 6b02          	ld	(OFST+0,sp),a
6729                     ; 2107     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6731  000c c45256        	and	a,21078
6732  000f 1a01          	or	a,(OFST-1,sp)
6733  0011 2702          	jreq	L7433
6734                     ; 2109         bitstatus = SET;
6736  0013 a601          	ld	a,#1
6739  0015               L7433:
6740                     ; 2113         bitstatus = RESET;
6743                     ; 2115     return (FlagStatus)(bitstatus);
6747  0015 5b04          	addw	sp,#4
6748  0017 81            	ret	
6783                     ; 2136 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6783                     ; 2137 {
6784                     .text:	section	.text,new
6785  0000               _TIM1_ClearFlag:
6787  0000 89            	pushw	x
6788       00000000      OFST:	set	0
6791                     ; 2139     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6793                     ; 2142     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6795  0001 9f            	ld	a,xl
6796  0002 43            	cpl	a
6797  0003 c75255        	ld	21077,a
6798                     ; 2143     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6798                     ; 2144                           (uint8_t)0x1E);
6800  0006 7b01          	ld	a,(OFST+1,sp)
6801  0008 43            	cpl	a
6802  0009 a41e          	and	a,#30
6803  000b c75256        	ld	21078,a
6804                     ; 2145 }
6807  000e 85            	popw	x
6808  000f 81            	ret	
6868                     ; 2161 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6868                     ; 2162 {
6869                     .text:	section	.text,new
6870  0000               _TIM1_GetITStatus:
6872  0000 88            	push	a
6873  0001 89            	pushw	x
6874       00000002      OFST:	set	2
6877                     ; 2163     ITStatus bitstatus = RESET;
6879                     ; 2164     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6883                     ; 2167     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6885                     ; 2169     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6887  0002 c45255        	and	a,21077
6888  0005 6b01          	ld	(OFST-1,sp),a
6890                     ; 2171     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6892  0007 c65254        	ld	a,21076
6893  000a 1403          	and	a,(OFST+1,sp)
6894  000c 6b02          	ld	(OFST+0,sp),a
6896                     ; 2173     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6898  000e 7b01          	ld	a,(OFST-1,sp)
6899  0010 2708          	jreq	L7143
6901  0012 7b02          	ld	a,(OFST+0,sp)
6902  0014 2704          	jreq	L7143
6903                     ; 2175         bitstatus = SET;
6905  0016 a601          	ld	a,#1
6908  0018 2001          	jra	L1243
6909  001a               L7143:
6910                     ; 2179         bitstatus = RESET;
6912  001a 4f            	clr	a
6914  001b               L1243:
6915                     ; 2181     return (ITStatus)(bitstatus);
6919  001b 5b03          	addw	sp,#3
6920  001d 81            	ret	
6956                     ; 2198 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6956                     ; 2199 {
6957                     .text:	section	.text,new
6958  0000               _TIM1_ClearITPendingBit:
6962                     ; 2201     assert_param(IS_TIM1_IT_OK(TIM1_IT));
6964                     ; 2204     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6966  0000 43            	cpl	a
6967  0001 c75255        	ld	21077,a
6968                     ; 2205 }
6971  0004 81            	ret	
7017                     ; 2223 static void TI1_Config(uint8_t TIM1_ICPolarity,
7017                     ; 2224                        uint8_t TIM1_ICSelection,
7017                     ; 2225                        uint8_t TIM1_ICFilter)
7017                     ; 2226 {
7018                     .text:	section	.text,new
7019  0000               L3_TI1_Config:
7021  0000 89            	pushw	x
7022  0001 88            	push	a
7023       00000001      OFST:	set	1
7026                     ; 2229     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7028  0002 7211525c      	bres	21084,#0
7029                     ; 2232     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7029                     ; 2233                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7031  0006 7b06          	ld	a,(OFST+5,sp)
7032  0008 97            	ld	xl,a
7033  0009 a610          	ld	a,#16
7034  000b 42            	mul	x,a
7035  000c 9f            	ld	a,xl
7036  000d 1a03          	or	a,(OFST+2,sp)
7037  000f 6b01          	ld	(OFST+0,sp),a
7039  0011 c65258        	ld	a,21080
7040  0014 a40c          	and	a,#12
7041  0016 1a01          	or	a,(OFST+0,sp)
7042  0018 c75258        	ld	21080,a
7043                     ; 2236     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7045  001b 7b02          	ld	a,(OFST+1,sp)
7046  001d 2706          	jreq	L1643
7047                     ; 2238         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7049  001f 7212525c      	bset	21084,#1
7051  0023 2004          	jra	L3643
7052  0025               L1643:
7053                     ; 2242         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7055  0025 7213525c      	bres	21084,#1
7056  0029               L3643:
7057                     ; 2246     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7059  0029 7210525c      	bset	21084,#0
7060                     ; 2247 }
7063  002d 5b03          	addw	sp,#3
7064  002f 81            	ret	
7110                     ; 2265 static void TI2_Config(uint8_t TIM1_ICPolarity,
7110                     ; 2266                        uint8_t TIM1_ICSelection,
7110                     ; 2267                        uint8_t TIM1_ICFilter)
7110                     ; 2268 {
7111                     .text:	section	.text,new
7112  0000               L5_TI2_Config:
7114  0000 89            	pushw	x
7115  0001 88            	push	a
7116       00000001      OFST:	set	1
7119                     ; 2270     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7121  0002 7219525c      	bres	21084,#4
7122                     ; 2273     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7122                     ; 2274                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7124  0006 7b06          	ld	a,(OFST+5,sp)
7125  0008 97            	ld	xl,a
7126  0009 a610          	ld	a,#16
7127  000b 42            	mul	x,a
7128  000c 9f            	ld	a,xl
7129  000d 1a03          	or	a,(OFST+2,sp)
7130  000f 6b01          	ld	(OFST+0,sp),a
7132  0011 c65259        	ld	a,21081
7133  0014 a40c          	and	a,#12
7134  0016 1a01          	or	a,(OFST+0,sp)
7135  0018 c75259        	ld	21081,a
7136                     ; 2276     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7138  001b 7b02          	ld	a,(OFST+1,sp)
7139  001d 2706          	jreq	L5053
7140                     ; 2278         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7142  001f 721a525c      	bset	21084,#5
7144  0023 2004          	jra	L7053
7145  0025               L5053:
7146                     ; 2282         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7148  0025 721b525c      	bres	21084,#5
7149  0029               L7053:
7150                     ; 2285     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7152  0029 7218525c      	bset	21084,#4
7153                     ; 2286 }
7156  002d 5b03          	addw	sp,#3
7157  002f 81            	ret	
7203                     ; 2304 static void TI3_Config(uint8_t TIM1_ICPolarity,
7203                     ; 2305                        uint8_t TIM1_ICSelection,
7203                     ; 2306                        uint8_t TIM1_ICFilter)
7203                     ; 2307 {
7204                     .text:	section	.text,new
7205  0000               L7_TI3_Config:
7207  0000 89            	pushw	x
7208  0001 88            	push	a
7209       00000001      OFST:	set	1
7212                     ; 2309     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7214  0002 7211525d      	bres	21085,#0
7215                     ; 2312     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7215                     ; 2313                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7217  0006 7b06          	ld	a,(OFST+5,sp)
7218  0008 97            	ld	xl,a
7219  0009 a610          	ld	a,#16
7220  000b 42            	mul	x,a
7221  000c 9f            	ld	a,xl
7222  000d 1a03          	or	a,(OFST+2,sp)
7223  000f 6b01          	ld	(OFST+0,sp),a
7225  0011 c6525a        	ld	a,21082
7226  0014 a40c          	and	a,#12
7227  0016 1a01          	or	a,(OFST+0,sp)
7228  0018 c7525a        	ld	21082,a
7229                     ; 2316     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7231  001b 7b02          	ld	a,(OFST+1,sp)
7232  001d 2706          	jreq	L1353
7233                     ; 2318         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7235  001f 7212525d      	bset	21085,#1
7237  0023 2004          	jra	L3353
7238  0025               L1353:
7239                     ; 2322         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7241  0025 7213525d      	bres	21085,#1
7242  0029               L3353:
7243                     ; 2325     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7245  0029 7210525d      	bset	21085,#0
7246                     ; 2326 }
7249  002d 5b03          	addw	sp,#3
7250  002f 81            	ret	
7296                     ; 2345 static void TI4_Config(uint8_t TIM1_ICPolarity,
7296                     ; 2346                        uint8_t TIM1_ICSelection,
7296                     ; 2347                        uint8_t TIM1_ICFilter)
7296                     ; 2348 {
7297                     .text:	section	.text,new
7298  0000               L11_TI4_Config:
7300  0000 89            	pushw	x
7301  0001 88            	push	a
7302       00000001      OFST:	set	1
7305                     ; 2351     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7307  0002 7219525d      	bres	21085,#4
7308                     ; 2354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7308                     ; 2355                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7310  0006 7b06          	ld	a,(OFST+5,sp)
7311  0008 97            	ld	xl,a
7312  0009 a610          	ld	a,#16
7313  000b 42            	mul	x,a
7314  000c 9f            	ld	a,xl
7315  000d 1a03          	or	a,(OFST+2,sp)
7316  000f 6b01          	ld	(OFST+0,sp),a
7318  0011 c6525b        	ld	a,21083
7319  0014 a40c          	and	a,#12
7320  0016 1a01          	or	a,(OFST+0,sp)
7321  0018 c7525b        	ld	21083,a
7322                     ; 2358     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7324  001b 7b02          	ld	a,(OFST+1,sp)
7325  001d 2706          	jreq	L5553
7326                     ; 2360         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7328  001f 721a525d      	bset	21085,#5
7330  0023 2004          	jra	L7553
7331  0025               L5553:
7332                     ; 2364         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7334  0025 721b525d      	bres	21085,#5
7335  0029               L7553:
7336                     ; 2368     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7338  0029 7218525d      	bset	21085,#4
7339                     ; 2369 }
7342  002d 5b03          	addw	sp,#3
7343  002f 81            	ret	
7356                     	xdef	_TIM1_ClearITPendingBit
7357                     	xdef	_TIM1_GetITStatus
7358                     	xdef	_TIM1_ClearFlag
7359                     	xdef	_TIM1_GetFlagStatus
7360                     	xdef	_TIM1_GetPrescaler
7361                     	xdef	_TIM1_GetCounter
7362                     	xdef	_TIM1_GetCapture4
7363                     	xdef	_TIM1_GetCapture3
7364                     	xdef	_TIM1_GetCapture2
7365                     	xdef	_TIM1_GetCapture1
7366                     	xdef	_TIM1_SetIC4Prescaler
7367                     	xdef	_TIM1_SetIC3Prescaler
7368                     	xdef	_TIM1_SetIC2Prescaler
7369                     	xdef	_TIM1_SetIC1Prescaler
7370                     	xdef	_TIM1_SetCompare4
7371                     	xdef	_TIM1_SetCompare3
7372                     	xdef	_TIM1_SetCompare2
7373                     	xdef	_TIM1_SetCompare1
7374                     	xdef	_TIM1_SetAutoreload
7375                     	xdef	_TIM1_SetCounter
7376                     	xdef	_TIM1_SelectOCxM
7377                     	xdef	_TIM1_CCxNCmd
7378                     	xdef	_TIM1_CCxCmd
7379                     	xdef	_TIM1_OC4PolarityConfig
7380                     	xdef	_TIM1_OC3NPolarityConfig
7381                     	xdef	_TIM1_OC3PolarityConfig
7382                     	xdef	_TIM1_OC2NPolarityConfig
7383                     	xdef	_TIM1_OC2PolarityConfig
7384                     	xdef	_TIM1_OC1NPolarityConfig
7385                     	xdef	_TIM1_OC1PolarityConfig
7386                     	xdef	_TIM1_GenerateEvent
7387                     	xdef	_TIM1_OC4FastConfig
7388                     	xdef	_TIM1_OC3FastConfig
7389                     	xdef	_TIM1_OC2FastConfig
7390                     	xdef	_TIM1_OC1FastConfig
7391                     	xdef	_TIM1_OC4PreloadConfig
7392                     	xdef	_TIM1_OC3PreloadConfig
7393                     	xdef	_TIM1_OC2PreloadConfig
7394                     	xdef	_TIM1_OC1PreloadConfig
7395                     	xdef	_TIM1_CCPreloadControl
7396                     	xdef	_TIM1_SelectCOM
7397                     	xdef	_TIM1_ARRPreloadConfig
7398                     	xdef	_TIM1_ForcedOC4Config
7399                     	xdef	_TIM1_ForcedOC3Config
7400                     	xdef	_TIM1_ForcedOC2Config
7401                     	xdef	_TIM1_ForcedOC1Config
7402                     	xdef	_TIM1_CounterModeConfig
7403                     	xdef	_TIM1_PrescalerConfig
7404                     	xdef	_TIM1_EncoderInterfaceConfig
7405                     	xdef	_TIM1_SelectMasterSlaveMode
7406                     	xdef	_TIM1_SelectSlaveMode
7407                     	xdef	_TIM1_SelectOutputTrigger
7408                     	xdef	_TIM1_SelectOnePulseMode
7409                     	xdef	_TIM1_SelectHallSensor
7410                     	xdef	_TIM1_UpdateRequestConfig
7411                     	xdef	_TIM1_UpdateDisableConfig
7412                     	xdef	_TIM1_SelectInputTrigger
7413                     	xdef	_TIM1_TIxExternalClockConfig
7414                     	xdef	_TIM1_ETRConfig
7415                     	xdef	_TIM1_ETRClockMode2Config
7416                     	xdef	_TIM1_ETRClockMode1Config
7417                     	xdef	_TIM1_InternalClockConfig
7418                     	xdef	_TIM1_ITConfig
7419                     	xdef	_TIM1_CtrlPWMOutputs
7420                     	xdef	_TIM1_Cmd
7421                     	xdef	_TIM1_PWMIConfig
7422                     	xdef	_TIM1_ICInit
7423                     	xdef	_TIM1_BDTRConfig
7424                     	xdef	_TIM1_OC4Init
7425                     	xdef	_TIM1_OC3Init
7426                     	xdef	_TIM1_OC2Init
7427                     	xdef	_TIM1_OC1Init
7428                     	xdef	_TIM1_TimeBaseInit
7429                     	xdef	_TIM1_DeInit
7448                     	end
