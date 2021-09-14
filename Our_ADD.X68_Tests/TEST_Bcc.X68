**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: Testing for Bcc (BRA, BLT, BGE, BEQ) instruction.         *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
		
*BRA
    BRA     mark1
    
*BLT
continue1:
    MOVE.W  #5, D0
    CMP.W   #10, D0
    BLT     mark2
    
*BGE
continue2:
    MOVE.B  #15, D0
    CMP.B   #10, D0
    BGE     mark3
    
*BEQ
continue3:
    MOVE.L  #10, D0
    CMP.L   #10, D0
    BEQ     mark4
			
continue4:

		SIMHALT					; program halts
;Subroutines
;------------------------------------------------------------------------------------------------
mark1:
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    BRA     continue1
    
mark2:
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    BRA     continue2
    
mark3:
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    BRA     continue3
    
mark4:
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    MOVE.B  D1,D2
    BRA     continue4
    
		END    	main			; end of program, execution begins at label main


*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
