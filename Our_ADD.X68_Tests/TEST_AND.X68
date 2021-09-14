**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST AND                                                  *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
    
    *AND.B
    AND.B  D0,D1
    AND.B  D1,D2
    AND.B  D2,D3
    AND.B  D3,D4
    AND.B  D4,D5
    AND.B  D5,D6
    AND.B  D6,D7
    AND.B  D7,D0
    
    AND.B  D0,(A0)
    AND.B  D1,(A1)
    AND.B  D2,(A2)
    AND.B  D3,(A3)
    AND.B  D4,(A4)
    AND.B  D5,(A5)
    AND.B  D6,(A6)
    
    AND.B  D1,$00020000
    AND.B  D2,$00020000
    AND.B  D3,$00020000
    AND.B  D4,$00020000
    AND.B  D5,$00020000
    AND.B  D6,$00020000
    AND.B  D7,$00020000
    
    AND.B  $00020000,D1
    AND.B  $00020000,D2
    AND.B  $00020000,D3
    AND.B  $00020000,D4
    AND.B  $00020000,D5
    AND.B  $00020000,D6
    AND.B  $00020000,D7
    
    
    *AND.W
    AND.W  D0,D1
    AND.W  D1,D2
    AND.W  D2,D3
    AND.W  D3,D4
    AND.W  D4,D5
    AND.W  D5,D6
    AND.W  D6,D7
    AND.W  D7,D0
    
    AND.W  D0,(A0)
    AND.W  D1,(A1)
    AND.W  D2,(A2)
    AND.W  D3,(A3)
    AND.W  D4,(A4)
    AND.W  D5,(A5)
    AND.W  D6,(A6)
    
    AND.W  D1,$00020000
    AND.W  D2,$00020000
    AND.W  D3,$00020000
    AND.W  D4,$00020000
    AND.W  D5,$00020000
    AND.W  D6,$00020000
    AND.W  D7,$00020000
    
    AND.W  $00020000,D1
    AND.W  $00020000,D2
    AND.W  $00020000,D3
    AND.W  $00020000,D4
    AND.W  $00020000,D5
    AND.W  $00020000,D6
    AND.W  $00020000,D7
    
    
    *AND.L
    AND.L  D0,D1
    AND.L  D1,D2
    AND.L  D2,D3
    AND.L  D3,D4
    AND.L  D4,D5
    AND.L  D5,D6
    AND.L  D6,D7
    AND.L  D7,D0
    
    AND.L  D0,(A0)
    AND.L  D1,(A1)
    AND.L  D2,(A2)
    AND.L  D3,(A3)
    AND.L  D4,(A4)
    AND.L  D5,(A5)
    AND.L  D6,(A6)
    
    AND.L  D1,$00020000
    AND.L  D2,$00020000
    AND.L  D3,$00020000
    AND.L  D4,$00020000
    AND.L  D5,$00020000
    AND.L  D6,$00020000
    AND.L  D7,$00020000
    
    AND.L  $00020000,D1
    AND.L  $00020000,D2
    AND.L  $00020000,D3
    AND.L  $00020000,D4
    AND.L  $00020000,D5
    AND.L  $00020000,D6
    AND.L  $00020000,D7
    
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main






*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
