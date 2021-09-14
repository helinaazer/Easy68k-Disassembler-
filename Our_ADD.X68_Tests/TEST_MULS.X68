**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST MULS                                                 *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
    
    *MULS
    MULS   D0,D1
    MULS   D1,D2
    MULS   D2,D3
    MULS   D3,D4
    MULS   D4,D5
    MULS   D5,D6
    MULS   D6,D7
    MULS   D7,D0
    
    MULS   (A0),D0
    MULS   (A1),D1
    MULS   (A2),D2
    MULS   (A3),D3
    MULS   (A4),D4
    MULS   (A5),D5
    MULS   (A6),D6
    MULS   (A7),D7
    
    MULS   (A0)+,D0
    MULS   (A1)+,D1
    MULS   (A2)+,D2
    MULS   (A3)+,D3
    MULS   (A4)+,D4
    MULS   (A5)+,D5
    MULS   (A6)+,D6
    MULS   (A7)+,D7
      
    MULS   -(A0),D0
    MULS   -(A1),D1
    MULS   -(A2),D2
    MULS   -(A3),D3
    MULS   -(A4),D4
    MULS   -(A5),D5
    MULS   -(A6),D6
    MULS   -(A7),D7
    
    MULS   $00006500,D0
    MULS   $00006500,D1
    MULS   $00006500,D2
    MULS   $00006500,D3
    MULS   $00006500,D4
    MULS   $00006500,D5
    MULS   $00006500,D6
    MULS   $00006500,D7
    
    MULS  #$70,D0
    MULS  #$70,D1
    MULS  #$70,D2
    MULS  #$70,D3
    MULS  #$70,D4
    MULS  #$70,D5
    MULS  #$70,D6
    MULS  #$70,D7
		
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main








*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
