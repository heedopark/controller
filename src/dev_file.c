#include "stdafx.h"

/* Private typedef -----------------------------------------------------------*/
typedef enum { FAILED = 0, PASSED = !FAILED} TestStatus;
TestStatus OperationStatus;


#define BLOCK_OPERATION    0    /* block 0 in data eeprom memory: address is 0x1000 */
unsigned char GBuffer[FLASH_BLOCK_SIZE];


/* Declare _fctcpy function prototype as it is packaged by default in the Cosmic
   machine library 
*/
#ifdef _COSMIC_
int _fctcpy(char name);
#endif /*_COSMIC_*/

#if defined (_CNV_) || defined (_WOODANG_CNT_) || defined (MOTOR_CPU)
#define __FLASH_DATA_START_PHYSICAL_ADDRESS 	FLASH_DATA_START_PHYSICAL_ADDRESS
#define	__FLASH_MEMTYPE_DATA									FLASH_MEMTYPE_DATA
#define __FLASH_PROGRAMTIME_STANDARD					FLASH_PROGRAMTIME_STANDARD
#else
#define __FLASH_DATA_START_PHYSICAL_ADDRESS  	FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS
#define __FLASH_MEMTYPE_DATA									FLASH_MemType_Data
#define __FLASH_PROGRAMTIME_STANDARD					FLASH_ProgramTime_Standard
#endif

void	file_write(uint8_t addr, uint8_t data)
{
	uint16_t	add, startadd, stopadd = 0;
//return;	
	#ifdef _COSMIC_
	/* Call the _fctcpy() function with the first segment character as parameter 
	"_fctcpy('F');"  for a manual copy of the declared moveable code segment
	(FLASH_CODE) in RAM before execution
	*/
	_fctcpy('F');
	#endif /*_COSMIC_*
	
	/* Define flash programming Time
	*/
	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
	
	/* Unlock flash data eeprom memory 
	*/
	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
	
	/* Wait until Data EEPROM area unlocked flag is set
	*/
	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
		;

	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
	
	FLASH_ProgramByte(startadd + addr * 2, data);
}

uint8_t	file_read(uint8_t addr)
{	
	uint16_t	add, startadd, stopadd = 0;
	uint8_t newval = 0xAA;
	uint8_t prvval = 0xAA;
	uint8_t i = 0;
//return;	
	
	#ifdef _COSMIC_
	/* Call the _fctcpy() function with the first segment character as parameter 
	"_fctcpy('F');"  for a manual copy of the declared moveable code segment
	(FLASH_CODE) in RAM before execution
	*/
	_fctcpy('F');
	#endif /*_COSMIC_*
	
	/* Define flash programming Time
	*/
	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
	
	/* Unlock flash data eeprom memory 
	*/
	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
	/* Wait until Data EEPROM area unlocked flag is set
	*/
	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
		;
	
	/* Fill the buffer in RAM */
	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
	{
		GBuffer[i] = newval;
	}

	/* This function is executed from RAM 
	*/
	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
	
	add = startadd + addr * 2;
	return FLASH_ReadByte(add);	
}


#if 0
/*
 *	test routine for file_read()/file_write()
 */
char ddd = 0;
char ddd1 = 0;	// EEPROM Å×½ºÆ®
while(1)
{
	ddd1 = ReadEEPROM(0);
	ddd = ReadEEPROM(1);
	
	
	ddd++;	
	ddd1 += 2;
	sprintf(buff,"%d \r\n",ddd);				
	WriteEEPROM(1, ddd);
	WriteEEPROM(0, ddd1);
	uart1_tx_put(buff, strlen(buff));	

	delay(1000);	
}

#endif
	

