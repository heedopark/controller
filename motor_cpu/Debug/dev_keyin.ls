   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  17                     	switch	.data
  18  0000               __key_sec:
  19  0000 00            	dc.b	0
  20  0001               __key_min:
  21  0001 00            	dc.b	0
  22  0002               __key_hour:
  23  0002 00            	dc.b	0
  24  0003               ___key2:
  25  0003 00            	dc.b	0
  26  0004               ___key_2:
  27  0004 00            	dc.b	0
  28  0005               __key_continue:
  29  0005 00            	dc.b	0
  92                     	xdef	__key_continue
  93                     	xdef	___key_2
  94                     	xdef	___key2
  95                     	xdef	__key_hour
  96                     	xdef	__key_min
  97                     	xdef	__key_sec
 116                     	end
