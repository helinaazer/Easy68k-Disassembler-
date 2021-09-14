; =============================================================================
; DasmTest.X68 : Jim Hogg : 2021
;
; This file holds a fairly full set of tests for the CSS-422 final project, 
; which builds a disassembler (called "DASM") for a subset of the 68000 
; instruction set.  When assembled, the resulting .S68 binary file becomes the
; tests for the DASM

        OPT     MEX
        
        ; =====================================================================
        ; One-operand instructions
        ; =====================================================================

ONE:    MACRO
        \1.\2   D1
        \1.\2   (A3)
        \1.\2   (A3)+
        \1.\2   -(A3)
        \1.\2   $1234
        \1.\2   $12345678
        ENDM
        
        ; =====================================================================
        ; Two-operand instructions
        ; =====================================================================

TWO:    MACRO
        \1.\2   D0, D2
        \1.\2  (A1),       D2
        \1.\2  (A1)+,      D2
        \1.\2  -(A1),      D2
        \1.\2  $1234,      D2
        \1.\2  $12345678,  D2
        \1.\2  #$12,       D2
        ; ---------------------------------------------------------------------
        \1.\2  D1,         (A3)
        \1.\2  #$12,       (A3)
        ; ---------------------------------------------------------------------
        \1.\2  D1,         (A3)+
        \1.\2  #$12,       (A3)+
        ; ---------------------------------------------------------------------
        \1.\2  D1,         -(A3)
        \1.\2  #$12,       -(A3)
         ; ---------------------------------------------------------------------
        \1.\2  D1,         $1234
        \1.\2  #$12,       $1234
        ; ---------------------------------------------------------------------
        \1.\2  D1,         $12345678
        \1.\2  #$12,       $12345678
        ENDM

        ; =====================================================================
        ; Test LEA.
        ; =====================================================================
tLEA:   MACRO
        LEA     (A1), A2
        LEA     $1234, A2
        LEA     $12345678, A2
        ENDM

        ; =====================================================================
        ; Test SHIFT instructions.  Note that the PRM suggests the target 
        ; operand can be any of: (An), (An)+, -(An), WordAbs and LongAbs.  But
        ; EASy68K rejects them (??)
        ; =====================================================================
tSHIFT: MACRO
        \1.\2   #1, D3
        \1.\2   #2, D3
        \1.\2   #3, D3
        \1.\2   #4, D3
        \1.\2   #5, D3
        \1.\2   #6, D3
        \1.\2   #7, D3
        \1.\2   #8, D3
        ENDM
        
        ; =====================================================================
        ; Test MULS and DIVU instructions
        ; =====================================================================
tMULDIV:    MACRO
            \1.\2   D2, D5
            \1.\2   (A2), D5
            \1.\2   (A2)+, D5
            \1.\2   -(A2), D5
            \1.\2   $1234, D5
            \1.\2   $12345678, D5
            \1.\2   #$1234, D5
            ENDM

        ; =====================================================================
        ; Test MOVEM.  MOVEM <list>, <ea>
        ;              MOVEM <ea>, <list>
        ; =====================================================================
tMOVEM:     MACRO
            MOVEM   D0-D3/D5/A2-A7, (A3)
            MOVEM   D0-D3/D5/A2-A7, -(A3)
            MOVEM   D0-D3/D5/A2-A7, $1234
            MOVEM   D0-D3/D5/A2-A7, $12345678
            
            MOVEM   (A3), D4
            MOVEM   (A3)+, D4
            MOVEM   $1234, D4
            MOVEM   $12345678, D4
            ENDM

        ; =====================================================================
        ; Test Program
        ; =====================================================================

        ORG     $100
        
main:   NOP
        RTS

        ONE     NOT, B
        ONE     NOT, W
        ONE     NOT, L
        
        TWO     ADD, B
        TWO     ADD, W
        TWO     ADD, L
        
        TWO     SUB, B
        TWO     SUB, W
        TWO     SUB, L
        
        TWO     AND, B
        TWO     AND, W
        TWO     AND, L
        
        TWO     MOVE, B
        TWO     MOVE, W
        TWO     MOVE, L
        
        tSHIFT  LSL, B
        tSHIFT  LSL, W
        tSHIFT  LSL, L
       
        tSHIFT  LSR, B
        tSHIFT  LSR, W
        tSHIFT  LSR, L        

        tSHIFT  ASL, B
        tSHIFT  ASL, W
        tSHIFT  ASL, L        

        tSHIFT  ASR, B
        tSHIFT  ASR, W
        tSHIFT  ASR, L 
        
        tLEA
        
        tMULDIV MULS, W
        tMULDIV DIVU, W

        JSR     (A1)
        JSR     $1234
        JSR     $12345678
        
L1:     BLT     L1
        BLT     $12
        BLT     $1234

L2:     BGE     L2
        BGE     $1234
        
L3:     BEQ     L3
        BEQ     $1234
        
L4:     BRA.B   L4
        BRA.W   $12
        BRA.W   $1234
        
        tMOVEM

        SIMHALT 
        END     main  

    













*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
