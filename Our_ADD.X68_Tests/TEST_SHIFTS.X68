**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST SHIFT INSTRUCTIONS                                   *
**************************************************************************
    ORG    $100
START:                  ; first instruction of program
    *LSL, LSR
    LSL     (A3)
    LSL     -(A5)
    LSL     $A000
    LSR     (A4)+
    LSR     $4000

    *LSL.B
    LSL.B   #$1,D0
    LSL.B   #$2,D1
    LSL.B   D0,D3
    LSL.B   D1,D3
    LSL.B   D2,D3
    LSL.B   D3,D3
    LSL.B   #$7,D0
    
    *LSL.W
    LSL.W   #$1,D0
    LSL.W   #$2,D1
    LSL.W   D0,D3
    LSL.W   D1,D3
    LSL.W   D2,D3
    LSL.W   D3,D3
    LSL.W   $12345678
    LSL.W   #$8,D1
        
    *LSL.L
    LSL.L   #$1,D0
    LSL.L   #$2,D1
    LSL.L   D0,D3
    LSL.L   D1,D3
    LSL.L   D2,D3
    LSL.L   D3,D3
    LSL.L   D5,D1
    
    *LSR.B
    LSR.B   #$1,D0
    LSR.B   #$2,D1
    LSR.B   D0,D3
    LSR.B   D1,D3
    LSR.B   D2,D3
    LSR.B   D3,D3
    
    *LSR.W
    LSR.W   #$1,D0
    LSR.W   #$2,D1
    LSR.W   D0,D3
    LSR.W   D1,D3
    LSR.W   D2,D3
    LSR.W   D3,D3
    LSR.W   $12345678
    
    *LSR.L
    LSR.L   #$1,D0
    LSR.L   #$2,D1
    LSR.L   D0,D3
    LSR.L   D1,D3
    LSR.L   D2,D3
    LSR.L   D3,D3
    
    *ASL, ASR
    ASL     (A0)
    ASR     (A1)+
    ASL     -(A2)
    ASR     $4000
    ASL     $A000
    
    *ASL.B
    ASL.B   #$1,D0
    ASL.B   #$2,D1
    ASL.B   D0,D3
    ASL.B   D1,D3
    ASL.B   D2,D3
    ASL.B   D3,D3
        
    *ASL.W
    ASL.W   #$1,D0
    ASL.W   #$2,D1
    ASL.W   D0,D3
    ASL.W   D1,D3
    ASL.W   D2,D3
    ASL.W   D3,D3
    ASL.W   $12345678
    
    *ASL.L
    ASL.L   #$1,D0
    ASL.L   #$2,D1
    ASL.L   D0,D3
    ASL.L   D1,D3
    ASL.L   D2,D3
    ASL.L   D3,D3
    
    *ASR.B
    ASR.B   #$1,D0
    ASR.B   #$2,D1
    ASR.B   D0,D3
    ASR.B   D1,D3
    ASR.B   D2,D3
    ASR.B   D3,D3
    
    *ASR.W
    ASR.W   #$1,D0
    ASR.W   #$2,D1
    ASR.W   D0,D3
    ASR.W   D1,D3
    ASR.W   D2,D3
    ASR.W   D3,D3
    ASR.W   $12345678
    
    *ASR.L
    ASR.L   #$1,D0
    ASR.L   #$2,D1
    ASR.L   D0,D3
    ASR.L   D1,D3
    ASR.L   D2,D3
    ASR.L   D3,D3

    SIMHALT             ; halt simulator
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
