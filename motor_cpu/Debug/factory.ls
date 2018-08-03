   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  17                     	switch	.data
  18  0000               __fs:
  19  0000 00            	dc.b	0
  20  0001               __fs2:
  21  0001 00            	dc.b	0
  75                     ; 83 void	factory2wire(void)
  75                     ; 84 {
  77                     	switch	.text
  78  0000               _factory2wire:
  80  0000 5203          	subw	sp,#3
  81       00000003      OFST:	set	3
  84                     ; 87 	if( _io_head != _io_tail )
  86  0002 c60000        	ld	a,__io_head
  87  0005 c10000        	cp	a,__io_tail
  88  0008 2744          	jreq	L13
  89                     ; 89 		i = iouart_Ready();
  91  000a cd0000        	call	_iouart_Ready
  93  000d 6b01          	ld	(OFST-2,sp),a
  95                     ; 90 		if( i==1 )
  97  000f 7b01          	ld	a,(OFST-2,sp)
  98  0011 a101          	cp	a,#1
  99  0013 2639          	jrne	L13
 100                     ; 92 			p = iouart_getBuffer();
 102  0015 cd0000        	call	_iouart_getBuffer
 104  0018 1f02          	ldw	(OFST-1,sp),x
 106                     ; 93 			p[0] = 0x0;
 108  001a 1e02          	ldw	x,(OFST-1,sp)
 109  001c 7f            	clr	(x)
 110                     ; 94 			p[1] = 0x1;
 112  001d 1e02          	ldw	x,(OFST-1,sp)
 113  001f a601          	ld	a,#1
 114  0021 e701          	ld	(1,x),a
 115                     ; 95 			p[2] = 0x2;
 117  0023 1e02          	ldw	x,(OFST-1,sp)
 118  0025 a602          	ld	a,#2
 119  0027 e702          	ld	(2,x),a
 120                     ; 96 			p[3] = 0x3;
 122  0029 1e02          	ldw	x,(OFST-1,sp)
 123  002b a603          	ld	a,#3
 124  002d e703          	ld	(3,x),a
 125                     ; 97 			p[4] = 0x4;
 127  002f 1e02          	ldw	x,(OFST-1,sp)
 128  0031 a604          	ld	a,#4
 129  0033 e704          	ld	(4,x),a
 130                     ; 98 			p[5] = 0x5;
 132  0035 1e02          	ldw	x,(OFST-1,sp)
 133  0037 a605          	ld	a,#5
 134  0039 e705          	ld	(5,x),a
 135                     ; 99 			p[6] = 0x6;
 137  003b 1e02          	ldw	x,(OFST-1,sp)
 138  003d a606          	ld	a,#6
 139  003f e706          	ld	(6,x),a
 140                     ; 100 			p[7] = 0x15;
 142  0041 1e02          	ldw	x,(OFST-1,sp)
 143  0043 a615          	ld	a,#21
 144  0045 e707          	ld	(7,x),a
 145                     ; 101 			iouart_Set_Packet(0);
 147  0047 4f            	clr	a
 148  0048 cd0000        	call	_iouart_Set_Packet
 150                     ; 102 			iouart_Pkt_Start();
 152  004b cd0000        	call	_iouart_Pkt_Start
 154  004e               L13:
 155                     ; 153 }
 158  004e 5b03          	addw	sp,#3
 159  0050 81            	ret
 191                     ; 566 void	_factoryCntl(uint8_t i)
 191                     ; 567 {
 192                     	switch	.text
 193  0051               __factoryCntl:
 197                     ; 578 }
 200  0051 81            	ret
 233                     ; 841 uint8_t factory(uint8_t mode)
 233                     ; 842 {
 234                     	switch	.text
 235  0052               _factory:
 239                     ; 843 	timerCalc();
 241  0052 cd0000        	call	_timerCalc
 243                     ; 861 }
 246  0055 81            	ret
 285                     	xdef	_factory
 286                     	xdef	__factoryCntl
 287                     	xdef	_factory2wire
 288                     	xdef	__fs2
 289                     	xdef	__fs
 290                     	switch	.bss
 291  0000               ___f:
 292  0000 000000000000  	ds.b	8
 293                     	xdef	___f
 294                     	xref	_timerCalc
 295                     	xref	_iouart_getBuffer
 296                     	xref	_iouart_Ready
 297                     	xref	__io_tail
 298                     	xref	__io_head
 299                     	xref	_iouart_Pkt_Start
 300                     	xref	_iouart_Set_Packet
 320                     	end
