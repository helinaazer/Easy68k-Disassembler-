**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST DIVU                                                 *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
    
    *To prevent division by zero:
    MOVE.L      #4839032,D0
    MOVE.L      #938475,D1
    MOVE.L      #94743,D2
    MOVE.L      #22342,D3
    MOVE.L      #12324,D4
    MOVE.L      #948674983,D5
    MOVE.L      #2345211,D6
    MOVE.L      #9579486,D7
    
    *DIVU
    DIVU   D0,D1
    DIVU   D1,D2
    DIVU   D2,D3
    DIVU   D3,D4
    DIVU   D4,D5
    DIVU   D5,D6
    DIVU   D6,D7
    DIVU   D7,D0
    
    DIVU   (A0),D0
    DIVU   (A1),D1
    DIVU   (A2),D2
    DIVU   (A3),D3
    DIVU   (A4),D4
    DIVU   (A5),D5
    DIVU   (A6),D6
    DIVU   (A7),D7
    
    DIVU   (A0)+,D0
    DIVU   (A1)+,D1
    DIVU   (A2)+,D2
    DIVU   (A3)+,D3
    DIVU   (A4)+,D4
    DIVU   (A5)+,D5
    DIVU   (A6)+,D6
    DIVU   (A7)+,D7
      
    DIVU   -(A0),D0
    DIVU   -(A1),D1
    DIVU   -(A2),D2
    DIVU   -(A3),D3
    DIVU   -(A4),D4
    DIVU   -(A5),D5
    DIVU   -(A6),D6
    DIVU   -(A7),D7
    
    DIVU   $00006500,D0
    DIVU   $00006500,D1
    DIVU   $00006500,D2
    DIVU   $00006500,D3
    DIVU   $00006500,D4
    DIVU   $00006500,D5
    DIVU   $00006500,D6
    DIVU   $00006500,D7
    
    DIVU  #$70,D0
    DIVU  #$70,D1
    DIVU  #$70,D2
    DIVU  #$70,D3
    DIVU  #$70,D4
    DIVU  #$70,D5
    DIVU  #$70,D6
    DIVU  #$70,D7
		
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main
		




*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
