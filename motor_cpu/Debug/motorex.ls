   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  68                     ; 3 void	motorDriveMove1Phase(uint8_t phase)
  68                     ; 4 {
  70                     .text:	section	.text,new
  71  0000               _motorDriveMove1Phase:
  73  0000 88            	push	a
  74       00000000      OFST:	set	0
  77                     ; 5 	Drive.Phase = (Drive.Phase + phase) % 8;
  79  0001 c6000b        	ld	a,_Drive+11
  80  0004 5f            	clrw	x
  81  0005 1b01          	add	a,(OFST+1,sp)
  82  0007 59            	rlcw	x
  83  0008 02            	rlwa	x,a
  84  0009 a608          	ld	a,#8
  85  000b cd0000        	call	c_smodx
  87  000e 01            	rrwa	x,a
  88  000f c7000b        	ld	_Drive+11,a
  89                     ; 6 	switch(Drive.Phase)
  92                     ; 28 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
  93  0012 271e          	jreq	L3
  94  0014 4a            	dec	a
  95  0015 2726          	jreq	L5
  96  0017 4a            	dec	a
  97  0018 2738          	jreq	L7
  98  001a 4a            	dec	a
  99  001b 274d          	jreq	L11
 100  001d 4a            	dec	a
 101  001e 2757          	jreq	L31
 102  0020 4a            	dec	a
 103  0021 2761          	jreq	L51
 104  0023 4a            	dec	a
 105  0024 2603cc00ad    	jreq	L71
 106  0029 4a            	dec	a
 107  002a 2603cc00b8    	jreq	L12
 108  002f cc00e0        	jra	L74
 109  0032               L3:
 110                     ; 21 		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
 112  0032 3b0002        	push	_IO_X1+2
 113  0035 ce0000        	ldw	x,_IO_X1
 114  0038 cd0000        	call	_GPIO_WriteHigh
 124  003b 2009          	jp	LC005
 125  003d               L5:
 126                     ; 22 		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
 128  003d 3b0002        	push	_IO_X1+2
 129  0040 ce0000        	ldw	x,_IO_X1
 130  0043 cd0000        	call	_GPIO_WriteLow
 134  0046               LC005:
 135  0046 84            	pop	a
 137  0047 3b0002        	push	_IO_X2+2
 138  004a ce0000        	ldw	x,_IO_X2
 139  004d cd0000        	call	_GPIO_WriteLow
 147  0050 200c          	jp	LC004
 148  0052               L7:
 149                     ; 23 		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
 151  0052 cd00e2        	call	LC008
 154  0055 3b0002        	push	_IO_X2+2
 155  0058 ce0000        	ldw	x,_IO_X2
 156  005b cd0000        	call	_GPIO_WriteHigh
 160  005e               LC004:
 161  005e 84            	pop	a
 164  005f 3b0002        	push	_IO_Y1+2
 165  0062 ce0000        	ldw	x,_IO_Y1
 166  0065 cd0000        	call	_GPIO_WriteHigh
 172  0068 206b          	jp	LC002
 173  006a               L11:
 174                     ; 24 		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
 176  006a ad76          	call	LC008
 179  006c 3b0002        	push	_IO_X2+2
 180  006f ce0000        	ldw	x,_IO_X2
 181  0072 cd0000        	call	_GPIO_WriteHigh
 189  0075 2054          	jp	LC003
 190  0077               L31:
 191                     ; 25 		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
 193  0077 ad69          	call	LC008
 196  0079 3b0002        	push	_IO_X2+2
 197  007c ce0000        	ldw	x,_IO_X2
 198  007f cd0000        	call	_GPIO_WriteHigh
 206  0082 2013          	jp	LC006
 207  0084               L51:
 208                     ; 26 		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
 210  0084 3b0002        	push	_IO_X1+2
 211  0087 ce0000        	ldw	x,_IO_X1
 212  008a cd0000        	call	_GPIO_WriteLow
 216  008d               LC007:
 217  008d 84            	pop	a
 219  008e 3b0002        	push	_IO_X2+2
 220  0091 ce0000        	ldw	x,_IO_X2
 221  0094 cd0000        	call	_GPIO_WriteLow
 228  0097               LC006:
 229  0097 84            	pop	a
 232  0098 3b0002        	push	_IO_Y1+2
 233  009b ce0000        	ldw	x,_IO_Y1
 234  009e cd0000        	call	_GPIO_WriteLow
 235  00a1 84            	pop	a
 238  00a2 3b0002        	push	_IO_Y2+2
 239  00a5 ce0000        	ldw	x,_IO_Y2
 240  00a8 cd0000        	call	_GPIO_WriteHigh
 244  00ab 2032          	jp	LC001
 245  00ad               L71:
 246                     ; 27 		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
 248  00ad 3b0002        	push	_IO_X1+2
 249  00b0 ce0000        	ldw	x,_IO_X1
 250  00b3 cd0000        	call	_GPIO_WriteHigh
 260  00b6 20d5          	jp	LC007
 261  00b8               L12:
 262                     ; 28 		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
 264  00b8 3b0002        	push	_IO_X1+2
 265  00bb ce0000        	ldw	x,_IO_X1
 266  00be cd0000        	call	_GPIO_WriteHigh
 268  00c1 84            	pop	a
 271  00c2 3b0002        	push	_IO_X2+2
 272  00c5 ce0000        	ldw	x,_IO_X2
 273  00c8 cd0000        	call	_GPIO_WriteLow
 277  00cb               LC003:
 278  00cb 84            	pop	a
 280  00cc 3b0002        	push	_IO_Y1+2
 281  00cf ce0000        	ldw	x,_IO_Y1
 282  00d2 cd0000        	call	_GPIO_WriteLow
 286  00d5               LC002:
 287  00d5 84            	pop	a
 292  00d6 3b0002        	push	_IO_Y2+2
 293  00d9 ce0000        	ldw	x,_IO_Y2
 294  00dc cd0000        	call	_GPIO_WriteLow
 296  00df               LC001:
 297  00df 84            	pop	a
 300  00e0               L74:
 301                     ; 34 }
 304  00e0 84            	pop	a
 305  00e1 81            	ret	
 306  00e2               LC008:
 307  00e2 3b0002        	push	_IO_X1+2
 308  00e5 ce0000        	ldw	x,_IO_X1
 309  00e8 cd0000        	call	_GPIO_WriteLow
 311  00eb 84            	pop	a
 312  00ec 81            	ret	
 341                     ; 36 void motorDriveStop(void)
 341                     ; 37 {
 342                     .text:	section	.text,new
 343  0000               _motorDriveStop:
 347                     ; 38 	_L_X1 _L_X2 _L_Y1 _L_Y2
 349  0000 3b0002        	push	_IO_X1+2
 350  0003 ce0000        	ldw	x,_IO_X1
 351  0006 cd0000        	call	_GPIO_WriteLow
 353  0009 84            	pop	a
 356  000a 3b0002        	push	_IO_X2+2
 357  000d ce0000        	ldw	x,_IO_X2
 358  0010 cd0000        	call	_GPIO_WriteLow
 360  0013 84            	pop	a
 363  0014 3b0002        	push	_IO_Y1+2
 364  0017 ce0000        	ldw	x,_IO_Y1
 365  001a cd0000        	call	_GPIO_WriteLow
 367  001d 84            	pop	a
 370  001e 3b0002        	push	_IO_Y2+2
 371  0021 ce0000        	ldw	x,_IO_Y2
 372  0024 cd0000        	call	_GPIO_WriteLow
 374  0027 5f            	clrw	x
 375  0028 cf0006        	ldw	_Drive+6,x
 376  002b 725f0001      	clr	_Drive+1
 377  002f 84            	pop	a
 378                     ; 39 	Drive.Run = Drive.Overrun = 0;
 380                     ; 40 }
 383  0030 81            	ret	
 408                     ; 42 void	MotorStepOpen(void)
 408                     ; 43 {
 409                     .text:	section	.text,new
 410  0000               _MotorStepOpen:
 414                     ; 61 	Drive.Position++;
 416  0000 ce0002        	ldw	x,_Drive+2
 417  0003 5c            	incw	x
 418  0004 cf0002        	ldw	_Drive+2,x
 419                     ; 62 	motorDriveMove1Phase(_MT_OPEN_); 
 421  0007 a607          	ld	a,#7
 423                     ; 63 }
 426  0009 cc0000        	jp	_motorDriveMove1Phase
 452                     ; 65 void	MotorStepClose(void)
 452                     ; 66 {
 453                     .text:	section	.text,new
 454  0000               _MotorStepClose:
 458                     ; 67 	if( Drive.Position == 0 ) 
 460  0000 ce0002        	ldw	x,_Drive+2
 461  0003 2607          	jrne	L101
 462                     ; 72 		Drive.Target = 0;
 464  0005 5f            	clrw	x
 465  0006 cf0004        	ldw	_Drive+4,x
 466                     ; 73 		motorDriveStop();	
 469                     ; 74 		return;
 472  0009 cc0000        	jp	_motorDriveStop
 473  000c               L101:
 474                     ; 76 	Drive.Position--;
 476  000c 5a            	decw	x
 477  000d cf0002        	ldw	_Drive+2,x
 478                     ; 77 	motorDriveMove1Phase(_MT_CLOSE_); 
 480  0010 a601          	ld	a,#1
 482                     ; 78 }
 485  0012 cc0000        	jp	_motorDriveMove1Phase
 498                     	xdef	_motorDriveMove1Phase
 499                     	xdef	_MotorStepClose
 500                     	xdef	_MotorStepOpen
 501                     	xdef	_motorDriveStop
 502                     	xref	_IO_Y2
 503                     	xref	_IO_Y1
 504                     	xref	_IO_X2
 505                     	xref	_IO_X1
 506                     	xref	_Drive
 507                     	xref	_GPIO_WriteLow
 508                     	xref	_GPIO_WriteHigh
 509                     	xref.b	c_x
 528                     	xref	c_smodx
 529                     	end
