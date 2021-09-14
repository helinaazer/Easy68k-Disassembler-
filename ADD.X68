**************************************************************************
* Title      : Disassembler Motorola 68K DASM                            *
* Written by : Eric, Dani, Helina, Alex                                  *
* Date       : 5/11/21                                                   *
* Description: Disassembler                                              *
**************************************************************************
    ORG     $1000    
; ========================================================================
; Beginning of MACROS used - Daniella
; ========================================================================
outStr              MACRO                       ; outputs a string to io
                    LEA         \1, A1          ; loads the effective address of the string to A1
                    MOVE.B      #14, D0         ; moves task #14 to D0, to then display
                    TRAP        #15             ; display string
                    ENDM

outOpSize           MACRO                       ; outputs an instruction, the given size, and a tab
                    outStr      \1              ; the instruction
                    outStr      \2              ; the size
                    outStr      printTab
                    ENDM
                    
out3Spaces          MACRO                       ; outputs an instruction, the given size, and a tab
                    outStr      printSpace
                    outStr      printSpace
                    outStr      printSpace
                    ENDM                    
                    
printHEX_W          MACRO                       ; takes whatever is at A2 and prints it while incrementing by 2 (word)
                    JSR         HEXtoSTR        ; This is where we print output in Hex 
                    MOVE.B      #1,D0           ; getting rid of the LF
                    MOVE.W      #4,D1           ; 
                    LEA         hexString,A1
                    TRAP        #15 
                    ENDM
                    
printSpecialMsg     MACRO                       ; essentially a subroutine to print out the special add msg
                    outStr      newLine
                    outStr      team1
                    outStr      team2
                    outStr      team3
                    outStr      team4
                    outStr      team5
                    outStr      team6
                    outStr      team7
                    outStr      team8
                    outStr      team9
                    outStr      newLine
                    outStr      team10
                    outStr      team11
                    outStr      team12
                    outStr      team13
                    outStr      team14
                    outStr      newLine
                    ENDM
; *****=============================================================================*****
;                                   Defining terms
; *****=============================================================================*****
; ===================== FANCY TEAM BANNER =====================
team1:              DC.B    '          0101            1010101010101       1010101010101' , CR, LF, 0
team2:              DC.B    '         101010           01010101010101      01010101010101' , CR, LF, 0
team3:              DC.B    '        010  101          010        0101     010        0101' , CR, LF, 0
team4:              DC.B    '       101    010         010         1010    010         1010' , CR, LF, 0
team5:              DC.B    '      010101010101        010         1010    010         1010' , CR, LF, 0
team6:              DC.B    '     10101010101010       010         1010    010         1010' , CR, LF, 0
team7:              DC.B    '    0101        0101      010        0101     010        0101' , CR, LF, 0
team8:              DC.B    '   1010          1010     01010101010101      01010101010101' , CR, LF, 0
team9:              DC.B    '  0101            0101    010101010101        010101010101' , CR, LF, 0
team10:             DC.B    '                          Team Members:' , CR, LF, 0
team11:             DC.B    '                          Azer, Helina' , CR, LF, 0
team12:             DC.B    '                       Pairault, Daniella' , CR, LF, 0
team13:             DC.B    '                         Petrenko, Alex' , CR, LF, 0
team14:             DC.B    '                           Pham, Eric' , CR, LF, 0

; ==================== FILE IO DEFINITIONS ====================
borderLine:         DC.B    '==================================================================' , CR, LF, 0
welcomeMsg:         DC.B    '           Welcome to the Easy68K disassembler program!            ' , CR, LF, 0
enterStartMsg:      DC.B    'Please enter the starting hex-address (8-digits): ' , 0
enterEndMsg:        DC.B    'Please enter the ending hex-address (8-digit): ' , 0
finishMsg:          DC.B    'All done!' , 0
errorMsg:           DC.B    'Error' , CR, LF, 0

pressMsg            DC.B    'Press: ' , CR, LF, 0
pressEnterMsg       DC.B    '    "enter"  - load 15 more lines' , CR, LF, 0
pressPrintAllMsg    DC.B    '    "1"      - print all lines. ' , CR, LF, 0
pressExitMsg        DC.B    '    "9"      - exit program.' , CR, LF, 0

printAll            DS.B    1
lineCount:          DS.B    1
; ---------- ADDRESSING VARIABLES ----------
startAddress:       DS.L    1
endAddress:         DS.L    1
opcode:             DS.L    1
nextWord:           DS.L    1
hexString           DS.L    1
hexValue            DS.L    1
; ==================== OPCODE DEFINITIONS ====================
printADD            DC.B    'ADD',0
printAND            DC.B    'AND',0
printASL            DC.B    'ASL',0
printASR            DC.B    'ASR',0
printBCC            DC.B    'BCC',0
printBEQ            DC.B    'BEQ',0
printBGE            DC.B    'BGE',0
printBLT            DC.B    'BLT',0
printBRA            DC.B    'BRA',0
printDIVU           DC.B    'DIVU',0
printINVALID        DC.B    'd',0            ; tag invalid raw data with 'd'
printJSR            DC.B    'JSR',0
printLEA            DC.B    'LEA',0
printLSL            DC.B    'LSL',0
printLSR            DC.B    'LSR',0
printMOVEA          DC.B    'MOVEA',0
printMOVE           DC.B    'MOVE',0
printMOVEM          DC.B    'MOVEM',0
printMULS           DC.B    'MULS',0
printNOP            DC.B    'NOP',0
printNOT            DC.B    'NOT',0
printRTS            DC.B    'RTS',0
printSUB            DC.B    'SUB',0

printByte           DC.B    '.B',0
printWord           DC.B    '.W',0
printLong           DC.B    '.L',0

; --------------- SEPARATING INSTRUCTION INTO BIT STORAGE ---------------
fourStartBits       EQU     $5000
HEXInstruction      EQU     $5100    
currentWord         EQU     $5200

; -------------------- GENERAL FORMATTING VARIABLES  --------------------
CR                  EQU     $0D     ; /n equivilents
LF                  EQU     $0A
space               DC.W    ' ',0
newLine             DC.B    ' ' , CR, LF, 0
printTab            DC.B    '      ',0
printSpace          DC.B    ' ',0

; ==================== ADDRESSING MODES VARIABLES  ====================
*------------------------- HEX-VALUE TABLE ----------------------------*
Hex_Table          
                    DC.B    '0' , 0
                    DC.B    '1' , 0
                    DC.B    '2' , 0
                    DC.B    '3' , 0
                    DC.B    '4' , 0
                    DC.B    '5' , 0
                    DC.B    '6' , 0
                    DC.B    '7' , 0
                    DC.B    '8' , 0
                    DC.B    '9' , 0
                    DC.B    'A' , 0
                    DC.B    'B' , 0
                    DC.B    'C' , 0
                    DC.B    'D' , 0
                    DC.B    'E' , 0
                    DC.B    'F' , 0
*-----------------------------------------------------------------------*
*------------------------- NUMBERS -----------------------------*
ONE                 DC.B    '1' , 0
TWO                 DC.B    '2' , 0
THREE               DC.B    '3' , 0
FOUR                DC.B    '4' , 0
FIVE                DC.B    '5' , 0
SIX                 DC.B    '6' , 0
SEVEN               DC.B    '7' , 0
ZERO                DC.B    '8' , 0
*-----------------------------------------------------------------------*
*--------------------------- HEX-VALUE TABLE ---------------------------*
Source_Mode             DS.W    1    ; Stores source mode type               
Source_Register         DS.W    1    ; Stores source register ID            
Destination_Mode        DS.W    1    ; Store destination mode type
Destination_Register    DS.W    1    ; Stores destination register ID
Opcode_Size             DS.B    1    ; Size of current Op-Word                   
*-----------------------------------------------------------------------*
; Output Symbols
Pound_Sign          DC.B    '#' , 0
Dollar_Sign         DC.B    '$' , 0
Open_Paran          DC.B    '(' , 0
Closing_Paran       DC.B    ')' , 0
Plus_Sign           DC.B    '+' , 0
Minus_Sign          DC.B    '-' , 0
Comma_Sign          DC.B    ', ' , 0

; Error Handling
Invalid_EA          DC.B    'Invalid EA' , 0
; *****=============================================================================*****
;                               START OF CODING SEGMENT
; *****=============================================================================*****
main:
        JSR         UI_Start
	    JSR         UI_setStart
	    JSR         UI_setEnd
	    *******************************
	    JSR         main_ProcessInput * <-- this is where our main logic should be
	    *******************************
	    JSR         UI_End	
; ----------------------------------------
; Halting simulation
; ----------------------------------------
	    SIMHALT
; *****=============================================================================*****
;                               FILE IO SUBROUTINES - ALEX
; *****=============================================================================*****
; -------------------- WELCOME & ENDING UI MESSAGE  --------------------
UI_Start:
        printSpecialMsg
        outStr      borderLine
        outStr      newLine
        outStr      welcomeMsg
        outStr      newLine
        outStr      borderLine
        RTS
        
UI_End:
        outStr      newLine
        outStr      finishMsg
        RTS      
        
; -------------------- SETTING START & END ADDRESSES  --------------------
; Sets the starting address input from the user
UI_setStart:
        outStr      newLine
        outStr      enterStartMsg
        
        MOVE.B      #2, D0                  ; takes user input
        TRAP        #15                     ; saves user input string into A1 register
        JSR         validAddr               ; jumps to set the address
        MOVE.L      D2, startAddress
        RTS
        
; Sets the ending address input from the user
UI_setEnd:
        outStr      newLine
        outStr      enterEndMsg
        
        MOVE.B      #2, D0
        TRAP        #15
        JSR         validAddr               ; jumps to set the address
        MOVE.L      D2, endAddress
        RTS
        
; ----------------------- CONVERTING STRING TO HEX  -----------------------
validAddr:
        CMP         #8, D1                  ; ensures address entered is 8 digits long
        BNE         ERROR
        
        CLR         D2
        CLR         D5
        
loop_setAddress:
        MOVE.B      (A1)+, D1               ; takes each character from A1 and processes one char by char
        JSR         addressNumbers
        OR.L        D1, D2                  ; essentially adds and then shifts to the left in the data registers
		
        ADD.B       #1, D5                  ; updates the loop to next char
        CMP.W       #8, D5                  ; once it's 8, it's done
        BEQ         endAddr
		
        LSL.L       #$4, D2                 ; stores the number
        BRA         loop_setAddress
		
endAddr:
        RTS
		
addressNumbers:
        CMP.B       #$30, D1                ; Numbers are between 30-39
        BLT.B       ERROR
        CMP.B       #$39, D1
        BGT.B       addressCharacters
        
        SUB.B       #$30, D1                ; subtracts to calculate hex value
        RTS
        
addressCharacters:
        CMP.B       #$41, D1                ; Letters are between 41-46
        BLT.B       ERROR
        CMP.B       #$46, D1
        BGT.B       ERROR
		
        SUB.B       #$37, D1                ; subtracts to calculate hex value
        RTS
; ------------------------------- ERROR MESSAGE  -------------------------------
ERROR:
        outStr      errorMSG
; ----------------------- CONVERTING HEX TO STRING  -----------------------
CLR_FOR_HEX
       CLR          D2
       CLR          D3
       CLR          D6
       CLR          D7
       RTS
       
HEXtoSTR:
        JSR         CLR_FOR_HEX
		MOVE.B      #12, D2                 ; used for shifting to the right
        MOVE.L      #hexString, A6          ; memory address of hexvalue into addr register
hexWord:
        MOVE.B      D3, D6                  ; represents which loop iteration we're at
        MULU.W      #4, D6                  ; used to determine how many bits to shift to the left
        
		MOVE.W      hexValue, D7            ; puts the current instruction into D7 to manipulate
		LSL.W       D6, D7                  ; shifts to the left by current iteration
		LSR.W       D2, D7                  ; shifts to the right by a fixed number of 28
		
		JSR         hexNumber               ; takes the current hex and converts it
		        
		MOVE.B      D7, (A6)                ; A6 points to memory address of hexValue, being updated
		ADD.L       #1, A6                  ; increments to point to the next byte
		
		ADD.B       #1, D3                  ; updates the loop; increments
		CMP.B       #4, D3                  ; an address is up to 8 chars; i.e. when we're at the end
		BLT         hexWord
		
		MOVE.L      A6, A1                  ; finished value is placed into A1
		RTS
		
hexNumber:
        CMP.B       #$9, D7                 ; determines if the number is a number or letter
        BGT.B       hexChar
        
        ADD.B       #$30, D7
        RTS
        
hexChar:
        ADD.B       #$37, D7
        RTS        
        
; -------------------- LOOPING PROCESS FOR EACH INSTRUCTION  --------------------
main_ProcessInput:        
        MOVE.L      startAddress,D4
        MOVE.L      endAddress,D5

print15Lines:
        outStr      newLine
        outStr      pressMsg
        outStr      pressEnterMsg
        outStr      pressPrintAllMsg
        outStr      pressExitMsg
        
        MOVE.B      #0, lineCount            ; starting at line count zero
        MOVE.B      #4, D0                   ; reads the number from the keyboard into D1
        TRAP        #15        
        MOVE.B      D1,printAll
        
main_loop:        
        CMP.B       #1,printAll             ; checks if user wants to print all rather than print in lines of 15
        BEQ         switchUserInput
        CMP.B       #9,printAll             ; checks if user wants to exit the program
        BEQ         end_main
        CMP.B       #15, lineCount          ; has the lineCount reached 15 to print?
        BEQ         print15Lines 
        ADD.B       #1, lineCount           ; increments the line count

switchUserInput:
        SWAP        D4                      ; swaps the first word with the second in D4
        MOVE.W      D4,hexValue
        printHEX_W
        
        SWAP        D4                      ; swaps the first word with the second in D4 to get back to the correct address
        MOVE.W      D4,hexValue
        printHEX_W
        
        outStr      printTab

        MOVE.B      #15, D0                 
        MOVE.B      #16, D2                 ; stores the base of D1 into hex
        MOVE.L      D4, A2                  
        MOVE.W      (A2) , opcode           ; copies our current address pointer of the instruction into a variable to decode
        JSR         startOpcode             ; begins the decoding process for the opcode
                
        ADD.L       #$2, D4                 ; TEMP INSTRUCTION INCREMENTOR
        CMP.L       D4, D5                  ; have we reached the end address?
        BGT.L       main_loop               
        
end_main:
        RTS

; *****=============================================================================*****
;                               OPCODE SUBROUTINES - DANI/HELINA
; *****=============================================================================*****
; ========================================================================
; START of first FOUR BITS -> First HEX
; ========================================================================
startOpcode:             
        MOVE.W      opcode,D7               ; instead of hex we have here, it will be a variable containing input hex      
        JSR         saveFourBits            ; saves the first four starting bits        
        
        ; ---------- Branches 1-3 -------   ; (MOVE) checks first HEX to see MOVE and SIZE
        CMP.B       #$01,fourStartBits
        BEQ         OP_MOVEB                ; only real option is MOVE.B
        CMP.B       #$02,fourStartBits
        BEQ         branch2                 ; either MOVE.L or MOVEA.L
        CMP.B       #$03,fourStartBits
        BEQ         branch3                 ; either MOVE.W or MOVEA.W
        ; ---------- Branch 4  ----------
        CMP.B       #$04,fourStartBits
        BEQ         branch4                 ; (NOP/RTS/JSR/LEA/NOT/MOVEM) checks first HEX = 4
        ; ---------- Branch 6  ---------- 
        CMP.B       #$06,fourStartBits
        BEQ         branch6                 ; (BCC/BEQ/BGE/BLT/BRA) checks first HEX = 6
        ; ---------- Branches 8-9  ---------- 
        CMP.B       #$08,fourStartBits
        BEQ         branch8                 ; (DIVU) checks first HEX = 8
        CMP.B       #$09,fourStartBits
        BEQ         branch9                 ; (SUB) checks first HEX = 9
        ; ---------- Branches C-D  ----------
        CMP.B       #$0C,fourStartBits
        BEQ         branchC                 ; (MULS/AND) checks first HEX = C
        
        CMP.B       #$0D,fourStartBits
        BEQ         branchD                 ; (ADD) checks first HEX = D
        ; ---------- Branch E  ----------
        CMP.B       #$0E,fourStartBits
        BEQ         branchE                 ; (ASL/ASR/LSL/LSR) checks first HEX = E
    
        ; ---------- INVALID OPCODE  ----------
        BRA         INVALID

; ========================================================================
; END of first FOUR BITS -> First HEX
; ========================================================================
; To compare against all 20 (or so) instructions, we begin by comparing
; the instructions with the most known values in binary or hex (depending on multiplicity)
; HEXInstruction -> Stored Hex
; D7 -> Stored data register for comparing a given set of bits
; ========================================================================
; START of Instruction dissassembling starting with the Hex->fourStartBits
; ========================================================================      
branch1:
        JSR         determine6to8           ; saves bits 6to8 from HEX instruction to D7
        CMP.B       #%001,D7                ; compares MOVE's bits to confirm instruction
        BEQ         OP_MOVEAL               ; only MOVEA has bits6to8 equal to '001'
        BRA         OP_MOVEL                ; otherwise it's MOVEL
        RTS    
        
OP_MOVEB:; HEX $1
        outOpSize   printMOVE,printByte

        JSR         determine0to2
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5
        MOVE.W      D7,Source_Mode

        JSR         determine6to8
        MOVE.W      D7,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA
        RTS
                
* ---------- Branch 2 ----------*
branch2:
        JSR         determine6to8           ; saves bits 6to8 from HEX instruction to D7
        CMP.B       #%001,D7                ; compares MOVE's bits to confirm instruction
        BEQ         OP_MOVEAL               ; only MOVEA has bits6to8 equal to '001'
        BRA         OP_MOVEL                ; otherwise it's MOVEL
        RTS        
        
OP_MOVEL:; HEX $2
        outOpSize   printMOVE,printLong
        JSR         determine0to2
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5
        MOVE.W      D7,Source_Mode

        JSR         determine6to8
        MOVE.W      D7,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register

        JSR         Print_EA
        RTS

OP_MOVEAL:; HEX $2
        outOpSize   printMOVEA,printLong
        ADDA.L      #2,A2
        JSR         determine0to2
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5
        MOVE.W      D7,Source_Mode

        JSR         determine6to8
        MOVE.W      D7,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register

        JSR         Print_EA
        RTS

* ---------- Branch 3 ----------*
branch3:
        JSR         determine6to8           ; saves bits6to8 from HEX instruction to D7
        CMP.B       #%001,D7                ; compares MOVE's bits to confirm instruction
        BEQ         OP_MOVEAW               ; only MOVEA has bits6to8 equal to '001'
        BRA         OP_MOVEW                ; otherwise it's MOVEW
        RTS 

OP_MOVEW:; HEX $3
        outOpSize   printMOVE,printWord

        JSR         determine0to2
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5
        MOVE.W      D7,Source_Mode

        JSR         determine6to8
        MOVE.W      D7,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA
        RTS

OP_MOVEAW:
        outOpSize   printMOVEA,printWord

        JSR         determine0to2
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5
        MOVE.W      D7,Source_Mode

        JSR         determine6to8
        MOVE.W      D7,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA
        RTS

; -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*  Branch 4  -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
branch4:
        CMP.W       #$4E71,HEXInstruction
        BEQ         OP_NOP                  ; given the set of HEX we know it's NOP
        
        CMP.W       #$4E75,HEXInstruction
        BEQ         OP_RTS                  ; given the set of HEX we know it's RTS

        JSR         determine6to11          ; saves bits 6to11 fromHEX instruction to D7
        CMP.B       #%111010,D7             ; compares JSR's instruction code to what is stored in D7
        BEQ         OP_JSR             
        
        JSR         determine6to8           ; saves bits 6to8 from HEX instruction to D7
        CMP.B       #%111,D7                ; compares LEA's bits to confirm instruction
        ; issue with addressing modes in LEA
        BEQ         OP_LEA
        
        JSR         determine6to11          ; " " " "
        CMP.B       #%011000,D7             ; compares NOT.B specifically to confirm instruction
        BEQ         OP_NOTB
        
        CMP.B       #%011001,D7             ; compares NOT.W specifically to confirm instruction
        BEQ         OP_NOTW

        CMP.B       #%011010,D7             ; compares NOT.L specifically to confirm instruction
        BEQ         OP_NOTL
        
        JSR         OP_CHECK_MOVEM          ; given how large MOVEM is, it's better to separate           
        RTS
        
; =============== MOVEM BEGINS HERE ===============
OP_CHECK_MOVEM:
        JSR         determine6to11          ; MOVEM has four possibilities between bits 6 to 11 with a beginning of 0100
        CMP.B       #%100010,D7             ; REGISTER->MEMORY WORD
        BEQ         MOVEM_REGtoMEM_W
        CMP.B       #%100011,D7             ; REGISTER->MEMORY LONG
        BEQ         MOVEM_REGtoMEM_L
        CMP.B       #%110010,D7             ; MEMORY->REGISTER WORD
        BEQ         MOVEM_MEMtoREG_W
        CMP.B       #%110011,D7             ; MEMORY->REGISTER LONG
        BEQ         MOVEM_MEMtoREG_L

        BRA         INVALID                 ; HEXInstruction is not any of the given branch 4 instructions
        RTS
        
MOVEM_REGtoMEM_W:
        outStr      printMOVEM
        outStr      printWord
        outStr      printTab
        JSR         MOVEM_REGtoMEM
        RTS

MOVEM_REGtoMEM_L:
        outStr      printMOVEM
        outStr      printLong
        outStr      printTab
        JSR         MOVEM_REGtoMEM
        RTS

MOVEM_MEMtoREG_W:
        outStr      printMOVEM
        outStr      printWord
        outStr      printTab
        JSR         MOVEM_MEMtoREG
        RTS

MOVEM_MEMtoREG_L:
        outStr      printMOVEM
        outStr      printLong
        outStr      printTab
        JSR         MOVEM_MEMtoREG
        RTS
        
; ----- Looping Begins through Instruction to Determine Registers -----
MOVEM_REGtoMEM:
        MOVE.L      #15, D7                 ; opens the data register
        ADDA.L      #2,A2                   ; gets the next word
        MOVE.L      (A2),currentWord        ; to iterate through
        JSR         MOVEM_MASK_DATA
        
        MOVE.B      #6,D0
        MOVE.B      #$8,D1                  ; backspace to get rid of extra slash
        TRAP        #15
        
        ; addressing modes for MOVEM
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode
    
        outStr      comma_Sign
        JSR         Print_EA_Destination  
        outStr      newLine      
        RTS
        
MOVEM_MASK_DATA:
        MOVE.W      currentWord,D1          ; D1 used for bit shifting
        LSL.W       D7, D1                  ; shifts the size of D1, which increases each loop
        LSR.W       #8,D1
        LSR.B       #7,D1

        CMP.B       #%1,D1                  ; isolates bit and verifies if it's set     
        BEQ         MOVEM_DATA              ; pushes data register to stack      
MOVEM_DATA_CONTINUE:
        SUB.B       #1,D7                   ; update loop
        CMP.B       #7,D7                   ; finished reading through the 8 other registers (finished the instruction)
        BGT         MOVEM_MASK_DATA       
        
MOVEM_MASK_ADDR:
        MOVE.W      currentWord,D1          ; D1 used for bit shifting
        LSL.W       D7, D1                  ; shifts the size of D1, which increases each loop
        LSR.W       #8,D1
        LSR.B       #7,D1

        CMP.B       #%1,D1                  ; isolates bit and verifies if it's set     
        BEQ         MOVEM_ADDR              ; pushes address register to stack
MOVEM_ADDR_CONTINUE:
        SUB.B       #1,D7                   ; update loop
        CMP.B       #0,D7                   ; finished reading 8 registers
        BGE         MOVEM_MASK_ADDR
                
        ADD         #2,D4                   ; update counter
        RTS

MOVEM_DATA:
        MOVE.B      #6, D0                  ; prints 1 ascii character to d1
        MOVE.B      #'D', D1
        TRAP        #15

        MOVE.B      #3, D0
        MOVE.L      #15, D1
        SUB.L       D7, D1
        TRAP        #15
 
        MOVE.B      #6, D0                  ; prints 1 ascii character to d1       
        MOVE.B      #'/', D1
        TRAP        #15
        BRA         MOVEM_DATA_CONTINUE
  
MOVEM_ADDR:
        MOVE.B      #6, D0                  ; prints 1 ascii character to d1
        MOVE.B      #'A', D1
        TRAP        #15

        MOVE.B      #3, D0
        MOVE.L      #7, D1
        SUB.L       D7, D1
        TRAP        #15

        MOVE.B      #6, D0
        MOVE.B      #'/', D1
        TRAP        #15
        BRA         MOVEM_ADDR_CONTINUE
        
; ----- Looping Begins through Instruction to Determine Registers -----
MOVEM_MEMtoREG:
        ; addressing modes for MOVEM
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode
        
        ADDA.L      #2,A2                   ; gets the next word
        MOVE.L      (A2),currentWord        ; to iterate through

        JSR         Print_EA_Destination 
        outStr      comma_Sign
        
        MOVE.L      #15, D7                 ; opens the data register
        JSR         MOVEM_MASK_DATA
        
        MOVE.B      #6,D0
        MOVE.B      #$8,D1                  ; backspace to get rid of extra slash
        TRAP        #15
        
        outStr      newLine      
        RTS

; ================ MOVEM ENDS HERE ================
; --- BRANCH 4 GIVEN INSTRUCTIONS ---
OP_NOP:; HEX $4E71
        outStr      printNOP                ; displays the instruction NOP
        outStr      printTab
        outStr      printSpace
        outStr      printSpace        
        outStr      newLine                 ; serves as a linebreak to the next opcode
        RTS

OP_RTS:; HEX $4E75
        outStr      printRTS                ; displays the instruction RTS
        outStr      printTab
        out3Spaces
        outStr      newLine                 ; serves as a linebreak to the next opcode
        RTS
        
OP_JSR:; HEX $4E (bits 11-8 = $E)
        outStr      printJSR                ; displays the instruction JSR
        outStr      printTab
        outStr      printSpace
        outStr      printSpace
        outStr      printSpace
        
        ; no source register or mode for NOT
        
        JSR         determine3to5
        MOVE.W      D7,Source_Mode
        
        JSR         determine0to2          
        MOVE.W      D7,Source_Register
        
        JSR         Print_EA_Source
        
        RTS
        
OP_LEA:; HEX $4 (bits 8-6 = 111)
        outStr      printLEA                ; displays the instruction LEA
        outStr      printTab
        out3Spaces
        
        JSR         determine0to2           ; saves bits 0to2 from HEX instruction for ea register
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5           ; saves bits 3to5 from HEX instruction for ea mode
        MOVE.W      D7,Source_Mode
        
        MOVE.W      #001,Destination_Mode   ; force An destination
        
        JSR         determine9to11          ; saves bits 9to11 from HEX instruction for destination operand
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA
        RTS
                
; --- HEX NOT = $46 -> (grouped by size) ---   
OP_NOTB:
        outOpSize   printNOT,printByte
        outStr      printSpace
        
        ; no source register or mode for NOT
        
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode
        
        JSR         determine0to2          
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA_Destination
        outStr      newLine
        RTS
        
OP_NOTW:    
        outOpSize   printNOT,printWord
        outStr      printSpace
        
        ; no source register or mode for NOT
        
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode
        
        JSR         determine0to2          
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA_Destination
        outStr      newLine
        RTS
        
OP_NOTL:    
        outOpSize   printNOT,printLong
        outStr      printSpace
        
        ; no source register or mode for NOT
        
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode
        
        JSR         determine0to2          
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA_Destination
        outStr      newLine
        RTS
        
; -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*  Branch 6  -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
branch6:
        JSR         determine8to11          ; saves bits 8to11 which serves as the condition code
        
        CMP.B       #%0100,D7               ; CC carry clear 0100 /C
        BEQ         OP_BCC
        CMP.B       #%0111,D7               ; EQ equal 0111 Z
        BEQ         OP_BEQ
        CMP.B       #%1100,D7               ; GE greater or equal 1100 N¥V + /N¥/V
        BEQ         OP_BGE
        CMP.B       #%1101,D7               ; LT less than 1101 N¥/V + /N¥V 
        BEQ         OP_BLT
        
        CMP.B       #%0000,D7               ; differs from conditionals; but still operates in the same way logically
        BEQ         OP_BRA
        
        BRA         INVALID
        RTS

; ---------- HELPER METHODS FOR DISPLACEMENT CALCULATIONS ----------
findDisplacement:      
        JSR         determine0to7           ; determines if the last two HEX are 00, FF or something else (i.e. the displacement)
        CMP.B       #$00,D7                 ; 6x00 HEX = 16 bit displacement
        BEQ         displacement16
        
        BRA         displacement8           ; else it's an 8 bit displacement
        RTS
        
displacement16:
        outStr      printWord
        outStr      printTab
        outStr      printSpace
        outStr      Dollar_Sign

        ADDA.L      #2,A2
        CLR         D7
        MOVE.W      (A2),D7                 ; copies the current PC into D7; PC contains address + 2
        EXT.L       D7
        ADDA.W      D7,A2                    ; the PC contains the address of the instruction word plus 2
        
        ; get the word next to current pointer (16 bits)
        MOVE.W      A2,hexValue
        printHEX_W
        
        ADD.L       #$2, D4                 ; increments address pointer to be in sync w/ A2
        outStr      newLine
        RTS
        
displacement8:
        outStr      printByte
        outStr      printTab
        outStr      printSpace
        outStr      Dollar_Sign
        

        ADDA.L      #2,A2                   ; the PC contains the address of the instruction word plus 2
        CLR         D7
        JSR         determine0to7           ; redundant check to ensure the 8bit displacement is in D7
        EXT.W       D7
        EXT.L       D7        
        ADDA.W      D7,A2                   ; just adds the displacement
        
        MOVE.W      A2,hexValue
        printHEX_W
        
        outStr      newLine
        RTS

; ---------- B INSTRUCTIONS ----------
OP_BCC:
        outStr      printBCC
        JSR         findDisplacement
        RTS

OP_BEQ:
        outStr      printBEQ
        JSR         findDisplacement
        RTS

OP_BGE:
        outStr      printBGE
        JSR         findDisplacement
        RTS

OP_BLT:
        outStr      printBLT
        JSR         findDisplacement
        RTS

OP_BRA:
        outStr      printBRA
        JSR         findDisplacement
        RTS

; -*-*-*-*-*-*-*-*-*-*-*-*-*-*  Branches 8-9  -*-*-*-*-*-*-*-*-*-*-*-*-*-*
branch8:
        JSR         determine6to8           ; saves bits 6to8 from HEX instruction to D7
        CMP.B       #%011,D7                ; compares LEA's bits to confirm instruction
        BEQ         OP_DIVU                 ; if it's equal it branches to DIVU
        
        BRA         INVALID                 ; else INVALID
         
OP_DIVU:; HEX $8 (bits 8-6 = 011)
        outOpSize   printDIVU,printWord
        
        JSR         determine0to2           ; saves bits 0to2 from HEX instruction for ea register
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5           ; saves bits 0to2 from HEX instruction for ea mode
        MOVE.W      D7,Source_Mode
        
        MOVE.W      #0,Destination_Mode
        
        JSR         determine9to11          ; saves bits 0to2 from HEX instruction for destination operand
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA
        
        RTS
        
* ---------- Branch 9 ----------*
branch9:
        JSR         determine6to8           ; saves bits 6to8 which are the expected OPMODE to D7
       
        CMP.B       #%000,D7                ; OPMODE = Byte & DN - <ea> ->DN 
        BEQ         OP_SUB_DN     
        CMP.B       #%001,D7                ; OPMODE = Word & DN - <ea> ->DN 
        BEQ         OP_SUB_DN 
        CMP.B       #%010,D7                ; OPMODE = Long & DN - <ea> ->DN 
        BEQ         OP_SUB_DN    
    
        CMP.B       #%100,D7                ; OPMODE = Byte & <ea> - DN -> <ea>
        BEQ         OP_SUB_EA                
        CMP.B       #%101,D7                ; OPMODE = Word & <ea> - DN -> <ea>
        BEQ         OP_SUB_EA         
        CMP.B       #%110,D7                ; OPMODE = Long & <ea> - DN -> <ea>
        BEQ         OP_SUB_EA         
        
        BRA         INVALID
        RTS

OP_SUB_EA:; Source Mode/Register are bits 0 to 5
        JSR         OP_SUB_SIZE
        
        ; addressing modes section        
        JSR         determine3to5   
        MOVE.W      D7,Destination_Mode  
        
        JSR         determine0to2   
        MOVE.W      D7,Destination_Register
        
        MOVE.W      #0,Source_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Source_Register
        
        ; set opcode size
        JSR         Print_EA
        RTS

OP_SUB_DN:; Destination Mode/Register are bits 0 to 5
        JSR         OP_SUB_SIZE                 ; checks the size of the instruction
        
        ; addressing modes section        
        JSR         determine3to5  
        MOVE.W      D7,Source_Mode  
        
        JSR         determine0to2   
        MOVE.W      D7,Source_Register
        
        MOVE.W      #0,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register        
        ; set opcode size
        JSR         Print_EA
        RTS

OP_SUB_SIZE:
        JSR         determine6to7       ; checks the bits 6-7 to determine the size
        CMP.B       #%00,D7
        BEQ         OP_SUBB             ; Size = Byte
        CMP.B       #%01,D7        
        BEQ         OP_SUBW             ; Size = Word
        CMP.B       #%10,D7        
        BEQ         OP_SUBL             ; Size = Long
        RTS
        
* ----- Goes to the different sized SUBs -----*
OP_SUBB:
        outOpSize   printSUB,printByte
        outStr      printSpace
        RTS

OP_SUBW:
        outOpSize   printSUB,printWord
        outStr      printSpace
        RTS
        
OP_SUBL:
        outOpSize   printSUB,printLong
        outStr      printSpace
        RTS

; -*-*-*-*-*-*-*-*-*-*-*-*-*-*  Branches C-D  -*-*-*-*-*-*-*-*-*-*-*-*-*-*
branchC:
        JSR         determine6to8           ; saves bits 6to8 from HEX instruction to D7
        CMP.B       #%111,D7                ; compares MULS' bits to confirm instruction
        BEQ         OP_MULS
                                            ; moves onto AND instruction        
        CMP.B       #%000,D7                ; OPMODE = Byte & <ea> & DN -> DN
        BEQ         OP_AND_DN     
        CMP.B       #%001,D7                ; OPMODE = Word & <ea> & DN -> DN
        BEQ         OP_AND_DN 
        CMP.B       #%010,D7                ; OPMODE = Long & <ea> & DN -> DN
        BEQ         OP_AND_DN    
    
        CMP.B       #%100,D7                ; OPMODE = Byte & DN & <ea> -> <ea>
        BEQ         OP_AND_EA                
        CMP.B       #%101,D7                ; OPMODE = Word & DN & <ea> -> <ea>
        BEQ         OP_AND_EA         
        CMP.B       #%110,D7                ; OPMODE = Long & DN & <ea> -> <ea>
        BEQ         OP_AND_EA         
        
        BRA         INVALID
        RTS
        
OP_AND_EA:; Source Mode/Register are bits 0 to 5
        JSR         OP_AND_SIZE
        
        ; addressing modes section        
        JSR         determine3to5   
        MOVE.W      D7,Destination_Mode  
        
        JSR         determine0to2   
        MOVE.W      D7,Destination_Register
        
        MOVE.W      #0,Source_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Source_Register
        
        ; set opcode size
        JSR         Print_EA
        RTS

OP_AND_DN:; Destination Mode/Register are bits 0 to 5
        JSR         OP_AND_SIZE                 ; checks the size of the instruction
        
        ; addressing modes section        
        JSR         determine3to5  
        MOVE.W      D7,Source_Mode  
        
        JSR         determine0to2   
        MOVE.W      D7,Source_Register
        
        MOVE.W      #0,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register        
        ; set opcode size
        JSR         Print_EA
        RTS

OP_AND_SIZE:
        JSR         determine6to7       ; checks the bits 6-7 to determine the size
        CMP.B       #%00,D7
        BEQ         OP_ANDB             ; Size = Byte
        CMP.B       #%01,D7        
        BEQ         OP_ANDW             ; Size = Word
        CMP.B       #%10,D7        
        BEQ         OP_ANDL             ; Size = Long
        RTS
     
* ----- Goes to the different sized ANDs -----*
OP_ANDB:
        outOpSize   printAND,printByte
        outStr      printSpace
        RTS

OP_ANDW:
        outOpSize   printAND,printWord
        outStr      printSpace
        RTS
        
OP_ANDL:
        outOpSize   printAND,printLong
        outStr      printSpace
        RTS
        
OP_MULS:; HEX $C (bits 8-6 = 111)
        outOpSize   printMULS,printWord
        
        JSR         determine0to2           ; saves bits 0to2 from HEX instruction for ea register
        MOVE.W      D7,Source_Register
        
        JSR         determine3to5           ; saves bits 0to2 from HEX instruction for ea mode
        MOVE.W      D7,Source_Mode
        
        MOVE.W      #0,Destination_Mode
        
        JSR         determine9to11          ; saves bits 0to2 from HEX instruction for destination operand
        MOVE.W      D7,Destination_Register
        
        JSR         Print_EA
        
        RTS   
* ---------- Branch D ----------*
branchD:      
        JSR         determine6to8           ; saves bits 6to8 from HEX instruction to D7
        
        CMP.B       #%000,D7                ; OPMODE = Byte & <ea> + DN -> DN
        BEQ         OP_ADD_DN     
        CMP.B       #%001,D7                ; OPMODE = Word & <ea> + DN -> DN
        BEQ         OP_ADD_DN 
        CMP.B       #%010,D7                ; OPMODE = Long & <ea> + DN -> DN
        BEQ         OP_ADD_DN    
    
        CMP.B       #%100,D7                ; OPMODE = Byte & DN + <ea> -> <ea>
        BEQ         OP_ADD_EA                
        CMP.B       #%101,D7                ; OPMODE = Word & DN + <ea> -> <ea>
        BEQ         OP_ADD_EA         
        CMP.B       #%110,D7                ; OPMODE = Long & DN + <ea> -> <ea>
        BEQ         OP_ADD_EA         
        
        BRA         INVALID
        RTS
        
OP_ADD_EA:; Source Mode/Register are bits 0 to 5
        JSR         OP_ADD_SIZE
        
        ; addressing modes section        
        JSR         determine3to5   
        MOVE.W      D7,Destination_Mode  
        
        JSR         determine0to2   
        MOVE.W      D7,Destination_Register
        
        MOVE.W      #0,Source_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Source_Register
        
        ; set opcode size
        JSR         Print_EA
        RTS

OP_ADD_DN:; Destination Mode/Register are bits 0 to 5
        JSR     OP_ADD_SIZE                 ; checks the size of the instruction
        
        ; addressing modes section        
        JSR         determine3to5  
        MOVE.W      D7,Source_Mode  
        
        JSR         determine0to2   
        MOVE.W      D7,Source_Register
        
        MOVE.W      #0,Destination_Mode
        
        JSR         determine9to11
        MOVE.W      D7,Destination_Register        
        ; set opcode size
        JSR         Print_EA
        RTS

OP_ADD_SIZE:
        JSR         determine6to7           ; checks the bits 6-7 to determine the size
        CMP.B       #%00,D7
        BEQ         OP_ADDB                 ; Size = Byte
        CMP.B       #%01,D7        
        BEQ         OP_ADDW                 ; Size = Word
        CMP.B       #%10,D7        
        BEQ         OP_ADDL                 ; Size = Long
        RTS

OP_ADDB:
        outOpSize   printADD,printByte
        outStr      printSpace
        RTS

OP_ADDW:
        outOpSize   printADD,printWord
        outStr      printSpace
        RTS
        
OP_ADDL:
        outOpSize   printADD,printLong
        outStr      printSpace
        RTS

; -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*  Branch E  -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
branchE:; first HEX is E = EFFF        
        JSR         determine3to4           ; allows us to know if it's LSL/LSR or ASL/ASR
        CMP.B       #%01,D7                 ; it's an L shift
        BEQ         LSHIFT
          
        CMP.B       #%00,D7                 ; it's an A shift 
        BEQ         ASHIfT
        
        JSR         determine6to7            ; memory shift
        CMP.B       #%11,D7
        BEQ         memoryShift
        
        BRA         INVALID
        RTS

; ---------- HELPER METHODS FOR DETERMING THE SHIFT TYPE ----------
memoryShift:
        JSR         determine9to11          ; left memory shift
        CMP.B       #%001,D7
        BEQ         OP_LS_MEM
        CMP.B       #%000,D7    
        BEQ         OP_AS_MEM
        BRA         INVALID
        RTS     
        
determineShiftL:
        JSR         determine3to5           ; tells us if it's a count or register shift    
        CMP.B       #%001,D7            
        BEQ         SHIFT_COUNT
        CMP.B       #%101,D7
        BEQ         SHIFT_REGISTER
        RTS

determineShiftA:
        JSR         determine3to5           ; tells us if it's a count or register shift    
        CMP.B       #%000,D7            
        BEQ         SHIFT_COUNT
        CMP.B       #%100,D7
        BEQ         SHIFT_REGISTER
        RTS
        
SHIFT_REGISTER:
        MOVE.W      #0,Source_Mode          ; no source mode
        MOVE.W      #0,Destination_Mode     ; no destination mode
        
        JSR         determine9to11          ; bits 9-11 are the data register containing shifts
        MOVE.W      D7,Source_Register
        
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         Print_EA
        RTS
       
SHIFT_COUNT:
        ; No source mode. Force an immediate shift value (0-8)
        outStr      Pound_Sign
        
        JSR         determineCountSize      ; Determine the immediate number value to be shifted
        
        MOVE.B      #3, D0                  ; Display signed number gathered from determineCountSize
        TRAP        #15                     ; Tell system to do it
        
        outStr      Comma_Sign

        JSR         determine0to2           ; Determine destination register and store into D7
        MOVE.W      #0,Destination_Mode     ; Destination mode is not needed. Force Dn.
        MOVE.W      D7,Destination_Register

        JSR         Print_EA_Destination    ; Print EA Destination
        outStr      newLine
        RTS

determineCountSize:
        JSR         determine9to11
        CMP.B       #%001,D7
        BEQ         setCount                ; valid size of 1 
        CMP.B       #%010,D7
        BEQ         setCount                ; valid size of 2 
        CMP.B       #%011,D7
        BEQ         setCount                ; valid size of 3 
        CMP.B       #%100,D7
        BEQ         setCount                ; valid size of 4 
        CMP.B       #%101,D7
        BEQ         setCount                ; valid size of 5 
        CMP.B       #%110,D7
        BEQ         setCount                ; valid size of 6 
        CMP.B       #%111,D7
        BEQ         setCount                ; valid size of 7
        CMP.B       #%000,D7
        BEQ         setCountZero            ; valid size of 8          
        
        BRA         INVALID
        RTS
        
setCount:
        MOVE.W      D7,D1                   ; Store this number in D1 for console output
        RTS        
        
setCountZero:
        MOVE.W      #%1000,D1
        RTS

; --------------- LOGICAL SHIFT METHODS ---------------
LSHIFT:        
        JSR         determine6to8           ; gives us size AND direction
        CMP.B       #%000,D7                ; RIGHT SHIFT BYTE
        BEQ         OP_LSRB
        CMP.B       #%100,D7                ; LEFT SHIFT BYTE
        BEQ         OP_LSLB
        CMP.B       #%001,D7                ; RIGHT SHIFT WORD
        BEQ         OP_LSRW
        CMP.B       #%101,D7                ; LEFT SHIFT WORD
        BEQ         OP_LSLW
        CMP.B       #%010,D7                ; RIGHT SHIFT LONG
        BEQ         OP_LSRL
        CMP.B       #%110,D7                ; LEFT SHIFT LONG
        BEQ         OP_LSLL
        
        BRA         INVALID
        RTS

; Logical shift Memory shifts
OP_LS_MEM:
        JSR         determine6to8           ; checks the direction while also confirming LSL/LSR
        CMP.B       #%011,D7
        BEQ         LSR_MEM
        
        JSR         determine6to8           ; shift left
        CMP.B       #%111,D7
        BEQ         LSL_MEM
        
        RTS
        
LSR_MEM:
        outStr      printLSR
        outStr      printTab
        outStr      printSpace
        outStr      printSpace
        outStr      printSpace
        
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode

        JSR         Print_EA_Destination
        outStr      newLine
        RTS
        
LSL_MEM:
        outStr      printLSL
        outStr      printTab
        outStr      printSpace
        outStr      printSpace
        outStr      printSpace
        
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode

        JSR         Print_EA_Destination
        outStr      newLine
        RTS
        
OP_LSRB:
        outOpSize   printLSR,printByte
        outStr      printSpace
        JSR         determineShiftL
        RTS
        
OP_LSRW:
        outOpSize   printLSR,printWord
        outStr      printSpace
        JSR         determineShiftL
        RTS
        
OP_LSRL:
        outOpSize   printLSR,printLong
        outStr      printSpace
        JSR         determineShiftL    
        RTS

OP_LSLB:
        outOpSize   printLSL,printByte
        outStr      printSpace
        JSR         determineShiftL
        RTS
        
OP_LSLW:
        outOpSize   printLSL,printWord
        outStr      printSpace
        JSR         determineShiftL
        RTS
        
OP_LSLL:
        outOpSize   printLSL,printLong
        outStr      printSpace
        JSR         determineShiftL
        RTS   

; --------------- ARITHMETIC SHIFT METHODS ---------------
ASHIFT:
        JSR         determine6to8           ; gives us size and direction
        CMP.B       #%000,D7                ; RIGHT SHIFT BYTE
        BEQ         OP_ASRB
        CMP.B       #%100,D7                ; LEFT SHIFT BYTE
        BEQ         OP_ASLB
        CMP.B       #%001,D7                ; RIGHT SHIFT WORD
        BEQ         OP_ASRW
        CMP.B       #%101,D7                ; LEFT SHIFT WORD
        BEQ         OP_ASLW
        CMP.B       #%010,D7                ; RIGHT SHIFT LONG
        BEQ         OP_ASRL
        CMP.B       #%110,D7                ; LEFT SHIFT LONG
        BEQ         OP_ASLL
        
        BRA         INVALID
        RTS

; Arithmetic shift memory shifts
OP_AS_MEM:
        JSR         determine6to8           ; checks the direction while also confirming RSL/RSR
        CMP.B       #%011,D7
        BEQ         LSR_MEM
        
        JSR         determine6to8           ; shift left
        CMP.B       #%111,D7
        BEQ         LSL_MEM
        
        RTS
        
ASR_MEM:
        outStr      printASR
        outStr      printTab
        outStr      printSpace
        outStr      printSpace
        outStr      printSpace
        
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode

        JSR         Print_EA_Destination
        outStr      newLine
        RTS
        
ASL_MEM:
        outStr      printASL
        outStr      printTab
        outStr      printSpace
        outStr      printSpace
        outStr      printSpace
        
        JSR         determine0to2
        MOVE.W      D7,Destination_Register
        JSR         determine3to5
        MOVE.W      D7,Destination_Mode

        JSR         Print_EA_Destination
        outStr      newLine
        RTS
      
OP_ASRB:
        outOpSize   printASR,printByte
        outStr      printSpace
        JSR         determineShiftA
        RTS
        
OP_ASRW:
        outOpSize   printASR,printWord
        outStr      printSpace
        JSR         determineShiftA
        RTS
        
OP_ASRL:
        outOpSize   printASR,printLong
        outStr      printSpace
        JSR         determineShiftA
        RTS   

OP_ASLB:
        outOpSize   printASL,printByte
        outStr      printSpace
        JSR         determineShiftA
        RTS
        
OP_ASLW:
        outOpSize   printASL,printWord
        outStr      printSpace
        JSR         determineShiftA
        RTS
        
OP_ASLL:
        outOpSize   printASL,printLong
        outStr      printSpace
        JSR         determineShiftA
        RTS         

; -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*  LAST BRANCH - INVALID  -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
INVALID:
        MOVE.W      (A2),hexValue
        JSR         HEXtoSTR                ; This is where we print output in Hex 
        MOVE.B      #1,D0                   ; getting rid of the LF
        MOVE.W      #4,D1                   ; 
        LEA         hexString,A1
        TRAP        #15
        outStr      printINVALID            ; tag with d
        outstr      newLine
        RTS
; ========================================================================
; END of Instruction dissassembling
; ========================================================================     
; The subroutines in place to determine a given set of bits utilize D7
; as the destination for any bit comparing.
; ========================================================================
; START of determining bits segment
; -> This segment of code simply evaluates a given set of bits for any word
; ========================================================================
saveFourBits:
        MOVE.W      D7,HEXInstruction       ; save the entire hex instruction before extrapolating bits
        LSR.W       #8,D7   
        LSR.W       #4,D7
        MOVE.B      D7,fourStartBits        ; save the first hex into a variable for easy manipulation
        RTS       
        
; -*-*-*-*-*-*-*-*-*-*      Get Bits ZERO to TWO      -*-*-*-*-*-*-*-*-*-*
determine0to2:
        MOVE.W      HEXInstruction,D7        
        MOVE.B      #13,D6                  ; opens D6 in order to then isolate bits
        LSL.W       D6,D7                   ; truncates up to bit 2 (leaving 2 to 0)
        LSR.W       D6,D7                   ; isolates bits 2 to 0
        RTS                             

; -*-*-*-*-*-*-*-*-*-*      Get Bits ZERO to SEVEN    -*-*-*-*-*-*-*-*-*-*
determine0to7:
        MOVE.W      HEXInstruction,D7        
        LSL.W       #8,D7                   ; truncates up to bit 7 (leaving 7 to 0)
        LSR.W       #8,D7                   ; isolates bits 7 to 0
        RTS            
                 
; -*-*-*-*-*-*-*-*-*-*      Get Bits THREE to FOUR    -*-*-*-*-*-*-*-*-*-*
determine3to4:
        MOVE.W      HEXInstruction,D7     
        MOVE.B      #11,D6                  ; truncates up to bit 4 (leaving 4 to 0)
        LSL.W       D6,D7
        MOVE.B      #14,D6
        LSR.W       D6,D7                   ; isolates bits 4 to 3
        RTS                             

; -*-*-*-*-*-*-*-*-*-*      Get Bits THREE to FIVE    -*-*-*-*-*-*-*-*-*-*
determine3to5:
        MOVE.W      HEXInstruction,D7     
        MOVE.B      #10,D6                  ; opens D6 in order to isolate 5 bits
        LSL.W       D6,D7                   ; truncates up to bit 5 (leaving 5 to 0)
        MOVE.B      #13,D6                  ; opens D6 in order to isolate 3 bits
        LSR.W       D6,D7                   ; isolates bits 5 to 3
        RTS                             

; -*-*-*-*-*-*-*-*-*-*      Get Bits THREE to EIGHT   -*-*-*-*-*-*-*-*-*-*
determine3to8:
        MOVE.W      HEXInstruction,D7       
        LSL.W       #7,D7                   ; truncates up to bit 8 (leaving 8 to 0)
        MOVE.B      #10,D6                  ; opens D6 in order to isolate 5 bits
        LSR.W       D6,D7                   ; isolates bits 8 to 3
        RTS    

; -*-*-*-*-*-*-*-*-*-*      Get Bits SIX to SEVEN     -*-*-*-*-*-*-*-*-*-*
determine6to7:
        MOVE.W      HEXInstruction,D7         
        LSL.W       #8,D7                   ; truncates up to bit 7 (leaving 7 to 0)
        MOVE.B      #14,D6                  ; opens D6 in order to isolate 2 bits
        LSR.W       D6,D7                   ; isolates bits 7 to 6
        RTS    

; -*-*-*-*-*-*-*-*-*-*      Get Bits SIX to EIGHT     -*-*-*-*-*-*-*-*-*-*
determine6to8:
        MOVE.W      HEXInstruction,D7         
        LSL.W       #7,D7                   ; truncates up to bit 8 (leaving 8 to 0)
        MOVE.B      #13,D6                  ; opens D6 in order to isolate 2 bits
        LSR.W       D6,D7                   ; isolates bits 8 to 6
        RTS    
        
; -*-*-*-*-*-*-*-*-*-*      Get Bits SIX to ELEVEN     -*-*-*-*-*-*-*-*-*-*
determine6to11:
        MOVE.W      HEXInstruction,D7
        LSL.W       #4,D7                   ; truncates up to bit 11 (leaving 11 to 0)
        MOVE.B      #10,D6                  ; opens D6 in order to isolate 2 bits
        LSR.W       D6,D7                   ; isolates bits 8 to 6
        RTS    
        
; -*-*-*-*-*-*-*-*-*-*      Get Bits EIGHT to ELEVEN     -*-*-*-*-*-*-*-*-*-*
determine8to11:
        MOVE.W      HEXInstruction,D7
        LSL.W       #4,D7                   ; truncates up to bit 11 (leaving 11 to 0)
        MOVE.B      #12,D6                  ; opens D6 in order to isolate 2 bits
        LSR.W       D6,D7                   ; isolates bits 8 to 6
        RTS    

; -*-*-*-*-*-*-*-*-*-*      Get Bits NINE to ELEVEN   -*-*-*-*-*-*-*-*-*-*
determine9to11:
        MOVE.W      HEXInstruction,D7
        LSL.W       #4,D7                   ; truncates up to bit 11 (leaving 11 to 0)
        MOVE.B      #13,D6                  ; opens D6 in order to isolate 2 bits
        LSR.W       D6,D7                   ; isolates bits 11 to 9
        RTS    
; ------------------------------------------------------------------------
; END of determining bits segment
; ------------------------------------------------------------------------
; *****=============================================================================*****
;                           ADDRESSING MODES CODE SECTION - ERIC
; *****=============================================================================*****
*---------------------- EA Mode Class Overview --------------------------*
; Receives 6 bits from the Effective Address field of the op-code word
; Addressing Modes will be saved in Data Register 2
; Addressing Registers will be saved in Data Register 3
; Operation instruction size will be saved in Data Register 4
*------------------------------------------------------------------------*
*--------------------------- DECODE EFFECTIVE ADDRESS -----------------------------------*
Decode_EA:       
        LEA         Mode_Table, A3          ; Load effective address of Mode Table into A3 
        LEA         Hex_Table, A4           ; Load effective address of Hex Table into A4 (grab
                                            ; characters to print)
        MULU        #6,D2
        JSR         (A3, D2)                ; Jump to Mode Table subroutine + the value in D2
                                            ; Think of A3 as the first value in the array and
                                            ; D2 as the index (D2 is the Address Mode we will
                                            ; decode)
        RTS
*----------------------------------------------------------------------------------------*
*--------------------------- EA MODE TABLE ----------------------------------------------*
Mode_Table:  
        JMP         EA_Mode_1               ; Data Register Direct
        JMP         EA_Mode_2               ; Address Register Direct
        JMP         EA_Mode_3               ; Address Register Indirect
        JMP         EA_Mode_4               ; Address Register Indirect Post-increment
        JMP         EA_Mode_5               ; Address Register Indirect Pre-decrement
        JMP         EA_Mode_6               ; Unsupported EA Mode
        JMP         EA_Mode_7               ; Unsupported EA Mode
        JMP         EA_Mode_8               ; Handle 3 Address Modes (Immediate/Long/Word)
*----------------------------------------------------------------------------------------*
*----------------------------- EFFECTIVE ADDRESS MODES ----------------------------------*
; Data Register Direct
EA_Mode_1:; Print 'D' for data register direct modes
        MOVE.B      #2,nextWord
           
        MOVE.L      #26,D6                  ; Task that copies 'D' into Data Register D5 (increment
                                            ; by 2 to step through Hex Table)
        LEA         (A4,D6) , A1            ; Load address of 'D' from D5 from Hex Table (A4)
        MOVE.B      #14,D0
        TRAP        #15                     ; Tell system to do it
           
        ; Determine value of register (0-7)
        MULU        #2,D3
        LEA         (A4,D3),A1              ; Load address of Register number from Register D3 from 
                                            ; Hex Table (A4)
        MOVE.B      #14,D0  
        TRAP        #15                     ; Tell system to print the value of the register
        RTS                                 ; If successful, return
 
; Address Register Direct
EA_Mode_2:; Print 'A' for address register direct modes
        MOVE.B      #2,nextWord

        MOVE.L      #20, D6                 ; Task that copies 'A' into Data Register D5
        LEA         (A4, D6) , A1           ; Load address of register value from D5 from Hex Table (A4)
        TRAP        #15                     ; Tell system to do it
           
        ; Determine value of address register (0-7)
        MULU        #2, D3
        LEA         (A4, D3),A1             ; Load address of Register number from Data Register D3 from
                                            ; Hex Table (A4)
        MOVE.B      #14, D0      
        TRAP        #15                     ; Tell system to do it
        RTS                                 ; If successful, return to JSR

; Address Register Indirect
EA_Mode_3:
        MOVE.B      #2,nextWord

        outStr      Open_Paran
        JSR         EA_Mode_2               ; Perform Address Register Direct subroutine
        outStr      Closing_Paran         
                                            ; Writes in this order: '(' then 'Address Register Indirect Output' then ')'
        RTS                                 ; If successful, return

; Address Register Indirect Post-increment
EA_Mode_4:
        MOVE.B      #2,nextWord
  
        JSR         EA_Mode_3               ; Jump to Address Register Indirect subroutine
        outStr      Plus_Sign
                                            ; Writes in this order: '(' then 'Address Register Indirect Output' then ')' then '+'
        RTS                                 ; If successful, return

; Address Register Indirect Pre-decrement
EA_Mode_5:  
        MOVE.B      #2,nextWord
        
        outStr      Minus_Sign
        JSR         EA_Mode_3               ; Jump to Address Register Indirect subroutine
                                            ; Writes in this order: '-' then '(' then 'Address Register Indirect Output' then ')'
        RTS                                 ; If successful, return

; Error Handling
EA_Mode_6:  
        BRA THROW_ERROR                     ; Invalid EA_Mode (Not supported: 101)

; Error Handling
EA_Mode_7:  
        BRA THROW_ERROR                     ; Invalid EA_Mode (Not supported: 110)

; Handle 3 Address Modes (Word/Long/Immediate 1-Word & 2-Word)
EA_Mode_8:
        MOVE.B      #4,nextWord

        MOVEA.L     A2, A3                  ; Copies A5 address mode into Mode Table for comparison
        CMP.B       #%000, D3               ; If equal to Word value; match to Word EA
        BEQ         EA_WORD
        CMP.B       #%001, D3               ; If equal to Long value; match to Long EA
        BEQ         EA_LONG
        CMP.B       #%100, D3               ; If equal to immediate value; match to Immediate EA
        BEQ         EA_IMMEDIATE    
        BRA         THROW_ERROR             ; End of EA Handling
            
EA_WORD:
        outStr      Dollar_Sign

        ADDA.L      #2, A2                  ; increments the address pointer to immediate value
        MOVE.W      (A2),hexValue
        printHEX_W
        ADD.L       #$2, D4                 ; increments address pointer to be in sync w/ A2

        RTS                                 ; If successful, return

EA_LONG:
        outStr      Dollar_Sign
        
        ADDA.L      #2, A2                  ; increments the address pointer to immediate value
        MOVE.W      (A2),hexValue
        printHEX_W
        ADDA.L      #2, A2                  ; increments the address pointer to immediate value
        MOVE.W      (A2),hexValue
        printHEX_W
        
        ADD.L       #$4, D4                 ; increments address pointer to be in sync w/ A2
    
        RTS                                 ; If successful, return
            
EA_IMMEDIATE:   
        outStr      Pound_Sign
        outStr      Dollar_Sign
        
        CLR.L       D2                      ; Clears D2 as precaution, used to compare bit size
        
        MOVE.B      Opcode_Size, D2         ; Copy operation instruction size into Data Register 4       
        CMP.B       #1, D2                  ; Compares if the opcode size is greater than the immediate value of 1
        BGT         EA_IMMEDIATE_LONG       ; Checks if these conditions are met:
                                            ;     1. The Z, N and V flags are all clear
                                            ;     2. The Z flag is clear, but the N and V flags are both set              
                
        ADDA.L      #2, A2                  ; increments the address pointer to immediate value        
        MOVE.B      #15,D0                  ; getting rid of the LF
        MOVE.B      #16,D2 
        MOVE.W      (A2),D1
        TRAP        #15 
                    
        ADD.L       #$2, D4                 ; increments address pointer to be in sync w/ A2

        RTS                                 ; If successful, return
                
EA_IMMEDIATE_LONG:           
        ADDA.L      #2, A2                  ; increments the address pointer to immediate value
        MOVE.W      (A2),hexValue
        printHEX_W
        ADDA.L      #2, A2                  ; increments the address pointer to immediate value
        MOVE.W      (A2),hexValue
        printHEX_W   

        ADD.L       #$4, D4                 ; increments address pointer to be in sync w/ A2
   
        RTS                                 ; If successful, return
*------------------------------------------------------------------------------------*
*----------------------------------ERROR HANDLING------------------------------------*
; Handle invalid Effective Addressing
THROW_ERROR:     
        outStr      Invalid_EA      
        ADDA.W      #2, A2                  ; Skip over next two Words
        RTS                                 ; Throw error
*------------------------------------------------------------------------------------*
*---------------------------------- PRINT OPERATIONS --------------------------------*
; Print Effective Addresses
PRINT_EA:        
        MOVE.W      Source_Mode, D2         ; Stores the source mode into D2 register
        MOVE.W      Source_Register, D3     ; Stores the source register into D3 register
        JSR         Decode_EA               ; Jumps to Decode_EA subroutine
    
        outStr      Comma_Sign
                
        MOVE.W      Destination_Mode, D2        ; Stores the destination mode into D2 register
        MOVE.W      Destination_Register, D3    ; Stores the destination register into D3 register
        JSR         Decode_EA        
                
        outStr      newLine   
        RTS
 PRINT_EA_Source:
        MOVE.W      Source_Mode, D2         ; Stores the source mode into D2 register
        MOVE.W      Source_Register, D3     ; Stores the source register into D3 register
        JSR         Decode_EA               ; Jumps to Decode_EA subroutine
        
        outStr      newLine 
        RTS
 PRINT_EA_Destination:
        MOVE.W      Destination_Mode, D2        ; Stores the destination mode into D2 register
        MOVE.W      Destination_Register, D3    ; Stores the destination register into D3 register
        JSR         Decode_EA        
                
        ;outStr      newLine   
        RTS
; =============================================================================
; End of code
; =============================================================================
        END     main            ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
