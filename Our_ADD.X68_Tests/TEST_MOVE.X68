**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: TEST MOVE                                                 *
**************************************************************************
		ORG    	$100			; program gets loaded into the memory
main:							; program execution starting point
    
    *MOVE.B
    MOVE.B  D0,D1
    MOVE.B  D1,D2
    MOVE.B  D2,D3
    MOVE.B  D3,D4
    MOVE.B  D4,D5
    MOVE.B  D5,D6
    MOVE.B  D6,D7
    MOVE.B  D7,D0
    
    MOVE.B  D0,(A0)
    MOVE.B  D1,(A1)
    MOVE.B  D2,(A2)
    MOVE.B  D3,(A3)
    MOVE.B  D4,(A4)
    MOVE.B  D5,(A5)
    MOVE.B  D6,(A6)
    
    MOVE.B  (A0),(A1)
    MOVE.B  (A1),(A2)
    MOVE.B  (A2),(A3)
    MOVE.B  (A3),(A4)
    MOVE.B  (A4),(A5)
    MOVE.B  (A5),(A6)
    MOVE.B  (A6),(A7)
    MOVE.B  (A7),(A0)
    
    MOVE.B  (A0)+,(A1)+
    MOVE.B  (A1)+,(A2)+
    MOVE.B  (A2)+,(A3)+
    MOVE.B  (A3)+,(A4)+
    MOVE.B  (A4)+,(A5)+
    MOVE.B  (A5)+,(A6)+
    MOVE.B  (A6)+,(A7)+
    MOVE.B  (A7)+,(A0)+
    
    MOVE.B  -(A0),-(A1)
    MOVE.B  -(A1),-(A2)
    MOVE.B  -(A2),-(A3)
    MOVE.B  -(A3),-(A4)
    MOVE.B  -(A4),-(A5)
    MOVE.B  -(A5),-(A6)
    MOVE.B  -(A6),-(A7)
    MOVE.B  -(A7),-(A0)
    
    MOVE.B  D1,$00020000
    MOVE.B  D2,$00020000
    MOVE.B  D3,$00020000
    MOVE.B  D4,$00020000
    MOVE.B  D5,$00020000
    MOVE.B  D6,$00020000
    MOVE.B  D7,$00020000
    
    MOVE.B  $00020000,D1
    MOVE.B  $00020000,D2
    MOVE.B  $00020000,D3
    MOVE.B  $00020000,D4
    MOVE.B  $00020000,D5
    MOVE.B  $00020000,D6
    MOVE.B  $00020000,D7
    
    MOVE.B  (A1),$00020000
    MOVE.B  (A2),$00020000
    MOVE.B  (A3),$00020000
    MOVE.B  (A4),$00020000
    MOVE.B  (A5),$00020000
    MOVE.B  (A6),$00020000
    
    MOVE.B  $00020000,(A1)
    MOVE.B  $00020000,(A2)
    MOVE.B  $00020000,(A3)
    MOVE.B  $00020000,(A4)
    MOVE.B  $00020000,(A5)
    MOVE.B  $00020000,(A6)
    
    MOVE.B  $100,$700
    MOVE.B  $2000,$8000
    MOVE.B  $8050,$7050
    MOVE.B  $8000,$90000
    MOVE.B  $ABCDE,$BCDEF
    MOVE.B  $99998,$99999
    MOVE.B  $FFFFF,$FFFFF
    MOVE.B  $00003000,$00006556
    
    
    *MOVE.W
    MOVE.W  D0,D1
    MOVE.W  D1,D2
    MOVE.W  D2,D3
    MOVE.W  D3,D4
    MOVE.W  D4,D5
    MOVE.W  D5,D6
    MOVE.W  D6,D7
    MOVE.W  D7,D0
    
    MOVE.W  D0,(A0)
    MOVE.W  D1,(A1)
    MOVE.W  D2,(A2)
    MOVE.W  D3,(A3)
    MOVE.W  D4,(A4)
    MOVE.W  D5,(A5)
    MOVE.W  D6,(A6)
    
    MOVE.W  (A0),(A1)
    MOVE.W  (A1),(A2)
    MOVE.W  (A2),(A3)
    MOVE.W  (A3),(A4)
    MOVE.W  (A4),(A5)
    MOVE.W  (A5),(A6)
    MOVE.W  (A6),(A7)
    MOVE.W  (A7),(A0)
    
    MOVE.W  (A0)+,(A1)+
    MOVE.W  (A1)+,(A2)+
    MOVE.W  (A2)+,(A3)+
    MOVE.W  (A3)+,(A4)+
    MOVE.W  (A4)+,(A5)+
    MOVE.W  (A5)+,(A6)+
    MOVE.W  (A6)+,(A7)+
    MOVE.W  (A7)+,(A0)+
    
    MOVE.W  -(A0),-(A1)
    MOVE.W  -(A1),-(A2)
    MOVE.W  -(A2),-(A3)
    MOVE.W  -(A3),-(A4)
    MOVE.W  -(A4),-(A5)
    MOVE.W  -(A5),-(A6)
    MOVE.W  -(A6),-(A7)
    MOVE.W  -(A7),-(A0)
    
    MOVE.W  D1,$00020000
    MOVE.W  D2,$00020000
    MOVE.W  D3,$00020000
    MOVE.W  D4,$00020000
    MOVE.W  D5,$00020000
    MOVE.W  D6,$00020000
    MOVE.W  D7,$00020000
    
    MOVE.W  $00020000,D1
    MOVE.W  $00020000,D2
    MOVE.W  $00020000,D3
    MOVE.W  $00020000,D4
    MOVE.W  $00020000,D5
    MOVE.W  $00020000,D6
    MOVE.W  $00020000,D7
    
    MOVE.W  (A1),$00020000
    MOVE.W  (A2),$00020000
    MOVE.W  (A3),$00020000
    MOVE.W  (A4),$00020000
    MOVE.W  (A5),$00020000
    MOVE.W  (A6),$00020000
    
    MOVE.W  $00020000,(A1)
    MOVE.W  $00020000,(A2)
    MOVE.W  $00020000,(A3)
    MOVE.W  $00020000,(A4)
    MOVE.W  $00020000,(A5)
    MOVE.W  $00020000,(A6)
    
    MOVE.W  $100,$700
    MOVE.W  $2000,$8000
    MOVE.W  $8050,$7050
    MOVE.W  $8000,$90000
    MOVE.W  $ABCDE,$BCDEE
    MOVE.W  $99996,$99998
    MOVE.W  $FFFFA,$FFFFE
    MOVE.W  $00003000,$00006556
    
    
    *MOVE.L
    MOVE.L  D0,D1
    MOVE.L  D1,D2
    MOVE.L  D2,D3
    MOVE.L  D3,D4
    MOVE.L  D4,D5
    MOVE.L  D5,D6
    MOVE.L  D6,D7
    MOVE.L  D7,D0
    
    MOVE.L  D0,(A0)
    MOVE.L  D1,(A1)
    MOVE.L  D2,(A2)
    MOVE.L  D3,(A3)
    MOVE.L  D4,(A4)
    MOVE.L  D5,(A5)
    MOVE.L  D6,(A6)
    
    MOVE.L  (A0),(A1)
    MOVE.L  (A1),(A2)
    MOVE.L  (A2),(A3)
    MOVE.L  (A3),(A4)
    MOVE.L  (A4),(A5)
    MOVE.L  (A5),(A6)
    MOVE.L  (A6),(A7)
    MOVE.L  (A7),(A0)
    
    MOVE.L  (A0)+,(A1)+
    MOVE.L  (A1)+,(A2)+
    MOVE.L  (A2)+,(A3)+
    MOVE.L  (A3)+,(A4)+
    MOVE.L  (A4)+,(A5)+
    MOVE.L  (A5)+,(A6)+
    MOVE.L  (A6)+,(A7)+
    MOVE.L  (A7)+,(A0)+
    
    MOVE.L  -(A0),-(A1)
    MOVE.L  -(A1),-(A2)
    MOVE.L  -(A2),-(A3)
    MOVE.L  -(A3),-(A4)
    MOVE.L  -(A4),-(A5)
    MOVE.L  -(A5),-(A6)
    MOVE.L  -(A6),-(A7)
    MOVE.L  -(A7),-(A0)
    
    MOVE.L  D1,$00020000
    MOVE.L  D2,$00020000
    MOVE.L  D3,$00020000
    MOVE.L  D4,$00020000
    MOVE.L  D5,$00020000
    MOVE.L  D6,$00020000
    MOVE.L  D7,$00020000
    
    MOVE.L  $00020000,D1
    MOVE.L  $00020000,D2
    MOVE.L  $00020000,D3
    MOVE.L  $00020000,D4
    MOVE.L  $00020000,D5
    MOVE.L  $00020000,D6
    MOVE.L  $00020000,D7
    
    MOVE.L  (A1),$00020000
    MOVE.L  (A2),$00020000
    MOVE.L  (A3),$00020000
    MOVE.L  (A4),$00020000
    MOVE.L  (A5),$00020000
    MOVE.L  (A6),$00020000
    
    MOVE.L  $00020000,(A1)
    MOVE.L  $00020000,(A2)
    MOVE.L  $00020000,(A3)
    MOVE.L  $00020000,(A4)
    MOVE.L  $00020000,(A5)
    MOVE.L  $00020000,(A6)
    
    MOVE.L  $100,$700
    MOVE.L  $2000,$8000
    MOVE.L  $8050,$7050
    MOVE.L  $8000,$90000
    MOVE.L  $ABCDE,$BCDEE
    MOVE.L  $99996,$99998
    MOVE.L  $FFFFA,$FFFFE
    MOVE.L  $00003000,$00006556

    *MOVE.B IMMEDIATE
    MOVE.B     #$AB, D0
    MOVE.B     #$BC, D1
    MOVE.B     #$CD, D2
    MOVE.B     #$DE, D3
    MOVE.B     #$EF, D4
    MOVE.B     #$12, D5
    MOVE.B     #$32, D6
    MOVE.B     #$66, D7

    *MOVE.W IMMEDIATE
    MOVE.W     #7, D0
    MOVE.W     #6, D1
    MOVE.W     #5, D2
    MOVE.W     #4, D3
    MOVE.W     #3, D4
    MOVE.W     #2, D5
    MOVE.W     #1, D6
    MOVE.W     #12, D7
    
    *MOVE.L IMMEDIATE
    MOVE.L     #$ABCD5678, D0
    MOVE.L     #$BCCD5678, D1
    MOVE.L     #$CDCD5678, D2
    MOVE.L     #$DECD5678, D3
    MOVE.L     #$EFCD5678, D4
    MOVE.L     #$12CD5678, D5
    MOVE.L     #$32CD5678, D6
    MOVE.L     #$66CD5678, D7

    *MOVEA.W
    MOVEA.W D1,A1
    MOVEA.W A1,A2
    MOVEA.W (A1),A2
    MOVEA.W (A1)+,A2
    MOVEA.W -(A1),A2
    MOVEA.W $8000,A2
    MOVEA.W $00001234,A2
    MOVEA.W #$1234,A2
    
    *MOVEA.L 
    MOVEA.L D1,A1
    MOVEA.L A1,A2
    MOVEA.L (A1),A2
    MOVEA.L (A1)+,A2
    MOVEA.L -(A1),A2
    MOVEA.L $8000,A2
    MOVEA.L $00001234,A2
    MOVEA.L #$12345678,A2
		
		SIMHALT					; program halts
		END    	main			; end of program, execution begins at label main






*~Font name~Courier New~
*~Font size~14~
*~Tab type~1~
*~Tab size~4~
