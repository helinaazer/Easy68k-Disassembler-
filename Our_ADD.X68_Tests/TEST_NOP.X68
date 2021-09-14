**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST NOP                                                  *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
			
	    NOP
        NOP
        NOP
		
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main
*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
