**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 6/4/21                                                    *
* Description: Testing for MOVEM                                         *
**************************************************************************
    ORG    $100
START:                  ; first instruction of program

* MOVEM.W Tests
    MOVEM.W A1/A2,(A2)
    MOVEM.W A1,-(A2)
    MOVEM.W A1,$1234
    MOVEM.W A1,$00001234
    MOVEM.W (A1),D1
    MOVEM.W (A1),A2
    
        
* MOVEM.L Tests
    MOVEM.L A0/A1/A2/A3/A4/D0/D4/D5/D6,-(A7) *Write mode
    MOVEM.L (A7)+,A0/A1/A2/A3/A4/D0/D4/D6/D7 *Read mode
    
    SIMHALT             ; halt simulator
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
