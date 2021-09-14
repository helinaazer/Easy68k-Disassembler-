**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST ADD                                                  *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
	
    *ADD.B
    ADD.B   D0,D1
    ADD.B   D1,D2
    ADD.B   D2,D3
    ADD.B   D3,D4
    ADD.B   D4,D5
    ADD.B   D5,D6
    ADD.B   D6,D7
    ADD.B   D7,D0
    
    ADD.B   D0,(A0)
    ADD.B   D1,(A1)
    ADD.B   D2,(A2)
    ADD.B   D3,(A3)
    ADD.B   D4,(A4)
    ADD.B   D5,(A5)
    ADD.B   D6,(A6)
    ADD.B   D7,(A7)
    
    ADD.B   (A0),D0
    ADD.B   (A1),D1
    ADD.B   (A2),D2
    ADD.B   (A3),D3
    ADD.B   (A4),D4
    ADD.B   (A5),D5
    ADD.B   (A6),D6
    ADD.B   (A7),D7
    
    ADD.B   D0,(A0)+
    ADD.B   D1,(A1)+
    ADD.B   D2,(A2)+
    ADD.B   D3,(A3)+
    ADD.B   D4,(A4)+
    ADD.B   D5,(A5)+
    ADD.B   D6,(A6)+
    ADD.B   D7,(A7)+
    
    ADD.B   (A0)+,D0
    ADD.B   (A1)+,D1
    ADD.B   (A2)+,D2
    ADD.B   (A3)+,D3
    ADD.B   (A4)+,D4
    ADD.B   (A5)+,D5
    ADD.B   (A6)+,D6
    ADD.B   (A7)+,D7
    
    ADD.B   D0,-(A0)
    ADD.B   D1,-(A1)
    ADD.B   D2,-(A2)
    ADD.B   D3,-(A3)
    ADD.B   D4,-(A4)
    ADD.B   D5,-(A5)
    ADD.B   D6,-(A6)
    ADD.B   D7,-(A7)
    
    ADD.B   -(A0),D0
    ADD.B   -(A1),D1
    ADD.B   -(A2),D2
    ADD.B   -(A3),D3
    ADD.B   -(A4),D4
    ADD.B   -(A5),D5
    ADD.B   -(A6),D6
    ADD.B   -(A7),D7
    
    ADD.B   $00006500,D0
    ADD.B   $00006500,D1
    ADD.B   $00006500,D2
    ADD.B   $00006500,D3
    ADD.B   $00006500,D4
    ADD.B   $00006500,D5
    ADD.B   $00006500,D6
    ADD.B   $00006500,D7
    
    ADD.B   D0,$00007000
    ADD.B   D1,$00007000
    ADD.B   D2,$00007000
    ADD.B   D3,$00007000
    ADD.B   D4,$00007000
    ADD.B   D5,$00007000
    ADD.B   D6,$00007000
    ADD.B   D7,$00007000
    
    
    *ADD.W
    ADD.W   D0,D1
    ADD.W   D1,D2
    ADD.W   D2,D3
    ADD.W   D3,D4
    ADD.W   D4,D5
    ADD.W   D5,D6
    ADD.W   D6,D7
    ADD.W   D7,D0
    
    ADD.W   D0,(A0)
    ADD.W   D1,(A1)
    ADD.W   D2,(A2)
    ADD.W   D3,(A3)
    ADD.W   D4,(A4)
    ADD.W   D5,(A5)
    ADD.W   D6,(A6)
    ADD.W   D7,(A7)
    
    ADD.W   (A0),D0
    ADD.W   (A1),D1
    ADD.W   (A2),D2
    ADD.W   (A3),D3
    ADD.W   (A4),D4
    ADD.W   (A5),D5
    ADD.W   (A6),D6
    ADD.W   (A7),D7
    
    ADD.W   D0,(A0)+
    ADD.W   D1,(A1)+
    ADD.W   D2,(A2)+
    ADD.W   D3,(A3)+
    ADD.W   D4,(A4)+
    ADD.W   D5,(A5)+
    ADD.W   D6,(A6)+
    ADD.W   D7,(A7)+
    
    ADD.W   (A0)+,D0
    ADD.W   (A1)+,D1
    ADD.W   (A2)+,D2
    ADD.W   (A3)+,D3
    ADD.W   (A4)+,D4
    ADD.W   (A5)+,D5
    ADD.W   (A6)+,D6
    ADD.W   (A7)+,D7
    
    ADD.W   D0,-(A0)
    ADD.W   D1,-(A1)
    ADD.W   D2,-(A2)
    ADD.W   D3,-(A3)
    ADD.W   D4,-(A4)
    ADD.W   D5,-(A5)
    ADD.W   D6,-(A6)
    ADD.W   D7,-(A7)
    
    ADD.W   -(A0),D0
    ADD.W   -(A1),D1
    ADD.W   -(A2),D2
    ADD.W   -(A3),D3
    ADD.W   -(A4),D4
    ADD.W   -(A5),D5
    ADD.W   -(A6),D6
    ADD.W   -(A7),D7
    
    ADD.W   $00006500,D0
    ADD.W   $00006500,D1
    ADD.W   $00006500,D2
    ADD.W   $00006500,D3
    ADD.W   $00006500,D4
    ADD.W   $00006500,D5
    ADD.W   $00006500,D6
    ADD.W   $00006500,D7
    
    ADD.W   D0,$00007000
    ADD.W   D1,$00007000
    ADD.W   D2,$00007000
    ADD.W   D3,$00007000
    ADD.W   D4,$00007000
    ADD.W   D5,$00007000
    ADD.W   D6,$00007000
    ADD.W   D7,$00007000
    
    *ADD.L
    ADD.L   D0,D1
    ADD.L   D1,D2
    ADD.L   D2,D3
    ADD.L   D3,D4
    ADD.L   D4,D5
    ADD.L   D5,D6
    ADD.L   D6,D7
    ADD.L   D7,D0
    
    ADD.L   D0,(A0)
    ADD.L   D1,(A1)
    ADD.L   D2,(A2)
    ADD.L   D3,(A3)
    ADD.L   D4,(A4)
    ADD.L   D5,(A5)
    ADD.L   D6,(A6)
    ADD.L   D7,(A7)
    
    ADD.L   (A0),D0
    ADD.L   (A1),D1
    ADD.L   (A2),D2
    ADD.L   (A3),D3
    ADD.L   (A4),D4
    ADD.L   (A5),D5
    ADD.L   (A6),D6
    ADD.L   (A7),D7
    
    ADD.L   D0,(A0)+
    ADD.L   D1,(A1)+
    ADD.L   D2,(A2)+
    ADD.L   D3,(A3)+
    ADD.L   D4,(A4)+
    ADD.L   D5,(A5)+
    ADD.L   D6,(A6)+
    ADD.L   D7,(A7)+
    
    ADD.L   (A0)+,D0
    ADD.L   (A1)+,D1
    ADD.L   (A2)+,D2
    ADD.L   (A3)+,D3
    ADD.L   (A4)+,D4
    ADD.L   (A5)+,D5
    ADD.L   (A6)+,D6
    ADD.L   (A7)+,D7
    
    ADD.L   D0,-(A0)
    ADD.L   D1,-(A1)
    ADD.L   D2,-(A2)
    ADD.L   D3,-(A3)
    ADD.L   D4,-(A4)
    ADD.L   D5,-(A5)
    ADD.L   D6,-(A6)
    ADD.L   D7,-(A7)
    
    ADD.L   -(A0),D0
    ADD.L   -(A1),D1
    ADD.L   -(A2),D2
    ADD.L   -(A3),D3
    ADD.L   -(A4),D4
    ADD.L   -(A5),D5
    ADD.L   -(A6),D6
    ADD.L   -(A7),D7
    
    ADD.L   $00006500,D0
    ADD.L   $00006500,D1
    ADD.L   $00006500,D2
    ADD.L   $00006500,D3
    ADD.L   $00006500,D4
    ADD.L   $00006500,D5
    ADD.L   $00006500,D6
    ADD.L   $00006500,D7
    
    ADD.L   D0,$00007000
    ADD.L   D1,$00007000
    ADD.L   D2,$00007000
    ADD.L   D3,$00007000
    ADD.L   D4,$00007000
    ADD.L   D5,$00007000
    ADD.L   D6,$00007000
    ADD.L   D7,$00007000
		
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main



*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
