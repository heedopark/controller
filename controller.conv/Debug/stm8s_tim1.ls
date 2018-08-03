   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  45                     ; 51 void TIM1_DeInit(void)
  45                     ; 52 {
  47                     	switch	.text
  48  0000               _TIM1_DeInit:
  52                     ; 53     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  54  0000 725f5250      	clr	21072
  55                     ; 54     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  57  0004 725f5251      	clr	21073
  58                     ; 55     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  60  0008 725f5252      	clr	21074
  61                     ; 56     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  63  000c 725f5253      	clr	21075
  64                     ; 57     TIM1->IER  = TIM1_IER_RESET_VALUE;
  66  0010 725f5254      	clr	21076
  67                     ; 58     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  69  0014 725f5256      	clr	21078
  70                     ; 60     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  72  0018 725f525c      	clr	21084
  73                     ; 61     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  75  001c 725f525d      	clr	21085
  76                     ; 63     TIM1->CCMR1 = 0x01;
  78  0020 35015258      	mov	21080,#1
  79                     ; 64     TIM1->CCMR2 = 0x01;
  81  0024 35015259      	mov	21081,#1
  82                     ; 65     TIM1->CCMR3 = 0x01;
  84  0028 3501525a      	mov	21082,#1
  85                     ; 66     TIM1->CCMR4 = 0x01;
  87  002c 3501525b      	mov	21083,#1
  88                     ; 68     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  90  0030 725f525c      	clr	21084
  91                     ; 69     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  93  0034 725f525d      	clr	21085
  94                     ; 70     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  96  0038 725f5258      	clr	21080
  97                     ; 71     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  99  003c 725f5259      	clr	21081
 100                     ; 72     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 102  0040 725f525a      	clr	21082
 103                     ; 73     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 105  0044 725f525b      	clr	21083
 106                     ; 74     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 108  0048 725f525e      	clr	21086
 109                     ; 75     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 111  004c 725f525f      	clr	21087
 112                     ; 76     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 114  0050 725f5260      	clr	21088
 115                     ; 77     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 117  0054 725f5261      	clr	21089
 118                     ; 78     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 120  0058 35ff5262      	mov	21090,#255
 121                     ; 79     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 123  005c 35ff5263      	mov	21091,#255
 124                     ; 80     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 126  0060 725f5265      	clr	21093
 127                     ; 81     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 129  0064 725f5266      	clr	21094
 130                     ; 82     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 132  0068 725f5267      	clr	21095
 133                     ; 83     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 135  006c 725f5268      	clr	21096
 136                     ; 84     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 138  0070 725f5269      	clr	21097
 139                     ; 85     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 141  0074 725f526a      	clr	21098
 142                     ; 86     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 144  0078 725f526b      	clr	21099
 145                     ; 87     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 147  007c 725f526c      	clr	21100
 148                     ; 88     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 150  0080 725f526f      	clr	21103
 151                     ; 89     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 153  0084 35015257      	mov	21079,#1
 154                     ; 90     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 156  0088 725f526e      	clr	21102
 157                     ; 91     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 159  008c 725f526d      	clr	21101
 160                     ; 92     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 162  0090 725f5264      	clr	21092
 163                     ; 93     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 165  0094 725f5255      	clr	21077
 166                     ; 94 }
 169  0098 81            	ret
 278                     ; 104 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 105                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 106                        uint16_t TIM1_Period,
 278                     ; 107                        uint8_t TIM1_RepetitionCounter)
 278                     ; 108 {
 279                     	switch	.text
 280  0099               _TIM1_TimeBaseInit:
 282  0099 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 111     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288                     ; 114     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 290  009a 7b06          	ld	a,(OFST+6,sp)
 291  009c c75262        	ld	21090,a
 292                     ; 115     TIM1->ARRL = (uint8_t)(TIM1_Period);
 294  009f 7b07          	ld	a,(OFST+7,sp)
 295  00a1 c75263        	ld	21091,a
 296                     ; 118     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 298  00a4 9e            	ld	a,xh
 299  00a5 c75260        	ld	21088,a
 300                     ; 119     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 302  00a8 9f            	ld	a,xl
 303  00a9 c75261        	ld	21089,a
 304                     ; 122     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 304                     ; 123                            | (uint8_t)(TIM1_CounterMode));
 306  00ac c65250        	ld	a,21072
 307  00af a48f          	and	a,#143
 308  00b1 1a05          	or	a,(OFST+5,sp)
 309  00b3 c75250        	ld	21072,a
 310                     ; 126     TIM1->RCR = TIM1_RepetitionCounter;
 312  00b6 7b08          	ld	a,(OFST+8,sp)
 313  00b8 c75264        	ld	21092,a
 314                     ; 128 }
 317  00bb 85            	popw	x
 318  00bc 81            	ret
 603                     ; 149 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 603                     ; 150                   TIM1_OutputState_TypeDef TIM1_OutputState,
 603                     ; 151                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 603                     ; 152                   uint16_t TIM1_Pulse,
 603                     ; 153                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 603                     ; 154                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 603                     ; 155                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 603                     ; 156                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 603                     ; 157 {
 604                     	switch	.text
 605  00bd               _TIM1_OC1Init:
 607  00bd 89            	pushw	x
 608  00be 5203          	subw	sp,#3
 609       00000003      OFST:	set	3
 612                     ; 159     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 614                     ; 160     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 616                     ; 161     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 618                     ; 162     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 620                     ; 163     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 622                     ; 164     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 624                     ; 165     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 626                     ; 169     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 626                     ; 170                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 628  00c0 c6525c        	ld	a,21084
 629  00c3 a4f0          	and	a,#240
 630  00c5 c7525c        	ld	21084,a
 631                     ; 173   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 631                     ; 174                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 631                     ; 175                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 631                     ; 176                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 633  00c8 7b0c          	ld	a,(OFST+9,sp)
 634  00ca a408          	and	a,#8
 635  00cc 6b03          	ld	(OFST+0,sp),a
 637  00ce 7b0b          	ld	a,(OFST+8,sp)
 638  00d0 a402          	and	a,#2
 639  00d2 1a03          	or	a,(OFST+0,sp)
 640  00d4 6b02          	ld	(OFST-1,sp),a
 642  00d6 7b08          	ld	a,(OFST+5,sp)
 643  00d8 a404          	and	a,#4
 644  00da 6b01          	ld	(OFST-2,sp),a
 646  00dc 9f            	ld	a,xl
 647  00dd a401          	and	a,#1
 648  00df 1a01          	or	a,(OFST-2,sp)
 649  00e1 1a02          	or	a,(OFST-1,sp)
 650  00e3 ca525c        	or	a,21084
 651  00e6 c7525c        	ld	21084,a
 652                     ; 179     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 652                     ; 180                             (uint8_t)TIM1_OCMode);
 654  00e9 c65258        	ld	a,21080
 655  00ec a48f          	and	a,#143
 656  00ee 1a04          	or	a,(OFST+1,sp)
 657  00f0 c75258        	ld	21080,a
 658                     ; 183     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 660  00f3 c6526f        	ld	a,21103
 661  00f6 a4fc          	and	a,#252
 662  00f8 c7526f        	ld	21103,a
 663                     ; 185     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 663                     ; 186                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 665  00fb 7b0e          	ld	a,(OFST+11,sp)
 666  00fd a402          	and	a,#2
 667  00ff 6b03          	ld	(OFST+0,sp),a
 669  0101 7b0d          	ld	a,(OFST+10,sp)
 670  0103 a401          	and	a,#1
 671  0105 1a03          	or	a,(OFST+0,sp)
 672  0107 ca526f        	or	a,21103
 673  010a c7526f        	ld	21103,a
 674                     ; 189     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 676  010d 7b09          	ld	a,(OFST+6,sp)
 677  010f c75265        	ld	21093,a
 678                     ; 190     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 680  0112 7b0a          	ld	a,(OFST+7,sp)
 681  0114 c75266        	ld	21094,a
 682                     ; 191 }
 685  0117 5b05          	addw	sp,#5
 686  0119 81            	ret
 790                     ; 212 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 790                     ; 213                   TIM1_OutputState_TypeDef TIM1_OutputState,
 790                     ; 214                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 790                     ; 215                   uint16_t TIM1_Pulse,
 790                     ; 216                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 790                     ; 217                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 790                     ; 218                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 790                     ; 219                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 790                     ; 220 {
 791                     	switch	.text
 792  011a               _TIM1_OC2Init:
 794  011a 89            	pushw	x
 795  011b 5203          	subw	sp,#3
 796       00000003      OFST:	set	3
 799                     ; 222     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 801                     ; 223     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 803                     ; 224     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 805                     ; 225     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 807                     ; 226     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 809                     ; 227     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 811                     ; 228     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 813                     ; 232     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 813                     ; 233                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 815  011d c6525c        	ld	a,21084
 816  0120 a40f          	and	a,#15
 817  0122 c7525c        	ld	21084,a
 818                     ; 237     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 818                     ; 238                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 818                     ; 239                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 818                     ; 240                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 820  0125 7b0c          	ld	a,(OFST+9,sp)
 821  0127 a480          	and	a,#128
 822  0129 6b03          	ld	(OFST+0,sp),a
 824  012b 7b0b          	ld	a,(OFST+8,sp)
 825  012d a420          	and	a,#32
 826  012f 1a03          	or	a,(OFST+0,sp)
 827  0131 6b02          	ld	(OFST-1,sp),a
 829  0133 7b08          	ld	a,(OFST+5,sp)
 830  0135 a440          	and	a,#64
 831  0137 6b01          	ld	(OFST-2,sp),a
 833  0139 9f            	ld	a,xl
 834  013a a410          	and	a,#16
 835  013c 1a01          	or	a,(OFST-2,sp)
 836  013e 1a02          	or	a,(OFST-1,sp)
 837  0140 ca525c        	or	a,21084
 838  0143 c7525c        	ld	21084,a
 839                     ; 243     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 839                     ; 244                              (uint8_t)TIM1_OCMode);
 841  0146 c65259        	ld	a,21081
 842  0149 a48f          	and	a,#143
 843  014b 1a04          	or	a,(OFST+1,sp)
 844  014d c75259        	ld	21081,a
 845                     ; 247     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 847  0150 c6526f        	ld	a,21103
 848  0153 a4f3          	and	a,#243
 849  0155 c7526f        	ld	21103,a
 850                     ; 249     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 850                     ; 250                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 852  0158 7b0e          	ld	a,(OFST+11,sp)
 853  015a a408          	and	a,#8
 854  015c 6b03          	ld	(OFST+0,sp),a
 856  015e 7b0d          	ld	a,(OFST+10,sp)
 857  0160 a404          	and	a,#4
 858  0162 1a03          	or	a,(OFST+0,sp)
 859  0164 ca526f        	or	a,21103
 860  0167 c7526f        	ld	21103,a
 861                     ; 253     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 863  016a 7b09          	ld	a,(OFST+6,sp)
 864  016c c75267        	ld	21095,a
 865                     ; 254     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 867  016f 7b0a          	ld	a,(OFST+7,sp)
 868  0171 c75268        	ld	21096,a
 869                     ; 256 }
 872  0174 5b05          	addw	sp,#5
 873  0176 81            	ret
 977                     ; 277 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 977                     ; 278                   TIM1_OutputState_TypeDef TIM1_OutputState,
 977                     ; 279                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 977                     ; 280                   uint16_t TIM1_Pulse,
 977                     ; 281                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 977                     ; 282                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 977                     ; 283                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 977                     ; 284                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 977                     ; 285 {
 978                     	switch	.text
 979  0177               _TIM1_OC3Init:
 981  0177 89            	pushw	x
 982  0178 5203          	subw	sp,#3
 983       00000003      OFST:	set	3
 986                     ; 287     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 988                     ; 288     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 990                     ; 289     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 992                     ; 290     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 994                     ; 291     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 996                     ; 292     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 998                     ; 293     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1000                     ; 297     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1000                     ; 298                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1002  017a c6525d        	ld	a,21085
1003  017d a4f0          	and	a,#240
1004  017f c7525d        	ld	21085,a
1005                     ; 301     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1005                     ; 302                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1005                     ; 303                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1005                     ; 304                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1007  0182 7b0c          	ld	a,(OFST+9,sp)
1008  0184 a408          	and	a,#8
1009  0186 6b03          	ld	(OFST+0,sp),a
1011  0188 7b0b          	ld	a,(OFST+8,sp)
1012  018a a402          	and	a,#2
1013  018c 1a03          	or	a,(OFST+0,sp)
1014  018e 6b02          	ld	(OFST-1,sp),a
1016  0190 7b08          	ld	a,(OFST+5,sp)
1017  0192 a404          	and	a,#4
1018  0194 6b01          	ld	(OFST-2,sp),a
1020  0196 9f            	ld	a,xl
1021  0197 a401          	and	a,#1
1022  0199 1a01          	or	a,(OFST-2,sp)
1023  019b 1a02          	or	a,(OFST-1,sp)
1024  019d ca525d        	or	a,21085
1025  01a0 c7525d        	ld	21085,a
1026                     ; 307     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1026                     ; 308                              (uint8_t)TIM1_OCMode);
1028  01a3 c6525a        	ld	a,21082
1029  01a6 a48f          	and	a,#143
1030  01a8 1a04          	or	a,(OFST+1,sp)
1031  01aa c7525a        	ld	21082,a
1032                     ; 311     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1034  01ad c6526f        	ld	a,21103
1035  01b0 a4cf          	and	a,#207
1036  01b2 c7526f        	ld	21103,a
1037                     ; 313     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1037                     ; 314                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1039  01b5 7b0e          	ld	a,(OFST+11,sp)
1040  01b7 a420          	and	a,#32
1041  01b9 6b03          	ld	(OFST+0,sp),a
1043  01bb 7b0d          	ld	a,(OFST+10,sp)
1044  01bd a410          	and	a,#16
1045  01bf 1a03          	or	a,(OFST+0,sp)
1046  01c1 ca526f        	or	a,21103
1047  01c4 c7526f        	ld	21103,a
1048                     ; 317     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1050  01c7 7b09          	ld	a,(OFST+6,sp)
1051  01c9 c75269        	ld	21097,a
1052                     ; 318     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1054  01cc 7b0a          	ld	a,(OFST+7,sp)
1055  01ce c7526a        	ld	21098,a
1056                     ; 320 }
1059  01d1 5b05          	addw	sp,#5
1060  01d3 81            	ret
1134                     ; 335 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1134                     ; 336                   TIM1_OutputState_TypeDef TIM1_OutputState,
1134                     ; 337                   uint16_t TIM1_Pulse,
1134                     ; 338                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1134                     ; 339                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1134                     ; 340 {
1135                     	switch	.text
1136  01d4               _TIM1_OC4Init:
1138  01d4 89            	pushw	x
1139  01d5 88            	push	a
1140       00000001      OFST:	set	1
1143                     ; 342     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1145                     ; 343     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1147                     ; 344     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1149                     ; 345     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1151                     ; 348     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1153  01d6 c6525d        	ld	a,21085
1154  01d9 a4cf          	and	a,#207
1155  01db c7525d        	ld	21085,a
1156                     ; 350     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1156                     ; 351                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1158  01de 7b08          	ld	a,(OFST+7,sp)
1159  01e0 a420          	and	a,#32
1160  01e2 6b01          	ld	(OFST+0,sp),a
1162  01e4 9f            	ld	a,xl
1163  01e5 a410          	and	a,#16
1164  01e7 1a01          	or	a,(OFST+0,sp)
1165  01e9 ca525d        	or	a,21085
1166  01ec c7525d        	ld	21085,a
1167                     ; 354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1167                     ; 355                             TIM1_OCMode);
1169  01ef c6525b        	ld	a,21083
1170  01f2 a48f          	and	a,#143
1171  01f4 1a02          	or	a,(OFST+1,sp)
1172  01f6 c7525b        	ld	21083,a
1173                     ; 358     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1175  01f9 0d09          	tnz	(OFST+8,sp)
1176  01fb 270a          	jreq	L534
1177                     ; 360         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1179  01fd c6526f        	ld	a,21103
1180  0200 aadf          	or	a,#223
1181  0202 c7526f        	ld	21103,a
1183  0205 2004          	jra	L734
1184  0207               L534:
1185                     ; 364         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1187  0207 721d526f      	bres	21103,#6
1188  020b               L734:
1189                     ; 368     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1191  020b 7b06          	ld	a,(OFST+5,sp)
1192  020d c7526b        	ld	21099,a
1193                     ; 369     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1195  0210 7b07          	ld	a,(OFST+6,sp)
1196  0212 c7526c        	ld	21100,a
1197                     ; 371 }
1200  0215 5b03          	addw	sp,#3
1201  0217 81            	ret
1406                     ; 386 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1406                     ; 387                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1406                     ; 388                      uint8_t TIM1_DeadTime,
1406                     ; 389                      TIM1_BreakState_TypeDef TIM1_Break,
1406                     ; 390                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1406                     ; 391                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1406                     ; 392 {
1407                     	switch	.text
1408  0218               _TIM1_BDTRConfig:
1410  0218 89            	pushw	x
1411  0219 88            	push	a
1412       00000001      OFST:	set	1
1415                     ; 394     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1417                     ; 395     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1419                     ; 396     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1421                     ; 397     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1423                     ; 398     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1425                     ; 400     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1427  021a 7b06          	ld	a,(OFST+5,sp)
1428  021c c7526e        	ld	21102,a
1429                     ; 404     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1429                     ; 405                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1429                     ; 406                             (uint8_t)TIM1_AutomaticOutput));
1431  021f 7b07          	ld	a,(OFST+6,sp)
1432  0221 1a08          	or	a,(OFST+7,sp)
1433  0223 1a09          	or	a,(OFST+8,sp)
1434  0225 6b01          	ld	(OFST+0,sp),a
1436  0227 9f            	ld	a,xl
1437  0228 1a02          	or	a,(OFST+1,sp)
1438  022a 1a01          	or	a,(OFST+0,sp)
1439  022c c7526d        	ld	21101,a
1440                     ; 408 }
1443  022f 5b03          	addw	sp,#3
1444  0231 81            	ret
1646                     ; 422 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1646                     ; 423                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1646                     ; 424                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1646                     ; 425                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1646                     ; 426                  uint8_t TIM1_ICFilter)
1646                     ; 427 {
1647                     	switch	.text
1648  0232               _TIM1_ICInit:
1650  0232 89            	pushw	x
1651       00000000      OFST:	set	0
1654                     ; 430     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1656                     ; 431     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1658                     ; 432     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1660                     ; 433     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1662                     ; 434     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1664                     ; 436     if (TIM1_Channel == TIM1_CHANNEL_1)
1666  0233 9e            	ld	a,xh
1667  0234 4d            	tnz	a
1668  0235 2614          	jrne	L766
1669                     ; 439         TI1_Config((uint8_t)TIM1_ICPolarity,
1669                     ; 440                    (uint8_t)TIM1_ICSelection,
1669                     ; 441                    (uint8_t)TIM1_ICFilter);
1671  0237 7b07          	ld	a,(OFST+7,sp)
1672  0239 88            	push	a
1673  023a 7b06          	ld	a,(OFST+6,sp)
1674  023c 97            	ld	xl,a
1675  023d 7b03          	ld	a,(OFST+3,sp)
1676  023f 95            	ld	xh,a
1677  0240 cd080e        	call	L3_TI1_Config
1679  0243 84            	pop	a
1680                     ; 443         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1682  0244 7b06          	ld	a,(OFST+6,sp)
1683  0246 cd06b6        	call	_TIM1_SetIC1Prescaler
1686  0249 2046          	jra	L176
1687  024b               L766:
1688                     ; 445     else if (TIM1_Channel == TIM1_CHANNEL_2)
1690  024b 7b01          	ld	a,(OFST+1,sp)
1691  024d a101          	cp	a,#1
1692  024f 2614          	jrne	L376
1693                     ; 448         TI2_Config((uint8_t)TIM1_ICPolarity,
1693                     ; 449                    (uint8_t)TIM1_ICSelection,
1693                     ; 450                    (uint8_t)TIM1_ICFilter);
1695  0251 7b07          	ld	a,(OFST+7,sp)
1696  0253 88            	push	a
1697  0254 7b06          	ld	a,(OFST+6,sp)
1698  0256 97            	ld	xl,a
1699  0257 7b03          	ld	a,(OFST+3,sp)
1700  0259 95            	ld	xh,a
1701  025a cd083e        	call	L5_TI2_Config
1703  025d 84            	pop	a
1704                     ; 452         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1706  025e 7b06          	ld	a,(OFST+6,sp)
1707  0260 cd06c3        	call	_TIM1_SetIC2Prescaler
1710  0263 202c          	jra	L176
1711  0265               L376:
1712                     ; 454     else if (TIM1_Channel == TIM1_CHANNEL_3)
1714  0265 7b01          	ld	a,(OFST+1,sp)
1715  0267 a102          	cp	a,#2
1716  0269 2614          	jrne	L776
1717                     ; 457         TI3_Config((uint8_t)TIM1_ICPolarity,
1717                     ; 458                    (uint8_t)TIM1_ICSelection,
1717                     ; 459                    (uint8_t)TIM1_ICFilter);
1719  026b 7b07          	ld	a,(OFST+7,sp)
1720  026d 88            	push	a
1721  026e 7b06          	ld	a,(OFST+6,sp)
1722  0270 97            	ld	xl,a
1723  0271 7b03          	ld	a,(OFST+3,sp)
1724  0273 95            	ld	xh,a
1725  0274 cd086e        	call	L7_TI3_Config
1727  0277 84            	pop	a
1728                     ; 461         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1730  0278 7b06          	ld	a,(OFST+6,sp)
1731  027a cd06d0        	call	_TIM1_SetIC3Prescaler
1734  027d 2012          	jra	L176
1735  027f               L776:
1736                     ; 466         TI4_Config((uint8_t)TIM1_ICPolarity,
1736                     ; 467                    (uint8_t)TIM1_ICSelection,
1736                     ; 468                    (uint8_t)TIM1_ICFilter);
1738  027f 7b07          	ld	a,(OFST+7,sp)
1739  0281 88            	push	a
1740  0282 7b06          	ld	a,(OFST+6,sp)
1741  0284 97            	ld	xl,a
1742  0285 7b03          	ld	a,(OFST+3,sp)
1743  0287 95            	ld	xh,a
1744  0288 cd089e        	call	L11_TI4_Config
1746  028b 84            	pop	a
1747                     ; 470         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1749  028c 7b06          	ld	a,(OFST+6,sp)
1750  028e cd06dd        	call	_TIM1_SetIC4Prescaler
1752  0291               L176:
1753                     ; 473 }
1756  0291 85            	popw	x
1757  0292 81            	ret
1853                     ; 489 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1853                     ; 490                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1853                     ; 491                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1853                     ; 492                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1853                     ; 493                      uint8_t TIM1_ICFilter)
1853                     ; 494 {
1854                     	switch	.text
1855  0293               _TIM1_PWMIConfig:
1857  0293 89            	pushw	x
1858  0294 89            	pushw	x
1859       00000002      OFST:	set	2
1862                     ; 495     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1864                     ; 496     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1866                     ; 499     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1868                     ; 500     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1870                     ; 501     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1872                     ; 502     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1874                     ; 505     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1876  0295 9f            	ld	a,xl
1877  0296 a101          	cp	a,#1
1878  0298 2706          	jreq	L157
1879                     ; 507         icpolarity = TIM1_ICPOLARITY_FALLING;
1881  029a a601          	ld	a,#1
1882  029c 6b01          	ld	(OFST-1,sp),a
1885  029e 2002          	jra	L357
1886  02a0               L157:
1887                     ; 511         icpolarity = TIM1_ICPOLARITY_RISING;
1889  02a0 0f01          	clr	(OFST-1,sp)
1891  02a2               L357:
1892                     ; 515     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1894  02a2 7b07          	ld	a,(OFST+5,sp)
1895  02a4 a101          	cp	a,#1
1896  02a6 2606          	jrne	L557
1897                     ; 517         icselection = TIM1_ICSELECTION_INDIRECTTI;
1899  02a8 a602          	ld	a,#2
1900  02aa 6b02          	ld	(OFST+0,sp),a
1903  02ac 2004          	jra	L757
1904  02ae               L557:
1905                     ; 521         icselection = TIM1_ICSELECTION_DIRECTTI;
1907  02ae a601          	ld	a,#1
1908  02b0 6b02          	ld	(OFST+0,sp),a
1910  02b2               L757:
1911                     ; 524     if (TIM1_Channel == TIM1_CHANNEL_1)
1913  02b2 0d03          	tnz	(OFST+1,sp)
1914  02b4 2626          	jrne	L167
1915                     ; 527         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1915                     ; 528                    (uint8_t)TIM1_ICFilter);
1917  02b6 7b09          	ld	a,(OFST+7,sp)
1918  02b8 88            	push	a
1919  02b9 7b08          	ld	a,(OFST+6,sp)
1920  02bb 97            	ld	xl,a
1921  02bc 7b05          	ld	a,(OFST+3,sp)
1922  02be 95            	ld	xh,a
1923  02bf cd080e        	call	L3_TI1_Config
1925  02c2 84            	pop	a
1926                     ; 531         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1928  02c3 7b08          	ld	a,(OFST+6,sp)
1929  02c5 cd06b6        	call	_TIM1_SetIC1Prescaler
1931                     ; 534         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1933  02c8 7b09          	ld	a,(OFST+7,sp)
1934  02ca 88            	push	a
1935  02cb 7b03          	ld	a,(OFST+1,sp)
1936  02cd 97            	ld	xl,a
1937  02ce 7b02          	ld	a,(OFST+0,sp)
1938  02d0 95            	ld	xh,a
1939  02d1 cd083e        	call	L5_TI2_Config
1941  02d4 84            	pop	a
1942                     ; 537         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1944  02d5 7b08          	ld	a,(OFST+6,sp)
1945  02d7 cd06c3        	call	_TIM1_SetIC2Prescaler
1948  02da 2024          	jra	L367
1949  02dc               L167:
1950                     ; 542         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1950                     ; 543                    (uint8_t)TIM1_ICFilter);
1952  02dc 7b09          	ld	a,(OFST+7,sp)
1953  02de 88            	push	a
1954  02df 7b08          	ld	a,(OFST+6,sp)
1955  02e1 97            	ld	xl,a
1956  02e2 7b05          	ld	a,(OFST+3,sp)
1957  02e4 95            	ld	xh,a
1958  02e5 cd083e        	call	L5_TI2_Config
1960  02e8 84            	pop	a
1961                     ; 546         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1963  02e9 7b08          	ld	a,(OFST+6,sp)
1964  02eb cd06c3        	call	_TIM1_SetIC2Prescaler
1966                     ; 549         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1968  02ee 7b09          	ld	a,(OFST+7,sp)
1969  02f0 88            	push	a
1970  02f1 7b03          	ld	a,(OFST+1,sp)
1971  02f3 97            	ld	xl,a
1972  02f4 7b02          	ld	a,(OFST+0,sp)
1973  02f6 95            	ld	xh,a
1974  02f7 cd080e        	call	L3_TI1_Config
1976  02fa 84            	pop	a
1977                     ; 552         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1979  02fb 7b08          	ld	a,(OFST+6,sp)
1980  02fd cd06b6        	call	_TIM1_SetIC1Prescaler
1982  0300               L367:
1983                     ; 554 }
1986  0300 5b04          	addw	sp,#4
1987  0302 81            	ret
2042                     ; 562 void TIM1_Cmd(FunctionalState NewState)
2042                     ; 563 {
2043                     	switch	.text
2044  0303               _TIM1_Cmd:
2048                     ; 565     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2050                     ; 568     if (NewState != DISABLE)
2052  0303 4d            	tnz	a
2053  0304 2706          	jreq	L3101
2054                     ; 570         TIM1->CR1 |= TIM1_CR1_CEN;
2056  0306 72105250      	bset	21072,#0
2058  030a 2004          	jra	L5101
2059  030c               L3101:
2060                     ; 574         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2062  030c 72115250      	bres	21072,#0
2063  0310               L5101:
2064                     ; 576 }
2067  0310 81            	ret
2103                     ; 584 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2103                     ; 585 {
2104                     	switch	.text
2105  0311               _TIM1_CtrlPWMOutputs:
2109                     ; 587     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2111                     ; 591     if (NewState != DISABLE)
2113  0311 4d            	tnz	a
2114  0312 2706          	jreq	L5301
2115                     ; 593         TIM1->BKR |= TIM1_BKR_MOE;
2117  0314 721e526d      	bset	21101,#7
2119  0318 2004          	jra	L7301
2120  031a               L5301:
2121                     ; 597         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2123  031a 721f526d      	bres	21101,#7
2124  031e               L7301:
2125                     ; 599 }
2128  031e 81            	ret
2235                     ; 618 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2235                     ; 619 {
2236                     	switch	.text
2237  031f               _TIM1_ITConfig:
2239  031f 89            	pushw	x
2240       00000000      OFST:	set	0
2243                     ; 621     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2245                     ; 622     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2247                     ; 624     if (NewState != DISABLE)
2249  0320 9f            	ld	a,xl
2250  0321 4d            	tnz	a
2251  0322 2709          	jreq	L7011
2252                     ; 627         TIM1->IER |= (uint8_t)TIM1_IT;
2254  0324 9e            	ld	a,xh
2255  0325 ca5254        	or	a,21076
2256  0328 c75254        	ld	21076,a
2258  032b 2009          	jra	L1111
2259  032d               L7011:
2260                     ; 632         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2262  032d 7b01          	ld	a,(OFST+1,sp)
2263  032f 43            	cpl	a
2264  0330 c45254        	and	a,21076
2265  0333 c75254        	ld	21076,a
2266  0336               L1111:
2267                     ; 634 }
2270  0336 85            	popw	x
2271  0337 81            	ret
2295                     ; 641 void TIM1_InternalClockConfig(void)
2295                     ; 642 {
2296                     	switch	.text
2297  0338               _TIM1_InternalClockConfig:
2301                     ; 644     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2303  0338 c65252        	ld	a,21074
2304  033b a4f8          	and	a,#248
2305  033d c75252        	ld	21074,a
2306                     ; 645 }
2309  0340 81            	ret
2426                     ; 663 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2426                     ; 664                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2426                     ; 665                               uint8_t ExtTRGFilter)
2426                     ; 666 {
2427                     	switch	.text
2428  0341               _TIM1_ETRClockMode1Config:
2430  0341 89            	pushw	x
2431       00000000      OFST:	set	0
2434                     ; 668     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2436                     ; 669     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2438                     ; 672     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2440  0342 7b05          	ld	a,(OFST+5,sp)
2441  0344 88            	push	a
2442  0345 9f            	ld	a,xl
2443  0346 97            	ld	xl,a
2444  0347 7b02          	ld	a,(OFST+2,sp)
2445  0349 95            	ld	xh,a
2446  034a ad1f          	call	_TIM1_ETRConfig
2448  034c 84            	pop	a
2449                     ; 675     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2449                     ; 676                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2451  034d c65252        	ld	a,21074
2452  0350 a488          	and	a,#136
2453  0352 aa77          	or	a,#119
2454  0354 c75252        	ld	21074,a
2455                     ; 677 }
2458  0357 85            	popw	x
2459  0358 81            	ret
2517                     ; 695 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2517                     ; 696                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2517                     ; 697                               uint8_t ExtTRGFilter)
2517                     ; 698 {
2518                     	switch	.text
2519  0359               _TIM1_ETRClockMode2Config:
2521  0359 89            	pushw	x
2522       00000000      OFST:	set	0
2525                     ; 700     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2527                     ; 701     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2529                     ; 704     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2531  035a 7b05          	ld	a,(OFST+5,sp)
2532  035c 88            	push	a
2533  035d 9f            	ld	a,xl
2534  035e 97            	ld	xl,a
2535  035f 7b02          	ld	a,(OFST+2,sp)
2536  0361 95            	ld	xh,a
2537  0362 ad07          	call	_TIM1_ETRConfig
2539  0364 84            	pop	a
2540                     ; 707     TIM1->ETR |= TIM1_ETR_ECE;
2542  0365 721c5253      	bset	21075,#6
2543                     ; 708 }
2546  0369 85            	popw	x
2547  036a 81            	ret
2603                     ; 726 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2603                     ; 727                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2603                     ; 728                     uint8_t ExtTRGFilter)
2603                     ; 729 {
2604                     	switch	.text
2605  036b               _TIM1_ETRConfig:
2607  036b 89            	pushw	x
2608       00000000      OFST:	set	0
2611                     ; 731     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2613                     ; 733     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2613                     ; 734                       (uint8_t)ExtTRGFilter );
2615  036c 9f            	ld	a,xl
2616  036d 1a01          	or	a,(OFST+1,sp)
2617  036f 1a05          	or	a,(OFST+5,sp)
2618  0371 ca5253        	or	a,21075
2619  0374 c75253        	ld	21075,a
2620                     ; 735 }
2623  0377 85            	popw	x
2624  0378 81            	ret
2713                     ; 752 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2713                     ; 753                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2713                     ; 754                                  uint8_t ICFilter)
2713                     ; 755 {
2714                     	switch	.text
2715  0379               _TIM1_TIxExternalClockConfig:
2717  0379 89            	pushw	x
2718       00000000      OFST:	set	0
2721                     ; 757     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2723                     ; 758     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2725                     ; 759     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2727                     ; 762     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2729  037a 9e            	ld	a,xh
2730  037b a160          	cp	a,#96
2731  037d 260e          	jrne	L1131
2732                     ; 764         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2734  037f 7b05          	ld	a,(OFST+5,sp)
2735  0381 88            	push	a
2736  0382 9f            	ld	a,xl
2737  0383 ae0001        	ldw	x,#1
2738  0386 95            	ld	xh,a
2739  0387 cd083e        	call	L5_TI2_Config
2741  038a 84            	pop	a
2743  038b 200d          	jra	L3131
2744  038d               L1131:
2745                     ; 768         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2747  038d 7b05          	ld	a,(OFST+5,sp)
2748  038f 88            	push	a
2749  0390 7b03          	ld	a,(OFST+3,sp)
2750  0392 ae0001        	ldw	x,#1
2751  0395 95            	ld	xh,a
2752  0396 cd080e        	call	L3_TI1_Config
2754  0399 84            	pop	a
2755  039a               L3131:
2756                     ; 772     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2758  039a 7b01          	ld	a,(OFST+1,sp)
2759  039c ad0a          	call	_TIM1_SelectInputTrigger
2761                     ; 775     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2763  039e c65252        	ld	a,21074
2764  03a1 aa07          	or	a,#7
2765  03a3 c75252        	ld	21074,a
2766                     ; 776 }
2769  03a6 85            	popw	x
2770  03a7 81            	ret
2855                     ; 788 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2855                     ; 789 {
2856                     	switch	.text
2857  03a8               _TIM1_SelectInputTrigger:
2859  03a8 88            	push	a
2860       00000000      OFST:	set	0
2863                     ; 791     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2865                     ; 794     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2867  03a9 c65252        	ld	a,21074
2868  03ac a48f          	and	a,#143
2869  03ae 1a01          	or	a,(OFST+1,sp)
2870  03b0 c75252        	ld	21074,a
2871                     ; 795 }
2874  03b3 84            	pop	a
2875  03b4 81            	ret
2911                     ; 805 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2911                     ; 806 {
2912                     	switch	.text
2913  03b5               _TIM1_UpdateDisableConfig:
2917                     ; 808     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2919                     ; 811     if (NewState != DISABLE)
2921  03b5 4d            	tnz	a
2922  03b6 2706          	jreq	L1731
2923                     ; 813         TIM1->CR1 |= TIM1_CR1_UDIS;
2925  03b8 72125250      	bset	21072,#1
2927  03bc 2004          	jra	L3731
2928  03be               L1731:
2929                     ; 817         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2931  03be 72135250      	bres	21072,#1
2932  03c2               L3731:
2933                     ; 819 }
2936  03c2 81            	ret
2994                     ; 829 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2994                     ; 830 {
2995                     	switch	.text
2996  03c3               _TIM1_UpdateRequestConfig:
3000                     ; 832     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3002                     ; 835     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3004  03c3 4d            	tnz	a
3005  03c4 2706          	jreq	L3241
3006                     ; 837         TIM1->CR1 |= TIM1_CR1_URS;
3008  03c6 72145250      	bset	21072,#2
3010  03ca 2004          	jra	L5241
3011  03cc               L3241:
3012                     ; 841         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3014  03cc 72155250      	bres	21072,#2
3015  03d0               L5241:
3016                     ; 843 }
3019  03d0 81            	ret
3055                     ; 852 void TIM1_SelectHallSensor(FunctionalState NewState)
3055                     ; 853 {
3056                     	switch	.text
3057  03d1               _TIM1_SelectHallSensor:
3061                     ; 855     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3063                     ; 858     if (NewState != DISABLE)
3065  03d1 4d            	tnz	a
3066  03d2 2706          	jreq	L5441
3067                     ; 860         TIM1->CR2 |= TIM1_CR2_TI1S;
3069  03d4 721e5251      	bset	21073,#7
3071  03d8 2004          	jra	L7441
3072  03da               L5441:
3073                     ; 864         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3075  03da 721f5251      	bres	21073,#7
3076  03de               L7441:
3077                     ; 866 }
3080  03de 81            	ret
3137                     ; 877 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3137                     ; 878 {
3138                     	switch	.text
3139  03df               _TIM1_SelectOnePulseMode:
3143                     ; 880     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3145                     ; 883     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3147  03df 4d            	tnz	a
3148  03e0 2706          	jreq	L7741
3149                     ; 885         TIM1->CR1 |= TIM1_CR1_OPM;
3151  03e2 72165250      	bset	21072,#3
3153  03e6 2004          	jra	L1051
3154  03e8               L7741:
3155                     ; 889         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3157  03e8 72175250      	bres	21072,#3
3158  03ec               L1051:
3159                     ; 892 }
3162  03ec 81            	ret
3260                     ; 908 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3260                     ; 909 {
3261                     	switch	.text
3262  03ed               _TIM1_SelectOutputTrigger:
3264  03ed 88            	push	a
3265       00000000      OFST:	set	0
3268                     ; 911     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3270                     ; 914     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3270                     ; 915                           (uint8_t) TIM1_TRGOSource);
3272  03ee c65251        	ld	a,21073
3273  03f1 a48f          	and	a,#143
3274  03f3 1a01          	or	a,(OFST+1,sp)
3275  03f5 c75251        	ld	21073,a
3276                     ; 916 }
3279  03f8 84            	pop	a
3280  03f9 81            	ret
3354                     ; 928 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3354                     ; 929 {
3355                     	switch	.text
3356  03fa               _TIM1_SelectSlaveMode:
3358  03fa 88            	push	a
3359       00000000      OFST:	set	0
3362                     ; 932     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3364                     ; 935     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3364                     ; 936                            (uint8_t)TIM1_SlaveMode);
3366  03fb c65252        	ld	a,21074
3367  03fe a4f8          	and	a,#248
3368  0400 1a01          	or	a,(OFST+1,sp)
3369  0402 c75252        	ld	21074,a
3370                     ; 938 }
3373  0405 84            	pop	a
3374  0406 81            	ret
3410                     ; 946 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3410                     ; 947 {
3411                     	switch	.text
3412  0407               _TIM1_SelectMasterSlaveMode:
3416                     ; 949     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3418                     ; 952     if (NewState != DISABLE)
3420  0407 4d            	tnz	a
3421  0408 2706          	jreq	L3161
3422                     ; 954         TIM1->SMCR |= TIM1_SMCR_MSM;
3424  040a 721e5252      	bset	21074,#7
3426  040e 2004          	jra	L5161
3427  0410               L3161:
3428                     ; 958         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3430  0410 721f5252      	bres	21074,#7
3431  0414               L5161:
3432                     ; 960 }
3435  0414 81            	ret
3521                     ; 982 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3521                     ; 983                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3521                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3521                     ; 985 {
3522                     	switch	.text
3523  0415               _TIM1_EncoderInterfaceConfig:
3525  0415 89            	pushw	x
3526       00000000      OFST:	set	0
3529                     ; 989     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3531                     ; 990     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3533                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3535                     ; 994     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3537  0416 9f            	ld	a,xl
3538  0417 4d            	tnz	a
3539  0418 2706          	jreq	L7561
3540                     ; 996         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3542  041a 7212525c      	bset	21084,#1
3544  041e 2004          	jra	L1661
3545  0420               L7561:
3546                     ; 1000         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3548  0420 7213525c      	bres	21084,#1
3549  0424               L1661:
3550                     ; 1003     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3552  0424 0d05          	tnz	(OFST+5,sp)
3553  0426 2706          	jreq	L3661
3554                     ; 1005         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3556  0428 721a525c      	bset	21084,#5
3558  042c 2004          	jra	L5661
3559  042e               L3661:
3560                     ; 1009         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3562  042e 721b525c      	bres	21084,#5
3563  0432               L5661:
3564                     ; 1012     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3564                     ; 1013                            | (uint8_t) TIM1_EncoderMode);
3566  0432 c65252        	ld	a,21074
3567  0435 a4f0          	and	a,#240
3568  0437 1a01          	or	a,(OFST+1,sp)
3569  0439 c75252        	ld	21074,a
3570                     ; 1016     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3570                     ; 1017                             | (uint8_t) CCMR_TIxDirect_Set);
3572  043c c65258        	ld	a,21080
3573  043f a4fc          	and	a,#252
3574  0441 aa01          	or	a,#1
3575  0443 c75258        	ld	21080,a
3576                     ; 1018     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3576                     ; 1019                             | (uint8_t) CCMR_TIxDirect_Set);
3578  0446 c65259        	ld	a,21081
3579  0449 a4fc          	and	a,#252
3580  044b aa01          	or	a,#1
3581  044d c75259        	ld	21081,a
3582                     ; 1021 }
3585  0450 85            	popw	x
3586  0451 81            	ret
3653                     ; 1034 void TIM1_PrescalerConfig(uint16_t Prescaler,
3653                     ; 1035                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3653                     ; 1036 {
3654                     	switch	.text
3655  0452               _TIM1_PrescalerConfig:
3657  0452 89            	pushw	x
3658       00000000      OFST:	set	0
3661                     ; 1038     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3663                     ; 1041     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3665  0453 9e            	ld	a,xh
3666  0454 c75260        	ld	21088,a
3667                     ; 1042     TIM1->PSCRL = (uint8_t)(Prescaler);
3669  0457 9f            	ld	a,xl
3670  0458 c75261        	ld	21089,a
3671                     ; 1045     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3673  045b 7b05          	ld	a,(OFST+5,sp)
3674  045d c75257        	ld	21079,a
3675                     ; 1047 }
3678  0460 85            	popw	x
3679  0461 81            	ret
3715                     ; 1060 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3715                     ; 1061 {
3716                     	switch	.text
3717  0462               _TIM1_CounterModeConfig:
3719  0462 88            	push	a
3720       00000000      OFST:	set	0
3723                     ; 1063     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3725                     ; 1067     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3725                     ; 1068                           | (uint8_t)TIM1_CounterMode);
3727  0463 c65250        	ld	a,21072
3728  0466 a48f          	and	a,#143
3729  0468 1a01          	or	a,(OFST+1,sp)
3730  046a c75250        	ld	21072,a
3731                     ; 1069 }
3734  046d 84            	pop	a
3735  046e 81            	ret
3793                     ; 1080 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3793                     ; 1081 {
3794                     	switch	.text
3795  046f               _TIM1_ForcedOC1Config:
3797  046f 88            	push	a
3798       00000000      OFST:	set	0
3801                     ; 1083     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3803                     ; 1086     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3803                     ; 1087                              (uint8_t)TIM1_ForcedAction);
3805  0470 c65258        	ld	a,21080
3806  0473 a48f          	and	a,#143
3807  0475 1a01          	or	a,(OFST+1,sp)
3808  0477 c75258        	ld	21080,a
3809                     ; 1088 }
3812  047a 84            	pop	a
3813  047b 81            	ret
3849                     ; 1099 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3849                     ; 1100 {
3850                     	switch	.text
3851  047c               _TIM1_ForcedOC2Config:
3853  047c 88            	push	a
3854       00000000      OFST:	set	0
3857                     ; 1102     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3859                     ; 1105     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3859                     ; 1106                               | (uint8_t)TIM1_ForcedAction);
3861  047d c65259        	ld	a,21081
3862  0480 a48f          	and	a,#143
3863  0482 1a01          	or	a,(OFST+1,sp)
3864  0484 c75259        	ld	21081,a
3865                     ; 1107 }
3868  0487 84            	pop	a
3869  0488 81            	ret
3905                     ; 1119 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3905                     ; 1120 {
3906                     	switch	.text
3907  0489               _TIM1_ForcedOC3Config:
3909  0489 88            	push	a
3910       00000000      OFST:	set	0
3913                     ; 1122     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3915                     ; 1125     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3915                     ; 1126                               | (uint8_t)TIM1_ForcedAction);
3917  048a c6525a        	ld	a,21082
3918  048d a48f          	and	a,#143
3919  048f 1a01          	or	a,(OFST+1,sp)
3920  0491 c7525a        	ld	21082,a
3921                     ; 1127 }
3924  0494 84            	pop	a
3925  0495 81            	ret
3961                     ; 1139 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3961                     ; 1140 {
3962                     	switch	.text
3963  0496               _TIM1_ForcedOC4Config:
3965  0496 88            	push	a
3966       00000000      OFST:	set	0
3969                     ; 1142     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3971                     ; 1145     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3971                     ; 1146                               | (uint8_t)TIM1_ForcedAction);
3973  0497 c6525b        	ld	a,21083
3974  049a a48f          	and	a,#143
3975  049c 1a01          	or	a,(OFST+1,sp)
3976  049e c7525b        	ld	21083,a
3977                     ; 1147 }
3980  04a1 84            	pop	a
3981  04a2 81            	ret
4017                     ; 1156 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4017                     ; 1157 {
4018                     	switch	.text
4019  04a3               _TIM1_ARRPreloadConfig:
4023                     ; 1159     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4025                     ; 1162     if (NewState != DISABLE)
4027  04a3 4d            	tnz	a
4028  04a4 2706          	jreq	L5502
4029                     ; 1164         TIM1->CR1 |= TIM1_CR1_ARPE;
4031  04a6 721e5250      	bset	21072,#7
4033  04aa 2004          	jra	L7502
4034  04ac               L5502:
4035                     ; 1168         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4037  04ac 721f5250      	bres	21072,#7
4038  04b0               L7502:
4039                     ; 1170 }
4042  04b0 81            	ret
4077                     ; 1179 void TIM1_SelectCOM(FunctionalState NewState)
4077                     ; 1180 {
4078                     	switch	.text
4079  04b1               _TIM1_SelectCOM:
4083                     ; 1182     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4085                     ; 1185     if (NewState != DISABLE)
4087  04b1 4d            	tnz	a
4088  04b2 2706          	jreq	L7702
4089                     ; 1187         TIM1->CR2 |= TIM1_CR2_COMS;
4091  04b4 72145251      	bset	21073,#2
4093  04b8 2004          	jra	L1012
4094  04ba               L7702:
4095                     ; 1191         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4097  04ba 72155251      	bres	21073,#2
4098  04be               L1012:
4099                     ; 1193 }
4102  04be 81            	ret
4138                     ; 1201 void TIM1_CCPreloadControl(FunctionalState NewState)
4138                     ; 1202 {
4139                     	switch	.text
4140  04bf               _TIM1_CCPreloadControl:
4144                     ; 1204     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4146                     ; 1207     if (NewState != DISABLE)
4148  04bf 4d            	tnz	a
4149  04c0 2706          	jreq	L1212
4150                     ; 1209         TIM1->CR2 |= TIM1_CR2_CCPC;
4152  04c2 72105251      	bset	21073,#0
4154  04c6 2004          	jra	L3212
4155  04c8               L1212:
4156                     ; 1213         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4158  04c8 72115251      	bres	21073,#0
4159  04cc               L3212:
4160                     ; 1215 }
4163  04cc 81            	ret
4199                     ; 1224 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4199                     ; 1225 {
4200                     	switch	.text
4201  04cd               _TIM1_OC1PreloadConfig:
4205                     ; 1227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4207                     ; 1230     if (NewState != DISABLE)
4209  04cd 4d            	tnz	a
4210  04ce 2706          	jreq	L3412
4211                     ; 1232         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4213  04d0 72165258      	bset	21080,#3
4215  04d4 2004          	jra	L5412
4216  04d6               L3412:
4217                     ; 1236         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4219  04d6 72175258      	bres	21080,#3
4220  04da               L5412:
4221                     ; 1238 }
4224  04da 81            	ret
4260                     ; 1247 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4260                     ; 1248 {
4261                     	switch	.text
4262  04db               _TIM1_OC2PreloadConfig:
4266                     ; 1250     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4268                     ; 1253     if (NewState != DISABLE)
4270  04db 4d            	tnz	a
4271  04dc 2706          	jreq	L5612
4272                     ; 1255         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4274  04de 72165259      	bset	21081,#3
4276  04e2 2004          	jra	L7612
4277  04e4               L5612:
4278                     ; 1259         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4280  04e4 72175259      	bres	21081,#3
4281  04e8               L7612:
4282                     ; 1261 }
4285  04e8 81            	ret
4321                     ; 1270 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4321                     ; 1271 {
4322                     	switch	.text
4323  04e9               _TIM1_OC3PreloadConfig:
4327                     ; 1273     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4329                     ; 1276     if (NewState != DISABLE)
4331  04e9 4d            	tnz	a
4332  04ea 2706          	jreq	L7022
4333                     ; 1278         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4335  04ec 7216525a      	bset	21082,#3
4337  04f0 2004          	jra	L1122
4338  04f2               L7022:
4339                     ; 1282         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4341  04f2 7217525a      	bres	21082,#3
4342  04f6               L1122:
4343                     ; 1284 }
4346  04f6 81            	ret
4382                     ; 1294 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4382                     ; 1295 {
4383                     	switch	.text
4384  04f7               _TIM1_OC4PreloadConfig:
4388                     ; 1297     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4390                     ; 1300     if (NewState != DISABLE)
4392  04f7 4d            	tnz	a
4393  04f8 2706          	jreq	L1322
4394                     ; 1302         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4396  04fa 7216525b      	bset	21083,#3
4398  04fe 2004          	jra	L3322
4399  0500               L1322:
4400                     ; 1306         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4402  0500 7217525b      	bres	21083,#3
4403  0504               L3322:
4404                     ; 1308 }
4407  0504 81            	ret
4442                     ; 1316 void TIM1_OC1FastConfig(FunctionalState NewState)
4442                     ; 1317 {
4443                     	switch	.text
4444  0505               _TIM1_OC1FastConfig:
4448                     ; 1319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4450                     ; 1322     if (NewState != DISABLE)
4452  0505 4d            	tnz	a
4453  0506 2706          	jreq	L3522
4454                     ; 1324         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4456  0508 72145258      	bset	21080,#2
4458  050c 2004          	jra	L5522
4459  050e               L3522:
4460                     ; 1328         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4462  050e 72155258      	bres	21080,#2
4463  0512               L5522:
4464                     ; 1330 }
4467  0512 81            	ret
4502                     ; 1340 void TIM1_OC2FastConfig(FunctionalState NewState)
4502                     ; 1341 {
4503                     	switch	.text
4504  0513               _TIM1_OC2FastConfig:
4508                     ; 1343     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4510                     ; 1346     if (NewState != DISABLE)
4512  0513 4d            	tnz	a
4513  0514 2706          	jreq	L5722
4514                     ; 1348         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4516  0516 72145259      	bset	21081,#2
4518  051a 2004          	jra	L7722
4519  051c               L5722:
4520                     ; 1352         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4522  051c 72155259      	bres	21081,#2
4523  0520               L7722:
4524                     ; 1354 }
4527  0520 81            	ret
4562                     ; 1363 void TIM1_OC3FastConfig(FunctionalState NewState)
4562                     ; 1364 {
4563                     	switch	.text
4564  0521               _TIM1_OC3FastConfig:
4568                     ; 1366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4570                     ; 1369     if (NewState != DISABLE)
4572  0521 4d            	tnz	a
4573  0522 2706          	jreq	L7132
4574                     ; 1371         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4576  0524 7214525a      	bset	21082,#2
4578  0528 2004          	jra	L1232
4579  052a               L7132:
4580                     ; 1375         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4582  052a 7215525a      	bres	21082,#2
4583  052e               L1232:
4584                     ; 1377 }
4587  052e 81            	ret
4622                     ; 1386 void TIM1_OC4FastConfig(FunctionalState NewState)
4622                     ; 1387 {
4623                     	switch	.text
4624  052f               _TIM1_OC4FastConfig:
4628                     ; 1389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4630                     ; 1392     if (NewState != DISABLE)
4632  052f 4d            	tnz	a
4633  0530 2706          	jreq	L1432
4634                     ; 1394         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4636  0532 7214525b      	bset	21083,#2
4638  0536 2004          	jra	L3432
4639  0538               L1432:
4640                     ; 1398         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4642  0538 7215525b      	bres	21083,#2
4643  053c               L3432:
4644                     ; 1400 }
4647  053c 81            	ret
4752                     ; 1417 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4752                     ; 1418 {
4753                     	switch	.text
4754  053d               _TIM1_GenerateEvent:
4758                     ; 1420     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4760                     ; 1423     TIM1->EGR = (uint8_t)TIM1_EventSource;
4762  053d c75257        	ld	21079,a
4763                     ; 1424 }
4766  0540 81            	ret
4802                     ; 1435 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4802                     ; 1436 {
4803                     	switch	.text
4804  0541               _TIM1_OC1PolarityConfig:
4808                     ; 1438     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4810                     ; 1441     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4812  0541 4d            	tnz	a
4813  0542 2706          	jreq	L5242
4814                     ; 1443         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4816  0544 7212525c      	bset	21084,#1
4818  0548 2004          	jra	L7242
4819  054a               L5242:
4820                     ; 1447         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4822  054a 7213525c      	bres	21084,#1
4823  054e               L7242:
4824                     ; 1449 }
4827  054e 81            	ret
4863                     ; 1460 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4863                     ; 1461 {
4864                     	switch	.text
4865  054f               _TIM1_OC1NPolarityConfig:
4869                     ; 1463     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4871                     ; 1466     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4873  054f 4d            	tnz	a
4874  0550 2706          	jreq	L7442
4875                     ; 1468         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4877  0552 7216525c      	bset	21084,#3
4879  0556 2004          	jra	L1542
4880  0558               L7442:
4881                     ; 1472         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4883  0558 7217525c      	bres	21084,#3
4884  055c               L1542:
4885                     ; 1474 }
4888  055c 81            	ret
4924                     ; 1485 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4924                     ; 1486 {
4925                     	switch	.text
4926  055d               _TIM1_OC2PolarityConfig:
4930                     ; 1488     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4932                     ; 1491     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4934  055d 4d            	tnz	a
4935  055e 2706          	jreq	L1742
4936                     ; 1493         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4938  0560 721a525c      	bset	21084,#5
4940  0564 2004          	jra	L3742
4941  0566               L1742:
4942                     ; 1497         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4944  0566 721b525c      	bres	21084,#5
4945  056a               L3742:
4946                     ; 1499 }
4949  056a 81            	ret
4985                     ; 1509 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4985                     ; 1510 {
4986                     	switch	.text
4987  056b               _TIM1_OC2NPolarityConfig:
4991                     ; 1512     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4993                     ; 1515     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4995  056b 4d            	tnz	a
4996  056c 2706          	jreq	L3152
4997                     ; 1517         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4999  056e 721e525c      	bset	21084,#7
5001  0572 2004          	jra	L5152
5002  0574               L3152:
5003                     ; 1521         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5005  0574 721f525c      	bres	21084,#7
5006  0578               L5152:
5007                     ; 1523 }
5010  0578 81            	ret
5046                     ; 1534 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5046                     ; 1535 {
5047                     	switch	.text
5048  0579               _TIM1_OC3PolarityConfig:
5052                     ; 1537     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5054                     ; 1540     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5056  0579 4d            	tnz	a
5057  057a 2706          	jreq	L5352
5058                     ; 1542         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5060  057c 7212525d      	bset	21085,#1
5062  0580 2004          	jra	L7352
5063  0582               L5352:
5064                     ; 1546         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5066  0582 7213525d      	bres	21085,#1
5067  0586               L7352:
5068                     ; 1548 }
5071  0586 81            	ret
5107                     ; 1559 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5107                     ; 1560 {
5108                     	switch	.text
5109  0587               _TIM1_OC3NPolarityConfig:
5113                     ; 1562     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5115                     ; 1565     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5117  0587 4d            	tnz	a
5118  0588 2706          	jreq	L7552
5119                     ; 1567         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5121  058a 7216525d      	bset	21085,#3
5123  058e 2004          	jra	L1652
5124  0590               L7552:
5125                     ; 1571         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5127  0590 7217525d      	bres	21085,#3
5128  0594               L1652:
5129                     ; 1573 }
5132  0594 81            	ret
5168                     ; 1583 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5168                     ; 1584 {
5169                     	switch	.text
5170  0595               _TIM1_OC4PolarityConfig:
5174                     ; 1586     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5176                     ; 1589     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5178  0595 4d            	tnz	a
5179  0596 2706          	jreq	L1062
5180                     ; 1591         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5182  0598 721a525d      	bset	21085,#5
5184  059c 2004          	jra	L3062
5185  059e               L1062:
5186                     ; 1595         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5188  059e 721b525d      	bres	21085,#5
5189  05a2               L3062:
5190                     ; 1597 }
5193  05a2 81            	ret
5238                     ; 1612 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5238                     ; 1613 {
5239                     	switch	.text
5240  05a3               _TIM1_CCxCmd:
5242  05a3 89            	pushw	x
5243       00000000      OFST:	set	0
5246                     ; 1615     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5248                     ; 1616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5250                     ; 1618     if (TIM1_Channel == TIM1_CHANNEL_1)
5252  05a4 9e            	ld	a,xh
5253  05a5 4d            	tnz	a
5254  05a6 2610          	jrne	L7262
5255                     ; 1621         if (NewState != DISABLE)
5257  05a8 9f            	ld	a,xl
5258  05a9 4d            	tnz	a
5259  05aa 2706          	jreq	L1362
5260                     ; 1623             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5262  05ac 7210525c      	bset	21084,#0
5264  05b0 2040          	jra	L5362
5265  05b2               L1362:
5266                     ; 1627             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5268  05b2 7211525c      	bres	21084,#0
5269  05b6 203a          	jra	L5362
5270  05b8               L7262:
5271                     ; 1631     else if (TIM1_Channel == TIM1_CHANNEL_2)
5273  05b8 7b01          	ld	a,(OFST+1,sp)
5274  05ba a101          	cp	a,#1
5275  05bc 2610          	jrne	L7362
5276                     ; 1634         if (NewState != DISABLE)
5278  05be 0d02          	tnz	(OFST+2,sp)
5279  05c0 2706          	jreq	L1462
5280                     ; 1636             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5282  05c2 7218525c      	bset	21084,#4
5284  05c6 202a          	jra	L5362
5285  05c8               L1462:
5286                     ; 1640             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5288  05c8 7219525c      	bres	21084,#4
5289  05cc 2024          	jra	L5362
5290  05ce               L7362:
5291                     ; 1643     else if (TIM1_Channel == TIM1_CHANNEL_3)
5293  05ce 7b01          	ld	a,(OFST+1,sp)
5294  05d0 a102          	cp	a,#2
5295  05d2 2610          	jrne	L7462
5296                     ; 1646         if (NewState != DISABLE)
5298  05d4 0d02          	tnz	(OFST+2,sp)
5299  05d6 2706          	jreq	L1562
5300                     ; 1648             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5302  05d8 7210525d      	bset	21085,#0
5304  05dc 2014          	jra	L5362
5305  05de               L1562:
5306                     ; 1652             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5308  05de 7211525d      	bres	21085,#0
5309  05e2 200e          	jra	L5362
5310  05e4               L7462:
5311                     ; 1658         if (NewState != DISABLE)
5313  05e4 0d02          	tnz	(OFST+2,sp)
5314  05e6 2706          	jreq	L7562
5315                     ; 1660             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5317  05e8 7218525d      	bset	21085,#4
5319  05ec 2004          	jra	L5362
5320  05ee               L7562:
5321                     ; 1664             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5323  05ee 7219525d      	bres	21085,#4
5324  05f2               L5362:
5325                     ; 1667 }
5328  05f2 85            	popw	x
5329  05f3 81            	ret
5374                     ; 1680 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5374                     ; 1681 {
5375                     	switch	.text
5376  05f4               _TIM1_CCxNCmd:
5378  05f4 89            	pushw	x
5379       00000000      OFST:	set	0
5382                     ; 1683     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5384                     ; 1684     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5386                     ; 1686     if (TIM1_Channel == TIM1_CHANNEL_1)
5388  05f5 9e            	ld	a,xh
5389  05f6 4d            	tnz	a
5390  05f7 2610          	jrne	L5072
5391                     ; 1689         if (NewState != DISABLE)
5393  05f9 9f            	ld	a,xl
5394  05fa 4d            	tnz	a
5395  05fb 2706          	jreq	L7072
5396                     ; 1691             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5398  05fd 7214525c      	bset	21084,#2
5400  0601 202a          	jra	L3172
5401  0603               L7072:
5402                     ; 1695             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5404  0603 7215525c      	bres	21084,#2
5405  0607 2024          	jra	L3172
5406  0609               L5072:
5407                     ; 1698     else if (TIM1_Channel == TIM1_CHANNEL_2)
5409  0609 7b01          	ld	a,(OFST+1,sp)
5410  060b a101          	cp	a,#1
5411  060d 2610          	jrne	L5172
5412                     ; 1701         if (NewState != DISABLE)
5414  060f 0d02          	tnz	(OFST+2,sp)
5415  0611 2706          	jreq	L7172
5416                     ; 1703             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5418  0613 721c525c      	bset	21084,#6
5420  0617 2014          	jra	L3172
5421  0619               L7172:
5422                     ; 1707             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5424  0619 721d525c      	bres	21084,#6
5425  061d 200e          	jra	L3172
5426  061f               L5172:
5427                     ; 1713         if (NewState != DISABLE)
5429  061f 0d02          	tnz	(OFST+2,sp)
5430  0621 2706          	jreq	L5272
5431                     ; 1715             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5433  0623 7214525d      	bset	21085,#2
5435  0627 2004          	jra	L3172
5436  0629               L5272:
5437                     ; 1719             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5439  0629 7215525d      	bres	21085,#2
5440  062d               L3172:
5441                     ; 1722 }
5444  062d 85            	popw	x
5445  062e 81            	ret
5490                     ; 1746 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5490                     ; 1747 {
5491                     	switch	.text
5492  062f               _TIM1_SelectOCxM:
5494  062f 89            	pushw	x
5495       00000000      OFST:	set	0
5498                     ; 1749     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5500                     ; 1750     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5502                     ; 1752     if (TIM1_Channel == TIM1_CHANNEL_1)
5504  0630 9e            	ld	a,xh
5505  0631 4d            	tnz	a
5506  0632 2610          	jrne	L3572
5507                     ; 1755         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5509  0634 7211525c      	bres	21084,#0
5510                     ; 1758         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5510                     ; 1759                                 | (uint8_t)TIM1_OCMode);
5512  0638 c65258        	ld	a,21080
5513  063b a48f          	and	a,#143
5514  063d 1a02          	or	a,(OFST+2,sp)
5515  063f c75258        	ld	21080,a
5517  0642 203a          	jra	L5572
5518  0644               L3572:
5519                     ; 1761     else if (TIM1_Channel == TIM1_CHANNEL_2)
5521  0644 7b01          	ld	a,(OFST+1,sp)
5522  0646 a101          	cp	a,#1
5523  0648 2610          	jrne	L7572
5524                     ; 1764         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5526  064a 7219525c      	bres	21084,#4
5527                     ; 1767         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5527                     ; 1768                                 | (uint8_t)TIM1_OCMode);
5529  064e c65259        	ld	a,21081
5530  0651 a48f          	and	a,#143
5531  0653 1a02          	or	a,(OFST+2,sp)
5532  0655 c75259        	ld	21081,a
5534  0658 2024          	jra	L5572
5535  065a               L7572:
5536                     ; 1770     else if (TIM1_Channel == TIM1_CHANNEL_3)
5538  065a 7b01          	ld	a,(OFST+1,sp)
5539  065c a102          	cp	a,#2
5540  065e 2610          	jrne	L3672
5541                     ; 1773         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5543  0660 7211525d      	bres	21085,#0
5544                     ; 1776         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5544                     ; 1777                                 | (uint8_t)TIM1_OCMode);
5546  0664 c6525a        	ld	a,21082
5547  0667 a48f          	and	a,#143
5548  0669 1a02          	or	a,(OFST+2,sp)
5549  066b c7525a        	ld	21082,a
5551  066e 200e          	jra	L5572
5552  0670               L3672:
5553                     ; 1782         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5555  0670 7219525d      	bres	21085,#4
5556                     ; 1785         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5556                     ; 1786                                 | (uint8_t)TIM1_OCMode);
5558  0674 c6525b        	ld	a,21083
5559  0677 a48f          	and	a,#143
5560  0679 1a02          	or	a,(OFST+2,sp)
5561  067b c7525b        	ld	21083,a
5562  067e               L5572:
5563                     ; 1788 }
5566  067e 85            	popw	x
5567  067f 81            	ret
5601                     ; 1797 void TIM1_SetCounter(uint16_t Counter)
5601                     ; 1798 {
5602                     	switch	.text
5603  0680               _TIM1_SetCounter:
5607                     ; 1800     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5609  0680 9e            	ld	a,xh
5610  0681 c7525e        	ld	21086,a
5611                     ; 1801     TIM1->CNTRL = (uint8_t)(Counter);
5613  0684 9f            	ld	a,xl
5614  0685 c7525f        	ld	21087,a
5615                     ; 1803 }
5618  0688 81            	ret
5652                     ; 1812 void TIM1_SetAutoreload(uint16_t Autoreload)
5652                     ; 1813 {
5653                     	switch	.text
5654  0689               _TIM1_SetAutoreload:
5658                     ; 1816     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5660  0689 9e            	ld	a,xh
5661  068a c75262        	ld	21090,a
5662                     ; 1817     TIM1->ARRL = (uint8_t)(Autoreload);
5664  068d 9f            	ld	a,xl
5665  068e c75263        	ld	21091,a
5666                     ; 1819 }
5669  0691 81            	ret
5703                     ; 1828 void TIM1_SetCompare1(uint16_t Compare1)
5703                     ; 1829 {
5704                     	switch	.text
5705  0692               _TIM1_SetCompare1:
5709                     ; 1831     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5711  0692 9e            	ld	a,xh
5712  0693 c75265        	ld	21093,a
5713                     ; 1832     TIM1->CCR1L = (uint8_t)(Compare1);
5715  0696 9f            	ld	a,xl
5716  0697 c75266        	ld	21094,a
5717                     ; 1834 }
5720  069a 81            	ret
5754                     ; 1843 void TIM1_SetCompare2(uint16_t Compare2)
5754                     ; 1844 {
5755                     	switch	.text
5756  069b               _TIM1_SetCompare2:
5760                     ; 1846     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5762  069b 9e            	ld	a,xh
5763  069c c75267        	ld	21095,a
5764                     ; 1847     TIM1->CCR2L = (uint8_t)(Compare2);
5766  069f 9f            	ld	a,xl
5767  06a0 c75268        	ld	21096,a
5768                     ; 1849 }
5771  06a3 81            	ret
5805                     ; 1858 void TIM1_SetCompare3(uint16_t Compare3)
5805                     ; 1859 {
5806                     	switch	.text
5807  06a4               _TIM1_SetCompare3:
5811                     ; 1861     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5813  06a4 9e            	ld	a,xh
5814  06a5 c75269        	ld	21097,a
5815                     ; 1862     TIM1->CCR3L = (uint8_t)(Compare3);
5817  06a8 9f            	ld	a,xl
5818  06a9 c7526a        	ld	21098,a
5819                     ; 1864 }
5822  06ac 81            	ret
5856                     ; 1873 void TIM1_SetCompare4(uint16_t Compare4)
5856                     ; 1874 {
5857                     	switch	.text
5858  06ad               _TIM1_SetCompare4:
5862                     ; 1876     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5864  06ad 9e            	ld	a,xh
5865  06ae c7526b        	ld	21099,a
5866                     ; 1877     TIM1->CCR4L = (uint8_t)(Compare4);
5868  06b1 9f            	ld	a,xl
5869  06b2 c7526c        	ld	21100,a
5870                     ; 1878 }
5873  06b5 81            	ret
5909                     ; 1891 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5909                     ; 1892 {
5910                     	switch	.text
5911  06b6               _TIM1_SetIC1Prescaler:
5913  06b6 88            	push	a
5914       00000000      OFST:	set	0
5917                     ; 1894     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5919                     ; 1897     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5919                     ; 1898                             | (uint8_t)TIM1_IC1Prescaler);
5921  06b7 c65258        	ld	a,21080
5922  06ba a4f3          	and	a,#243
5923  06bc 1a01          	or	a,(OFST+1,sp)
5924  06be c75258        	ld	21080,a
5925                     ; 1900 }
5928  06c1 84            	pop	a
5929  06c2 81            	ret
5965                     ; 1912 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5965                     ; 1913 {
5966                     	switch	.text
5967  06c3               _TIM1_SetIC2Prescaler:
5969  06c3 88            	push	a
5970       00000000      OFST:	set	0
5973                     ; 1916     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5975                     ; 1919     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5975                     ; 1920                             | (uint8_t)TIM1_IC2Prescaler);
5977  06c4 c65259        	ld	a,21081
5978  06c7 a4f3          	and	a,#243
5979  06c9 1a01          	or	a,(OFST+1,sp)
5980  06cb c75259        	ld	21081,a
5981                     ; 1921 }
5984  06ce 84            	pop	a
5985  06cf 81            	ret
6021                     ; 1934 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6021                     ; 1935 {
6022                     	switch	.text
6023  06d0               _TIM1_SetIC3Prescaler:
6025  06d0 88            	push	a
6026       00000000      OFST:	set	0
6029                     ; 1938     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6031                     ; 1941     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6031                     ; 1942                             (uint8_t)TIM1_IC3Prescaler);
6033  06d1 c6525a        	ld	a,21082
6034  06d4 a4f3          	and	a,#243
6035  06d6 1a01          	or	a,(OFST+1,sp)
6036  06d8 c7525a        	ld	21082,a
6037                     ; 1943 }
6040  06db 84            	pop	a
6041  06dc 81            	ret
6077                     ; 1955 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6077                     ; 1956 {
6078                     	switch	.text
6079  06dd               _TIM1_SetIC4Prescaler:
6081  06dd 88            	push	a
6082       00000000      OFST:	set	0
6085                     ; 1959     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6087                     ; 1962     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6087                     ; 1963                             (uint8_t)TIM1_IC4Prescaler);
6089  06de c6525b        	ld	a,21083
6090  06e1 a4f3          	and	a,#243
6091  06e3 1a01          	or	a,(OFST+1,sp)
6092  06e5 c7525b        	ld	21083,a
6093                     ; 1964 }
6096  06e8 84            	pop	a
6097  06e9 81            	ret
6149                     ; 1971 uint16_t TIM1_GetCapture1(void)
6149                     ; 1972 {
6150                     	switch	.text
6151  06ea               _TIM1_GetCapture1:
6153  06ea 5204          	subw	sp,#4
6154       00000004      OFST:	set	4
6157                     ; 1975     uint16_t tmpccr1 = 0;
6159                     ; 1976     uint8_t tmpccr1l=0, tmpccr1h=0;
6163                     ; 1978     tmpccr1h = TIM1->CCR1H;
6165  06ec c65265        	ld	a,21093
6166  06ef 6b02          	ld	(OFST-2,sp),a
6168                     ; 1979     tmpccr1l = TIM1->CCR1L;
6170  06f1 c65266        	ld	a,21094
6171  06f4 6b01          	ld	(OFST-3,sp),a
6173                     ; 1981     tmpccr1 = (uint16_t)(tmpccr1l);
6175  06f6 7b01          	ld	a,(OFST-3,sp)
6176  06f8 5f            	clrw	x
6177  06f9 97            	ld	xl,a
6178  06fa 1f03          	ldw	(OFST-1,sp),x
6180                     ; 1982     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6182  06fc 7b02          	ld	a,(OFST-2,sp)
6183  06fe 5f            	clrw	x
6184  06ff 97            	ld	xl,a
6185  0700 4f            	clr	a
6186  0701 02            	rlwa	x,a
6187  0702 01            	rrwa	x,a
6188  0703 1a04          	or	a,(OFST+0,sp)
6189  0705 01            	rrwa	x,a
6190  0706 1a03          	or	a,(OFST-1,sp)
6191  0708 01            	rrwa	x,a
6192  0709 1f03          	ldw	(OFST-1,sp),x
6194                     ; 1984     return (uint16_t)tmpccr1;
6196  070b 1e03          	ldw	x,(OFST-1,sp)
6199  070d 5b04          	addw	sp,#4
6200  070f 81            	ret
6252                     ; 1992 uint16_t TIM1_GetCapture2(void)
6252                     ; 1993 {
6253                     	switch	.text
6254  0710               _TIM1_GetCapture2:
6256  0710 5204          	subw	sp,#4
6257       00000004      OFST:	set	4
6260                     ; 1996     uint16_t tmpccr2 = 0;
6262                     ; 1997     uint8_t tmpccr2l=0, tmpccr2h=0;
6266                     ; 1999     tmpccr2h = TIM1->CCR2H;
6268  0712 c65267        	ld	a,21095
6269  0715 6b02          	ld	(OFST-2,sp),a
6271                     ; 2000     tmpccr2l = TIM1->CCR2L;
6273  0717 c65268        	ld	a,21096
6274  071a 6b01          	ld	(OFST-3,sp),a
6276                     ; 2002     tmpccr2 = (uint16_t)(tmpccr2l);
6278  071c 7b01          	ld	a,(OFST-3,sp)
6279  071e 5f            	clrw	x
6280  071f 97            	ld	xl,a
6281  0720 1f03          	ldw	(OFST-1,sp),x
6283                     ; 2003     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6285  0722 7b02          	ld	a,(OFST-2,sp)
6286  0724 5f            	clrw	x
6287  0725 97            	ld	xl,a
6288  0726 4f            	clr	a
6289  0727 02            	rlwa	x,a
6290  0728 01            	rrwa	x,a
6291  0729 1a04          	or	a,(OFST+0,sp)
6292  072b 01            	rrwa	x,a
6293  072c 1a03          	or	a,(OFST-1,sp)
6294  072e 01            	rrwa	x,a
6295  072f 1f03          	ldw	(OFST-1,sp),x
6297                     ; 2005     return (uint16_t)tmpccr2;
6299  0731 1e03          	ldw	x,(OFST-1,sp)
6302  0733 5b04          	addw	sp,#4
6303  0735 81            	ret
6355                     ; 2013 uint16_t TIM1_GetCapture3(void)
6355                     ; 2014 {
6356                     	switch	.text
6357  0736               _TIM1_GetCapture3:
6359  0736 5204          	subw	sp,#4
6360       00000004      OFST:	set	4
6363                     ; 2016     uint16_t tmpccr3 = 0;
6365                     ; 2017     uint8_t tmpccr3l=0, tmpccr3h=0;
6369                     ; 2019     tmpccr3h = TIM1->CCR3H;
6371  0738 c65269        	ld	a,21097
6372  073b 6b02          	ld	(OFST-2,sp),a
6374                     ; 2020     tmpccr3l = TIM1->CCR3L;
6376  073d c6526a        	ld	a,21098
6377  0740 6b01          	ld	(OFST-3,sp),a
6379                     ; 2022     tmpccr3 = (uint16_t)(tmpccr3l);
6381  0742 7b01          	ld	a,(OFST-3,sp)
6382  0744 5f            	clrw	x
6383  0745 97            	ld	xl,a
6384  0746 1f03          	ldw	(OFST-1,sp),x
6386                     ; 2023     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6388  0748 7b02          	ld	a,(OFST-2,sp)
6389  074a 5f            	clrw	x
6390  074b 97            	ld	xl,a
6391  074c 4f            	clr	a
6392  074d 02            	rlwa	x,a
6393  074e 01            	rrwa	x,a
6394  074f 1a04          	or	a,(OFST+0,sp)
6395  0751 01            	rrwa	x,a
6396  0752 1a03          	or	a,(OFST-1,sp)
6397  0754 01            	rrwa	x,a
6398  0755 1f03          	ldw	(OFST-1,sp),x
6400                     ; 2025     return (uint16_t)tmpccr3;
6402  0757 1e03          	ldw	x,(OFST-1,sp)
6405  0759 5b04          	addw	sp,#4
6406  075b 81            	ret
6458                     ; 2033 uint16_t TIM1_GetCapture4(void)
6458                     ; 2034 {
6459                     	switch	.text
6460  075c               _TIM1_GetCapture4:
6462  075c 5204          	subw	sp,#4
6463       00000004      OFST:	set	4
6466                     ; 2036     uint16_t tmpccr4 = 0;
6468                     ; 2037     uint8_t tmpccr4l=0, tmpccr4h=0;
6472                     ; 2039     tmpccr4h = TIM1->CCR4H;
6474  075e c6526b        	ld	a,21099
6475  0761 6b02          	ld	(OFST-2,sp),a
6477                     ; 2040     tmpccr4l = TIM1->CCR4L;
6479  0763 c6526c        	ld	a,21100
6480  0766 6b01          	ld	(OFST-3,sp),a
6482                     ; 2042     tmpccr4 = (uint16_t)(tmpccr4l);
6484  0768 7b01          	ld	a,(OFST-3,sp)
6485  076a 5f            	clrw	x
6486  076b 97            	ld	xl,a
6487  076c 1f03          	ldw	(OFST-1,sp),x
6489                     ; 2043     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6491  076e 7b02          	ld	a,(OFST-2,sp)
6492  0770 5f            	clrw	x
6493  0771 97            	ld	xl,a
6494  0772 4f            	clr	a
6495  0773 02            	rlwa	x,a
6496  0774 01            	rrwa	x,a
6497  0775 1a04          	or	a,(OFST+0,sp)
6498  0777 01            	rrwa	x,a
6499  0778 1a03          	or	a,(OFST-1,sp)
6500  077a 01            	rrwa	x,a
6501  077b 1f03          	ldw	(OFST-1,sp),x
6503                     ; 2045     return (uint16_t)tmpccr4;
6505  077d 1e03          	ldw	x,(OFST-1,sp)
6508  077f 5b04          	addw	sp,#4
6509  0781 81            	ret
6543                     ; 2053 uint16_t TIM1_GetCounter(void)
6543                     ; 2054 {
6544                     	switch	.text
6545  0782               _TIM1_GetCounter:
6547  0782 89            	pushw	x
6548       00000002      OFST:	set	2
6551                     ; 2055   uint16_t tmpcntr = 0;
6553                     ; 2057   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6555  0783 c6525e        	ld	a,21086
6556  0786 5f            	clrw	x
6557  0787 97            	ld	xl,a
6558  0788 4f            	clr	a
6559  0789 02            	rlwa	x,a
6560  078a 1f01          	ldw	(OFST-1,sp),x
6562                     ; 2060     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6564  078c c6525f        	ld	a,21087
6565  078f 5f            	clrw	x
6566  0790 97            	ld	xl,a
6567  0791 01            	rrwa	x,a
6568  0792 1a02          	or	a,(OFST+0,sp)
6569  0794 01            	rrwa	x,a
6570  0795 1a01          	or	a,(OFST-1,sp)
6571  0797 01            	rrwa	x,a
6574  0798 5b02          	addw	sp,#2
6575  079a 81            	ret
6609                     ; 2068 uint16_t TIM1_GetPrescaler(void)
6609                     ; 2069 {
6610                     	switch	.text
6611  079b               _TIM1_GetPrescaler:
6613  079b 89            	pushw	x
6614       00000002      OFST:	set	2
6617                     ; 2070    uint16_t temp = 0;
6619                     ; 2072    temp = ((uint16_t)TIM1->PSCRH << 8);
6621  079c c65260        	ld	a,21088
6622  079f 5f            	clrw	x
6623  07a0 97            	ld	xl,a
6624  07a1 4f            	clr	a
6625  07a2 02            	rlwa	x,a
6626  07a3 1f01          	ldw	(OFST-1,sp),x
6628                     ; 2075     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6630  07a5 c65261        	ld	a,21089
6631  07a8 5f            	clrw	x
6632  07a9 97            	ld	xl,a
6633  07aa 01            	rrwa	x,a
6634  07ab 1a02          	or	a,(OFST+0,sp)
6635  07ad 01            	rrwa	x,a
6636  07ae 1a01          	or	a,(OFST-1,sp)
6637  07b0 01            	rrwa	x,a
6640  07b1 5b02          	addw	sp,#2
6641  07b3 81            	ret
6815                     ; 2096 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6815                     ; 2097 {
6816                     	switch	.text
6817  07b4               _TIM1_GetFlagStatus:
6819  07b4 89            	pushw	x
6820  07b5 89            	pushw	x
6821       00000002      OFST:	set	2
6824                     ; 2098     FlagStatus bitstatus = RESET;
6826                     ; 2099     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6830                     ; 2102     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6832                     ; 2104     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6834  07b6 9f            	ld	a,xl
6835  07b7 c45255        	and	a,21077
6836  07ba 6b01          	ld	(OFST-1,sp),a
6838                     ; 2105     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6840  07bc 7b03          	ld	a,(OFST+1,sp)
6841  07be 6b02          	ld	(OFST+0,sp),a
6843                     ; 2107     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6845  07c0 c65256        	ld	a,21078
6846  07c3 1402          	and	a,(OFST+0,sp)
6847  07c5 1a01          	or	a,(OFST-1,sp)
6848  07c7 2706          	jreq	L5643
6849                     ; 2109         bitstatus = SET;
6851  07c9 a601          	ld	a,#1
6852  07cb 6b02          	ld	(OFST+0,sp),a
6855  07cd 2002          	jra	L7643
6856  07cf               L5643:
6857                     ; 2113         bitstatus = RESET;
6859  07cf 0f02          	clr	(OFST+0,sp)
6861  07d1               L7643:
6862                     ; 2115     return (FlagStatus)(bitstatus);
6864  07d1 7b02          	ld	a,(OFST+0,sp)
6867  07d3 5b04          	addw	sp,#4
6868  07d5 81            	ret
6903                     ; 2136 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6903                     ; 2137 {
6904                     	switch	.text
6905  07d6               _TIM1_ClearFlag:
6907  07d6 89            	pushw	x
6908       00000000      OFST:	set	0
6911                     ; 2139     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6913                     ; 2142     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6915  07d7 9f            	ld	a,xl
6916  07d8 43            	cpl	a
6917  07d9 c75255        	ld	21077,a
6918                     ; 2143     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6918                     ; 2144                           (uint8_t)0x1E);
6920  07dc 7b01          	ld	a,(OFST+1,sp)
6921  07de 43            	cpl	a
6922  07df a41e          	and	a,#30
6923  07e1 c75256        	ld	21078,a
6924                     ; 2145 }
6927  07e4 85            	popw	x
6928  07e5 81            	ret
6992                     ; 2161 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6992                     ; 2162 {
6993                     	switch	.text
6994  07e6               _TIM1_GetITStatus:
6996  07e6 88            	push	a
6997  07e7 89            	pushw	x
6998       00000002      OFST:	set	2
7001                     ; 2163     ITStatus bitstatus = RESET;
7003                     ; 2164     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7007                     ; 2167     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7009                     ; 2169     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7011  07e8 c45255        	and	a,21077
7012  07eb 6b01          	ld	(OFST-1,sp),a
7014                     ; 2171     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7016  07ed c65254        	ld	a,21076
7017  07f0 1403          	and	a,(OFST+1,sp)
7018  07f2 6b02          	ld	(OFST+0,sp),a
7020                     ; 2173     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7022  07f4 0d01          	tnz	(OFST-1,sp)
7023  07f6 270a          	jreq	L1453
7025  07f8 0d02          	tnz	(OFST+0,sp)
7026  07fa 2706          	jreq	L1453
7027                     ; 2175         bitstatus = SET;
7029  07fc a601          	ld	a,#1
7030  07fe 6b02          	ld	(OFST+0,sp),a
7033  0800 2002          	jra	L3453
7034  0802               L1453:
7035                     ; 2179         bitstatus = RESET;
7037  0802 0f02          	clr	(OFST+0,sp)
7039  0804               L3453:
7040                     ; 2181     return (ITStatus)(bitstatus);
7042  0804 7b02          	ld	a,(OFST+0,sp)
7045  0806 5b03          	addw	sp,#3
7046  0808 81            	ret
7082                     ; 2198 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7082                     ; 2199 {
7083                     	switch	.text
7084  0809               _TIM1_ClearITPendingBit:
7088                     ; 2201     assert_param(IS_TIM1_IT_OK(TIM1_IT));
7090                     ; 2204     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7092  0809 43            	cpl	a
7093  080a c75255        	ld	21077,a
7094                     ; 2205 }
7097  080d 81            	ret
7149                     ; 2223 static void TI1_Config(uint8_t TIM1_ICPolarity,
7149                     ; 2224                        uint8_t TIM1_ICSelection,
7149                     ; 2225                        uint8_t TIM1_ICFilter)
7149                     ; 2226 {
7150                     	switch	.text
7151  080e               L3_TI1_Config:
7153  080e 89            	pushw	x
7154  080f 88            	push	a
7155       00000001      OFST:	set	1
7158                     ; 2229     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7160  0810 7211525c      	bres	21084,#0
7161                     ; 2232     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7161                     ; 2233                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7163  0814 7b06          	ld	a,(OFST+5,sp)
7164  0816 97            	ld	xl,a
7165  0817 a610          	ld	a,#16
7166  0819 42            	mul	x,a
7167  081a 9f            	ld	a,xl
7168  081b 1a03          	or	a,(OFST+2,sp)
7169  081d 6b01          	ld	(OFST+0,sp),a
7171  081f c65258        	ld	a,21080
7172  0822 a40c          	and	a,#12
7173  0824 1a01          	or	a,(OFST+0,sp)
7174  0826 c75258        	ld	21080,a
7175                     ; 2236     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7177  0829 0d02          	tnz	(OFST+1,sp)
7178  082b 2706          	jreq	L1163
7179                     ; 2238         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7181  082d 7212525c      	bset	21084,#1
7183  0831 2004          	jra	L3163
7184  0833               L1163:
7185                     ; 2242         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7187  0833 7213525c      	bres	21084,#1
7188  0837               L3163:
7189                     ; 2246     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7191  0837 7210525c      	bset	21084,#0
7192                     ; 2247 }
7195  083b 5b03          	addw	sp,#3
7196  083d 81            	ret
7248                     ; 2265 static void TI2_Config(uint8_t TIM1_ICPolarity,
7248                     ; 2266                        uint8_t TIM1_ICSelection,
7248                     ; 2267                        uint8_t TIM1_ICFilter)
7248                     ; 2268 {
7249                     	switch	.text
7250  083e               L5_TI2_Config:
7252  083e 89            	pushw	x
7253  083f 88            	push	a
7254       00000001      OFST:	set	1
7257                     ; 2270     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7259  0840 7219525c      	bres	21084,#4
7260                     ; 2273     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7260                     ; 2274                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7262  0844 7b06          	ld	a,(OFST+5,sp)
7263  0846 97            	ld	xl,a
7264  0847 a610          	ld	a,#16
7265  0849 42            	mul	x,a
7266  084a 9f            	ld	a,xl
7267  084b 1a03          	or	a,(OFST+2,sp)
7268  084d 6b01          	ld	(OFST+0,sp),a
7270  084f c65259        	ld	a,21081
7271  0852 a40c          	and	a,#12
7272  0854 1a01          	or	a,(OFST+0,sp)
7273  0856 c75259        	ld	21081,a
7274                     ; 2276     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7276  0859 0d02          	tnz	(OFST+1,sp)
7277  085b 2706          	jreq	L3463
7278                     ; 2278         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7280  085d 721a525c      	bset	21084,#5
7282  0861 2004          	jra	L5463
7283  0863               L3463:
7284                     ; 2282         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7286  0863 721b525c      	bres	21084,#5
7287  0867               L5463:
7288                     ; 2285     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7290  0867 7218525c      	bset	21084,#4
7291                     ; 2286 }
7294  086b 5b03          	addw	sp,#3
7295  086d 81            	ret
7347                     ; 2304 static void TI3_Config(uint8_t TIM1_ICPolarity,
7347                     ; 2305                        uint8_t TIM1_ICSelection,
7347                     ; 2306                        uint8_t TIM1_ICFilter)
7347                     ; 2307 {
7348                     	switch	.text
7349  086e               L7_TI3_Config:
7351  086e 89            	pushw	x
7352  086f 88            	push	a
7353       00000001      OFST:	set	1
7356                     ; 2309     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7358  0870 7211525d      	bres	21085,#0
7359                     ; 2312     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7359                     ; 2313                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7361  0874 7b06          	ld	a,(OFST+5,sp)
7362  0876 97            	ld	xl,a
7363  0877 a610          	ld	a,#16
7364  0879 42            	mul	x,a
7365  087a 9f            	ld	a,xl
7366  087b 1a03          	or	a,(OFST+2,sp)
7367  087d 6b01          	ld	(OFST+0,sp),a
7369  087f c6525a        	ld	a,21082
7370  0882 a40c          	and	a,#12
7371  0884 1a01          	or	a,(OFST+0,sp)
7372  0886 c7525a        	ld	21082,a
7373                     ; 2316     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7375  0889 0d02          	tnz	(OFST+1,sp)
7376  088b 2706          	jreq	L5763
7377                     ; 2318         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7379  088d 7212525d      	bset	21085,#1
7381  0891 2004          	jra	L7763
7382  0893               L5763:
7383                     ; 2322         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7385  0893 7213525d      	bres	21085,#1
7386  0897               L7763:
7387                     ; 2325     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7389  0897 7210525d      	bset	21085,#0
7390                     ; 2326 }
7393  089b 5b03          	addw	sp,#3
7394  089d 81            	ret
7446                     ; 2345 static void TI4_Config(uint8_t TIM1_ICPolarity,
7446                     ; 2346                        uint8_t TIM1_ICSelection,
7446                     ; 2347                        uint8_t TIM1_ICFilter)
7446                     ; 2348 {
7447                     	switch	.text
7448  089e               L11_TI4_Config:
7450  089e 89            	pushw	x
7451  089f 88            	push	a
7452       00000001      OFST:	set	1
7455                     ; 2351     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7457  08a0 7219525d      	bres	21085,#4
7458                     ; 2354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7458                     ; 2355                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7460  08a4 7b06          	ld	a,(OFST+5,sp)
7461  08a6 97            	ld	xl,a
7462  08a7 a610          	ld	a,#16
7463  08a9 42            	mul	x,a
7464  08aa 9f            	ld	a,xl
7465  08ab 1a03          	or	a,(OFST+2,sp)
7466  08ad 6b01          	ld	(OFST+0,sp),a
7468  08af c6525b        	ld	a,21083
7469  08b2 a40c          	and	a,#12
7470  08b4 1a01          	or	a,(OFST+0,sp)
7471  08b6 c7525b        	ld	21083,a
7472                     ; 2358     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7474  08b9 0d02          	tnz	(OFST+1,sp)
7475  08bb 2706          	jreq	L7273
7476                     ; 2360         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7478  08bd 721a525d      	bset	21085,#5
7480  08c1 2004          	jra	L1373
7481  08c3               L7273:
7482                     ; 2364         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7484  08c3 721b525d      	bres	21085,#5
7485  08c7               L1373:
7486                     ; 2368     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7488  08c7 7218525d      	bset	21085,#4
7489                     ; 2369 }
7492  08cb 5b03          	addw	sp,#3
7493  08cd 81            	ret
7506                     	xdef	_TIM1_ClearITPendingBit
7507                     	xdef	_TIM1_GetITStatus
7508                     	xdef	_TIM1_ClearFlag
7509                     	xdef	_TIM1_GetFlagStatus
7510                     	xdef	_TIM1_GetPrescaler
7511                     	xdef	_TIM1_GetCounter
7512                     	xdef	_TIM1_GetCapture4
7513                     	xdef	_TIM1_GetCapture3
7514                     	xdef	_TIM1_GetCapture2
7515                     	xdef	_TIM1_GetCapture1
7516                     	xdef	_TIM1_SetIC4Prescaler
7517                     	xdef	_TIM1_SetIC3Prescaler
7518                     	xdef	_TIM1_SetIC2Prescaler
7519                     	xdef	_TIM1_SetIC1Prescaler
7520                     	xdef	_TIM1_SetCompare4
7521                     	xdef	_TIM1_SetCompare3
7522                     	xdef	_TIM1_SetCompare2
7523                     	xdef	_TIM1_SetCompare1
7524                     	xdef	_TIM1_SetAutoreload
7525                     	xdef	_TIM1_SetCounter
7526                     	xdef	_TIM1_SelectOCxM
7527                     	xdef	_TIM1_CCxNCmd
7528                     	xdef	_TIM1_CCxCmd
7529                     	xdef	_TIM1_OC4PolarityConfig
7530                     	xdef	_TIM1_OC3NPolarityConfig
7531                     	xdef	_TIM1_OC3PolarityConfig
7532                     	xdef	_TIM1_OC2NPolarityConfig
7533                     	xdef	_TIM1_OC2PolarityConfig
7534                     	xdef	_TIM1_OC1NPolarityConfig
7535                     	xdef	_TIM1_OC1PolarityConfig
7536                     	xdef	_TIM1_GenerateEvent
7537                     	xdef	_TIM1_OC4FastConfig
7538                     	xdef	_TIM1_OC3FastConfig
7539                     	xdef	_TIM1_OC2FastConfig
7540                     	xdef	_TIM1_OC1FastConfig
7541                     	xdef	_TIM1_OC4PreloadConfig
7542                     	xdef	_TIM1_OC3PreloadConfig
7543                     	xdef	_TIM1_OC2PreloadConfig
7544                     	xdef	_TIM1_OC1PreloadConfig
7545                     	xdef	_TIM1_CCPreloadControl
7546                     	xdef	_TIM1_SelectCOM
7547                     	xdef	_TIM1_ARRPreloadConfig
7548                     	xdef	_TIM1_ForcedOC4Config
7549                     	xdef	_TIM1_ForcedOC3Config
7550                     	xdef	_TIM1_ForcedOC2Config
7551                     	xdef	_TIM1_ForcedOC1Config
7552                     	xdef	_TIM1_CounterModeConfig
7553                     	xdef	_TIM1_PrescalerConfig
7554                     	xdef	_TIM1_EncoderInterfaceConfig
7555                     	xdef	_TIM1_SelectMasterSlaveMode
7556                     	xdef	_TIM1_SelectSlaveMode
7557                     	xdef	_TIM1_SelectOutputTrigger
7558                     	xdef	_TIM1_SelectOnePulseMode
7559                     	xdef	_TIM1_SelectHallSensor
7560                     	xdef	_TIM1_UpdateRequestConfig
7561                     	xdef	_TIM1_UpdateDisableConfig
7562                     	xdef	_TIM1_SelectInputTrigger
7563                     	xdef	_TIM1_TIxExternalClockConfig
7564                     	xdef	_TIM1_ETRConfig
7565                     	xdef	_TIM1_ETRClockMode2Config
7566                     	xdef	_TIM1_ETRClockMode1Config
7567                     	xdef	_TIM1_InternalClockConfig
7568                     	xdef	_TIM1_ITConfig
7569                     	xdef	_TIM1_CtrlPWMOutputs
7570                     	xdef	_TIM1_Cmd
7571                     	xdef	_TIM1_PWMIConfig
7572                     	xdef	_TIM1_ICInit
7573                     	xdef	_TIM1_BDTRConfig
7574                     	xdef	_TIM1_OC4Init
7575                     	xdef	_TIM1_OC3Init
7576                     	xdef	_TIM1_OC2Init
7577                     	xdef	_TIM1_OC1Init
7578                     	xdef	_TIM1_TimeBaseInit
7579                     	xdef	_TIM1_DeInit
7598                     	end
