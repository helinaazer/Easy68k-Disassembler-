**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST SUB                                                  *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
	
    *SUB.B
    SUB.B   D0,D1
    SUB.B   D1,D2
    SUB.B   D2,D3
    SUB.B   D3,D4
    SUB.B   D4,D5
    SUB.B   D5,D6
    SUB.B   D6,D7
    SUB.B   D7,D0
    
    SUB.B   D0,(A0)
    SUB.B   D1,(A1)
    SUB.B   D2,(A2)
    SUB.B   D3,(A3)
    SUB.B   D4,(A4)
    SUB.B   D5,(A5)
    SUB.B   D6,(A6)
    SUB.B   D7,(A7)
    
    SUB.B   (A0),D0
    SUB.B   (A1),D1
    SUB.B   (A2),D2
    SUB.B   (A3),D3
    SUB.B   (A4),D4
    SUB.B   (A5),D5
    SUB.B   (A6),D6
    SUB.B   (A7),D7
    
    SUB.B   D0,(A0)+
    SUB.B   D1,(A1)+
    SUB.B   D2,(A2)+
    SUB.B   D3,(A3)+
    SUB.B   D4,(A4)+
    SUB.B   D5,(A5)+
    SUB.B   D6,(A6)+
    SUB.B   D7,(A7)+
    
    SUB.B   (A0)+,D0
    SUB.B   (A1)+,D1
    SUB.B   (A2)+,D2
    SUB.B   (A3)+,D3
    SUB.B   (A4)+,D4
    SUB.B   (A5)+,D5
    SUB.B   (A6)+,D6
    SUB.B   (A7)+,D7
    
    SUB.B   D0,-(A0)
    SUB.B   D1,-(A1)
    SUB.B   D2,-(A2)
    SUB.B   D3,-(A3)
    SUB.B   D4,-(A4)
    SUB.B   D5,-(A5)
    SUB.B   D6,-(A6)
    SUB.B   D7,-(A7)
    
    SUB.B   -(A0),D0
    SUB.B   -(A1),D1
    SUB.B   -(A2),D2
    SUB.B   -(A3),D3
    SUB.B   -(A4),D4
    SUB.B   -(A5),D5
    SUB.B   -(A6),D6
    SUB.B   -(A7),D7
    
    SUB.B   $00006500,D0
    SUB.B   $00006500,D1
    SUB.B   $00006500,D2
    SUB.B   $00006500,D3
    SUB.B   $00006500,D4
    SUB.B   $00006500,D5
    SUB.B   $00006500,D6
    SUB.B   $00006500,D7
    
    SUB.B   D0,$00007000
    SUB.B   D1,$00007000
    SUB.B   D2,$00007000
    SUB.B   D3,$00007000
    SUB.B   D4,$00007000
    SUB.B   D5,$00007000
    SUB.B   D6,$00007000
    SUB.B   D7,$00007000
    
    *SUB.W
    SUB.W   D0,D1
    SUB.W   D1,D2
    SUB.W   D2,D3
    SUB.W   D3,D4
    SUB.W   D4,D5
    SUB.W   D5,D6
    SUB.W   D6,D7
    SUB.W   D7,D0
    
    SUB.W   D0,(A0)
    SUB.W   D1,(A1)
    SUB.W   D2,(A2)
    SUB.W   D3,(A3)
    SUB.W   D4,(A4)
    SUB.W   D5,(A5)
    SUB.W   D6,(A6)
    SUB.W   D7,(A7)
    
    SUB.W   (A0),D0
    SUB.W   (A1),D1
    SUB.W   (A2),D2
    SUB.W   (A3),D3
    SUB.W   (A4),D4
    SUB.W   (A5),D5
    SUB.W   (A6),D6
    SUB.W   (A7),D7
    
    SUB.W   D0,(A0)+
    SUB.W   D1,(A1)+
    SUB.W   D2,(A2)+
    SUB.W   D3,(A3)+
    SUB.W   D4,(A4)+
    SUB.W   D5,(A5)+
    SUB.W   D6,(A6)+
    SUB.W   D7,(A7)+
    
    SUB.W   (A0)+,D0
    SUB.W   (A1)+,D1
    SUB.W   (A2)+,D2
    SUB.W   (A3)+,D3
    SUB.W   (A4)+,D4
    SUB.W   (A5)+,D5
    SUB.W   (A6)+,D6
    SUB.W   (A7)+,D7
    
    SUB.W   D0,-(A0)
    SUB.W   D1,-(A1)
    SUB.W   D2,-(A2)
    SUB.W   D3,-(A3)
    SUB.W   D4,-(A4)
    SUB.W   D5,-(A5)
    SUB.W   D6,-(A6)
    SUB.W   D7,-(A7)
    
    SUB.W   -(A0),D0
    SUB.W   -(A1),D1
    SUB.W   -(A2),D2
    SUB.W   -(A3),D3
    SUB.W   -(A4),D4
    SUB.W   -(A5),D5
    SUB.W   -(A6),D6
    SUB.W   -(A7),D7
    
    SUB.W   $00006500,D0
    SUB.W   $00006500,D1
    SUB.W   $00006500,D2
    SUB.W   $00006500,D3
    SUB.W   $00006500,D4
    SUB.W   $00006500,D5
    SUB.W   $00006500,D6
    SUB.W   $00006500,D7
    
    SUB.W   D0,$00007000
    SUB.W   D1,$00007000
    SUB.W   D2,$00007000
    SUB.W   D3,$00007000
    SUB.W   D4,$00007000
    SUB.W   D5,$00007000
    SUB.W   D6,$00007000
    SUB.W   D7,$00007000
    
    *SUB.L
    SUB.L   D0,D1
    SUB.L   D1,D2
    SUB.L   D2,D3
    SUB.L   D3,D4
    SUB.L   D4,D5
    SUB.L   D5,D6
    SUB.L   D6,D7
    SUB.L   D7,D0
    
    SUB.L   D0,(A0)
    SUB.L   D1,(A1)
    SUB.L   D2,(A2)
    SUB.L   D3,(A3)
    SUB.L   D4,(A4)
    SUB.L   D5,(A5)
    SUB.L   D6,(A6)
    SUB.L   D7,(A7)
    
    SUB.L   (A0),D0
    SUB.L   (A1),D1
    SUB.L   (A2),D2
    SUB.L   (A3),D3
    SUB.L   (A4),D4
    SUB.L   (A5),D5
    SUB.L   (A6),D6
    SUB.L   (A7),D7
    
    SUB.L   D0,(A0)+
    SUB.L   D1,(A1)+
    SUB.L   D2,(A2)+
    SUB.L   D3,(A3)+
    SUB.L   D4,(A4)+
    SUB.L   D5,(A5)+
    SUB.L   D6,(A6)+
    SUB.L   D7,(A7)+
    
    SUB.L   (A0)+,D0
    SUB.L   (A1)+,D1
    SUB.L   (A2)+,D2
    SUB.L   (A3)+,D3
    SUB.L   (A4)+,D4
    SUB.L   (A5)+,D5
    SUB.L   (A6)+,D6
    SUB.L   (A7)+,D7
    
    SUB.L   D0,-(A0)
    SUB.L   D1,-(A1)
    SUB.L   D2,-(A2)
    SUB.L   D3,-(A3)
    SUB.L   D4,-(A4)
    SUB.L   D5,-(A5)
    SUB.L   D6,-(A6)
    SUB.L   D7,-(A7)
    
    SUB.L   -(A0),D0
    SUB.L   -(A1),D1
    SUB.L   -(A2),D2
    SUB.L   -(A3),D3
    SUB.L   -(A4),D4
    SUB.L   -(A5),D5
    SUB.L   -(A6),D6
    SUB.L   -(A7),D7
    
    SUB.L   $00006500,D0
    SUB.L   $00006500,D1
    SUB.L   $00006500,D2
    SUB.L   $00006500,D3
    SUB.L   $00006500,D4
    SUB.L   $00006500,D5
    SUB.L   $00006500,D6
    SUB.L   $00006500,D7
    
    SUB.L   D0,$00007000
    SUB.L   D1,$00007000
    SUB.L   D2,$00007000
    SUB.L   D3,$00007000
    SUB.L   D4,$00007000
    SUB.L   D5,$00007000
    SUB.L   D6,$00007000
    SUB.L   D7,$00007000	
    
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main




*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
