   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  53                     ; 12 @far @interrupt void NonHandledInterrupt (void)
  53                     ; 13 {
  54                     .text:	section	.text,new
  55  0000               f_NonHandledInterrupt:
  59                     ; 17 	return;
  62  0000 80            	iret	
  64                     .const:	section	.text
  65  0000               __vectab:
  66  0000 82            	dc.b	130
  68  0001 00            	dc.b	page(__stext)
  69  0002 0000          	dc.w	__stext
  70  0004 82            	dc.b	130
  72  0005 00            	dc.b	page(f_NonHandledInterrupt)
  73  0006 0000          	dc.w	f_NonHandledInterrupt
  74  0008 82            	dc.b	130
  76  0009 00            	dc.b	page(f_NonHandledInterrupt)
  77  000a 0000          	dc.w	f_NonHandledInterrupt
  78  000c 82            	dc.b	130
  80  000d 00            	dc.b	page(f_NonHandledInterrupt)
  81  000e 0000          	dc.w	f_NonHandledInterrupt
  82  0010 82            	dc.b	130
  84  0011 00            	dc.b	page(f_NonHandledInterrupt)
  85  0012 0000          	dc.w	f_NonHandledInterrupt
  86  0014 82            	dc.b	130
  88  0015 00            	dc.b	page(f_NonHandledInterrupt)
  89  0016 0000          	dc.w	f_NonHandledInterrupt
  90  0018 82            	dc.b	130
  92  0019 00            	dc.b	page(f_NonHandledInterrupt)
  93  001a 0000          	dc.w	f_NonHandledInterrupt
  94  001c 82            	dc.b	130
  96  001d 00            	dc.b	page(f_NonHandledInterrupt)
  97  001e 0000          	dc.w	f_NonHandledInterrupt
  98  0020 82            	dc.b	130
 100  0021 00            	dc.b	page(f_NonHandledInterrupt)
 101  0022 0000          	dc.w	f_NonHandledInterrupt
 102  0024 82            	dc.b	130
 104  0025 00            	dc.b	page(f_NonHandledInterrupt)
 105  0026 0000          	dc.w	f_NonHandledInterrupt
 106  0028 82            	dc.b	130
 108  0029 00            	dc.b	page(f_NonHandledInterrupt)
 109  002a 0000          	dc.w	f_NonHandledInterrupt
 110  002c 82            	dc.b	130
 112  002d 00            	dc.b	page(f_NonHandledInterrupt)
 113  002e 0000          	dc.w	f_NonHandledInterrupt
 114  0030 82            	dc.b	130
 116  0031 00            	dc.b	page(f_NonHandledInterrupt)
 117  0032 0000          	dc.w	f_NonHandledInterrupt
 118  0034 82            	dc.b	130
 120  0035 00            	dc.b	page(f_NonHandledInterrupt)
 121  0036 0000          	dc.w	f_NonHandledInterrupt
 122  0038 82            	dc.b	130
 124  0039 00            	dc.b	page(f_NonHandledInterrupt)
 125  003a 0000          	dc.w	f_NonHandledInterrupt
 126  003c 82            	dc.b	130
 128  003d 00            	dc.b	page(f_NonHandledInterrupt)
 129  003e 0000          	dc.w	f_NonHandledInterrupt
 130  0040 82            	dc.b	130
 132  0041 00            	dc.b	page(f_NonHandledInterrupt)
 133  0042 0000          	dc.w	f_NonHandledInterrupt
 134  0044 82            	dc.b	130
 136  0045 00            	dc.b	page(f_NonHandledInterrupt)
 137  0046 0000          	dc.w	f_NonHandledInterrupt
 138  0048 82            	dc.b	130
 140  0049 00            	dc.b	page(f_NonHandledInterrupt)
 141  004a 0000          	dc.w	f_NonHandledInterrupt
 142  004c 82            	dc.b	130
 144  004d 00            	dc.b	page(f_NonHandledInterrupt)
 145  004e 0000          	dc.w	f_NonHandledInterrupt
 146  0050 82            	dc.b	130
 148  0051 00            	dc.b	page(f_NonHandledInterrupt)
 149  0052 0000          	dc.w	f_NonHandledInterrupt
 150  0054 82            	dc.b	130
 152  0055 00            	dc.b	page(f_NonHandledInterrupt)
 153  0056 0000          	dc.w	f_NonHandledInterrupt
 154  0058 82            	dc.b	130
 156  0059 00            	dc.b	page(f_NonHandledInterrupt)
 157  005a 0000          	dc.w	f_NonHandledInterrupt
 158  005c 82            	dc.b	130
 160  005d 00            	dc.b	page(f_NonHandledInterrupt)
 161  005e 0000          	dc.w	f_NonHandledInterrupt
 162  0060 82            	dc.b	130
 164  0061 00            	dc.b	page(f_NonHandledInterrupt)
 165  0062 0000          	dc.w	f_NonHandledInterrupt
 166  0064 82            	dc.b	130
 168  0065 00            	dc.b	page(f_NonHandledInterrupt)
 169  0066 0000          	dc.w	f_NonHandledInterrupt
 170  0068 82            	dc.b	130
 172  0069 00            	dc.b	page(f_NonHandledInterrupt)
 173  006a 0000          	dc.w	f_NonHandledInterrupt
 174  006c 82            	dc.b	130
 176  006d 00            	dc.b	page(f_NonHandledInterrupt)
 177  006e 0000          	dc.w	f_NonHandledInterrupt
 178  0070 82            	dc.b	130
 180  0071 00            	dc.b	page(f_NonHandledInterrupt)
 181  0072 0000          	dc.w	f_NonHandledInterrupt
 182  0074 82            	dc.b	130
 184  0075 00            	dc.b	page(f_NonHandledInterrupt)
 185  0076 0000          	dc.w	f_NonHandledInterrupt
 186  0078 82            	dc.b	130
 188  0079 00            	dc.b	page(f_NonHandledInterrupt)
 189  007a 0000          	dc.w	f_NonHandledInterrupt
 190  007c 82            	dc.b	130
 192  007d 00            	dc.b	page(f_NonHandledInterrupt)
 193  007e 0000          	dc.w	f_NonHandledInterrupt
 244                     	xdef	__vectab
 245                     	xref	__stext
 246                     	xdef	f_NonHandledInterrupt
 265                     	end
