**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST JSR                                                  *
**************************************************************************
    ORG    $100
START:                  ; first instruction of program

    JSR     test1
    JSR     test2
    JSR     test3
    JSR     (A2)
    JSR     (A1)
    JSR     (A3)
    
test1:
    MOVE.B  D0, D1
    MOVE.B  D1, D2
    RTS
    
test2:
    MOVE.B  D2, D3
    MOVE.B  D3, D4
    RTS

test3:
    MOVE.B  D4, D5
    RTS

    SIMHALT             ; halt simulator
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
