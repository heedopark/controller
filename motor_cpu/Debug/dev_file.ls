   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  80                     ; 29 void	file_write(uint8_t addr, uint8_t data)
  80                     ; 30 {
  82                     	switch	.text
  83  0000               _file_write:
  85  0000 89            	pushw	x
  86  0001 5204          	subw	sp,#4
  87       00000004      OFST:	set	4
  90                     ; 31 	uint16_t	add, startadd, stopadd = 0;
  92                     ; 38 	_fctcpy('F');
  94  0003 a646          	ld	a,#70
  95  0005 cd0000        	call	__fctcpy
  97                     ; 43 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
  99  0008 4f            	clr	a
 100  0009 cd0000        	call	_FLASH_SetProgrammingTime
 102                     ; 47 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 104  000c a6f7          	ld	a,#247
 105  000e cd0000        	call	_FLASH_Unlock
 108  0011               L53:
 109                     ; 51 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 111  0011 a608          	ld	a,#8
 112  0013 cd0000        	call	_FLASH_GetFlagStatus
 114  0016 4d            	tnz	a
 115  0017 27f8          	jreq	L53
 116                     ; 54 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 116                     ; 55 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 118                     ; 56 	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 120                     ; 58 	FLASH_ProgramByte(startadd + addr * 2, data);
 122  0019 7b06          	ld	a,(OFST+2,sp)
 123  001b 88            	push	a
 124  001c 7b06          	ld	a,(OFST+2,sp)
 125  001e 5f            	clrw	x
 126  001f 97            	ld	xl,a
 127  0020 58            	sllw	x
 128  0021 1c4000        	addw	x,#16384
 129  0024 cd0000        	call	c_uitolx
 131  0027 be02          	ldw	x,c_lreg+2
 132  0029 89            	pushw	x
 133  002a be00          	ldw	x,c_lreg
 134  002c 89            	pushw	x
 135  002d cd0000        	call	_FLASH_ProgramByte
 137  0030 5b05          	addw	sp,#5
 138                     ; 59 }
 141  0032 5b06          	addw	sp,#6
 142  0034 81            	ret
 222                     ; 61 uint8_t	file_read(uint8_t addr)
 222                     ; 62 {	
 223                     	switch	.text
 224  0035               _file_read:
 226  0035 88            	push	a
 227  0036 5209          	subw	sp,#9
 228       00000009      OFST:	set	9
 231                     ; 63 	uint16_t	add, startadd, stopadd = 0;
 233                     ; 64 	uint8_t newval = 0xAA;
 235  0038 a6aa          	ld	a,#170
 236  003a 6b08          	ld	(OFST-1,sp),a
 238                     ; 65 	uint8_t prvval = 0xAA;
 240                     ; 66 	uint8_t i = 0;
 242                     ; 74 	_fctcpy('F');
 244  003c a646          	ld	a,#70
 245  003e cd0000        	call	__fctcpy
 247                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 249  0041 4f            	clr	a
 250  0042 cd0000        	call	_FLASH_SetProgrammingTime
 252                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 254  0045 a6f7          	ld	a,#247
 255  0047 cd0000        	call	_FLASH_Unlock
 258  004a               L37:
 259                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 261  004a a608          	ld	a,#8
 262  004c cd0000        	call	_FLASH_GetFlagStatus
 264  004f 4d            	tnz	a
 265  0050 27f8          	jreq	L37
 266                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 268  0052 0f09          	clr	(OFST+0,sp)
 270  0054               L77:
 271                     ; 92 		GBuffer[i] = newval;
 273  0054 7b09          	ld	a,(OFST+0,sp)
 274  0056 5f            	clrw	x
 275  0057 97            	ld	xl,a
 276  0058 7b08          	ld	a,(OFST-1,sp)
 277  005a d70000        	ld	(_GBuffer,x),a
 278                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 280  005d 0c09          	inc	(OFST+0,sp)
 284  005f 7b09          	ld	a,(OFST+0,sp)
 285  0061 a140          	cp	a,#64
 286  0063 25ef          	jrult	L77
 287                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 287                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 289                     ; 100 	add = startadd + addr * 2;
 291  0065 7b0a          	ld	a,(OFST+1,sp)
 292  0067 5f            	clrw	x
 293  0068 97            	ld	xl,a
 294  0069 58            	sllw	x
 295  006a 1c4000        	addw	x,#16384
 296  006d 1f06          	ldw	(OFST-3,sp),x
 298                     ; 101 	return FLASH_ReadByte(add);	
 300  006f 1e06          	ldw	x,(OFST-3,sp)
 301  0071 cd0000        	call	c_uitolx
 303  0074 be02          	ldw	x,c_lreg+2
 304  0076 89            	pushw	x
 305  0077 be00          	ldw	x,c_lreg
 306  0079 89            	pushw	x
 307  007a cd0000        	call	_FLASH_ReadByte
 309  007d 5b04          	addw	sp,#4
 312  007f 5b0a          	addw	sp,#10
 313  0081 81            	ret
 368                     	xref	__fctcpy
 369                     	switch	.bss
 370  0000               _GBuffer:
 371  0000 000000000000  	ds.b	64
 372                     	xdef	_GBuffer
 373  0040               _OperationStatus:
 374  0040 00            	ds.b	1
 375                     	xdef	_OperationStatus
 376                     	xdef	_file_read
 377                     	xdef	_file_write
 378                     	xref	_FLASH_GetFlagStatus
 379                     	xref	_FLASH_SetProgrammingTime
 380                     	xref	_FLASH_ReadByte
 381                     	xref	_FLASH_ProgramByte
 382                     	xref	_FLASH_Unlock
 383                     	xref.b	c_lreg
 403                     	xref	c_uitolx
 404                     	end
