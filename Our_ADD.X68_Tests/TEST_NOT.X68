**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST NOT                                                  *
**************************************************************************
    ORG    $100
START:                  ; first instruction of program
    
    *NOT.B
    NOT.B   D0
    NOT.B   D1
    NOT.B   D2
    NOT.B   D3
    NOT.B   D4
    NOT.B   D5
    NOT.B   D6
    NOT.B   D7
    NOT.B   (A1)
    NOT.B   (A2)
    NOT.B   (A3)
    NOT.B   (A4)
    NOT.B   (A5)
    NOT.B   (A6)
    NOT.B   $000048C0
    NOT.B   $0FF037D0
    NOT.B   $00493430
    NOT.B   $00342500
    NOT.B   $00FFFFC0
    
    *NOT.W
    NOT.W   D0
    NOT.W   D1
    NOT.W   D2
    NOT.W   D3
    NOT.W   D4
    NOT.W   D5
    NOT.W   D6
    NOT.W   D7
    NOT.W   (A1)
    NOT.W   (A2)
    NOT.W   (A3)
    NOT.W   (A4)
    NOT.W   (A5)
    NOT.W   (A6)
    NOT.W   $000048C0
    NOT.W   $0FF037D0
    NOT.W   $00493430
    NOT.W   $00342500
    NOT.W   $00FFFFC0
    
    *NOT.L
    NOT.L   D0
    NOT.L   D1
    NOT.L   D2
    NOT.L   D3
    NOT.L   D4
    NOT.L   D5
    NOT.L   D6
    NOT.L   D7
    NOT.L   (A1)
    NOT.L   (A2)
    NOT.L   (A3)
    NOT.L   (A4)
    NOT.L   (A5)
    NOT.L   (A6)
    NOT.L   $000048C0
    NOT.L   $0FF037D0
    NOT.L   $00493430
    NOT.L   $00342500
    NOT.L   $00FFFFC0

    SIMHALT             ; halt simulator
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
