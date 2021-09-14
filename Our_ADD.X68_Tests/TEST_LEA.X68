**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST LEA                                                  *
**************************************************************************
    ORG    $100
START:                  ; first instruction of program

    * LEA Tests
    LEA $8000,A1
    LEA $777,A1
    LEA (A1),A2
    LEA (A3),A4
    LEA (A4),A5
    LEA (A5),A6
    LEA (A7),A0

    SIMHALT             ; halt simulator
    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
