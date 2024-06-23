

	AREA MYDATA, DATA, READWRITE

	
RCC_BASE	EQU		0x40021000
RCC_APB2ENR		EQU		RCC_BASE + 0x18


GPIOC_BASE         EQU      0x40011000   ; port c
GPIOC_CRH         EQU     GPIOC_BASE+0x04
GPIOC_CRL         EQU     GPIOC_BASE
GPIOC_ODR     EQU        GPIOC_BASE+0x0C
GPIOC_IDR     EQU        GPIOC_BASE+0x08



GPIOA_BASE      EQU     0x40010800
GPIOA_CRH         EQU     GPIOA_BASE+0x04
GPIOA_CRL         EQU     GPIOA_BASE
GPIOA_ODR     EQU        GPIOA_BASE+0x0C
GPIOA_IDR     EQU        GPIOA_BASE+0x08
GPIOB_IDR     EQU        GPIOB_BASE+0x08
		
AFIO_BASE	EQU	0x40010000
AFIO_MAPR	EQU	AFIO_BASE + 0x04

GPIOB_BASE  EQU 0x40010C00
GPIOB_CRH         EQU     GPIOB_BASE+0x04
GPIOB_CRL         EQU     GPIOB_BASE
GPIOB_ODR     EQU        GPIOB_BASE+0x0C



INTERVAL EQU 0x566004		;just a number to perform the delay. this number takes roughly 1 second to decrement until it reaches 0


	

;the following are pins connected from the TFT to our EasyMX board
;RD = PB9		Read pin	--> to read from touch screen input 
;WR = PB13		Write pin	--> to write data/command to display
;RS = PB12		Command pin	--> to choose command or data to write
;CS = PB15		Chip Select	--> to enable the TFT, lol	(active low)
;RST= PB6		Reset		--> to reset the TFT (active low)
;D0-7 = PA0-7	Data BUS	--> Put your command or data on this bus



;just some color codes, 16-bit colors coded in RGB 565
BLACK	EQU   	0x0000
;BLUE 	EQU  	0xF8B2
;YELLOW 	EQU  	0x07FF
YELLOW2   	EQU 	0x4000
GREEN 	EQU  	0x07E0
;CYAN  	EQU  	0x07FF
MAGENTA EQU 	0xF81F
RED	EQU  	    0x001F
WHITE 	EQU  	0xFFFF
GREEN2 	EQU 	0x2FA4
CYAN2 	EQU  	0x07FF

GREY EQU 0x6b4d
FIREBRICK EQU 0X001F	 ; BODY OF GHOST
DARKORCHID EQU 0X7B5D    ; PANTS OF GHOST
NAVAJOWHITE EQU 0XEFFF   ; FACE AND ARMS OF GHOST BEFORE
DARKGREEN   EQU  0X07F0  ; FACE AND ARMS AND PANTS OF GHOST AFTER
LIGHTBLUE EQU 0xfea0     ;TESTED
BROWN EQU     0X1234
Pink    EQU     0xF81F
	
	
	
;BLACK	EQU   	0x0000
BLUE	EQU  	0xF8B2
;YELLOW2   	EQU 	0x4000
;GREEN 	EQU  	0x07E0
CYAN  	EQU  	0xFFE0
;MAGENTA EQU 	0xF81F
;RED	EQU  	0x001F
;WHITE 	EQU  	0xFFFF
;GREEN2 	EQU 	0x2FA4
;	 
;FIREBRICK EQU 0X001F	 ; BODY OF GHOST
;DARKORCHID EQU 0X7B5D    ; PANTS OF GHOST
;NAVAJOWHITE EQU 0XEFFF   ; FACE AND ARMS OF GHOST
;	
;Pink    EQU     0xF81F

;BROWN EQU     0X1234
;SEALBROWN        EQU      0x5921
;DARKBLUE   EQU     0xF8B2   ;TESTED
;DARKGREEN   EQU  0X1240  ;TESTED
;LIGHTBLUE 	EQU  	0xFFF9  ;TESTED
;GOLD     EQU     0x07FF     ;TESTED
;BLUE2   EQU     0xFFD9      ;TESTED
;LIGHTGREEN EQU 0x07F0      ;TESTED
YELLOW  EQU 0xEFFF	


TIMER DCW 0X001E
DIRECTION1 DCW 0X0000
DIRECTION2 DCW 0X0000
DIRECTION3 DCW 0X0000
COUNTER DCW 0X32

PRISONERX DCW 0X1111
PRISONERY DCW 0x0020
GHOST1X DCW 0X000A
GHOST1Y DCW 0x006A
GHOST2X DCW 0X000A
GHOST2Y DCW 0x0096
GHOST3X DCW 0X000A
GHOST3Y DCW 0x00BE



BUNNY_X	   DCW		0xC8    ;BUNNY 
BUNNY_Y	   DCW		0xb7
JUMPFRD    DCW      0x00	
LEVEL      DCW      0X00

STARTING_X_LOG1_L1  DCW 0X0A   ;RIVER
STARTING_X_LOG2_L1  DCW 0XF0
SPEED_L1            DCW 0X0A
LOG1_LENGTH_L1      DCW 0X50
LOG2_LENGTH_L1      DCW 0X50


STARTING_X_LOG1_L2  DCW 0X32
STARTING_X_LOG2_L2  DCW 0XF0
SPEED_L2            DCW 0X0F
LOG1_LENGTH_L2      DCW 0X3C
LOG2_LENGTH_L2      DCW 0X3C


STARTING_X_LOG1_L3  DCW 0X1E
STARTING_X_LOG2_L3  DCW 0XA0
SPEED_L3            DCW 0X0A
LOG1_LENGTH_L3      DCW 0X64
LOG2_LENGTH_L3      DCW 0X64



STARTING_X_LOG1_L4  DCW 0X32
STARTING_X_LOG2_L4  DCW 0XA0
SPEED_L4            DCW 0X0F
LOG1_LENGTH_L4      DCW 0X50
LOG2_LENGTH_L4      DCW 0X50


STARTING_X_LOG1_L5  DCW 0X14
STARTING_X_LOG2_L5  DCW 0XB4
SPEED_L5            DCW 0X0A
LOG1_LENGTH_L5      DCW 0X64
LOG2_LENGTH_L5      DCW 0X64


	EXPORT __main
	
	

	AREA	MYCODE, CODE, READONLY
	ENTRY
	
;    B SKIPPED1
;	LTORG
;SKIPPED1

__main FUNCTION

	;This is the main funcion

     ;CALL FUNCTION SETUP
	BL SETUP


	;DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	
	BL MAIN_MENU 
	
ENDINGG
GET_END
    BL MAIN_MENU
	ENDFUNC
		
EXECUTEPACMAN FUNCTION
	
	PUSH {R0-R12,LR}
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	BL INITIALIZE_VARIABLES
	
	;; KEY VALUE IN R9
	MOV R9, #0   ;THIS FOR KEY
	MOV R6,#0    ;THIS FOR LEVEL CHECK
	BL DRAW_LEVEL1
	
	BL DRAW_WALLS
	BL DRAW_PRISONER
	

	LDR R7,=GHOST1X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST1Y   ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST

    LDR R7,=GHOST2X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST2Y     ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]

	BL DRAW_GHOST
	
	LDR R7,=GHOST3X      ;SETTING THE VALUE OF X1
	LDR R8,=GHOST3Y     ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST


     MOV R8,#302
	 MOV R6,#169
     BL DRAW_CIRCLE    ;DRAW KEY
	 
	 
	 MOV R0,#20
	 MOV R1,#215
	 BL Draw_Arrow
	 

	
   ; BL DRAW_TIMEOUT
;//////////////////////////////////////Check if button is pressed///////////////////////////////////////
INFINITELOOP 
	 LDR R5, =COUNTER
	 LDRH R0,[R5]
	 ldr r12,=GPIOB_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #4
	 AND r11,r11, R2
	 CMP R11, #0
	 BEQ jump2
	 ldr r12,=GPIOB_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #7
	 AND r11,r11, R2
	 CMP R11, #0
	 BEQ jump4
	 ldr r12,=GPIOB_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #5
	 AND r11,r11, R2
	 CMP R11, #0
	 BEQ jump6
	 ldr r12,=GPIOC_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #15
	 AND r11,r11, R2
	 CMP R11, #0
	 BEQ jump8
CONT
	 BL MOVE_GHOST1_RIGHT
	 BL MOVE_GHOST1_LEFT
	 BL MOVE_GHOST2_RIGHT
	 BL MOVE_GHOST2_LEFT
	 BL MOVE_GHOST3_RIGHT
	 BL MOVE_GHOST3_LEFT
	 BL GHOST_COLLISION
	 
	 SUB  R0,#1
	 STRH R0,[R5]
	 
	 ;CMP R6,#1
	 B TIMERLEVEL2
	 
RETURN4
;; Collecting Key
     LDR R4,=PRISONERX
	 LDRH R5,[R4]
     CMP R5,#270   ;X comparison
     BGE CHECK_Y
	 
RETURN 
;; WIN CONDITION
     LDR R4,=PRISONERX   ;if prisoner at position x go to check y 
	 LDRH R5,[R4]
     CMP R5,#40    ;X comparison
     BLT OPEN_Y    ;else if not at posion x  go forward in infinite loop        

RETURN2
      B INFINITELOOP
	


;	 
OPEN_Y  
   LDR R4,=PRISONERY     ;if prisoner at position y go to check if he has the key 
   LDRH R5,[R4]
   CMP R5, #192
   BGE CHECK_COLLECTING_KEY
   B RETURN2       ;else go back he is not at the open 
   
CHECK_COLLECTING_KEY    ;if prisoner has the key 
    CMP R9,#1    ;r9 determines if prisoner has the key = 1 not 0
	;PUSH{R9,R10}
	BEQ Win_Animation    ;then he wins 
	B RETURN2

;  
;     
Win_Animation
     BL DRAW_HIDDEN_PRISONER
     BL DRAW_winner
	 BL delay_half_second
	 MOV R0, #0
	 MOV R1, #0
	 MOV R3, #320
	 MOV R4, #240 
	 LDR R10, =WHITE
	 BL DRAW_RECTANGLE_FILLED
	 MOV R0,#100
	 MOV R1,#90
	 BL DRAW_WIN_ANIMATION
	 BL delay_half_second
	 CMP R6,#1    ;IF HE IS IN LEVEL 1
	 BNE GET_LEVEL2
	 CMP R6,#1    ;IF HE IS IN LEVEL2
;	 LDR R12,=LEVEL
;	 LDRH R11,[R10]
;	 CMP r11,#1   ;IF HE IS IN LEVEL 1
     BEQ GET_END	  ;END OF GAME OR GO TO END OF MAIN 

;##########


;   B SKIPPED2
;	LTORG
;SKIPPED2

;   B  do   
  B jump
jump2
   B GOLEFT
jump
;do

  B jump3
jump4
   B GORIGHT
jump3


  B jump5
jump6
   B GODOWN
jump5

  B jump7
jump8
   B GOUP
jump7

GET_LEVEL1
    BL INITIALIZE_VARIABLES
    BL DRAW_LEVEL1  ;GO TO LEVEL
	B RETURN2 
;	
;	
GET_LEVEL2
;	 LDR R12,=LEVEL
;	 LDRH R11,[R12]
;	 MOV R11,#1    ;CHANGE TO BE THAT HE IS IN LEVEL2
;	 STRH R11,[R12]
      mov r6,#1
	 mov r9,#0
	 BL INITIALIZE_VARIABLES
     BL DRAW_LEVEL2
	 B RETURN2
	
CHECK_Y
   LDR R4,=PRISONERY
   LDRH R5,[R4]
   CMP R5, #0x98
   BGE COLLECT_KEY
   B RETURN

COLLECT_KEY 
   PUSH{R8,R6}
    MOV R8,#302
	MOV R6,#169
   BL  DRAW_Hidden_Key
   POP{R8,R6}
   MOV R8, #300; X
   push{R6}
   MOV R6, #4   ;y
   BL  DRAW_CIRCLE
   pop{R6}
   MOV R9,#1
   B RETURN
   
	
;#######

TIMEEE
     
     BL DRAW_TIME
	 B RETURN4

GORIGHT
	BL MOVE_PRISONER_RIGHT
	B CONT
	
GOLEFT
    BL MOVE_PRISONER_LEFT
	B CONT
	
GODOWN
    BL MOVE_PRISONER_DOWN
    B CONT
	
GOUP
    BL MOVE_PRISONER_UP
    B CONT
	
TIMERLEVEL2
	  CMP R0,#0
	  BEQ COUNTER2
	  B RETURN4
COUNTER2	  
	  LDR R5, =COUNTER
      LDRH R0,[R5]
      MOV  R0,#50
      STRH R0,[R5]
	  CMP R6,#1
	  BEQ TIMEEE
      B RETURN4

;ENDINGG
;GET_END
	POP {R0-R12,PC}
	
	ENDFUNC









;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FUNCTIONS' DEFINITIONS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@



    B SKIPPED3
	LTORG
SKIPPED3



;#####################################################################################################################################################################
LCD_WRITE FUNCTION
	;this function takes what is inside r2 and writes it to the tft
	;this function writes 8 bits only
	;later we will choose whether those 8 bits are considered a command, or just pure data
	;your job is to just write 8-bits (regardless if data or command) to PE0-7 and set WR appropriately
	;arguments: R2 = data to be written to the D0-7 bus

	;TODO: PUSH THE NEEDED REGISTERS TO SAVE THEIR CONTENTS. HINT: Push any register you will modify inside the function
	PUSH {r0-r3, LR}


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING WR to 0 ;;;;;;;;;;;;;;;;;;;;;
	;TODO: RESET WR TO 0
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	LSL R3, #13
	MVN R3, R3
	AND r0, r0, R3
	STRH r0, [r1]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;; HERE YOU PUT YOUR DATA which is in R2 TO PE0-7 ;;;;;;;;;;;;;;;;;
	;TODO: SET PE0-7 WITH THE LOWER 8-bits of R2
	LDR r1, =GPIOA_ODR
	STRB r2, [r1]			;only write the lower byte to PE0-7
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;;;;;;;;;;;;;;;;;;;;;;;;;; SETTING WR to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET WR TO 1 AGAIN (ie make a rising edge)
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #13
	STRH r0, [r1]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	;TODO: POP THE REGISTERS YOU JUST PUSHED.
	POP {R0-r3, PC}
;#####################################################################################################################################################################
    ENDFUNC





    B SKIPPED4
	LTORG
SKIPPED4




;#####################################################################################################################################################################
LCD_COMMAND_WRITE FUNCTION
	;this function writes a command to the TFT, the command is read from R2
	;it writes LOW to RS first to specify that we are writing a command not data.
	;then it normally calls the function LCD_WRITE we just defined above
	;arguments: R2 = data to be written on D0-7 bus

	;TODO: PUSH ANY NEEDED REGISTERS
	PUSH {R0-R3, LR}
	


	;TODO: SET RD HIGH (we won't need reading anyways, but we must keep read pin to high, which means we will not read anything)
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #6
	STRH r0, [r1]

	;;;;;;;;;;;;;;;;;;;;;;;;; SETTING RS to 0 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RS TO 0 (to specify that we are writing commands not data on the D0-7 bus)
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	LSL R3, #12
	MVN R3, R3
	AND r0, r0, R3
	STRH r0, [r1]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;TODO: CALL FUNCTION LCD_WRITE
	BL LCD_WRITE


	;TODO: POP ALL REGISTERS YOU PUSHED
	POP {R0-R3, PC}
;#####################################################################################################################################################################

    ENDFUNC


 B SKIPPED5
	LTORG
SKIPPED5

;#####################################################################################################################################################################
LCD_DATA_WRITE FUNCTION
	;this function writes Data to the TFT, the data is read from R2
	;it writes HIGH to RS first to specify that we are writing actual data not a command.
	;arguments: R2 = data

	;TODO: PUSH ANY NEEDED REGISTERS
	PUSH {R0-R3, LR}

	;TODO: SET RD TO HIGH (we don't need to read anything)
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #6
	STRH r0, [r1]

	;;;;;;;;;;;;;;;;;;;; SETTING RS to 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RS TO 1 (to specify that we are sending actual data not a command on the D0-7 bus)
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #12
	STRH r0, [r1]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;TODO: CALL FUNCTION LCD_WRITE
	BL LCD_WRITE

	;TODO: POP ANY REGISTER YOU PUSHED
	POP {R0-R3, PC}
;#####################################################################################################################################################################
   ENDFUNC


    B SKIPPED6
	LTORG
SKIPPED6
; REVISE WITH YOUR TA THE LAST 3 FUNCTIONS (LCD_WRITE, LCD_COMMAND_WRITE AND LCD_DATA_WRITE BEFORE PROCEEDING)




;#####################################################################################################################################################################
LCD_INIT FUNCTION
	;This function executes the minimum needed LCD initialization measures
	;Only the necessary Commands are covered
	;Eventho there are so many more in the DataSheet

	;TODO: PUSH ANY NEEDED REGISTERS
  	PUSH {R0-R3, LR}

	;;;;;;;;;;;;;;;;; HARDWARE RESET (putting RST to high then low then high again) ;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: SET RESET PIN TO HIGH
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #9
	STRH r0, [r1]

	;TODO: DELAY FOR SOME TIME
	BL delay_1_second

	;TODO: RESET RESET PIN TO LOW
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	LSL R3, #9
	MVN R3, R3
	AND r0, r0, R3
	STRH r0, [r1]

	;TODO: DELAY FOR SOME TIME
	BL delay_10_milli_second

	;TODO: SET RESET PIN TO HIGH AGAIN
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #9
	STRH r0, [r1]

	;TODO: DELAY FOR SOME TIME
	BL delay_1_second
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






	;;;;;;;;;;;;;;;;; PREPARATION FOR WRITE CYCLE SEQUENCE (setting CS to high, then configuring WR and RD, then resetting CS to low) ;;;;;;;;;;;;;;;;;;
	;TODO: SET CS PIN HIGH
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #15
	STR r0, [r1]

	;TODO: SET WR PIN HIGH
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #13
	STRH r0, [r1]

	;TODO: SET RD PIN HIGH
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	ORR r0, r0, R3, LSL #6
	STRH r0, [r1]

	;TODO: SET CS PIN LOW
	LDR r1, =GPIOB_ODR
	LDR r0, [r1]
	MOV R3, #1
	LSL R3, #15
	MVN R3, R3
	AND r0, r0, R3
	STR r0, [r1]
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	




	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; SOFTWARE INITIALIZATION SEQUENCE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;TODO: ISSUE THE "SET CONTRAST" COMMAND, ITS HEX CODE IS 0xC5
	MOV R2, #0xC5
	BL LCD_COMMAND_WRITE

	;THIS COMMAND REQUIRES 2 PARAMETERS TO BE SENT AS DATA, THE VCOM H, AND THE VCOM L
	;WE WANT TO SET VCOM H TO A SPECIFIC VOLTAGE WITH CORRESPONDS TO A BINARY CODE OF 1111111 OR 0x7F HEXA
	;TODO: SEND THE FIRST PARAMETER (THE VCOM H) NEEDED BY THE COMMAND, WITH HEX 0x7F, PARAMETERS ARE SENT AS DATA BUT COMMANDS ARE SENT AS COMMANDS
	MOV R2, #0x7F
	BL LCD_DATA_WRITE

	;WE WANT TO SET VCOM L TO A SPECIFIC VOLTAGE WITH CORRESPONDS TO A BINARY CODE OF 00000000 OR 0x00 HEXA
	;TODO: SEND THE SECOND PARAMETER (THE VCOM L) NEEDED BY THE CONTRAST COMMAND, WITH HEX 0x00, PARAMETERS ARE SENT AS DATA BUT COMMANDS ARE SENT AS COMMANDS
	MOV R2, #0x00
	BL LCD_DATA_WRITE


	;MEMORY ACCESS CONTROL AKA MADCLT | DATASHEET PAGE 127
	;WE WANT TO SET MX (to draw from left to right) AND SET MV (to configure the TFT to be in horizontal landscape mode, not a vertical screen)
	;TODO: ISSUE THE COMMAND MEMORY ACCESS CONTROL, HEXCODE 0x36
	MOV R2, #0x36
	BL LCD_COMMAND_WRITE

	;TODO: SEND ONE NEEDED PARAMETER ONLY WITH MX AND MV SET TO 1. HOW WILL WE SEND PARAMETERS? AS DATA OR AS COMMAND?
	MOV R2, #0x20
	BL LCD_DATA_WRITE



	;COLMOD: PIXEL FORMAT SET | DATASHEET PAGE 134
	;THIS COMMAND LETS US CHOOSE WHETHER WE WANT TO USE 16-BIT COLORS OR 18-BIT COLORS.
	;WE WILL ALWAYS USE 16-BIT COLORS
	;TODO: ISSUE THE COMMAND COLMOD
	MOV R2, #0x3A
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE NEEDED PARAMETER WHICH CORRESPONDS TO 16-BIT RGB AND 16-BIT MCU INTERFACE FORMAT
	MOV R2, #0x55
	BL LCD_DATA_WRITE
	


	;SLEEP OUT | DATASHEET PAGE 101
	;TODO: ISSUE THE SLEEP OUT COMMAND TO EXIT SLEEP MODE (THIS COMMAND TAKES NO PARAMETERS, JUST SEND THE COMMAND)
	MOV R2, #0x11
	BL LCD_COMMAND_WRITE

	;NECESSARY TO WAIT 5ms BEFORE SENDING NEXT COMMAND
	;I WILL WAIT FOR 10MSEC TO BE SURE
	;TODO: DELAY FOR AT LEAST 10ms
	BL delay_1_second


	;DISPLAY ON | DATASHEET PAGE 109
	;TODO: ISSUE THE COMMAND, IT TAKES NO PARAMETERS
	MOV R2, #0x29
	BL LCD_COMMAND_WRITE


	;COLOR INVERSION OFF | DATASHEET PAGE 105
	;NOTE: SOME TFTs HAS COLOR INVERTED BY DEFAULT, SO YOU WOULD HAVE TO INVERT THE COLOR MANUALLY SO COLORS APPEAR NATURAL
	;MEANING THAT IF THE COLORS ARE INVERTED WHILE YOU ALREADY TURNED OFF INVERSION, YOU HAVE TO TURN ON INVERSION NOT TURN IT OFF.
	;TODO: ISSUE THE COMMAND, IT TAKES NO PARAMETERS
	MOV R2, #0x20
	BL LCD_COMMAND_WRITE



	;MEMORY WRITE | DATASHEET PAGE 245
	;WE NEED TO PREPARE OUR TFT TO SEND PIXEL DATA, MEMORY WRITE SHOULD ALWAYS BE ISSUED BEFORE ANY PIXEL DATA SENT
	;TODO: ISSUE MEMORY WRITE COMMAND
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE	


	;TODO: POP ALL PUSHED REGISTERS
	POP {R0-R3, PC}

;#####################################################################################################################################################################
  ENDFUNC

; REVISE THE FUNCTION LCD_INIT WITH YOUR TA BEFORE PROCEEDING

 B SKIPPED7
	LTORG
SKIPPED7

;#####################################################################################################################################################################
ADDRESS_SET FUNCTION
	;THIS FUNCTION TAKES X1, X2, Y1, Y2
	;IT ISSUES COLUMN ADDRESS SET TO SPECIFY THE START AND END COLUMNS (X1 AND X2)
	;IT ISSUES PAGE ADDRESS SET TO SPECIFY THE START AND END PAGE (Y1 AND Y2)
	;THIS FUNCTION JUST MARKS THE PLAYGROUND WHERE WE WILL ACTUALLY DRAW OUR PIXELS, MAYBE TARGETTING EACH PIXEL AS IT IS.
	;R0 = X1
	;R1 = X2
	;R3 = Y1
	;R4 = Y2

	;PUSHING ANY NEEDED REGISTERS
	PUSH {R0-R4, LR}
	

	;COLUMN ADDRESS SET | DATASHEET PAGE 110
	MOV R2, #0x2A
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE FIRST PARAMETER (HIGHER 8-BITS OF THE STARTING COLUMN, AKA HIGHER 8-BITS OF X1)
	MOV R2, R0
	LSR R2, #8
	BL LCD_DATA_WRITE

	;TODO: SEND THE SECOND PARAMETER (LOWER 8-BITS OF THE STARTING COLUMN, AKA LOWER 8-BITS OF X1)
	MOV R2, R0
	BL LCD_DATA_WRITE


	;TODO: SEND THE THIRD PARAMETER (HIGHER 8-BITS OF THE ENDING COLUMN, AKA HIGHER 8-BITS OF X2)
	MOV R2, R1
	LSR R2, #8
	BL LCD_DATA_WRITE

	;TODO: SEND THE FOURTH PARAMETER (LOWER 8-BITS OF THE ENDING COLUMN, AKA LOWER 8-BITS OF X2)
	MOV R2, R1
	BL LCD_DATA_WRITE



	;PAGE ADDRESS SET | DATASHEET PAGE 110
	MOV R2, #0x2B
	BL LCD_COMMAND_WRITE

	;TODO: SEND THE FIRST PARAMETER (HIGHER 8-BITS OF THE STARTING PAGE, AKA HIGHER 8-BITS OF Y1)
	MOV R2, R3
	LSR R2, #8
	BL LCD_DATA_WRITE

	;TODO: SEND THE SECOND PARAMETER (LOWER 8-BITS OF THE STARTING PAGE, AKA LOWER 8-BITS OF Y1)
	MOV R2, R3
	BL LCD_DATA_WRITE


	;TODO: SEND THE THIRD PARAMETER (HIGHER 8-BITS OF THE ENDING PAGE, AKA HIGHER 8-BITS OF Y2)
	MOV R2, R4
	LSR R2, #8
	BL LCD_DATA_WRITE

	;TODO: SEND THE FOURTH PARAMETER (LOWER 8-BITS OF THE ENDING PAGE, AKA LOWER 8-BITS OF Y2)
	MOV R2, R4
	BL LCD_DATA_WRITE

	;MEMORY WRITE
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE


	;POPPING ALL REGISTERS I PUSHED
	POP {R0-R4, PC}
;#####################################################################################################################################################################
    ENDFUNC

    B SKIPPED8
	LTORG
SKIPPED8

;#####################################################################################################################################################################
DRAWPIXEL FUNCTION
	PUSH {R0-R5, r10, LR}
	;THIS FUNCTION TAKES X AND Y AND A COLOR AND DRAWS THIS EXACT PIXEL
	;NOTE YOU HAVE TO CALL ADDRESS SET ON A SPECIFIC PIXEL WITH LENGTH 1 AND WIDTH 1 FROM THE STARTING COORDINATES OF THE PIXEL, THOSE STARTING COORDINATES ARE GIVEN AS PARAMETERS
	;THEN YOU SIMPLY ISSUE MEMORY WRITE COMMAND AND SEND THE COLOR
	;R0 = X
	;R1 = Y
	;R10 = COLOR

	;CHIP SELECT ACTIVE, WRITE LOW TO CS
	LDR r3, =GPIOB_ODR
	LDR r4, [r3]
	MOV R5, #1
	LSL R5, #15
	MVN R5, R5
	AND r4, r4, R5
	STR r4, [r3]

	;TODO: SETTING PARAMETERS FOR FUNC 'ADDRESS_SET' CALL, THEN CALL FUNCTION ADDRESS SET
	;NOTE YOU MIGHT WANT TO PERFORM PARAMETER REORDERING, AS ADDRESS SET FUNCTION TAKES X1, X2, Y1, Y2 IN R0, R1, R3, R4 BUT THIS FUNCTION TAKES X,Y IN R0 AND R1
	MOV R3, R1 ;Y1
	ADD R1, R0, #1 ;X2
	ADD R4, R3, #1 ;Y2
	BL ADDRESS_SET


	
	;MEMORY WRITE
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE


	;SEND THE COLOR DATA | DATASHEET PAGE 114
	;HINT: WE SEND THE HIGHER 8-BITS OF THE COLOR FIRST, THEN THE LOWER 8-BITS
	;HINT: WE SEND THE COLOR OF ONLY 1 PIXEL BY 2 DATA WRITES, THE FIRST TO SEND THE HIGHER 8-BITS OF THE COLOR, THE SECOND TO SEND THE LOWER 8-BITS OF THE COLOR
	;REMINDER: WE USE 16-BIT PER PIXEL COLOR
	;TODO: SEND THE SINGLE COLOR, PASSED IN R10
	MOV R2, R10
	LSR R2, #8
	BL LCD_DATA_WRITE
	MOV R2, R10
	BL LCD_DATA_WRITE


	
	POP {R0-R5, r10, PC}
;#####################################################################################################################################################################
   ENDFUNC

;	REVISE THE PREVIOUS TWO FUNCTIONS (ADDRESS_SET AND DRAW_PIXEL) WITH YOUR TA BEFORE PROCEEDING








;##########################################################################################################################################
DRAW_RECTANGLE_FILLED FUNCTION
	;TODO: IMPLEMENT THIS FUNCTION ENTIRELY, AND SPECIFY THE ARGUMENTS IN COMMENTS, WE DRAW A RECTANGLE BY SPECIFYING ITS TOP-LEFT AND LOWER-RIGHT POINTS, THEN FILL IT WITH THE SAME COLOR
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3
	;Y2 = [] r4
	;COLOR = [] r10
	
	
	PUSH {R0-R12, LR}
	
	push{r0-r4}


	PUSH {R1}
	PUSH {R3}
	
	pop {r1}
	pop {r3}
	
	;THE NEXT FUNCTION TAKES x1, x2, y1, y2
	;R0 = x1
	;R1 = x2
	;R3 = y1
	;R4 = y2
	bl ADDRESS_SET
	
	pop{r0-r4}
	

	SUBS R3, R3, R0
	add r3, r3, #1
	SUBS R4, R4, R1
	add r4, r4, #1
	MUL R3, R3, R4


;MEMORY WRITE
	MOV R2, #0x2C
	BL LCD_COMMAND_WRITE


RECT_FILL_LOOP
	MOV R2, R10
	LSR R2, #8
	BL LCD_DATA_WRITE
	MOV R2, R10
	BL LCD_DATA_WRITE

	SUBS R3, R3, #1
	CMP R3, #0
	BGT RECT_FILL_LOOP


END_RECT_FILL
	POP {R0-R12, PC}
;##########################################################################################################################################
   ENDFUNC




    B SKIPPED9
	LTORG
SKIPPED9





;####################################################################################################################################################################
SETUP FUNCTION
	;THIS FUNCTION ENABLES PORT E, MARKS IT AS OUTPUT, CONFIGURES SOME GPIO
	;THEN FINALLY IT CALLS LCD_INIT (HINT, USE THIS SETUP FUNCTION DIRECTLY IN THE MAIN)
	PUSH {R0-R12, LR}
	
	
	
	  LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #1        ; Set bit 2 to enable GPIOA clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
	LDR R0, =AFIO_MAPR
	LDR R1, [R0]
	MOV R2, #1
	LSL R2, #25
	STR R2, [R0]
	
	
	
	

	  LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #2        ; Set bit 2 to enable GPIOA clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
    ; Configure PORT A AS OUTPUT (LOWER 8 PINS)
    LDR R0, =GPIOA_CRL     
    MOV R1, #0x33333333     ;ALL 8 LOWER PINS OF PORT A AS OUTPUT WITH MAX SPEED OF 50 MHZ
    STR R1, [R0]

    ; Configure PORT A AS INPUT (HIGHER 8 PINS)
    LDR R0, =GPIOA_CRH           ; Address of GPIOC_CRH register
    MOV R1, #0x88888888    ;ALL 8 HIGHER PINS OF PORT A AS INPUT WITH MAX SPEED OF 50 MHZ
    STR R1, [R0]                 ; Write the updated value back to GPIOC_CRH
	
	  LDR R0, =GPIOA_ODR     
    LDR R1, [R0]                 ; Read the current value of GPIOC_CRH
	MOV R2,#0xffffffff
    STRH R2, [R0]



    ; Enable GPIOC clock
    LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #4        ; Set bit 4 to enable GPIOC clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
    ; Configure PC13 as output push-pull 
    LDR R0, =GPIOC_CRH           ; Address of GPIOC_CRH register
    MOV R1, #0x88888888      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
    STR R1, [R0]                 ; Write the updated value back to GPIOC_CRH

;    ; Configure PC13 as output push-pull 
;    LDR R0, =GPIOC_CRL           ; Address of GPIOC_CRH register
;    MOV R1, #0x33333333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
;    STR R1, [R0]   
	
	 LDR R0, =GPIOC_ODR     
    MOV R1, #0xFFFFFFFF
    STR R1, [R0]


    ; Enable GPIOB clock
    LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #3        ; Set bit 3 to enable GPIOB clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
    
    LDR R0, =GPIOB_CRL           ; Address of GPIOC_CRL register
    MOV R1, #0x00008333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
	ORR R1, #0x00880000
	ORR R1, #0x83000000
    STR R1, [R0]                 ; Write the updated value back to GPIOC_CRH


    LDR R0, =GPIOB_CRH           ; Address of GPIOC_CRL register
    MOV R1, #0x00003333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
	ORR R1, #0x00330000
	ORR R1, #0x33000000
    STR R1, [R0] 
	
	 LDR R0, =GPIOB_ODR     
    MOV R1, #0xFFFF                ; Read the current value of GPIOC_CRH
    STR R1, [R0]


	BL LCD_INIT

	POP {R0-R12, PC}
;#####################################################################################################################################################################

   ENDFUNC




    B SKIPPED10
	LTORG
SKIPPED10
; HELPER DELAYS IN THE SYSTEM, YOU CAN USE THEM DIRECTLY


;##########################################################################################################################################
delay_1_second FUNCTION
	;this function just delays for 1 second
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop
	SUBS r8, #1
	CMP r8, #0
	BGE delay_loop
	POP {R8, PC}
;##########################################################################################################################################
  ENDFUNC



;##########################################################################################################################################
delay_half_second FUNCTION
	;this function just delays for half a second
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop1
	SUBS r8, #2
	CMP r8, #0
	BGE delay_loop1

	POP {R8, PC}
;##########################################################################################################################################
  ENDFUNC

;##########################################################################################################################################
delay_milli_second FUNCTION
	;this function just delays for a millisecond
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop2
	SUBS r8, #1000
	CMP r8, #0
	BGE delay_loop2

	POP {R8, PC}
;##########################################################################################################################################
  ENDFUNC


;##########################################################################################################################################
delay_10_milli_second FUNCTION
	;this function just delays for 10 millisecondS
	PUSH {R8, LR}
	LDR r8, =INTERVAL
delay_loop3
	SUBS r8, #100
	CMP r8, #0
	BGE delay_loop3

	POP {R8, PC}
;##########################################################################################################################################

  ENDFUNC
  
  B SKIPPED11
   LTORG
SKIPPED11

;##########################################################################################################################################
DRAW_Hidden_Key FUNCTION
  ;it is parameters are center (x3,y3) in (r8,r6) and radius in r7
  
  PUSH{R0-R12,LR}
  MOV R7,#10
  MOV R0,R8  ;X1    taking centers into r0,r1
  MOV R1,R6  ;Y1
  PUSH{R0-R12} ;FOR BACKING TO CENTER BEFORE THIRD QUARTER
  
   MOV R5,#5 ;NO OF RECTANGLES
   ;DRAWING FIRST RECT ABOVE
   SUBS R1,R1,R7   ; HIGHERING TO THE POINT OF DRAWING FIRST AND SECOND QUARTER
   ADD R3,R0,#2   ;X2
   MOV R4,R1     ;Y2
   SUBS R1,R1,#2   ;Y1
   LDR R10, =BLACK
   BL DRAW_RECTANGLE_FILLED
   PUSH {R0-R12}

   

FIRST_QUARTER1
  MOV R0,R3
  ADD R3,R3,#2
  MOV R1,R4
  ADD R4,R4,#2
   LDR R10, =BLACK
  BL DRAW_RECTANGLE_FILLED
  subs R5,R5,#1
   CMP R5,#0
  BNE FIRST_QUARTER1
 
  POP {R0-R12}
   MOV R5,#5
SECOND_QUARTER1
  MOV R3,R0
  SUBS R0,R0,#2
  MOV  R1,R4
  ADD R4,R4,#2
    LDR R10, =BLACK
   BL DRAW_RECTANGLE_FILLED
   subs r5,r5,#1
   CMP R5,#0
  BNE SECOND_QUARTER1

  ;BACK TO CENTER
  POP {R0-R12}
  ADD R1,R1,R7    ;LOWERING TO THE POINT OF DRAWING third AND forth QUARTER  ,ro,r1 => nochange
  ADD R3,R0,#2   ;x2
  ADD R4,R1,#2    ;y2
   LDR R10, =BLACK
  BL DRAW_RECTANGLE_FILLED
  PUSH{r0,r1,r3,r4} ;FOR BACKING WHEN DRAWING FORTH QUARTER
  BL VERLine1

  MOV R5,#5

  
 
THIRD_QUARTER1
  MOV R0,R3  ;X1
  ADD R3,R3,#2  ;X2
  MOV R4,R1 ;Y2
  SUBS R1,R1,#2 ;Y1
   LDR R10, =BLACK  ;COLOR
  BL DRAW_RECTANGLE_FILLED
   subs r5,r5,#1
   CMP R5,#0
  BNE THIRD_QUARTER1


   MOV R5,#5
   POP{r0,r1,r3,r4} ;POPING TO BACK TO THE LOWER POINT
FORTH_QUARTER1
  MOV R3,R0   ;X2
  SUBS R0,R0,#2  ;X1
  MOV R4,R1 ;Y2
  SUBS R1,R1,#2 ;Y1
   LDR R10, =BLACK
  BL DRAW_RECTANGLE_FILLED
   subs r5,r5,#1
   CMP R5,#0
  BNE FORTH_QUARTER1

  POP{R0-R12,PC}
  ENDFUNC
  
  
    B SKIPPED12
	LTORG
SKIPPED12

DRAW_winner FUNCTION
	  ;takes arguments same as RECTANGLE parameters
   ;is divided into many rectangle Functions 
   ;addres seting for parameters 
   PUSH {R0-R12,LR}
    LDR R7,=PRISONERX     ;SETTING THE VALUE OF X1
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
    ADD R3,R0,#12  ;HAIR
	ADD R4,R1,#4
	LDR R10,=BROWN  ;BROWN 
    BL DRAW_RECTANGLE_FILLED
	
	MOV R1,R4
	ADD R4,R1,#7     ;HEAD
	LDR R10, = NAVAJOWHITE ;LITTLE ORANGE
	   BL DRAW_RECTANGLE_FILLED 
	push{r0,r1,r3,r4}
	ADD R0,#4
	ADD R1,#1
	add r4,r1,#1
	add r3,r0,#1
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	ADD R0,#4
	add r4,r1,#1
	add r3,r0,#1
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	ADD r1,r1,#3
	add r4,r1,#1 
	subs r0,r0,#5
	add r3,r0,#6
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	pop {r0,r1,r3,r4}
	MOV  R1,R4      ;Y1
	ADD  R3,R3,#3   ;X2     ;BODY
	SUBS R0,R0,#3   ;X1
	ADD  R4,R4,#13  ;Y2
	MOV R10,#0xF81F     ;PINK
	MOV R12,R4 ;Y2
	MOV R11,R0 ;X1
	MOV R9,R3 ;X2
	BL DRAW_RECTANGLE_FILLED
	MOV R0,R3  
    ADD R0,R0,#1 ;X1	
	ADD R3,R3,#4 ;X2    ;LEFT HAND
	MOV R4,R1 
	SUB R1,R1,#9
	LDR R10,=NAVAJOWHITE
    BL DRAW_RECTANGLE_FILLED
;;	ADD R4,R4,#18
	SUBS R0,R0,#23     
	SUBS R3,R3,#23   ;RIGHT HAND
	LDR R10,=NAVAJOWHITE
    BL DRAW_RECTANGLE_FILLED
	MOV R0,R11 ;X1
	ADD R3,R0,#6
	;SUBS R0,R0,#29
	MOV R1,R12;Y1
	;SUBS R1,R1,#1
	ADD R4,R1,#9 ;Y2
	LDR R10,=BLUE
	BL DRAW_RECTANGLE_FILLED
	MOV  R3,R9
	SUBS R0,R3,#6
	;SUBS R0,R0,#20
	;SUBS R3,R0,#20
	LDR R10,=BLUE
	BL DRAW_RECTANGLE_FILLED
	POP{R0-R12,PC}
   ;r0 x1
   ;r1 y1
   ;r3 x2
   ;r4 y2
	 POP{R0-R12,PC}
    ENDFUNC

    B SKIPPED13
	LTORG
SKIPPED13

DRAW_LEVEL1 FUNCTION
	MOV R6,#0
	MOV R9,#0
	PUSH {R0-R12, LR}
		MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
   	BL DRAW_WALLS
    ;BL DRAW_TIMESLOT
	BL DRAW_PRISONER
	

	
	LDR R7,=GHOST1X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST1Y   ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST

    LDR R7,=GHOST2X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST2Y     ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]

	BL DRAW_GHOST
	
	LDR R7,=GHOST3X      ;SETTING THE VALUE OF X1
	LDR R8,=GHOST3Y     ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST

     MOV R8,#302
	 MOV R6,#169
     BL DRAW_CIRCLE    ;DRAW KEY
	 
	 
	 MOV R0,#20
	 MOV R1,#215
	 BL Draw_Arrow	
	POP {R0-R12, PC}
	ENDFUNC
;##########################################################################################################################################

    B SKIPPED14
	LTORG
SKIPPED14

DRAW_LEVEL2 FUNCTION
	MOV R6,#1
	PUSH {R0-R12, LR}
	 MOV R0, #0
	 MOV R1, #0
	 MOV R3, #320
	 MOV R4, #240 
	 LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	BL DRAW_WALLS
    BL DRAW_TIMESLOT
	BL DRAW_PRISONER
	
	LDR R7,=GHOST1X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST1Y   ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST

    LDR R7,=GHOST2X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST2Y     ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]

	BL DRAW_GHOST
	
	LDR R7,=GHOST3X      ;SETTING THE VALUE OF X1
	LDR R8,=GHOST3Y     ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST

     MOV R8,#302
	 MOV R6,#169
     BL DRAW_CIRCLE    ;DRAW KEY
	 
	 
	 MOV R0,#20
	 MOV R1,#215
	 BL Draw_Arrow
	POP {R0-R12, PC}
	ENDFUNC	
	
DRAW_GHOST FUNCTION
  ;input x,y (left coordinates at base of left leg)
  ;R0 = x
  ;R1 = y
  ;DRAW_RECTANGLE_FILLED (x1=R0, y1=R1, x2=R3, y2=R4, color=R10)

  PUSH {R0-R12, LR}

  ;DRAW LEFT LEG
  PUSH {R0-R1}

  MOV R4,R1       ;set y2
  ADD R3,R0,#5    ;set x2
  SUBS R1,R1,#10   ;set y1
  ;this function already has x1 as input (R0=x)
  LDR R10,=DARKGREEN   ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////
  
  
  
  ;DRAW RIGHT LEG
  PUSH {R0-R1}

  MOV R4,R1      ;set y2
  ADD R0,R0,#7   ;set x1
  ADD R3,R0,#5   ;set x2
  SUBS R1,R1,#10  ;set y1
  LDR R10,=DARKGREEN  ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////



  ;DRAW BODY 
  PUSH {R0-R1}

  ADD R3,R0,#12   ;set x2
  SUBS R4,R1,#10   ;set y2
  SUBS R1,R1,#20  ;set y1
  ;this function already has x1 as input (R0=x)
  LDR R10,=FIREBRICK    ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////



  ;DRAW LEFT ARM
  PUSH {R0-R1}

  MOV R3,R0       ;set x2
  SUBS R0,R0,#3   ;set x1
  SUBS R4,R1,#14  ;set y2
  SUBS R1,R1,#20  ;set y1
  LDR R10,=DARKGREEN  ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////



  ;DRAW RIGHT ARM
  PUSH {R0-R1}

  ADD R0,R0,#12    ;set x1
  ADD R3,R0,#3     ;set x2
  SUBS R1,R1,#20   ;set y1
  ADD R4,R1,#6     ;set y2
  LDR R10,=DARKGREEN   ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////



  ;DRAW HEAD
  PUSH {R0-R1}

  ADD R0,R0,#3    ;set x1
  ADD R3,R0,#6    ;set x2
  SUBS R1,R1,#32  ;set y1
  ADD R4,R1,#10   ;set y2
  LDR R10,=DARKGREEN  ;setting color
  BL DRAW_RECTANGLE_FILLED 
   
   ;;;REMOVE A PIXEL UP AND DOWN TO TAKE THE SHAPE OF OVAL FACE
   
   PUSH{R0-R5}
  ;REMOVE LEFT SIDE OF HEAD
  MOV R3,R0       ;set x2
  mov r1,r4      ; set y1 with y2 of main head
  ADD R4,R1,#1   ;set y2
  LDR R10,=BLACK  ;setting color
  BL DRAW_RECTANGLE_FILLED
  POP{R0-R5}
  
   PUSH{R0-R5}
;REMOVE right SIDE OF HEAD
  ADD R3,R0,#0   ;set x2
  ADD R4,R1,#1   ;set y2
  LDR R10,=BLACK  ;setting color
  BL DRAW_RECTANGLE_FILLED
  POP{R0-R5}
  
   PUSH{R0-R5}
  ;REMOVE LEFT SIDE OF HEAD
  MOV R0,R3
  ADD R3,R0,#1   ;set x2
  mov r1,r4      ; set y1 with y2 of main head
  ADD R4,R1,#1   ;set y2
  LDR R10,=BLACK  ;setting color
  BL DRAW_RECTANGLE_FILLED
  POP{R0-R5}

 PUSH{R0-R5}
  ;REMOVE LEFT SIDE OF HEAD
  MOV R0,R3
  ADD R3,R0,#1   ;set x2
  ADD R4,R1,#1   ;set y2
  LDR R10,=BLACK  ;setting color
  BL DRAW_RECTANGLE_FILLED
  POP{R0-R5}


  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////
  
  
 



  ;DRAW LEFT EYE
  PUSH {R0-R1}

  ADD R0,R0,#4    ;set x1
  ADD R3,R0,#1    ;set x2
  SUBS R1,R1,#29  ;set y1
  ADD R4,R1,#2    ;set y2
  LDR R10,=BLACK   ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////



  ;DRAW RIGHT EYE
  PUSH {R0-R1}

  ADD R0,R0,#7    ;set x1
  ADD R3,R0,#1    ;set x2
  SUBS R1,R1,#29  ;set y1
  ADD R4,R1,#2    ;set y2
  LDR R10,=BLACK   ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////



  ;DRAW MOUTH
  PUSH {R0-R1}

  ADD R0,R0,#4    ;set x1
  ADD R3,R0,#4    ;set x2
  SUBS R1,R1,#25  ;set y1
  ADD R4,R1,#1   ;set y2
  LDR R10,=BLACK  ;setting color
  BL DRAW_RECTANGLE_FILLED 

  POP {R0-R1}
  ;/////////////////////////////////////////////////////////////////
  






  POP {R0-R12, PC}
  ENDFUNC
  
     B SKIPPED15
	LTORG
SKIPPED15  

MOVE_GHOST1_RIGHT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE GHOST TOUCHES A WALL, DON'T MOVE
	LDR R12,=PRISONERX
	LDRH R3,[R12]
	LDR R12,=DIRECTION1
	LDRH R5,[R12]
	CMP R5,#1
	BEQ NOMOVE15
	LDR R7,=GHOST1X
	LDRH R5,[R7]
;	CMP R5,R3
;	BLT LOSE
	ADD R5,R5,#20
;	CMP R5,R3
;	BGE LOSE
	CMP R5,#320
	BGE NOMOVE6
	
	;TODO: COVER THE GHOST WITH THE BACKGROUND COLOR
	
	LDR R7,=GHOST1X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST1Y    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R4,[R8]
	PUSH{R0}
	SUB R0,R0,#3
	ADD R3,R0,#15
	SUB R1,R4,#32
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE GHOST IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	ADD R0,R0,#1
	STRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST
	B NOMOVE15
LOSE
    BL DRAW_LOSE
NOMOVE6	
	LDR R12,=DIRECTION1
	MOV R5,#1
    STRH R5,[R12]
NOMOVE15	
	POP{R0-R12,PC}
	ENDFUNC

MOVE_GHOST1_LEFT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE GHOST TOUCHES A WALL, DON'T MOVE
	LDR R12,=DIRECTION1
	LDRH R5,[R12]
	CMP R5,#0
	BEQ NOMOVE16
	LDR R7,=GHOST1X
	LDRH R5,[R7]
	SUB R5,R5,#10
	CMP R5,#0
	BLE NOMOVE7
	;TODO: COVER THE GHOST WITH THE BACKGROUND COLOR
	
	LDR R8,=GHOST1Y    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R4,[R8]
	push{R0}
	SUB R0,R0,#5
	ADD R3,R0,#20
	SUB R1,R4,#32
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE GHOST IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	SUB R0,R0,#1
	STRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST
	B  NOMOVE16
NOMOVE7
	LDR R7,=DIRECTION1
	MOV R5,#0
    STRH R5,[R7]
NOMOVE16
	POP{R0-R12,PC}
	ENDFUNC

MOVE_GHOST2_RIGHT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE GHOST TOUCHES A WALL, DON'T MOVE
	LDR R12,=DIRECTION2
	LDRH R5,[R12]
	CMP R5,#1
	BEQ NOMOVE21
	LDR R7,=GHOST2X
	LDRH R5,[R7]
	ADD R5,R5,#20
	CMP R5,#320
	BGE NOMOVE22
	;TODO: COVER THE GHOST WITH THE BACKGROUND COLOR
	
	LDR R7,=GHOST2X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST2Y    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R4,[R8]
	PUSH{R0}
	SUB R0,R0,#3
	ADD R3,R0,#15
	SUB R1,R4,#32
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE GHOST IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	ADD R0,R0,#1
	STRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST
	B NOMOVE21
NOMOVE22	
	LDR R12,=DIRECTION2
	MOV R5,#1
    STRH R5,[R12]
NOMOVE21	
	POP{R0-R12,PC}
	ENDFUNC

MOVE_GHOST2_LEFT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE GHOST TOUCHES A WALL, DON'T MOVE
	LDR R12,=DIRECTION2
	LDRH R5,[R12]
	CMP R5,#0
	BEQ NOMOVE23
	LDR R7,=GHOST2X
	LDRH R5,[R7]
	SUB R5,R5,#10
	CMP R5,#0
	BLE NOMOVE24
	;TODO: COVER THE GHOST WITH THE BACKGROUND COLOR
	
	LDR R8,=GHOST2Y    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R4,[R8]
	push{R0}
	SUB R0,R0,#5
	ADD R3,R0,#20
	SUB R1,R4,#32
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE GHOST IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	SUB R0,R0,#1
	STRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST
	B  NOMOVE16
NOMOVE24
	LDR R7,=DIRECTION2
	MOV R5,#0
    STRH R5,[R7]
NOMOVE23
	POP{R0-R12,PC}
	ENDFUNC
	
    B SKIPPED16
	LTORG
SKIPPED16	

MOVE_GHOST3_RIGHT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE GHOST TOUCHES A WALL, DON'T MOVE
	LDR R12,=DIRECTION3
	LDRH R5,[R12]
	CMP R5,#1
	BEQ NOMOVE25
	LDR R7,=GHOST3X
	LDRH R5,[R7]
	ADD R5,R5,#20
	CMP R5,#290
	BGE NOMOVE26
	;TODO: COVER THE GHOST WITH THE BACKGROUND COLOR
	
	LDR R7,=GHOST3X     ;SETTING THE VALUE OF X1
	LDR R8,=GHOST3Y    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R4,[R8]
	PUSH{R0}
	SUB R0,R0,#3
	ADD R3,R0,#15
	SUB R1,R4,#32
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE GHOST IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	ADD R0,R0,#1
	STRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST
	B NOMOVE25
NOMOVE26
	LDR R12,=DIRECTION3
	MOV R5,#1
    STRH R5,[R12]
NOMOVE25	
	POP{R0-R12,PC}
	ENDFUNC

MOVE_GHOST3_LEFT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE GHOST TOUCHES A WALL, DON'T MOVE
	LDR R12,=DIRECTION3
	LDRH R5,[R12]
	CMP R5,#0
	BEQ NOMOVE28
	LDR R7,=GHOST3X
	LDRH R5,[R7]
	SUB R5,R5,#10
	CMP R5,#0
	BLE NOMOVE29
	;TODO: COVER THE GHOST WITH THE BACKGROUND COLOR
	
	LDR R8,=GHOST3Y    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R4,[R8]
	push{R0}
	SUB R0,R0,#5
	ADD R3,R0,#20
	SUB R1,R4,#32
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE GHOST IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	SUB R0,R0,#1
	STRH R0,[R7]
	LDRH R1,[R8]
	BL DRAW_GHOST
	B  NOMOVE16
NOMOVE29
	LDR R7,=DIRECTION3
	MOV R5,#0
    STRH R5,[R7]
NOMOVE28
	POP{R0-R12,PC}
	ENDFUNC

  B SKIPPED17
   LTORG
SKIPPED17
;##########################################################################################################################################




    

DRAW_CIRCLE FUNCTION
  ;it is parameters are center (x3,y3) in (r8,r6) and radius in r7
  PUSH{R0-R12,LR}
  MOV R7,#10
  MOV R0,R8  ;X1    taking centers into r0,r1
  MOV R1,R6  ;Y1
  PUSH{R0-R12} ;FOR BACKING TO CENTER BEFORE THIRD QUARTER
  
   MOV R5,#5 ;NO OF RECTANGLES
   ;DRAWING FIRST RECT ABOVE
   SUBS R1,R1,R7   ; HIGHERING TO THE POINT OF DRAWING FIRST AND SECOND QUARTER
   ADD R3,R0,#2   ;X2
   MOV R4,R1     ;Y2
   SUBS R1,R1,#2   ;Y1
   MOV R10,#0xF800   
   BL DRAW_RECTANGLE_FILLED
   PUSH {R0-R12}

   

FIRST_QUARTER
  MOV R0,R3
  ADD R3,R3,#2
  MOV R1,R4
  ADD R4,R4,#2
  MOV R10,#0xF800
  BL DRAW_RECTANGLE_FILLED
  subs R5,R5,#1
   CMP R5,#0
  BNE FIRST_QUARTER
 
  POP {R0-R12}
   MOV R5,#5
SECOND_QUARTER
  MOV R3,R0
  SUBS R0,R0,#2
  MOV  R1,R4
  ADD R4,R4,#2
   MOV R10,#0xF800
   BL DRAW_RECTANGLE_FILLED
   subs r5,r5,#1
   CMP R5,#0
  BNE SECOND_QUARTER

  ;BACK TO CENTER
  POP {R0-R12}
  ADD R1,R1,R7    ;LOWERING TO THE POINT OF DRAWING third AND forth QUARTER  ,ro,r1 => nochange
  ADD R3,R0,#2   ;x2
  ADD R4,R1,#2    ;y2
  MOV R10,#0xF800
  BL DRAW_RECTANGLE_FILLED
  PUSH{r0,r1,r3,r4} ;FOR BACKING WHEN DRAWING FORTH QUARTER
  BL VERLine

  MOV R5,#5

  
 
THIRD_QUARTER
  MOV R0,R3  ;X1
  ADD R3,R3,#2  ;X2
  MOV R4,R1 ;Y2
  SUBS R1,R1,#2 ;Y1
  MOV R10,#0xF800  ;COLOR
  BL DRAW_RECTANGLE_FILLED
   subs r5,r5,#1
   CMP R5,#0
  BNE THIRD_QUARTER


   MOV R5,#5
   POP{r0,r1,r3,r4} ;POPING TO BACK TO THE LOWER POINT
FORTH_QUARTER
  MOV R3,R0   ;X2
  SUBS R0,R0,#2  ;X1
  MOV R4,R1 ;Y2
  SUBS R1,R1,#2 ;Y1
  MOV R10,#0xF800
  BL DRAW_RECTANGLE_FILLED
   subs r5,r5,#1
   CMP R5,#0
  BNE FORTH_QUARTER

  POP{R0-R12,PC}
  ENDFUNC
  
  ;##########################################################################################################################################
  
VERLine  FUNCTION
;TAKES R0 for X1,R1 for y1
   PUSH{R0-R12,LR}
   ADD R3,R0,#2
   ADD R4,R1,#12
   mov R10,#0xF800
   BL DRAW_RECTANGLE_FILLED
   POP{R0-R12,PC}
   ENDFUNC

    B SKIPPED18
	LTORG
SKIPPED18

DRAW_HIDDEN_PRISONER FUNCTION
   ;takes arguments same as RECTANGLE parameters
   ;is divided into many rectangle Functions 
   ;addres seting for parameters 
   PUSH {R0-R12,LR}
    LDR R7,=PRISONERX     ;SETTING THE VALUE OF X1
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
    ADD R3,R0,#12  ;HAIR
	ADD R4,R1,#4
	LDR R10,=BLACK  ;BROWN 
    BL DRAW_RECTANGLE_FILLED
	
	MOV R1,R4
	ADD R4,R1,#7     ;HEAD
	LDR R10, = NAVAJOWHITE ;LITTLE ORANGE
	   BL DRAW_RECTANGLE_FILLED 
	push{r0,r1,r3,r4}
	ADD R0,#4
	ADD R1,#1
	add r4,r1,#1
	add r3,r0,#1
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	ADD R0,#4
	add r4,r1,#1
	add r3,r0,#1
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	ADD r1,r1,#3
	add r4,r1,#1 
	subs r0,r0,#5
	add r3,r0,#6
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	
	pop {r0,r1,r3,r4}
	
	MOV  R1,R4      ;Y1
	ADD  R3,R3,#3   ;X2     ;BODY
	SUBS R0,R0,#3   ;X1
	ADD  R4,R4,#13  ;Y2
	LDR R10,=BLACK    ;PINK
	MOV R12,R4 ;Y2
	MOV R11,R0 ;X1
	MOV R9,R3 ;X2
	BL DRAW_RECTANGLE_FILLED
	MOV R0,R3  
    ADD R0,R0,#1 ;X1	
	ADD R3,R3,#4 ;X2    ;LEFT HAND
	MOV R4,R1 
	ADD R4,R4,#9
	LDR R10,=BLACK
    BL DRAW_RECTANGLE_FILLED
	SUBS R0,R0,#23     
	SUBS R3,R3,#23   ;RIGHT HAND
	LDR R10,=BLACK
    BL DRAW_RECTANGLE_FILLED
	MOV R0,R11 ;X1
	ADD R3,R0,#6
	;SUBS R0,R0,#29
	MOV R1,R12;Y1
	;SUBS R1,R1,#1
	ADD R4,R1,#9 ;Y2
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV  R3,R9
	SUBS R0,R3,#6
	;SUBS R0,R0,#20
	;SUBS R3,R0,#20
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	POP{R0-R12,PC}
   ;r0 x1
   ;r1 y1
   ;r3 x2
   ;r4 y2
   ENDFUNC
   
    B SKIPPED19
	LTORG
SKIPPED19
;##########################################################################################################################################
DRAW_WIN_ANIMATION FUNCTION
	PUSH{R0-R12,LR}
	
;R10 COLOR OF win word
;R0-->X1, R3-->X2   ,R2-->Y1,  R4-->Y2
;;W CHARACTER BASE
    MOV R0,#100
	ADD R3,R0,#36
	MOV R1,#115
	ADD R4,R1,#5
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;FIRST CLOUMN
    ADD R3,R0,#6
	MOV R4,R1
	SUB R1,R1,#25
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;SECOND COLUMN
    ADD R0,R0,#15
    ADD R3,R3,#15	
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;THIRD COLUMN
    ADD R0,R0,#15
    ADD R3,R3,#15
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;DRAW SECOND CHARACTER
;; DRAW I HEAD
    ADD R0,R0,#16
	ADD R3,R3,#16
	ADD R4,R1,#6
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; I BODY 
    ADD R1,R4,#4   
	ADD R4,R1,#20  
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; FIRST COLUMN
    ADD R0,R0,#16   ;X1
	ADD R3,R0,#6    ;X2
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; N UPPER HEAD   NO CHANGE IN X0
	ADD R3,R0,#20   ;WIDTH OF FIRST HEAD 
	MOV R4,R1
   	SUB R1,R1,#7
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; 	SECOND COLUMN
    MOV R1,R4
	ADD R4,R1,#15  
    ADD R0,R0,#15
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED   
;; LOWER HEAD
    ADD R3,R3,#15
	MOV R1,R4
	ADD R4,R1,#5
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED   
;; LAST COLUMN
    ADD R0,R0,#15   ; X1    NO CHANGE IN X2 
    ;MOV R4,R1   
	SUB R1,R1,#22  ;LENGHT OF COLUMN
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED   
	POP{R0-R12,PC}
	ENDFUNC
	
	
	 B SKIPPED20
	LTORG
SKIPPED20

DRAW_WALLS FUNCTION
   ;THIS FUNCTION TAKES STARTING X, Y, COLOR AND DRAWS WALLS
   ;X1 = R0
   ;Y1 = R1
   ;COLOR = R10
   ;X2 = R3
   ;Y2 = R4
  PUSH{R0-R12,LR}



  ;DRAW THE FIRST HORIZONTAL LINE FROM RIGHT

  ADD R1, R1, #28
  ADD R4, R1, #2
  ADD R3, R0, #320
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R6, R0
  MOV R7, R1   ;SAVING STARTING X , Y

  ;DRAW THE SECOND HORIZONTAL LINE FROM RIGHT


  ADD R1, R1, #40
  ADD R4, R1, #2
  ADD R3, R0, #260
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE THIRD HORIZONTAL LINE FROM RIGHT


  ADD R1, R1, #82
  ADD R4, R1, #2
  ADD R3, R0, #180
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE FOURTH HORIZONTAL LINE FROM RIGHT


  ADD R1, R1, #124
  ADD R4, R1, #2
  ADD R3, R0, #220
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE FIFTH HORIZONTAL LINE FROM RIGHT


  ADD R1, R1, #166
  ADD R4, R1, #2
  ADD R3, R0, #220
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE SIXTH HORIZONTAL LINE FROM RIGHT


  ADD R1, R1, #208
  ADD R4, R1, #2
  ADD R3, R0, #320
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE FIRST HORIZONTAL LINE FROM LEFT


  ADD R1, R1, #82
  ADD R4, R1, #2
  ADD R0, R0, #240
  ADD R3, R0, #80
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE SECOND HORIZONTAL LINE FROM LEFT


  ADD R1, R1, #124
  ADD R4, R1, #2
  ADD R0, R0, #280
  ADD R3, R0, #40
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE THIRD HORIZONTAL LINE FROM LEFT


;  ADD R1, R1, #166
;  ADD R4, R1, #2
;  ADD R0, R0, #280
;  ADD R3, R0, #40
;  LDR R10, =GREY
;  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE VERTICAL LINE ON THE RIGHT


  ADD R4, R1, #166
  ADD R3, R0, #2
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE VERTICAL LINE ON THE LEFT


  ADD R4, R1, #240
  ADD R0, R0, #318
  ADD R3, R0, #2
  LDR R10, =GREY
  BL DRAW_RECTANGLE_FILLED

  POP{R0-R12,PC}
  ENDFUNC
  
   B SKIPPED21
	LTORG
SKIPPED21

  ;##########################################################################################################################################

DRAW_TIMESLOT FUNCTION
;THIS FUNCTION TAKES X, Y , COLOR AND DRAWS A TIME SLOT WILL BE USED IN LEVEL 2
   ;X1 = R0
   ;Y1 = R1
   ;COLOR = R10
   ;X2 = R3
   ;Y2 = R4
  PUSH{R0-R12,LR}
  ADD R1, R1, #0
  ADD R0, R0, #0
  MOV R6, R0
  MOV R7, R1   ;SAVING STARTING X , Y

  ;DRAWS THE HORIZONTAL  RECTANGLE OF T LETTER

  ADD R1, R1, #4
  ADD R4, R1, #3
  ADD R0, R0, #4
  ADD R3, R0, #13
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAWS THE VERTICAL  RECTANGLE OF T LETTER

  ADD R1, R1, #8
  ADD R4, R1, #16
  ADD R0, R0, #9
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE I LETTER

  ADD R1, R1, #4
  ADD R4, R1, #20
  ADD R0, R0, #26
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW FIRST VERTICAL RECTANGLE OF M LETTER

  ADD R1, R1, #4
  ADD R4, R1, #20
  ADD R0, R0, #38
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW FIRST HORIZONTAL RECTANGLE OF M LETTER

  ADD R1, R1, #4
  ADD R4, R1, #2
  ADD R0, R0, #42
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE SECOND VERTICAL RECTANGLE OF M LETTER

  ADD R1, R1, #4
  ADD R4, R1, #20
  ADD R0, R0, #46
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE SECOND HORIZONTAL RECTANGLE OF M LETTER

  ADD R1, R1, #4
  ADD R4, R1, #2
  ADD R0, R0, #50
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE THIRD VERTICAL RECTANGLE OF M LETTER

  ADD R1, R1, #4
  ADD R4, R1, #20
  ADD R0, R0, #54
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE VERTICAL RECTANGLE OF E LETTER

  ADD R1, R1, #4
  ADD R4, R1, #20
  ADD R0, R0, #66
  ADD R3, R0, #3
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE FIRST HORIZONTAL RECTANGLE OF M LETTER

  ADD R1, R1, #4
  ADD R4, R1, #3
  ADD R0, R0, #70
  ADD R3, R0, #13
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE SECOND HORIZONTAL RECTANGLE OF M LETTER

  ADD R1, R1, #12
  ADD R4, R1, #3
  ADD R0, R0, #70
  ADD R3, R0, #12
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ;DRAW THE THIRD HORIZONTAL RECTANGLE OF M LETTER

  ADD R1, R1, #21
  ADD R4, R1, #3
  ADD R0, R0, #70
  ADD R3, R0, #12
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ADD R1, R1, #4
  ADD R4, R1, #5
  ADD R0, R0, #90
  ADD R3, R0, #9
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

  ADD R1, R1, #19
  ADD R4, R1, #5
  ADD R0, R0, #90
  ADD R3, R0, #9
  LDR R10, =YELLOW
  BL DRAW_RECTANGLE_FILLED

  MOV R0, R6
  MOV R1, R7  ;RETRIEVE STARTING X , Y

;  ;DRAW THE FIRST NUMBER

;  ADD R1, R1, #4
;  ADD R4, R1, #20
;  ADD R0, R0, #112
;  ADD R3, R0, #3
;  LDR R10, =YELLOW
;  BL DRAW_RECTANGLE_FILLED

;  MOV R0, R6
;  MOV R1, R7  ;RETRIEVE STARTING X , Y

;  ;DRAW THE SECOND NUMBER

;  ADD R1, R1, #4
;  ADD R4, R1, #20
;  ADD R0, R0, #133
;  ADD R3, R0, #3
;  LDR R10, =YELLOW
;  BL DRAW_RECTANGLE_FILLED



  POP{R0-R12,PC}
  ENDFUNC
  
    B SKIPPED22
	LTORG
SKIPPED22	
 ;########################################################################################################################################## 
  
DRAW_PRISONER FUNCTION
   ;takes arguments same as RECTANGLE parameters
   ;is divided into many rectangle Functions 
   ;addres seting for parameters 
   PUSH {R0-R12,LR}
    LDR R7,=PRISONERX     ;SETTING THE VALUE OF X1
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
    ADD R3,R0,#12  ;HAIR
	ADD R4,R1,#4
	LDR R10,=BROWN  ;BROWN 
    BL DRAW_RECTANGLE_FILLED
	
	MOV R1,R4
	ADD R4,R1,#7     ;HEAD
	LDR R10, = NAVAJOWHITE ;LITTLE ORANGE
	   BL DRAW_RECTANGLE_FILLED 
	push{r0,r1,r3,r4}
	ADD R0,#4
	ADD R1,#1
	add r4,r1,#1
	add r3,r0,#1
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	ADD R0,#4
	add r4,r1,#1
	add r3,r0,#1
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	ADD r1,r1,#3
	add r4,r1,#1 
	subs r0,r0,#5
	add r3,r0,#6
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	
	pop {r0,r1,r3,r4}
	
	MOV  R1,R4      ;Y1
	ADD  R3,R3,#3   ;X2     ;BODY
	SUBS R0,R0,#3   ;X1
	ADD  R4,R4,#13  ;Y2
	MOV R10,#0xF81F     ;PINK
	MOV R12,R4 ;Y2
	MOV R11,R0 ;X1
	MOV R9,R3 ;X2
	BL DRAW_RECTANGLE_FILLED
	MOV R0,R3  
    ADD R0,R0,#1 ;X1	
	ADD R3,R3,#4 ;X2    ;LEFT HAND
	MOV R4,R1 
	ADD R4,R4,#9
	LDR R10,=NAVAJOWHITE
    BL DRAW_RECTANGLE_FILLED
	SUBS R0,R0,#23     
	SUBS R3,R3,#23   ;RIGHT HAND
	LDR R10,=NAVAJOWHITE
    BL DRAW_RECTANGLE_FILLED
	MOV R0,R11 ;X1
	ADD R3,R0,#6
	;SUBS R0,R0,#29
	MOV R1,R12;Y1
	;SUBS R1,R1,#1
	ADD R4,R1,#9 ;Y2
	LDR R10,=BLUE
	BL DRAW_RECTANGLE_FILLED
	MOV  R3,R9
	SUBS R0,R3,#6
	;SUBS R0,R0,#20
	;SUBS R3,R0,#20
	LDR R10,=BLUE
	BL DRAW_RECTANGLE_FILLED
	POP{R0-R12,PC}
   ;r0 x1
   ;r1 y1
   ;r3 x2
   ;r4 y2
   ENDFUNC


    B SKIPPED23
	LTORG
SKIPPED23
;##########################################################################################################################################
MOVE_PRISONER_LEFT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	LDR R5, =COUNTER
	LDRH R0,[R5]
	CMP R0,#10
	BEQ MOVE1
	CMP R0,#20
	BEQ MOVE1
	CMP R0,#30
	BEQ MOVE1
	CMP R0,#40
	BEQ MOVE1
	CMP R0,#50
	BEQ MOVE1
	B NOMOVE2
MOVE1
	LDR R7,=PRISONERX
	LDRH R5,[R7]
	SUB R5,R5,#20
	CMP R5,#0
	BLE NOMOVE2
	MOV R10,#1
    BL WALL_COLLISION_RIGHT
	CMP R10,#0
	BEQ NOMOVE2
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	push{R0}
	SUB R0,R0,#5
	ADD R3,R0,#25
	ADD R4,R1,#35
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	SUB R0,R0,#20
	STRH R0,[R7]
	BL DRAW_PRISONER
NOMOVE2	
	
	POP{R0-R12,PC}
	ENDFUNC
	
    B SKIPPED24
	LTORG
SKIPPED24

MOVE_PRISONER_RIGHT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	LDR R5, =COUNTER
	LDRH R0,[R5]
	CMP R0,#10
	BEQ MOVE
	CMP R0,#20
	BEQ MOVE
	CMP R0,#30
	BEQ MOVE
	CMP R0,#40
	BEQ MOVE
	CMP R0,#50
	BEQ MOVE
	B NOMOVE
MOVE
	LDR R7,=PRISONERX
	LDRH R5,[R7]
	ADD R5,R5,#37
	CMP R5,#320
	BGE NOMOVE
	MOV R10,#1
    BL WALL_COLLISION_RIGHT
	CMP R10,#0
	BEQ NOMOVE
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	
	LDR R7,=PRISONERX     ;SETTING THE VALUE OF X1
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	PUSH{R0}
	SUB R0,R0,#7
	ADD R3,R0,#25
	ADD R4,R1,#35
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	ADD R0,R0,#15
	STRH R0,[R7]
	BL DRAW_PRISONER
NOMOVE	
	POP{R0-R12,PC}
	ENDFUNC

    B SKIPPED25
	LTORG
SKIPPED25


MOVE_PRISONER_DOWN	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	LDR R5, =COUNTER
	LDRH R0,[R5]
	CMP R0,#10
	BEQ MOVE3
	CMP R0,#20
	BEQ MOVE3
	CMP R0,#30
	BEQ MOVE3
	CMP R0,#40
	BEQ MOVE3
	CMP R0,#50
	BEQ MOVE3
	B NOMOVE3
MOVE3
	LDR R7,=PRISONERY
	LDRH R5,[R7]
	ADD R5,R5,#50
	CMP R5,#240                                      ;COMPARE WITH THE LAST LINE
	BGE NOMOVE3
	MOV R10,#1
    BL WALL_COLLISION_DOWN
	CMP R10,#0
	BEQ NOMOVE3
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	
	LDR R7,=PRISONERX     ;SETTING THE VALUE OF X1
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	PUSH{R0}
	SUB R0,R0,#7
	ADD R3,R0,#27
	ADD R4,R1,#35
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	ADD R1,R1,#13
	STRH R1,[R8]
	BL DRAW_PRISONER
NOMOVE3	
	POP{R0-R12,PC}
	ENDFUNC

    B SKIPPED27
	LTORG
SKIPPED27

MOVE_PRISONER_UP	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
		LDR R5, =COUNTER
	LDRH R0,[R5]
	CMP R0,#10
	BEQ MOVE4
	CMP R0,#20
	BEQ MOVE4
	CMP R0,#30
	BEQ MOVE4
	CMP R0,#40
	BEQ MOVE4
	CMP R0,#50
	BEQ MOVE4
	B NOMOVE4
MOVE4
	LDR R7,=PRISONERY
	LDRH R5,[R7]
	SUB R5,R5,#20
	CMP R5,#20
	BLT NOMOVE4
    MOV R10,#1
    BL WALL_COLLISION_UP
	CMP R10,#0
	BEQ NOMOVE4
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	
	LDR R7,=PRISONERX     ;SETTING THE VALUE OF X1
	LDR R8,=PRISONERY    ;SETTING THE VALUE OF Y1
	LDRH R0,[R7]
	LDRH R1,[R8]
	PUSH{R0}
	SUB R0,R0,#7
	ADD R3,R0,#27
	ADD R4,R1,#35
	LDR R10,=BLACK ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED
	POP{R0}
	
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	SUB R1,R1,#20
	STRH R1,[R8]
	BL DRAW_PRISONER
NOMOVE4
	POP{R0-R12,PC}
	ENDFUNC
	
	
	 B SKIPPED28
	LTORG
SKIPPED28

;##########################################################################################################################################
Draw_Arrow FUNCTION;TAKES R0 FOR X1 AND R1 FOR Y1
   PUSH{R0-R12,LR}
   ADD R3,R0,#35     ;   BL HOR_Line 
   ADD R4,R1,#2
   LDR R10,=WHITE
   BL DRAW_RECTANGLE_FILLED
     
    
   
    SUBS R0,R0,#12 ;x1
   subs  R3,R3,#43 ;X2  WIDTH OF RECTANGLE
   ADD  r3,r3,#1
   MOV R7,R0   ;X1
   MOV R9,R3   ;X2
   MOV R8,R1   ;Y1
   MOV R11,R4 ;Y2 
   bl DRAW_RECTANGLE_FILLED
   ;RESSETTING FOR X1,X2 TO START OF HORIZONTAL ARROW
   mov R5,#4 ;number OF RECTANGLES    ;   BL Sloped_Lines
LOOP_PVE_SLOPE
   MOV R0,R3  ;X0
   ADD R3,R3,#4 ;X1
   MOV   R4,R1   ;HIGHERING THE LEVEL OF Y2 TO PLACE OF Y1
   SUBS  R1,R1,#2 ; HIGHERING THE LEVEL OF Y1 TO 2 STEPS UPPER THAN Y1
   LDR R10,=WHITE
   BL DRAW_RECTANGLE_FILLED
    SUBS R5,R5,#1    ;DECREASING BY 1 NUM OF RECTANGLES REQUIRED
   CMP R5,#0      ;IF RECTANGLES ENDS
   BNE LOOP_PVE_SLOPE
    
	
   MOV R0,R7 ;RESETTING THE ORIGINAL GIVEN PARAMETERS
   MOV R1,R8 
   MOV R3,R9
   MOV R4,R11   
   MOV R5,#4  

LOOP_NVE_SLOPE
    MOV R0,R3 ;X1
    ADD R3,R3,#4 ;X2 
    ;x1  LOWERING THE LEVEL OF Y2
   MOV R1,R4
   ADD R4,R4,#2
   
   LDR R10,=WHITE
   BL DRAW_RECTANGLE_FILLED
   SUBS R5,R5,#1 
   CMP R5,#0
   BNE LOOP_NVE_SLOPE
                       
   POP{R0-R12,PC}
  ENDFUNC
  

    B SKIPPED29
	LTORG
SKIPPED29

DRAW_TIMEOUT FUNCTION
  PUSH {R0-R12, LR}
  
  ;Draw horizontal rectangle of T
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#70
  ADD R3,R0,#40
  ADD R1,R1,#40
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw vertical rectangle of T
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#85
  ADD R3,R0,#10
  ADD R1,R1,#50
  ADD R4,R1,#60
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw vertical rectangle of I
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#120
  ADD R3,R0,#10
  ADD R1,R1,#40
  ADD R4,R1,#70
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw horizontal rectangle of M
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#140
  ADD R3,R0,#50
  ADD R1,R1,#40
  ADD R4,R1,#20
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw left vertical rectangle of M
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#140
  ADD R3,R0,#10
  ADD R1,R1,#60
  ADD R4,R1,#50
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}
  
  ;Draw middle vertical rectangle of M
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#160
  ADD R3,R0,#10
  ADD R1,R1,#60
  ADD R4,R1,#50
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw right vertical rectangle of M
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#180
  ADD R3,R0,#10
  ADD R1,R1,#60
  ADD R4,R1,#50
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw upper horizontal rectangle of E
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#200
  ADD R3,R0,#35
  ADD R1,R1,#40
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}
  
  ;Draw middle horizontal rectangle of E
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#200
  ADD R3,R0,#35
  ADD R1,R1,#70
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw lower horizontal rectangle of E
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#200
  ADD R3,R0,#35
  ADD R1,R1,#100
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw vertical rectangle of E
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#200
  ADD R3,R0,#10
  ADD R1,R1,#50
  ADD R4,R1,#50
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}
  
  
  
  ;Draw upper horizontal rectangle of O
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#95
  ADD R3,R0,#35
  ADD R1,R1,#130
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw lower horizontal rectangle of O
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#95
  ADD R3,R0,#35
  ADD R1,R1,#190
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw left vertical rectangle of O
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#95
  ADD R3,R0,#10
  ADD R1,R1,#140
  ADD R4,R1,#50
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw right vertical rectangle of O
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#120
  ADD R3,R0,#10
  ADD R1,R1,#140
  ADD R4,R1,#50
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw left vertical rectangle of U
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#140
  ADD R3,R0,#10
  ADD R1,R1,#130
  ADD R4,R1,#60
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw left vertical rectangle of U
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#170
  ADD R3,R0,#10
  ADD R1,R1,#130
  ADD R4,R1,#60
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw horizontal rectangle of U
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#140
  ADD R3,R0,#40
  ADD R1,R1,#190
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw horizontal rectangle of T
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#190
  ADD R3,R0,#40
  ADD R1,R1,#130
  ADD R4,R1,#10
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  ;Draw vertical rectangle of T
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#205
  ADD R3,R0,#10
  ADD R1,R1,#140
  ADD R4,R1,#60
  LDR R10,=RED
  BL DRAW_RECTANGLE_FILLED
  POP {R0-R1}

  BL LOSE2

  POP {R0-R12, PC}
  ENDFUNC








    B SKIPPED30
	LTORG
SKIPPED30



;///////////////////////////////////////////////////Logic//////////////////////////////////////////////////
INCHECK FUNCTION
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	POP{R0-R12,PC}
	ENDFUNC


INITIALIZE_VARIABLES	FUNCTION
	PUSH{R0-R12,LR}
	;THIS FUNCTION JUST INITIALIZES ANY VARIABLE IN THE DATASECTION TO ITS INITIAL VALUES
	;ALTHOUGH WE SPECIFIED SOME VALUES IN THE DATA AREA, BUT THEIR VALUES MIGHT BE ALTERED DURING BOOT TIME.
	;SO WE NEED TO IMPLEMENT THIS FUNCTION THAT REINITIALIZES ALL VARIABLES
	
	;TODO: INITIALIZE STARTING_X TO 150, NOTICE THAT STARTING_X IS DECLARED AS 16-BITS
	LDR R5, =PRISONERX
	LDRH R0,[R5]
	MOV  R0,#100
	STRH R0,[R5]
	
	;TODO: INITIALIZE STARTING_Y TO 170, NOTICE THAT STARTING_Y IS DECLARED AS 16-BITS
	LDR R5, =PRISONERY
	LDRH R0,[R5]
	MOV R0,#32
	STRH R0,[R5]

;TODO: INITIALIZE STARTING_X TO 150, NOTICE THAT STARTING_X IS DECLARED AS 16-BITS
	LDR R5, =GHOST1X
	LDRH R0,[R5]
	MOV  R0,#10
	STRH R0,[R5]
	
	;TODO: INITIALIZE STARTING_Y TO 170, NOTICE THAT STARTING_Y IS DECLARED AS 16-BITS
	LDR R5, =GHOST1Y
	LDRH R0,[R5]
	MOV R0,#106
	STRH R0,[R5]

;TODO: INITIALIZE STARTING_X TO 150, NOTICE THAT STARTING_X IS DECLARED AS 16-BITS
	LDR R5, =GHOST2X
	LDRH R0,[R5]
	MOV  R0,#160
	STRH R0,[R5]
	
	;TODO: INITIALIZE STARTING_Y TO 170, NOTICE THAT STARTING_Y IS DECLARED AS 16-BITS
	LDR R5, =GHOST2Y
	LDRH R0,[R5]
	MOV R0,#150
	STRH R0,[R5]


;TODO: INITIALIZE STARTING_X TO 150, NOTICE THAT STARTING_X IS DECLARED AS 16-BITS
	LDR R5, =GHOST3X
	LDRH R0,[R5]
	MOV  R0,#10
	STRH R0,[R5]
	
	;TODO: INITIALIZE STARTING_Y TO 170, NOTICE THAT STARTING_Y IS DECLARED AS 16-BITS
	LDR R5, =GHOST3Y
	LDRH R0,[R5]
	MOV R0,#190
	STRH R0,[R5]

    LDR R5, =TIMER
	LDRH R0,[R5]
	MOV  R0,#30
	STRH R0,[R5]
	
	LDR R5, =DIRECTION1
	LDRH R0,[R5]
	MOV  R0,#0
	STRH R0,[R5]
	
	LDR R5, =DIRECTION2
	LDRH R0,[R5]
	MOV  R0,#0
	STRH R0,[R5]
	
	LDR R5, =DIRECTION3
	LDRH R0,[R5]
	MOV  R0,#0
	STRH R0,[R5]
	
	LDR R5, =COUNTER
	LDRH R0,[R5]
	MOV  R0,#50
	STRH R0,[R5]


	POP{R0-R12,PC}
	ENDFUNC
	
    B SKIPPED31
	LTORG
SKIPPED31
	
DRAW_TIME FUNCTION
  PUSH {R0-R12, LR}
  LDR R8,=TIMER
  LDRH R1,[R8]

  CMP R1,#30
  BEQ Label_30
  CMP R1,#29
  BEQ Label_29
  CMP R1,#28
  BEQ Label_28
  CMP R1,#27
  BEQ Label_27
  CMP R1,#26
  BEQ Label_26
  CMP R1,#25
  BEQ Label_25
  CMP R1,#24
  BEQ Label_24
  CMP R1,#23
  BEQ Label_23
  CMP R1,#22
  BEQ Label_22
  CMP R1,#21
  BEQ Label_21
  CMP R1,#20
  BEQ Label_20
  CMP R1,#19
  BEQ Label_19
  CMP R1,#18
  BEQ Label_18
  CMP R1,#17
  BEQ Label_17
  CMP R1,#16
  BEQ Label_16
  CMP R1,#15
  BEQ Label_15
  CMP R1,#14
  BEQ Label_14
  CMP R1,#13
  BEQ Label_13
  CMP R1,#12
  BEQ Label_12
  CMP R1,#11
  BEQ Label_11
  CMP R1,#10
  BEQ Label_10
  CMP R1,#09
  BEQ Label_09
  CMP R1,#08
  BEQ Label_08
  CMP R1,#07
  BEQ Label_07
  CMP R1,#06
  BEQ Label_06
  CMP R1,#05
  BEQ Label_05
  CMP R1,#04
  BEQ Label_04
  CMP R1,#03
  BEQ Label_03
  CMP R1,#02
  BEQ Label_02
  CMP R1,#01
  BEQ Label_01
  CMP R1,#00
  BEQ Label_00
  
  
Label_30
  BL DRAW_30
  B ENDING  
Label_29
  BL DRAW_29
  B ENDING 
Label_28
  BL DRAW_28
  B ENDING 
Label_27
  BL DRAW_27
  B ENDING 
Label_26
  BL DRAW_26
  B ENDING 
Label_25
  BL DRAW_25
  B ENDING 
Label_24
  BL DRAW_24
  B ENDING 
Label_23
  BL DRAW_23
  B ENDING 
Label_22
  BL DRAW_22
  B ENDING 
Label_21
  BL DRAW_21
  B ENDING 
Label_20
  BL DRAW_20
  B ENDING 
Label_19
  BL DRAW_19
  B ENDING 
Label_18
  BL DRAW_18
  B ENDING 
Label_17
  BL DRAW_17
  B ENDING 
Label_16
  BL DRAW_16
  B ENDING 
Label_15
  BL DRAW_15
  B ENDING 
Label_14
  BL DRAW_14
  B ENDING 
Label_13
  BL DRAW_13
  B ENDING 
Label_12
  BL DRAW_12
  B ENDING 
Label_11
  BL DRAW_11
  B ENDING 
Label_10
  BL DRAW_10
  B ENDING 
Label_09
  BL DRAW_09
  B ENDING 
Label_08
  BL DRAW_08
  B ENDING 
Label_07
  BL DRAW_07
  B ENDING 
Label_06
  BL DRAW_06
  B ENDING 
Label_05
  BL DRAW_05
  B ENDING 
Label_04
  BL DRAW_04
  B ENDING 
Label_03
  BL DRAW_03
  B ENDING 
Label_02
  BL DRAW_02
  B ENDING 
Label_01
  BL DRAW_01
  B ENDING 
Label_00
  BL DRAW_00
  
ENDING  
  SUB R1,#1
  STRH R1,[R8] 
  LDR R5, =COUNTER
  LDRH R0,[R5]
  MOV  R0,#50
  STRH R0,[R5]
  POP {R0-R12, PC}
  ENDFUNC

    B SKIPPED32
	LTORG
SKIPPED32

DRAW_LEFT_ZERO FUNCTION
	
  PUSH {R0-R12, LR}
  
;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#114
  ADD R3,R0,#8
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#16
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#16
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED33
	LTORG
SKIPPED33

DRAW_RIGHT_ZERO FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#136
  ADD R3,R0,#8
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#16
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#16
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 B SKIPPED34
	LTORG
SKIPPED34

DRAW_LEFT_ONE FUNCTION
  PUSH {R0-R12, LR}

;Remove upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#10
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#10
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#10
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#4
  ADD R4,R1,#20
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED35
	LTORG
SKIPPED35

DRAW_RIGHT_ONE FUNCTION
  PUSH {R0-R12, LR}

;Remove upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#10
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#10
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#10
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#4
  ADD R4,R1,#20
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 B SKIPPED36
	LTORG
SKIPPED36

DRAW_LEFT_EIGHT FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle  
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED37
	LTORG
SKIPPED37

DRAW_RIGHT_EIGHT FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED38
	LTORG
SKIPPED38

DRAW_LEFT_NINE FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    B SKIPPED39
	LTORG
SKIPPED39

DRAW_RIGHT_NINE FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    B SKIPPED40
	LTORG
SKIPPED40

DRAW_LEFT_TWO FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4  
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 B SKIPPED41
	LTORG
SKIPPED41

DRAW_RIGHT_TWO FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    B SKIPPED42
	LTORG
SKIPPED42

DRAW_LEFT_THREE FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle  
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7 
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 B SKIPPED43
	LTORG
SKIPPED43

DRAW_RIGHT_THREE FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    B SKIPPED44
	LTORG
SKIPPED44

DRAW_LEFT_FIVE FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


 B SKIPPED45
	LTORG
SKIPPED45


DRAW_RIGHT_FIVE FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED46
	LTORG
SKIPPED46

DRAW_LEFT_SIX FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower left vertical rectangle  
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 B SKIPPED47
	LTORG
SKIPPED47

DRAW_RIGHT_SIX FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15 
  ADD R4,R1,#7
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 B SKIPPED48
	LTORG
SKIPPED48

DRAW_LEFT_FOUR FUNCTION
  PUSH {R0-R12, LR}

;Remove upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#114
  ADD R3,R0,#8
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#10
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle  
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#4
  ADD R4,R1,#9
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#4
  ADD R4,R1,#9
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#9
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED49
	LTORG
SKIPPED49

DRAW_RIGHT_FOUR FUNCTION
  PUSH {R0-R12, LR}

;Remove upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#136
  ADD R3,R0,#8
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#10
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=BLACK 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#4
  ADD R4,R1,#9
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw upper right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#4
  ADD R4,R1,#9
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw lower right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#9
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 B SKIPPED50
	LTORG
SKIPPED50

DRAW_LEFT_SEVEN FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0 
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#10
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#10
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#122
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#18
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#112
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    B SKIPPED51
	LTORG
SKIPPED51

DRAW_RIGHT_SEVEN FUNCTION
  PUSH {R0-R12, LR}

;Draw upper horizontal rectangle 
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#12
  ADD R1,R1,#4
  ADD R4,R1,#2
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove middle horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#10
  ADD R1,R1,#13
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower horizontal rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#10
  ADD R1,R1,#22
  ADD R4,R1,#2
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove upper left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#7
  LDR R10,=BLACK 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Draw right vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#144
  ADD R3,R0,#2
  ADD R1,R1,#6
  ADD R4,R1,#18
  LDR R10,=YELLOW 
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

;Remove lower left vertical rectangle
  PUSH {R0-R1}
  MOV R0,#0
  MOV R1,#0
  ADD R0,R0,#134
  ADD R3,R0,#2
  ADD R1,R1,#15
  ADD R4,R1,#7
  LDR R10,=BLACK
  BL DRAW_RECTANGLE_FILLED 
  POP {R0-R1}

  POP {R0-R12, PC}
  ENDFUNC
  
  
   B SKIPPED52
	LTORG
SKIPPED52

DRAW_00  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_ZERO
   BL delay_10_milli_second
   BL DRAW_TIMEOUT
   POP{R0-R12,PC}
   ENDFUNC
  
DRAW_01  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_ONE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_02  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_TWO
   POP{R0-R12,PC}
   ENDFUNC

   
DRAW_03  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_THREE
   POP{R0-R12,PC}
   ENDFUNC

DRAW_04  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_FOUR
   POP{R0-R12,PC}
   ENDFUNC

   B SKIPPED70
	LTORG
SKIPPED70

DRAW_05  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_FIVE
   POP{R0-R12,PC}
   ENDFUNC

DRAW_06  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_SIX
   POP{R0-R12,PC}
   ENDFUNC

DRAW_07  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_SEVEN
   POP{R0-R12,PC}
   ENDFUNC


DRAW_08  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_EIGHT
   POP{R0-R12,PC}
   ENDFUNC

    B SKIPPED53
	LTORG
SKIPPED53

DRAW_09  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ZERO
   BL DRAW_RIGHT_NINE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_10  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_ZERO
   POP{R0-R12,PC}
   ENDFUNC



DRAW_11  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_ONE
   POP{R0-R12,PC}
   ENDFUNC

    B SKIPPED54
	LTORG
SKIPPED54

DRAW_12  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_TWO
   POP{R0-R12,PC}
   ENDFUNC


DRAW_13  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_THREE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_14  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_FOUR
   POP{R0-R12,PC}
   ENDFUNC


DRAW_15  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_FIVE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_16  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_SIX
   POP{R0-R12,PC}
   ENDFUNC


DRAW_17  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_SEVEN
   POP{R0-R12,PC}
   ENDFUNC


   B SKIPPED55
	LTORG
SKIPPED55


DRAW_18 FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_EIGHT
   POP{R0-R12,PC}
   ENDFUNC


DRAW_19  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_ONE
   BL DRAW_RIGHT_NINE
   POP{R0-R12,PC}
   ENDFUNC

    B SKIPPED56
	LTORG
SKIPPED56

DRAW_20  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_ZERO
   POP{R0-R12,PC}
   ENDFUNC

DRAW_21  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_ONE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_22  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_TWO
   POP{R0-R12,PC}
   ENDFUNC


DRAW_23  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_THREE
   POP{R0-R12,PC}
   ENDFUNC

DRAW_24  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_FOUR
   POP{R0-R12,PC}
   ENDFUNC

DRAW_25  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_FIVE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_26  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_SIX
   POP{R0-R12,PC}
   ENDFUNC

    B SKIPPED57
	LTORG
SKIPPED57

DRAW_27  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_SEVEN
   POP{R0-R12,PC}
   ENDFUNC


DRAW_28  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_EIGHT
   POP{R0-R12,PC}
   ENDFUNC


DRAW_29  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_TWO
   BL DRAW_RIGHT_NINE
   POP{R0-R12,PC}
   ENDFUNC


DRAW_30  FUNCTION
   PUSH{R0-R12,LR}

   BL DRAW_LEFT_THREE
   BL DRAW_RIGHT_ZERO
   POP{R0-R12,PC}
   ENDFUNC
  
  B SKIPPED58
	LTORG
SKIPPED58

DRAW_LOSE FUNCTION
    PUSH{R0-R12,LR}
	
	MOV R0, #0                    ;WHITE BACKGROUND
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #95                    ;L
	MOV R1, #90
	MOV R3, #101
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R0, #95
	MOV R1, #114
	MOV R3, #131
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #141                   ;O
	MOV R1, #90
	MOV R3, #177
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #147                   
	MOV R1, #96
	MOV R3, #171
	MOV R4, #114
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                 ;S
	MOV R1, #90
	MOV R3, #219
	MOV R4, #96
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                    ;S
	MOV R1, #103
	MOV R3, #219
	MOV R4, #109
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                    ;S
	MOV R1, #114
	MOV R3, #219
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                 ;S VIRTICAL
	MOV R1, #90
	MOV R3, #189
	MOV R4, #104
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #213                 ;S VIRTICAL
	MOV R1, #109
	MOV R3, #219
	MOV R4, #115
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                  ;I IN E
	MOV R1, #90
	MOV R3, #231
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                ;- IN E
	MOV R1, #90
	MOV R3, #261
	MOV R4, #96
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                   ;E
	MOV R1, #103
	MOV R3, #261
	MOV R4, #109
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                   ;S
	MOV R1, #114
	MOV R3, #261
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED	
	BL delay_1_second
	B GET_LEVEL1
	
	
    POP{R0-R12,PC}
    ENDFUNC

LOSE2 FUNCTION
	PUSH{R0-R12,LR}
	BL delay_1_second
	B GET_LEVEL1
	 POP{R0-R12,PC}
	 ENDFUNC

   B SKIPPED59
	LTORG
SKIPPED59


VERLine1  FUNCTION
;TAKES R0 for X1,R1 for y1
   PUSH{R0-R12,LR}
   ADD R3,R0,#2
   ADD R4,R1,#12
    LDR R10, =BLACK
   BL DRAW_RECTANGLE_FILLED
   POP{R0-R12,PC}
   ENDFUNC

GHOST_COLLISION FUNCTION
    PUSH{R0-R12,LR}
	LDR R7,=PRISONERX  
	LDR R8,=PRISONERY  
	LDRH R0,[R7]                  ; R0=PRISONERX
	LDRH R1,[R8]                  ; R1=PRISONERY
	LDR R7,=GHOST1X  
	LDR R8,=GHOST1Y  
	LDRH R2,[R7]
	LDRH R3,[R8]
	LDR R7,=GHOST2X  
	LDR R8,=GHOST2Y  
	LDRH R4,[R7]
	LDRH R5,[R8]
	LDR R7,=GHOST3X  
	LDR R8,=GHOST3Y  
	LDRH R6,[R7]
	LDRH R7,[R8]
	
	CMP R1,#70                     ; END OF LANE 1
	BGE WALLNOTLANE1
	B NOCOLLISION
	
WALLNOTLANE1
     CMP R1,#110
	 BLT WALLINLANE2
	 CMP R1,#152
	 BLT WALLINLANE3
	 CMP R1,#194
	 BLT WALLINLANE4
	 B NOCOLLISION
	 
WALLINLANE2	 
	 CMP R0,R2
	 BGE MAYCOLLISION1
	 B NOCOLLISION
WALLINLANE3	
     CMP R0,R4
	 BGE MAYCOLLISION2
	 B NOCOLLISION
	 
WALLINLANE4
     CMP R0,R6
	 BGE MAYCOLLISION3
	 B NOCOLLISION
	 
MAYCOLLISION1
    ADD R12,R2,#20
    CMP R0,R12
	BLT LOSE
	B NOCOLLISION
	
MAYCOLLISION2
    ADD R12,R4,#20
    CMP R0,R12
	BLT LOSE
	B NOCOLLISION
	
MAYCOLLISION3
    ADD R12,R6,#20
    CMP R0,R12
	BLT LOSE
	B NOCOLLISION

NOCOLLISION
    POP{R0-R12,PC}
    ENDFUNC


WALL_COLLISION_DOWN FUNCTION
	PUSH{R0-R9,R11,R12,LR}
	
	LDR R7,=PRISONERX  
	LDR R8,=PRISONERY  
	LDRH R0,[R7]                  ; R0=PRISONERX
	LDRH R1,[R8]                  ; R1=PRISONERY
	
	CMP R1,#70                     ; END OF LANE 1
	BGE NOTLANE1
    B INLANE1
	
NOTLANE1
     CMP R1,#110
	 BLT INLANE2
	 CMP R1,#152
	 BLT INLANE3
	 CMP R1,#194
	 BLT INLANE4
	 B INLANE5
	 
INLANE1	 
	 CMP R0,#260
	 BLT NOMOVE100
	 B INLANE5
INLANE2	 
	 CMP R0,#180
	 BGE LANE1RIGHT
	 BLT NOMOVE100
INLANE3	
     CMP R0,#220
	 BGE LANE2RIGHT
	 BLT NOMOVE100
	 
INLANE4
     CMP R0,#220
	 ;BGE LANE2RIGHT
	 BLT NOMOVE100
	 B INLANE5
	 	 
LANE1RIGHT
    CMP R0,#240
	BGE NOMOVE100
	B INLANE5
	
LANE2RIGHT
    CMP R0,#280
	BGE NOMOVE100
    B INLANE5
NOMOVE100
    MOV R10,#0
INLANE5	
	POP{R0-R9,R11,R12,PC}
	ENDFUNC

WALL_COLLISION_UP FUNCTION
	PUSH{R0-R9,R11,R12,LR}
	
	LDR R7,=PRISONERX  
	LDR R8,=PRISONERY  
	LDRH R0,[R7]                  ; R0=PRISONERX
	LDRH R1,[R8]                  ; R1=PRISONERY
	
	CMP R1,#70                     ; END OF LANE 1
	BGE NOTLANE1UP
    B INLANE5UP
	
NOTLANE1UP
     CMP R1,#110
	 BLT INLANE1UP
	 CMP R1,#152
	 BLT INLANE2UP
	 CMP R1,#194
	 BLT INLANE3UP
	 B INLANE4UP
	 
INLANE1UP 
	 CMP R0,#260
	 BLT NOMOVE100UP
	 B INLANE5UP
INLANE2UP
	 CMP R0,#180
	 BGE LANE1RIGHTUP
	 BLT NOMOVE100UP
INLANE3UP
     CMP R0,#220
	 BGE LANE2RIGHTUP
	 BLT NOMOVE100UP
	 
INLANE4UP
     CMP R0,#220
	 BGE LANE2RIGHTUP
	 BLT NOMOVE100UP
	 	 
LANE1RIGHTUP
    CMP R0,#240
	BGE NOMOVE100UP
	B INLANE5UP
	
LANE2RIGHTUP
    CMP R0,#280
	BGE NOMOVE100UP
    B INLANE5UP
NOMOVE100UP
    MOV R10,#0
INLANE5UP
	POP{R0-R9,R11,R12,PC}
	ENDFUNC
	
	

WALL_COLLISION_RIGHT FUNCTION
	PUSH{R0-R9,R11,R12,LR}
	
	LDR R7,=PRISONERX  
	LDR R8,=PRISONERY  
	LDRH R0,[R7]                  ; R0=PRISONERX
	LDRH R1,[R8]                  ; R1=PRISONERY
	
    CMP R1,#68
	BLT MORELANE1
CHECKLANE2
    CMP R1,#110
	BLT MORELANE2
CHECKLANE3
    CMP R1,#152
	BLT MORELANE3
CHECKLANE4
    CMP R1,#194
	BLT MORELANE4
	B GOOUT
	
MORELANE1
    ADD R2,R1,#30
    CMP R2,#70
	BGE NOMOVE100RIGHT
	B CHECKLANE2
	
MORELANE2
    ADD R2,R1,#30
    CMP R2,#112
	BGE NOMOVE100RIGHT
	B CHECKLANE3
MORELANE3
    ADD R2,R1,#30
    CMP R2,#154
	BGE NOMOVE100RIGHT
	B CHECKLANE4
MORELANE4
    ADD R2,R1,#30
    CMP R2,#196
	BGE NOMOVE100RIGHT
	B GOOUT	
	
	
NOMOVE100RIGHT
    MOV R10,#0
GOOUT	
	POP{R0-R9,R11,R12,PC}
	ENDFUNC
	

MAIN_MENU   FUNCTION 
	;THIS FUNCTION TAKES TAKES 2 INPUT ONE TO CHOOSE BETWEEN THE TWO GAMES AND ONE TO ENTER THE CHOOSEN GAME
	PUSH{R0-R12,LR}
		MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =BLACK
	BL DRAW_RECTANGLE_FILLED
	MOV R11,#160
	MOV R12,#30
    BL Draw_Bunny
	
	BL DRAW_winner_PACMAN
	
LABEL_TO_RETURN_FOR
	LDR R12,=GPIOC_IDR
	LDR R11,[R12]
	MOV R2,#1
	LSL R2,#13
	AND R11,R11,R2
	CMP R11,#0
	BEQ EXECUTE_FROGGER
	LDR R12,=GPIOC_IDR
	LDR R11,[R12]
	MOV R2,#1
	LSL R2,#14
	AND R11,R11,R2
	CMP R11,#0
	BEQ EXECUTE_PACMAN
	
	B LABEL_TO_RETURN_FOR


EXECUTE_PACMAN
   
   
   	MOV R0,#230
	MOV R1,#165
	BL Draw_Arrow2
	BL delay_1_second
;	MOV R0,#0
;	MOV R1,#0
;	MOV R3,#320
;	MOV R4,#240
;	LDR R10,=BLACK
;	BL DRAW_RECTANGLE_FILLED
	BL EXECUTEPACMAN
	B ROBYY
	
EXECUTE_FROGGER	
	;BL FROGGER_GAME
	
	MOV R0,#230
	MOV R1,#50
	BL Draw_Arrow2
	BL delay_1_second
;	MOV R0,#0
;	MOV R1,#0
;	MOV R3,#320
;	MOV R4,#240
;	LDR R10,=RED
;	BL DRAW_RECTANGLE_FILLED
    BL EXECUTEFROGGER
	B ROBYY
	;AFTER RETURNING FROM ANYGAME WE HAVE TO CALL MAIN MENU AGAIN
ROBYY	
    BL MAIN_MENU
	POP{R0-R12,PC}
	ENDFUNC	
	
Draw_Arrow2  FUNCTION;TAKES R0 FOR X1 AND R1 FOR Y1
   PUSH{R0-R12,LR}
   ADD R3,R0,#35     ;   BL HOR_Line 
   ADD R4,R1,#2
   LDR R10,=WHITE
   BL DRAW_RECTANGLE_FILLED
     
    
   
   SUBS R0,R0,#12 ;x1
   subs  R3,R3,#43 ;X2  WIDTH OF RECTANGLE
   ADD  r3,r3,#1
   MOV R7,R0   ;X1
   MOV R9,R3   ;X2
   MOV R8,R1   ;Y1
   MOV R11,R4 ;Y2 
   bl DRAW_RECTANGLE_FILLED
   ;RESSETTING FOR X1,X2 TO START OF HORIZONTAL ARROW
   mov R5,#4 ;number OF RECTANGLES    ;   BL Sloped_Lines
LOOP_PVE_SLOPE2
   MOV R0,R3  ;X0
   ADD R3,R3,#4 ;X1
   MOV   R4,R1   ;HIGHERING THE LEVEL OF Y2 TO PLACE OF Y1
   SUBS  R1,R1,#2 ; HIGHERING THE LEVEL OF Y1 TO 2 STEPS UPPER THAN Y1
   LDR R10,=WHITE
   BL DRAW_RECTANGLE_FILLED
    SUBS R5,R5,#1    ;DECREASING BY 1 NUM OF RECTANGLES REQUIRED
   CMP R5,#0      ;IF RECTANGLES ENDS
   BNE LOOP_PVE_SLOPE2
    
	
   MOV R0,R7 ;RESETTING THE ORIGINAL GIVEN PARAMETERS
   MOV R1,R8 
   MOV R3,R9
   MOV R4,R11   
   MOV R5,#4  

LOOP_NVE_SLOPE2
    MOV R0,R3 ;X1
    ADD R3,R3,#4 ;X2 
    ;x1  LOWERING THE LEVEL OF Y2
   MOV R1,R4
   ADD R4,R4,#2
   
   LDR R10,=WHITE
   BL DRAW_RECTANGLE_FILLED
   SUBS R5,R5,#1 
   CMP R5,#0
   BNE LOOP_NVE_SLOPE2
                       
   POP{R0-R12,PC}
   ENDFUNC
  

    B SKIPPED226
	LTORG
SKIPPED226



DRAW_winner_PACMAN FUNCTION
	  ;takes arguments same as RECTANGLE parameters
   ;is divided into many rectangle Functions 
   ;addres seting for parameters 
   PUSH {R0-R12,LR}

    MOV R0,#150  ;HAIR
	MOV R1,#120
	MOV R3,#170
	MOV R4,#125
	LDR R10,=BROWN  ;BROWN 
    BL DRAW_RECTANGLE_FILLED
	
	MOV R0,#150;HEAD
	MOV R1,#125
	MOV R3,#170
	MOV R4,#135
	LDR R10, = NAVAJOWHITE ;LITTLE ORANGE
	BL DRAW_RECTANGLE_FILLED 
	
	

	
	
	
	MOV  R0,#140      ;X1
	MOV  R3,#180   ;X2     ;BODY
	MOV  R1,#135 ;y1
	MOV  R4,#175  ;Y2
	MOV R10,#0xF81F     ;PINK

	BL DRAW_RECTANGLE_FILLED
	
	MOV R0,#136  
    MOV R1,#135	
	MOV R3,#140 ;X2    ;LEFT HAND
	MOV R4,#175 
	LDR R10,=NAVAJOWHITE
    BL DRAW_RECTANGLE_FILLED

	MOV R0,#180
    MOV R1,#105	;RIGHT HAND
	MOV R3,#184
	MOV R4,#145
	
	LDR R10,=NAVAJOWHITE
    BL DRAW_RECTANGLE_FILLED
	MOV R0,#154 ;X1
	MOV R3,#156
	MOV R1,#127
	MOV R4,#129
    
	LDR R10,=BLACK
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0,#140 ;X1
	MOV R3,#155
	MOV R1,#175
	MOV R4,#205
	LDR R10,=BLUE
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0,#165 ;X1
	MOV R3,#180
	MOV R1,#175
	MOV R4,#205
	LDR R10,=BLUE
	BL DRAW_RECTANGLE_FILLED
	
	
	
   ;r0 x1
   ;r1 y1
   ;r3 x2
   ;r4 y2
	 POP{R0-R12,PC}
    ENDFUNC
	
	
	
	
Draw_Bunny FUNCTION
;this function takes one point of the top middle of the bunny 
;in r11=x, r12=y
;farest point in width x + or - 24
;if you need the middle point from the button it will be y-54 
;width of bunny = 48 from its foots
;middle point is 48/2 = 24-> x of the corner+24
;R0 = X of ;R1 = Y ;R10 = COLOR  draw pixel  

;draw first row of bunny ear
;right
    push{r0,r1,r10,r9,r11,r12,lr}
    mov r0,r11
    add r0,r0,#12
    mov r1,r12
    ldr r10, =BLACK	
    bl DRAWPIXEL

    add r0,r0,#1     
    bl DRAWPIXEL

    add r0,r0,#1     
    bl DRAWPIXEL
;left
    mov r0,r11
    sub r0,r0,#12	
    bl DRAWPIXEL

    sub r0,r0,#1     
    bl DRAWPIXEL

    sub r0,r0,#1     
    bl DRAWPIXEL
;second raw
    add r1,r1,#1 
	
    mov r0,r11
    add r0,r0,#11
    bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	mov r0,r11
    add r0,r0,#15
	bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	mov r0,r11
    add r0,r0,#12
	ldr r10, =Pink
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	 
	ldr r10, =BLACK
	mov r0,r11
    sub r0,r0,#11
    bl DRAWPIXEL
	add r0,r0,#1
	bl DRAWPIXEL
	mov r0,r11
    sub r0,r0,#15
	bl DRAWPIXEL
	sub r0,r0,#1     
    bl DRAWPIXEL
	mov r0,r11
    sub r0,r0,#12
    ldr r10, =Pink
    bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	
;third raw
    add r1,r1,#1 
	
	ldr r10, =BLACK
	mov r0,r11
    add r0,r0,#10
    bl DRAWPIXEL
	mov r0,r11
    add r0,r0,#16    
    bl DRAWPIXEL
	ldr r10, =Pink
	mov r0,r11
    add r0,r0,#11
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	
	ldr r10, =BLACK
	mov r0,r11
    sub r0,r0,#10
    bl DRAWPIXEL
	mov r0,r11
    sub r0,r0,#16    
    bl DRAWPIXEL
	ldr r10, =Pink
	mov r0,r11
    sub r0,r0,#11
    bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	
;4 raw
   add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#9
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
	
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#9
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   
;5 row
   add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   
;6 row   ;same as 5
    add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   
;7 row   ;same as 5
    add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL

   mov r9,#0
;8 row
rowEight
   add r9,#1
   add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#7
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#7
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   cmp r9,#9
   BNE rowEight
   
;17 row ;same as 5
   
   add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   
;18 row   ;same as 5
    add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   
;19 row   ;same as 5
    add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
   
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#8
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL

;20 row same as 4
   add r1,r1,#1 
   
   ldr r10, =BLACK  
   mov r0,r11
   add r0,r0,#9
   bl DRAWPIXEL
   ldr r10, =Pink
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   add r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   add r0,r0,#1
   bl DRAWPIXEL
	
   ldr r10, =BLACK
   mov r0,r11
   sub r0,r0,#9
   bl DRAWPIXEL
   ldr r10, =Pink
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   sub r0,r0,#1
   bl DRAWPIXEL
   ldr r10, =BLACK
   sub r0,r0,#1
   bl DRAWPIXEL
   
;21 row same as 3
    add r1,r1,#1 
	
	ldr r10, =BLACK
	mov r0,r11
    add r0,r0,#10
    bl DRAWPIXEL
	mov r0,r11
    add r0,r0,#16    
    bl DRAWPIXEL
	ldr r10, =Pink
	mov r0,r11
    add r0,r0,#11
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	
	ldr r10, =BLACK
	mov r0,r11
    sub r0,r0,#10
    bl DRAWPIXEL
	mov r0,r11
    sub r0,r0,#16    
    bl DRAWPIXEL
	ldr r10, =Pink
	mov r0,r11
    sub r0,r0,#11
    bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	
;22 row same as 2
    add r1,r1,#1 
	
    mov r0,r11
    add r0,r0,#11
    bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	mov r0,r11
    add r0,r0,#15
	bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	mov r0,r11
    add r0,r0,#12
	ldr r10, =Pink
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	add r0,r0,#1     
    bl DRAWPIXEL
	 
	ldr r10, =BLACK
	mov r0,r11
    sub r0,r0,#11
    bl DRAWPIXEL
	add r0,r0,#1
	bl DRAWPIXEL
	mov r0,r11
    sub r0,r0,#15
	bl DRAWPIXEL
	sub r0,r0,#1     
    bl DRAWPIXEL
	mov r0,r11
    sub r0,r0,#12
    ldr r10, =Pink
    bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	sub r0,r0,#1
	bl DRAWPIXEL
	
;23 same as 1
    mov r0,r11
    add r0,r0,#12
    add r1,r1,#1
    ldr r10, =BLACK
    bl DRAWPIXEL

    add r0,r0,#1     
    bl DRAWPIXEL

    add r0,r0,#1     
    bl DRAWPIXEL

    mov r0,r11
    sub r0,r0,#12	
    bl DRAWPIXEL

    sub r0,r0,#1     
    bl DRAWPIXEL

    sub r0,r0,#1     
    bl DRAWPIXEL
;ear ended
;Draw bunny face
    mov r1,r12
    add r1,r1,#18
    mov r0,r11
    ldr r10, =BLACK	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL

;2 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL

;3 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL

;4 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    
    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL

;5 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    
    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

;6 row face
   add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    
    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

;7 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    
    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

;8 row face same as 7
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    
    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

;9 row face 
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    
    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

    mov r9,#0
;10 row face start of eyes
Start_eye
    add r9,r9,#1
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLUE
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL	
    ldr r10, =WHITE	
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLUE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE	
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

    cmp r9,#3
    BNE Start_eye

    mov r9,#0
;13 row face
Con_eye
    add r9,r9,#1
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLUE
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE	
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLUE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE	
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    cmp r9,#4
    BNE Con_eye

    mov r9,#0
;17 row face start of bunny cheeks
Cheeks
    add r9,r9,#1
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =Pink
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE	
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =Pink
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE	
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    cmp r9,#2
    BNE Cheeks

;19 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    
    mov r9,#0
;20 row face
BeforMouth
    add r9,r9,#1
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    cmp r9,#3
    BNE BeforMouth

;23 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

;24 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE	
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;25 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;26 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;27 row face start of bunny foots
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
     add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
;28 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL

;29 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;30 row face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL

    mov r0,r11
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;31 row last row in bunny face
    add r1,r1,#1
    mov r0,r11
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#4
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL


    mov r0,r11
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#4
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;bunny face ended, row 1 after face
    add r1,r1,#1
    mov r0,r11
    add r0,r0,#8
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL


    mov r0,r11
    sub r0,r0,#8
    ldr r10, =BLACK
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
;row 2 after face same as 1
    add r1,r1,#1
    mov r0,r11
    add r0,r0,#8
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL


    mov r0,r11
    sub r0,r0,#8
    ldr r10, =BLACK
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL

; row 3 after face
    add r1,r1,#1
    mov r0,r11
    add r0,r0,#9
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL


    mov r0,r11
    sub r0,r0,#9
    ldr r10, =BLACK
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
  
; row 4 after face
    add r1,r1,#1
    mov r0,r11
    add r0,r0,#10
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL


    mov r0,r11
    sub r0,r0,#10
    ldr r10, =BLACK
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
; row 5 after face
    add r1,r1,#1
    mov r0,r11
    add r0,r0,#11
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    ldr r10, =WHITE
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL


    mov r0,r11
    sub r0,r0,#11
    ldr r10, =BLACK
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =WHITE
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    ldr r10, =BLACK
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
;Finally, the last row in the whole bunny
    add r1,r1,#1
    mov r0,r11
    add r0,r0,#12
    ldr r10, =BLACK
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    add r0,r0,#1
    bl DRAWPIXEL
    

    mov r0,r11
    sub r0,r0,#12
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
    sub r0,r0,#1
    bl DRAWPIXEL
;tmmt bhamd ALLAH
    pop{r0,r1,r10,r9,r11,r12,pc}
    ENDFUNC
	
	
	
	

EXECUTEFROGGER FUNCTION
	PUSH {R0-R12,LR}
    ;This is the main funcion, you should only call two functions, one that sets up the TFT
	;And the other that draws a rectangle over the entire screen (ie from (0,0) to (320,240)) with a certain color of your choice

    ldr r12,=LEVEL
	mov r11,#0
	strh r11,[r12]
	;FINAL TODO: CALL FUNCTION SETUP
START_GAME
    BL INITIALIZE_VARIABLES2
	
	

;	;FINAL TODO: DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR
;	MOV R0, #0
;	MOV R1, #0
;	MOV R3, #320
;	MOV R4, #240
;	LDR R10, =WHITE
;	BL DRAW_RECTANGLE_FILLED
	
	
	BL DRAW_RIVER

	


;DRAW THE TOP GREEN RECTANGLE 
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #80
	LDR R10, =GREEN2
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW THE HOUSE
	MOV R0, #210
	MOV R1, #40
	MOV R3, #270
	MOV R4, #70
	LDR R10, =MAGENTA
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #230
	MOV R1, #50
	MOV R3, #250
	MOV R4, #70
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R8, #210
	MOV R9, #38
	LDR R10, =MAGENTA
	BL DRAW_TRIANGLE_FILLED
	
	
	;DRAW TREE IN THE MIDDLE
	MOV R0, #78
	MOV R1, #52
	MOV R3, #82
	MOV R4, #72
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #65
	MOV R1, #32
	MOV R3, #95
	MOV R4, #52
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
    ;DRAW TREE ON THE LEFT
    MOV R0, #43
	MOV R1, #42
	MOV R3, #46
	MOV R4, #62
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #35
	MOV R1, #22
	MOV R3, #55
	MOV R4, #42
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW TREE ON THE RIGHT
	MOV R0, #124
	MOV R1, #37
	MOV R3, #127
	MOV R4, #57
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #115
	MOV R1, #17
	MOV R3, #135
	MOV R4, #37
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
	
	MOV R11, #200
	MOV R12, #183
	BL Draw_Bunny
;	

GAME_LOOP
   BL REINITIALIZE_SPEED
   ;BL TRACK_BUNNY
   MOV R0,#1
   
   BL DRAW_LANE1_MOVING
   BL DRAW_LANE2_MOVING
   BL DRAW_LANE3_MOVING
   BL DRAW_LANE4_MOVING
   BL DRAW_LANE5_MOVING
   
   BL CHECK_INPUT 
   BL delay_half_second
   
      B AYHAGA
   LTORG
AYHAGA
   
   LDR R1,=JUMPFRD
   LDRH R0,[R1]
   
   B AYHAGA1
   LTORG
AYHAGA1
;CHECKPLANCKSLVL1     
	CMP R0,#2
	BEQ LBLCHECK_LANE13
	;BEQ WIN_LVL1_LBL
	CMP R0,#3
	BEQ LBLCHECK_LANE12
	CMP R0,#4
	BEQ LBLCHECK_LANE11
	CMP R0,#5
	BEQ WIN_LVL1_LBL
	B RETURNLBL
	
LBLCHECK_LANE11
    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L1
	LDRH R3,[R1] ;R3->STARTWOOD11
	LDR R1,=STARTING_X_LOG2_L1 
	LDRH R4,[R1] ;R4->STARTWOOD12
	;LDR R1,=LOG1_LENGTH_L1 
    MOV R6,#100 ;R6->WOOD11 LENGHT
	;LDR R1,=LOG2_LENGTH_L1 
	MOV R7,#100 ;R7->WOOD12  LENGHT
	
	
    B CHECKLANE
	
	
LBLCHECK_LANE12

    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L2
	LDRH R3,[R1] ;R3->STARTWOOD21
	LDR R1,=STARTING_X_LOG2_L2
	LDRH R4,[R1] ;R4->STARTWOOD22
	;LDR R1,=LOG1_LENGTH_L2 
	MOV R6,#120 ;R6->WOOD21 LENGHT
	;LDR R1,=LOG2_LENGTH_L2 
	MOV R7,#120 ;R7->WOOD22 LENGHT
	
    B CHECKLANE
	
	
LBLCHECK_LANE13

    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L3
	LDRH R3,[R1] ;R3->STARTWOOD31
	LDR R1,=STARTING_X_LOG2_L3
	LDRH R4,[R1] ;R4->STARTWOOD32
	;LDR R1,LOG1_LENGTH_L3 
	MOV R6,#90 ;R6->WOOD31 LENGHT
	;LDR R1,=LOG2_LENGTH_L3 
	MOV R7,#90 ;R7->WOOD32 LENGHT

    B CHECKLANE
	

CHECKLANE
	;R2=MIDXBUUNY
	;R3=STARTXPLAMCK1
	;R6=PLANCK1LENGTH
	ADD R10,R2,#18 ;GET BUNNYEND   R1O->BUNNYENDX
	ADD R11,R3,R6  ;ADD PLANCKLENTHG TO PLANCK START TO GET PLANCK END  R11->BPLANCKENDX
	CMP R10,R11    ;COMPARE BUNNYEND WITH PLANCKEND
	BLT STARTCMP1   ;END BUNNY IS < PLANCK
	BEQ RETURNLBL ;BUNNYEND = PLANCKEND SO IT IS ON IT
	BGT CHECKPLANCK2LBL
STARTCMP1
    SUB R12,R2,#18 ;GET BUNNYSTART  R12->BUNNYSTARTX
	CMP R12,R3     ;CMP BUNNYSTART WITH PLANCKSTART
	BGT RETURNLBL  ;DRAW BUNNY WITH WOOD
	BEQ RETURNLBL  ;BUNNYSTART = PLANCKSTART SO IT IS ON IT
	BLT CHECKPLANCK2LBL

  B AYHAGA3 
   LTORG
AYHAGA3

CHECKPLANCK2LBL
  	;R2=MIDXBUUNY
	;R4=STARTXPLAMCK1
	;R7=PLANCK1ACTUALLENGTH
	ADD R10,R2,#18 ;GET BUNNYEND  R1O->BUNNYENDX
	ADD R11,R4,R7  ;ADD PLANCKACTUALLENTHG TO PLANCK START TO GET PLANCK END
	CMP R10,R11    ;COMPARE BUNNYEND WITH PLANCKEND
	BLT START2CMP
	BEQ RETURNLBL ;BUNNYEND = PLANCKEND SO IT IS ON IT
	BGT DEADLBL    ;NOT ON PLANCK1 NOR PLANCK2 SO IT IS DEAD
START2CMP
    SUB R12,R2,#18 ;GET BUNNYSTART  R12->BUNNYSTARTX
	CMP R12,R4     ;CMP BUNNYSTART WITH PLANCKSTART
	BGT RETURNLBL  ;DRAW BUNNY WITH WOOD
	BEQ RETURNLBL  ;BUNNYSTART = PLANCKSTART SO IT IS ON IT
	BLT  DEADLBL   ;NOT ON PLANCK1 NOR PLANCK2 SO IT IS DEAD
	
DEADLBL
    BL DRAW_LOSE2	 

WIN_LVL1_LBL
    BL DRAW_WIN_ANIMATION
	BL delay_half_second
	B LOOP2

RETURNLBL 
  
   BL MOVE_BUNNY_IN_RIVER
	B GAME_LOOP



	
LOOP2	
	BL INITIALIZE_VARIABLES2
	
	

	;FINAL TODO: DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	BL DRAW_RIVER

	


;DRAW THE TOP GREEN RECTANGLE 
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #80
	LDR R10, =GREEN2
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW THE HOUSE
	MOV R0, #210
	MOV R1, #40
	MOV R3, #270
	MOV R4, #70
	LDR R10, =MAGENTA
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #230
	MOV R1, #50
	MOV R3, #250
	MOV R4, #70
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R8, #210
	MOV R9, #38
	LDR R10, =MAGENTA
	BL DRAW_TRIANGLE_FILLED
	
	
	;DRAW TREE IN THE MIDDLE
	MOV R0, #78
	MOV R1, #52
	MOV R3, #82
	MOV R4, #72
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #65
	MOV R1, #32
	MOV R3, #95
	MOV R4, #52
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
    ;DRAW TREE ON THE LEFT
    MOV R0, #43
	MOV R1, #42
	MOV R3, #46
	MOV R4, #62
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #35
	MOV R1, #22
	MOV R3, #55
	MOV R4, #42
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW TREE ON THE RIGHT
	MOV R0, #124
	MOV R1, #37
	MOV R3, #127
	MOV R4, #57
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #115
	MOV R1, #17
	MOV R3, #135
	MOV R4, #37
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
	
	MOV R11, #200
	MOV R12, #183
	BL Draw_Bunny
	
GAME_LOOP2
   BL REINITIALIZE_SPEED
   ;BL TRACK_BUNNY
   MOV R0,#2

   BL DRAW_LANE1_MOVING
   BL DRAW_LANE2_MOVING
   BL DRAW_LANE3_MOVING
   BL DRAW_LANE4_MOVING
   BL DRAW_LANE5_MOVING
   
   BL CHECK_INPUT_LEVEL2
   BL delay_10_milli_second
   BL delay_10_milli_second
   BL delay_10_milli_second
   BL delay_10_milli_second
   BL delay_10_milli_second
   BL delay_10_milli_second
   
   B AYHAGA32
   LTORG
AYHAGA32
   
   LDR R1,=JUMPFRD
   LDRH R0,[R1]
   
   B AYHAGA133
   LTORG
AYHAGA133
;CHECKPLANCKSLVL1     
	CMP R0,#3
	BEQ LBLCHECK_LANE25
	;BEQ WIN_LVL1_LBL
	CMP R0,#4
	BEQ LBLCHECK_LANE24
	CMP R0,#5
	BEQ LBLCHECK_LANE23
	CMP R0,#6
	BEQ LBLCHECK_LANE22
	CMP R0,#7
	BEQ LBLCHECK_LANE21
	CMP R0,#8
	BEQ WIN_LVL2_LBL
	
	B RETURNLBL2
	
LBLCHECK_LANE21
    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L1
	LDRH R3,[R1] ;R3->STARTWOOD11
	LDR R1,=STARTING_X_LOG2_L1 
	LDRH R4,[R1] ;R4->STARTWOOD12
	;LDR R1,=LOG1_LENGTH_L1 
    MOV R6,#100 ;R6->WOOD11 LENGHT
	;LDR R1,=LOG2_LENGTH_L1 
	MOV R7,#100 ;R7->WOOD12  LENGHT
	
	
    B CHECKLANElvl2
	
	
LBLCHECK_LANE22

    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L2
	LDRH R3,[R1] ;R3->STARTWOOD21
	LDR R1,=STARTING_X_LOG2_L2
	LDRH R4,[R1] ;R4->STARTWOOD22
	;LDR R1,=LOG1_LENGTH_L2 
	MOV R6,#100 ;R6->WOOD21 LENGHT
	;LDR R1,=LOG2_LENGTH_L2 
	MOV R7,#100 ;R7->WOOD22 LENGHT
	
    B CHECKLANElvl2
	
	
LBLCHECK_LANE23

    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L3
	LDRH R3,[R1] ;R3->STARTWOOD31
	LDR R1,=STARTING_X_LOG2_L3
	LDRH R4,[R1] ;R4->STARTWOOD32
	;LDR R1,LOG1_LENGTH_L3 
	MOV R6,#90 ;R6->WOOD31 LENGHT
	;LDR R1,=LOG2_LENGTH_L3 
	MOV R7,#90 ;R7->WOOD32 LENGHT

    B CHECKLANElvl2
	
LBLCHECK_LANE24

    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L4
	LDRH R3,[R1] ;R3->STARTWOOD31
	LDR R1,=STARTING_X_LOG2_L4
	LDRH R4,[R1] ;R4->STARTWOOD32
	;LDR R1,LOG1_LENGTH_L3 
	MOV R6,#120 ;R6->WOOD31 LENGHT
	;LDR R1,=LOG2_LENGTH_L3 
	MOV R7,#120 ;R7->WOOD32 LENGHT

    B CHECKLANElvl2
	
LBLCHECK_LANE25

    LDR R1,=BUNNY_X
    LDRH R2,[R1] ;R2->XBUNNY
	LDR R1,=STARTING_X_LOG1_L5
	LDRH R3,[R1] ;R3->STARTWOOD31
	LDR R1,=STARTING_X_LOG2_L5
	LDRH R4,[R1] ;R4->STARTWOOD32
	;LDR R1,LOG1_LENGTH_L3 
	MOV R6,#100 ;R6->WOOD31 LENGHT
	;LDR R1,=LOG2_LENGTH_L3 
	MOV R7,#100 ;R7->WOOD32 LENGHT

    B CHECKLANElvl2
	

CHECKLANElvl2
	;R2=MIDXBUUNY
	;R3=STARTXPLAMCK1
	;R6=PLANCK1LENGTH
	ADD R10,R2,#18 ;GET BUNNYEND   R1O->BUNNYENDX
	ADD R11,R3,R6  ;ADD PLANCKLENTHG TO PLANCK START TO GET PLANCK END  R11->BPLANCKENDX
	CMP R10,R11    ;COMPARE BUNNYEND WITH PLANCKEND
	BLT STARTCMP21   ;END BUNNY IS < PLANCK
	BEQ RETURNLBL2 ;BUNNYEND = PLANCKEND SO IT IS ON IT
	BGT CHECKPLANCK2LBL2
STARTCMP21
    SUB R12,R2,#18 ;GET BUNNYSTART  R12->BUNNYSTARTX
	CMP R12,R3     ;CMP BUNNYSTART WITH PLANCKSTART
	BGT RETURNLBL2  ;DRAW BUNNY WITH WOOD
	BEQ RETURNLBL2  ;BUNNYSTART = PLANCKSTART SO IT IS ON IT
	BLT CHECKPLANCK2LBL2

  B AYHAGA33 
   LTORG
AYHAGA33

CHECKPLANCK2LBL2
  	;R2=MIDXBUUNY
	;R4=STARTXPLAMCK1
	;R7=PLANCK1ACTUALLENGTH
	ADD R10,R2,#24 ;GET BUNNYEND  R1O->BUNNYENDX
	ADD R11,R4,R7  ;ADD PLANCKACTUALLENTHG TO PLANCK START TO GET PLANCK END
	CMP R10,R11    ;COMPARE BUNNYEND WITH PLANCKEND
	BLT START22CMP
	BEQ RETURNLBL2 ;BUNNYEND = PLANCKEND SO IT IS ON IT
	BGT DEADLBL2    ;NOT ON PLANCK1 NOR PLANCK2 SO IT IS DEAD
START22CMP
    SUB R12,R2,#24 ;GET BUNNYSTART  R12->BUNNYSTARTX
	CMP R12,R4     ;CMP BUNNYSTART WITH PLANCKSTART
	BGT RETURNLBL2  ;DRAW BUNNY WITH WOOD
	BEQ RETURNLBL2 ;BUNNYSTART = PLANCKSTART SO IT IS ON IT
	BLT  DEADLBL2   ;NOT ON PLANCK1 NOR PLANCK2 SO IT IS DEAD
	
DEADLBL2
    BL DRAW_LOSE2	 

WIN_LVL2_LBL
    BL DRAW_WIN_ANIMATION2
	BL delay_half_second
	;B MAIN_MENU

RETURNLBL2   
  
  BL MOVE_BUNNY_IN_RIVER_LEVEL2
	B GAME_LOOP2
	POP {R0-R12,PC}
	ENDFUNC
	
REINITIALIZE_SPEED FUNCTION
	PUSH{R0-R12,LR}
	
    LDR R0,=SPEED_L1 
    MOV R1,#0X0A
	STRH R1,[R0]
	LDR R0,=SPEED_L2 
    MOV R1,#0X0F
	STRH R1,[R0]
	LDR R0,=SPEED_L3
    MOV R1,#0X0A
	STRH R1,[R0]
	LDR R0,=SPEED_L4 
    MOV R1,#0X0F
	STRH R1,[R0]
	LDR R0,=SPEED_L5 
    MOV R1,#0X0A
	STRH R1,[R0]
    
	POP{R0-R12,PC}
    ENDFUNC
TRACK_BUNNY FUNCTION   ;MAKE THE RIVER FASTER WHERE THE BUNNY IS
	PUSH{R0-R12,LR}
	LDR R1,=LEVEL
	LDRH R2, [R1]
	CMP R2,#0
	BEQ L1
	B   L2
L1	
	LDR R3,=JUMPFRD
	LDRH R4, [R3]
	CMP R4,#2
	BEQ L1LANE1
    CMP R4,#3
	BEQ L1LANE2
	CMP R4,#4
	BEQ L1LANE3
L1LANE1
    LDR R5,=SPEED_L3
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]
L1LANE2
    LDR R5,=SPEED_L2
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]	
L1LANE3
    LDR R5,=SPEED_L1
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5] 
L2
    LDR R3,=JUMPFRD
	LDRH R4, [R3]
	CMP R4,#3
	BEQ L2LANE1
    CMP R4,#4
	BEQ L2LANE2
	CMP R4,#5
	BEQ L2LANE3
	CMP R4,#6
	BEQ L2LANE4
	CMP R4,#7
	BEQ L2LANE5
L2LANE1
    LDR R5,=SPEED_L5 
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]
L2LANE2
    LDR R5,=SPEED_L4
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]	
L2LANE3
    LDR R5,=SPEED_L3
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]
L2LANE4
    LDR R5,=SPEED_L2
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]	
L2LANE5
    LDR R5,=SPEED_L1
	LDRH R6,[R5]
	ADD R6,R6,#7
	STRH R6,[R5]
	
	POP{R0-R12,PC}
	ENDFUNC	
	
 B SKKIP
  LTORG
SKKIP

ZEROJUMP_LEVEL2 FUNCTION     ;//FIRST TIME TO JUMP OR MOVE LEFT AND RIGHT IN THE YELLOW GROUND
	PUSH{R0-R12,LR}
	
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	ENDFUNC	
	
FIRSTJUMP_LEVEL2 FUNCTION    ;//SECOND TIME TO JUMP
	PUSH{R0-R12,LR}
	
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #0
	MOV R1, #159
	MOV R3, #320
	MOV R4, #180
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	BL DRAW_LANE1_MOVING
	
	POP{R0-R12,PC}
	ENDFUNC		
SECONDJUMP_LEVEL2 FUNCTION   ; //THIRD TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #138
	MOV R3, #320
	MOV R4, #180
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	BL DRAW_LANE3_MOVING
	BL DRAW_LANE4_MOVING
	BL DRAW_LANE5_MOVING
	 
	POP{R0-R12,PC}
	ENDFUNC	 
	
THIRDJUMP_LEVEL2 FUNCTION    ;//FOURTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #101
	MOV R3, #320
	MOV R4, #179
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	BL DRAW_LANE5_MOVING
	BL DRAW_LANE2_MOVING
	BL DRAW_LANE3_MOVING
	BL DRAW_LANE4_MOVING
	 
	
	POP{R0-R12,PC}
	ENDFUNC	
FOURTHJUMP_LEVEL2 FUNCTION    ;//FIFTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #80
	MOV R3, #320
	MOV R4, #159
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	BL DRAW_LANE2_MOVING
	BL DRAW_LANE3_MOVING 
	BL DRAW_LANE4_MOVING
	BL DRAW_LANE1_MOVING
	
	 
	
	POP{R0-R12,PC}
	ENDFUNC	
FIFTHJUMP_LEVEL2 FUNCTION    ;//FIFTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #80
	MOV R3, #320
	MOV R4, #139
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	
	BL DRAW_LANE3_MOVING
	BL DRAW_LANE2_MOVING
	BL DRAW_LANE1_MOVING
	
	;//DRAW HOME
	;DRAW THE TOP GREEN RECTANGLE 
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #80
	LDR R10, =GREEN2
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW THE HOUSE
	MOV R0, #210
	MOV R1, #40
	MOV R3, #270
	MOV R4, #70
	LDR R10, =MAGENTA
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #230
	MOV R1, #50
	MOV R3, #250
	MOV R4, #70
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R8, #210
	MOV R9, #38
	LDR R10, =MAGENTA
	BL DRAW_TRIANGLE_FILLED
	
	
	;DRAW TREE IN THE MIDDLE
	MOV R0, #78
	MOV R1, #52
	MOV R3, #82
	MOV R4, #72
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #65
	MOV R1, #32
	MOV R3, #95
	MOV R4, #52
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
    ;DRAW TREE ON THE LEFT
    MOV R0, #43
	MOV R1, #42
	MOV R3, #46
	MOV R4, #62
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #35
	MOV R1, #22
	MOV R3, #55
	MOV R4, #42
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW TREE ON THE RIGHT
	MOV R0, #124
	MOV R1, #37
	MOV R3, #127
	MOV R4, #57
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #115
	MOV R1, #17
	MOV R3, #135
	MOV R4, #37
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	ENDFUNC	
	
SIXTHJUMP_LEVEL2 FUNCTION    ;//FIFTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #80
	MOV R3, #320
	MOV R4, #119
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	BL DRAW_LANE2_MOVING
	BL DRAW_LANE1_MOVING
	
	;//DRAW HOME
	;DRAW THE TOP GREEN RECTANGLE 
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #80
	LDR R10, =GREEN2
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW THE HOUSE
	MOV R0, #210
	MOV R1, #40
	MOV R3, #270
	MOV R4, #70
	LDR R10, =MAGENTA
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #230
	MOV R1, #50
	MOV R3, #250
	MOV R4, #70
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R8, #210
	MOV R9, #38
	LDR R10, =MAGENTA
	BL DRAW_TRIANGLE_FILLED
	
	
	;DRAW TREE IN THE MIDDLE
	MOV R0, #78
	MOV R1, #52
	MOV R3, #82
	MOV R4, #72
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #65
	MOV R1, #32
	MOV R3, #95
	MOV R4, #52
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
    ;DRAW TREE ON THE LEFT
    MOV R0, #43
	MOV R1, #42
	MOV R3, #46
	MOV R4, #62
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #35
	MOV R1, #22
	MOV R3, #55
	MOV R4, #42
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW TREE ON THE RIGHT
	MOV R0, #124
	MOV R1, #37
	MOV R3, #127
	MOV R4, #57
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #115
	MOV R1, #17
	MOV R3, #135
	MOV R4, #37
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	ENDFUNC	
SEVENTHJUMP_LEVEL2 FUNCTION    ;//FIFTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #80
	MOV R3, #320
	MOV R4, #99
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#2
	 
	BL DRAW_LANE5_MOVING
	
	;//DRAW HOME
	;DRAW THE TOP GREEN RECTANGLE 
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #80
	LDR R10, =GREEN2
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW THE HOUSE
	MOV R0, #210
	MOV R1, #40
	MOV R3, #270
	MOV R4, #70
	LDR R10, =MAGENTA
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #230
	MOV R1, #50
	MOV R3, #250
	MOV R4, #70
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R8, #210
	MOV R9, #38
	LDR R10, =MAGENTA
	BL DRAW_TRIANGLE_FILLED
	
	
	;DRAW TREE IN THE MIDDLE
	MOV R0, #78
	MOV R1, #52
	MOV R3, #82
	MOV R4, #72
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #65
	MOV R1, #32
	MOV R3, #95
	MOV R4, #52
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
    ;DRAW TREE ON THE LEFT
    MOV R0, #43
	MOV R1, #42
	MOV R3, #46
	MOV R4, #62
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #35
	MOV R1, #22
	MOV R3, #55
	MOV R4, #42
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW TREE ON THE RIGHT
	MOV R0, #124
	MOV R1, #37
	MOV R3, #127
	MOV R4, #57
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #115
	MOV R1, #17
	MOV R3, #135
	MOV R4, #37
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	ENDFUNC	
WIN2 FUNCTION          ;JUMP 8
	PUSH{R0-R12,LR}
	;WIN_LEVEL 2
	POP{R0-R12,PC}
	ENDFUNC		
 
	
	
CHECK_INPUT_LEVEL2	FUNCTION
	PUSH{R0-R12,LR}
	
	 ldr r12,=GPIOB_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #4
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_LEFT_LABEL2
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #5
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_DOWN_LABEL2
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #7
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_RIGHT_LABEL2
	 ldr r12,=GPIOC_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #15
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_UP_LABEL2
    
Draw_Static_Bunny2
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
     B ENDCHECK
MOVE_BUNNY_LEFT_LABEL2
  BL MOVE_BUNNY_LEFT_LEVEL2
  B ENDCHECK2 

MOVE_BUNNY_RIGHT_LABEL2
  BL MOVE_BUNNY_RIGHT_LEVEL2
  B ENDCHECK2 

MOVE_BUNNY_UP_LABEL2
  BL MOVE_BUNNY_UP_LEVEL2
  B ENDCHECK2 

MOVE_BUNNY_DOWN_LABEL2
  BL MOVE_BUNNY_DOWN_LEVEL2
  B ENDCHECK2 

   
ENDCHECK2 
	POP{R0-R12,PC}
	ENDFUNC
CHECK_INPUT	FUNCTION
	PUSH{R0-R12,LR}
	
	 ldr r12,=GPIOB_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #4
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_LEFT_LABEL
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #5
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_DOWN_LABEL
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #7
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_RIGHT_LABEL
	 ldr r12,=GPIOC_IDR
	 ldr r11,[r12]
	 MOV R2, #1
	 LSL R2, #15
	 AND r11,r11, R2
	 CMP R11, #0
     BEQ MOVE_BUNNY_UP_LABEL
 B SKIPPCH 
   LTORG
SKIPPCH  
Draw_Static_Bunny
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
     B ENDCHECK
MOVE_BUNNY_LEFT_LABEL
  BL MOVE_BUNNY_LEFT
  B ENDCHECK 

MOVE_BUNNY_RIGHT_LABEL
  BL MOVE_BUNNY_RIGHT
  B ENDCHECK 

MOVE_BUNNY_UP_LABEL
  BL MOVE_BUNNY_UP
  B ENDCHECK 

MOVE_BUNNY_DOWN_LABEL
  BL MOVE_BUNNY_DOWN
  B ENDCHECK 

 B SKIPPCH2 
   LTORG
SKIPPCH2 
ENDCHECK 
	POP{R0-R12,PC}
	ENDFUNC
	
MOVE_BUNNY_IN_RIVER_LEVEL2 FUNCTION
 
    PUSH{R0-R12,LR}
	
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	 
	CMP R11,#3
	BEQ FIRSTLANE1R2
	CMP R11,#4
	BEQ SECONDLANE1L2
	CMP R11,#5
	BEQ THIRDLANE1R2
	CMP R11,#6
	BEQ FOURTHLANE1L2
	CMP R11,#7
	BEQ FIFTHLANE1R2
    B END_MOVE_RIVER_FUNC

 
FIRSTLANE1R2
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L5
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
	BGT LOSE_END2
  
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL THIRDJUMP_LEVEL2
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC
 
	
SECONDLANE1L2
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L4 
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
  	BGT LOSE_END2
    
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL FOURTHJUMP_LEVEL2
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC 

THIRDLANE1R2
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L3 
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
	BGT LOSE_END2
  
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL FIFTHJUMP_LEVEL2
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC
 
FOURTHLANE1L2
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L2
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
  	BGT LOSE_END2
    
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL SIXTHJUMP_LEVEL2
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC 
	
FIFTHLANE1R2
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L1
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
	BGT LOSE_END2
  
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL SEVENTHJUMP_LEVEL2
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC
	
LOSE_END2
    BL delay_10_milli_second
    BL DRAW_LOSE2 

END_MOVE_RIVER_FUNC
	 POP{R0-R12,PC}
    ENDFUNC

MOVE_BUNNY_IN_RIVER FUNCTION
 
    PUSH{R0-R12,LR}
	
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	 
	CMP R11,#2
	BEQ FIRSTLANE1R
	CMP R11,#3
	BEQ SECONDLANE1L
	CMP R11,#4
	BEQ THIRDLANE1R
    B END_MOVE_RIVER_FUNC1

 
FIRSTLANE1R
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L3 
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
	BGT LOSE_END
  
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL SECONDJUMP
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC1
	

	
SECONDLANE1L
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L2 
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
  	BGT LOSE_END
    
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL THIRDJUMP
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC1
 
THIRDLANE1R
    ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	LDR R4,=SPEED_L1
	LDRH R6,[R4]
	ADD r0,r0,R6
	cmp r0,#320
	BGT LOSE_END
 B SKIPPEDMR2
   LTORG
SKIPPEDMR2
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	BL FOURTHJUMP
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r7,=BUNNY_Y
	ldrh r12,[r7]
	ADD r11,r0,R6
	STRH R11,[R5]
	bl Draw_Bunny
    B END_MOVE_RIVER_FUNC1
 B SKIPPEDMR
   LTORG
SKIPPEDMR 
 
	
LOSE_END
    BL delay_10_milli_second
    BL DRAW_LOSE2	 

END_MOVE_RIVER_FUNC1
	 POP{R0-R12,PC}
    ENDFUNC
	

DRAW_WIN_ANIMATION2 FUNCTION
	PUSH{R0-R12,LR}
	
	
	MOV R0, #0                    ;WHITE BACKGROUND
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
;R10 COLOR OF win word
;R0-->X1, R3-->X2   ,R2-->Y1,  R4-->Y2
;;W CHARACTER BASE
    MOV R0,#100
	ADD R3,R0,#36
	MOV R1,#115
	ADD R4,R1,#5
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;FIRST CLOUMN
    ADD R3,R0,#6
	MOV R4,R1
	SUB R1,R1,#25
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;SECOND COLUMN
    ADD R0,R0,#15
    ADD R3,R3,#15	
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;THIRD COLUMN
    ADD R0,R0,#15
    ADD R3,R3,#15
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;;DRAW SECOND CHARACTER
;; DRAW I HEAD
    ADD R0,R0,#16
	ADD R3,R3,#16
	ADD R4,R1,#6
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; I BODY 
    ADD R1,R4,#4   
	ADD R4,R1,#20  
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; FIRST COLUMN
    ADD R0,R0,#16   ;X1
	ADD R3,R0,#6    ;X2
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; N UPPER HEAD   NO CHANGE IN X0
	ADD R3,R0,#20   ;WIDTH OF FIRST HEAD 
	MOV R4,R1
   	SUB R1,R1,#7
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
;; 	SECOND COLUMN
    MOV R1,R4
	ADD R4,R1,#15  
    ADD R0,R0,#15
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED   
;; LOWER HEAD
    ADD R3,R3,#15
	MOV R1,R4
	ADD R4,R1,#5
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED   
;; LAST COLUMN
    ADD R0,R0,#15   ; X1    NO CHANGE IN X2 
    ;MOV R4,R1   
	SUB R1,R1,#22  ;LENGHT OF COLUMN
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED   
	POP{R0-R12,PC}
	ENDFUNC	
	
DRAW_LOSE2 FUNCTION
    PUSH{R0-R12,LR}
	
	MOV R0, #0                    ;WHITE BACKGROUND
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #95                    ;L
	MOV R1, #90
	MOV R3, #101
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	B SKIPPEDRBLOSE
   LTORG
SKIPPEDRBLOSE
	
	MOV R0, #95
	MOV R1, #114
	MOV R3, #131
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #141                   ;O
	MOV R1, #90
	MOV R3, #177
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #147                   
	MOV R1, #96
	MOV R3, #171
	MOV R4, #114
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                 ;S
	MOV R1, #90
	MOV R3, #219
	MOV R4, #96
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                    ;S
	MOV R1, #103
	MOV R3, #219
	MOV R4, #109
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                    ;S
	MOV R1, #114
	MOV R3, #219
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #183                 ;S VIRTICAL
	MOV R1, #90
	MOV R3, #189
	MOV R4, #104
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #213                 ;S VIRTICAL
	MOV R1, #109
	MOV R3, #219
	MOV R4, #115
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                  ;I IN E
	MOV R1, #90
	MOV R3, #231
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                ;- IN E
	MOV R1, #90
	MOV R3, #261
	MOV R4, #96
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                   ;E
	MOV R1, #103
	MOV R3, #261
	MOV R4, #109
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #225                   ;S
	MOV R1, #114
	MOV R3, #261
	MOV R4, #120
	LDR R10, =RED
	BL DRAW_RECTANGLE_FILLED
	
	BL delay_half_second
	BL START_GAME
	
    POP{R0-R12,PC}
    ENDFUNC
	
ZEROJUMP FUNCTION     ;//FIRST TIME TO JUMP OR MOVE LEFT AND RIGHT IN THE YELLOW GROUND
	PUSH{R0-R12,LR}
	
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	ENDFUNC	
	
FIRSTJUMP FUNCTION    ;//SECOND TIME TO JUMP
	PUSH{R0-R12,LR}
	
	MOV R0, #0
	MOV R1, #180
	MOV R3, #320
	MOV R4, #240
	LDR R10, =YELLOW
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #0
	MOV R1, #147
	MOV R3, #320
	MOV R4, #180
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#1
	BL DRAW_LANE5_MOVING
	
	POP{R0-R12,PC}
	ENDFUNC		
SECONDJUMP FUNCTION   ; //THIRD TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #114
	MOV R3, #320
	MOV R4, #180
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#1
	BL DRAW_LANE5_MOVING
   
  
	BL DRAW_LANE2_MOVING
	
	POP{R0-R12,PC}
	ENDFUNC	 
	
THIRDJUMP FUNCTION    ;//FOURTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #80
	MOV R3, #320
	MOV R4, #147
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#1
	BL DRAW_LANE4_MOVING
	 
	BL DRAW_LANE3_MOVING
	
	POP{R0-R12,PC}
	ENDFUNC	
	
FOURTHJUMP FUNCTION    ;//FIFTH TIME TO JUMP
	PUSH{R0-R12,LR}
	MOV R0, #0
	MOV R1, #80
	MOV R3, #320
	MOV R4, #113
	LDR R10, =CYAN
	BL DRAW_RECTANGLE_FILLED
	mov r0,#1
	BL DRAW_LANE3_MOVING
	
	;//DRAW HOME
	;DRAW THE TOP GREEN RECTANGLE 
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #80
	LDR R10, =GREEN2
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW THE HOUSE
	MOV R0, #210
	MOV R1, #40
	MOV R3, #270
	MOV R4, #70
	LDR R10, =MAGENTA
	BL DRAW_RECTANGLE_FILLED
	
	MOV R0, #230
	MOV R1, #50
	MOV R3, #250
	MOV R4, #70
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	MOV R8, #210
	MOV R9, #38
	LDR R10, =MAGENTA
	BL DRAW_TRIANGLE_FILLED
	
	
	;DRAW TREE IN THE MIDDLE
	MOV R0, #78
	MOV R1, #52
	MOV R3, #82
	MOV R4, #72
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #65
	MOV R1, #32
	MOV R3, #95
	MOV R4, #52
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
    ;DRAW TREE ON THE LEFT
    MOV R0, #43
	MOV R1, #42
	MOV R3, #46
	MOV R4, #62
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #35
	MOV R1, #22
	MOV R3, #55
	MOV R4, #42
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	;DRAW TREE ON THE RIGHT
	MOV R0, #124
	MOV R1, #37
	MOV R3, #127
	MOV R4, #57
	LDR R10, =BROWN
	BL DRAW_RECTANGLE_FILLED
	MOV R0, #115
	MOV R1, #17
	MOV R3, #135
	MOV R4, #37
	LDR R10, =GREEN
	BL DRAW_RECTANGLE_FILLED
	
	POP{R0-R12,PC}
	ENDFUNC		
	
WINJUMP FUNCTION
	PUSH{R0-R12,LR}
	;WIN
	POP{R0-R12,PC}
	ENDFUNC	
MOVE_BUNNY_DOWN	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
 B SKIPBUNNYDOWN
  LTORG
SKIPBUNNYDOWN  
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	ADD R0,R0,#54    ;//SUB HALF WIDTH
	ADD r0,r0,#33
	cmp r0,#240
	BGT DRAWSBD
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPLD
	CMP R11,#1
	BEQ FIRSTJUMPLD
	CMP R11,#2
	BEQ SECONDJUMPLD
	CMP R11,#3
	BEQ THIRDJUMPLD
	CMP R11,#4
	BEQ FOURTHJUMPLD
	CMP R11,#5
	BEQ WINJUMPLD
	
	
ZEROJUMPLD
  BL ZEROJUMP
  B DRAW_BUNNY_AFTER_CMPD
FIRSTJUMPLD
  BL FIRSTJUMP
  B DRAW_BUNNY_AFTER_CMPD
SECONDJUMPLD
   BL SECONDJUMP
   B DRAW_BUNNY_AFTER_CMPD
THIRDJUMPLD
   BL THIRDJUMP
   B DRAW_BUNNY_AFTER_CMPD
FOURTHJUMPLD
   BL FOURTHJUMP
   B DRAW_BUNNY_AFTER_CMPD
WINJUMPLD
   BL WINJUMP

   
DRAW_BUNNY_AFTER_CMPD
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	
   LDR R7,=JUMPFRD
   LDRH R8, [R7]
   SUB R8,R8,#1
   STRH R8, [R7]
 B SKIPBUNNYDOWN2
  LTORG
SKIPBUNNYDOWN2  
	
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	ldr r6,=BUNNY_X
	ldrh r11,[r6]
	ADD r12,r0,#33
	STRH R12,[R5]
	bl Draw_Bunny
	B ENDDOWNFUNCTION
DRAWSBD
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      
ENDDOWNFUNCTION
	POP{R0-R12,PC}
	ENDFUNC	

MOVE_BUNNY_DOWN_LEVEL2	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	ADD R0,R0,#54    ;//SUB HALF WIDTH
	ADD r0,r0,#22
	cmp r0,#240
	BGT DRAWSBD2
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPDL_LEVEL2
	CMP R11,#1
	BEQ FIRSTJUMPDL_LEVEL2
	CMP R11,#2
	BEQ SECONDJUMPDL_LEVEL2
	CMP R11,#3
	BEQ THIRDJUMPDL_LEVEL2
	CMP R11,#4
	BEQ FOURTHJUMPDL_LEVEL2
	CMP R11,#5
	BEQ FIFTHJUMPDL_LEVEL2
	CMP R11,#6
	BEQ SIXTHJUMPDL_LEVEL2
	CMP R11,#7
	BEQ SEVENTHDJUMP_LEVEL2
	CMP R11,#8
	BEQ WIND_LEVEL2
	
	
ZEROJUMPDL_LEVEL2
  BL ZEROJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPD2
FIRSTJUMPDL_LEVEL2
  BL FIRSTJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPD2
SECONDJUMPDL_LEVEL2
   BL SECONDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPD2
THIRDJUMPDL_LEVEL2
   BL THIRDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPD2
FOURTHJUMPDL_LEVEL2
   BL FOURTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPD2
FIFTHJUMPDL_LEVEL2
   BL FIFTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPD2
SIXTHJUMPDL_LEVEL2
   BL SIXTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPD2
SEVENTHDJUMP_LEVEL2
   BL SEVENTHDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPD2
WIND_LEVEL2
   BL WIN2

   
DRAW_BUNNY_AFTER_CMPD2
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	
   LDR R7,=JUMPFRD
   LDRH R8, [R7]
   SUB R8,R8,#1
   STRH R8, [R7]
   
	
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	ldr r6,=BUNNY_X
	ldrh r11,[r6]
	ADD r12,r0,#22
	STRH R12,[R5]
	bl Draw_Bunny
	B ENDDOWNFUNCTION2
DRAWSBD2
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      
ENDDOWNFUNCTION2
	POP{R0-R12,PC}
	ENDFUNC	

MOVE_BUNNY_UP	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	   
	sub r0,r0,#33
	cmp r0,#0
	BLT DRAWSBU
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPLU
	CMP R11,#1
	BEQ FIRSTJUMPLU
	CMP R11,#2
	BEQ SECONDJUMPLU
	CMP R11,#3
	BEQ THIRDJUMPLU
	CMP R11,#4
	BEQ FOURTHJUMPLU
	CMP R11,#5
	BEQ WINJUMPLU
	
	
ZEROJUMPLU
  BL ZEROJUMP
  B DRAW_BUNNY_AFTER_CMPU
FIRSTJUMPLU
  BL FIRSTJUMP
  B DRAW_BUNNY_AFTER_CMPU
SECONDJUMPLU
   BL SECONDJUMP
   B DRAW_BUNNY_AFTER_CMPU
THIRDJUMPLU
   BL THIRDJUMP
   B DRAW_BUNNY_AFTER_CMPU
FOURTHJUMPLU
   BL FOURTHJUMP
   B DRAW_BUNNY_AFTER_CMPU
WINJUMPLU
   BL WINJUMP
   
   
 
DRAW_BUNNY_AFTER_CMPU
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	
	
   LDR R7,=JUMPFRD
   LDRH R8, [R7]
   ADD R8,R8,#1
   STRH R8, [R7]
   
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	ldr r6,=BUNNY_X
	ldrh r11,[r6]
	SUB r12,r0,#33
	STRH R12,[R5]
	bl Draw_Bunny
	B ENDUPFUNCTION 
DRAWSBU
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      
	
ENDUPFUNCTION
	POP{R0-R12,PC}
	ENDFUNC	
	
MOVE_BUNNY_UP_LEVEL2	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	   
	sub r0,r0,#22
	cmp r0,#0
	BLT DRAWSBU2
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPUL_LEVEL2
	CMP R11,#1
	BEQ FIRSTJUMPUL_LEVEL2
	CMP R11,#2
	BEQ SECONDJUMPUL_LEVEL2
	CMP R11,#3
	BEQ THIRDJUMPUL_LEVEL2
	CMP R11,#4
	BEQ FOURTHJUMPUL_LEVEL2
	CMP R11,#5
	BEQ FIFTHJUMPUL_LEVEL2
	CMP R11,#6
	BEQ SIXTHJUMPUL_LEVEL2
	CMP R11,#7
	BEQ SEVENTHUJUMPUL_LEVEL2
	CMP R11,#8
	BEQ WINU_LEVEL2
	
ZEROJUMPUL_LEVEL2
  BL ZEROJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPU2
FIRSTJUMPUL_LEVEL2
  BL FIRSTJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPU2
SECONDJUMPUL_LEVEL2
   BL SECONDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPU2
THIRDJUMPUL_LEVEL2
   BL THIRDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPU2
FOURTHJUMPUL_LEVEL2
   BL FOURTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPU2
FIFTHJUMPUL_LEVEL2
   BL FIFTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPU2
SIXTHJUMPUL_LEVEL2
   BL SIXTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPU2
SEVENTHUJUMPUL_LEVEL2
   BL SEVENTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPU2
WINU_LEVEL2
   BL WIN2
   
   
 
DRAW_BUNNY_AFTER_CMPU2
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	
	
   LDR R7,=JUMPFRD
   LDRH R8, [R7]
   ADD R8,R8,#1
   STRH R8, [R7]
   
	ldr r5,=BUNNY_Y
	ldrh r0,[r5]
	ldr r6,=BUNNY_X
	ldrh r11,[r6]
	SUB r12,r0,#22
	STRH R12,[R5]
	bl Draw_Bunny
	B ENDUPFUNCTION2 
DRAWSBU2
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      
	
ENDUPFUNCTION2
	POP{R0-R12,PC}
	ENDFUNC	

MOVE_BUNNY_LEFT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	SUB R0,R0,#24    ;//SUB HALF WIDTH
	sub r0,r0,#15
	cmp r0,#0
	BLT DRAWSBL
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPL
	CMP R11,#1
	BEQ FIRSTJUMPL
	CMP R11,#2
	BEQ SECONDJUMPL
	CMP R11,#3
	BEQ THIRDJUMPL
	CMP R11,#4
	BEQ FOURTHJUMPL
	CMP R11,#5
	BEQ WINJUMPL
	
	
ZEROJUMPL
  BL ZEROJUMP
  B DRAW_BUNNY_AFTER_CMP
FIRSTJUMPL
  BL FIRSTJUMP
  B DRAW_BUNNY_AFTER_CMP
SECONDJUMPL
   BL SECONDJUMP
   B DRAW_BUNNY_AFTER_CMP
THIRDJUMPL
   BL THIRDJUMP
   B DRAW_BUNNY_AFTER_CMP
FOURTHJUMPL
   BL FOURTHJUMP
   B DRAW_BUNNY_AFTER_CMP
WINJUMPL
   BL WINJUMP
   
DRAW_BUNNY_AFTER_CMP
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r6,=BUNNY_Y
	ldrh r12,[r6]
	SUB r11,r0,#15
	STRH R11,[R5]
	bl Draw_Bunny
	B ENDLEFTFUNCTION  
	
	
DRAWSBL
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      	

	
ENDLEFTFUNCTION
	POP{R0-R12,PC}
	ENDFUNC	
	
	
  B YARAB
   LTORG
YARAB

MOVE_BUNNY_LEFT_LEVEL2	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	SUB R0,R0,#24    ;//SUB HALF WIDTH
	sub r0,r0,#15
	cmp r0,#0
	BLT DRAWSBL2
	
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPL_LEVEL2
	CMP R11,#1
	BEQ FIRSTJUMPL_LEVEL2
	CMP R11,#2
	BEQ SECONDJUMPL_LEVEL2
	CMP R11,#3
	BEQ THIRDJUMPL_LEVEL2
	CMP R11,#4
	BEQ FOURTHJUMPL_LEVEL2
	CMP R11,#5
	BEQ FIFTHJUMPL_LEVEL2
	CMP R11,#6
	BEQ SIXTHJUMPL_LEVEL2
	CMP R11,#7
	BEQ SEVENTHLJUMPL_LEVEL2
	CMP R11,#8
	BEQ WIN_LEVEL2
	
ZEROJUMPL_LEVEL2
  BL ZEROJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPL2
FIRSTJUMPL_LEVEL2
  BL FIRSTJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPL2
SECONDJUMPL_LEVEL2
   BL SECONDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPL2
THIRDJUMPL_LEVEL2
   BL THIRDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPL2
FOURTHJUMPL_LEVEL2
   BL FOURTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPL2
FIFTHJUMPL_LEVEL2
   BL FIFTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPL2
SIXTHJUMPL_LEVEL2
   BL SIXTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPL2
SEVENTHLJUMPL_LEVEL2
   BL SEVENTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPL2
WIN_LEVEL2
   BL WIN2
   
   
DRAW_BUNNY_AFTER_CMPL2
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
	
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r6,=BUNNY_Y
	ldrh r12,[r6]
	SUB r11,r0,#15
	STRH R11,[R5]
	bl Draw_Bunny
	B ENDLEFTFUNCTION2  
	
	
DRAWSBL2
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      

	
ENDLEFTFUNCTION2
	POP{R0-R12,PC}
	ENDFUNC	

 


MOVE_BUNNY_RIGHT	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	ADD r0,r0,#15
	cmp r0,#320
	BGT DRAWSBR
 B SKIPPEDRB
   LTORG
SKIPPEDRB  
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPLR
	CMP R11,#1
	BEQ FIRSTJUMPLR
	CMP R11,#2
	BEQ SECONDJUMPLR
	CMP R11,#3
	BEQ THIRDJUMPLR
	CMP R11,#4
	BEQ FOURTHJUMPLR
	CMP R11,#5
	BEQ WINJUMPLR

ZEROJUMPLR
  BL ZEROJUMP
  B DRAW_BUNNY_AFTER_CMPR
FIRSTJUMPLR
  BL FIRSTJUMP
  B DRAW_BUNNY_AFTER_CMPR
SECONDJUMPLR
   BL SECONDJUMP
   B DRAW_BUNNY_AFTER_CMPR
THIRDJUMPLR
   BL THIRDJUMP
   B DRAW_BUNNY_AFTER_CMPR
FOURTHJUMPLR
   BL FOURTHJUMP
   B DRAW_BUNNY_AFTER_CMPR
WINJUMPLR
   BL WINJUMP
   
DRAW_BUNNY_AFTER_CMPR
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
 B SKIPPEDBR2
   LTORG
SKIPPEDBR2 	
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r6,=BUNNY_Y
	ldrh r12,[r6]
	ADD r11,r0,#15
	STRH R11,[R5]
	bl Draw_Bunny
    B ENDRIGHTFUNCTION
	
DRAWSBR
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      	

	
ENDRIGHTFUNCTION
	POP{R0-R12,PC}
	ENDFUNC	
	
MOVE_BUNNY_RIGHT_LEVEL2	FUNCTION
	PUSH{R0-R12,LR}
	;TODO: CHECK FOR SCREEN BOUNDARIES, IF THE SPRITE TOUCHES A WALL, DON'T MOVE
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ADD R0,R0,#24    ;//SUB HALF WIDTH
	ADD r0,r0,#15
	cmp r0,#320
	BGT DRAWSBR2
    
	;TODO: COVER THE SPIRIT WITH THE BACKGROUND COLOR
	LDR R12,=JUMPFRD
	LDRH R11, [r12]
	CMP R11,#0
	BEQ ZEROJUMPRL_LEVEL2
	CMP R11,#1
	BEQ FIRSTJUMPRL_LEVEL2
	CMP R11,#2
	BEQ SECONDJUMPRL_LEVEL2
	CMP R11,#3
	BEQ THIRDJUMPRL_LEVEL2
	CMP R11,#4
	BEQ FOURTHJUMPRL_LEVEL2
	CMP R11,#5
	BEQ FIFTHJUMPRL_LEVEL2
	CMP R11,#6
	BEQ SIXTHJUMPRL_LEVEL2
	CMP R11,#7
	BEQ SEVENTHRJUMP_LEVEL2
	CMP R11,#8
	BEQ WINR_LEVEL2
	
ZEROJUMPRL_LEVEL2
  BL ZEROJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPLR2
FIRSTJUMPRL_LEVEL2
  BL FIRSTJUMP_LEVEL2
  B DRAW_BUNNY_AFTER_CMPLR2
SECONDJUMPRL_LEVEL2
   BL SECONDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPLR2
THIRDJUMPRL_LEVEL2
   BL THIRDJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPLR2
FOURTHJUMPRL_LEVEL2
   BL FOURTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPLR2
FIFTHJUMPRL_LEVEL2
   BL FIFTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPLR2
SIXTHJUMPRL_LEVEL2
   BL SIXTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPLR2
SEVENTHRJUMP_LEVEL2
   BL SEVENTHJUMP_LEVEL2
   B DRAW_BUNNY_AFTER_CMPLR2
WINR_LEVEL2
   BL WIN2
   
DRAW_BUNNY_AFTER_CMPLR2
	;TODO: REDRAW THE SPIRIT IN THE NEW COORDINATES AND UPDATE ITS COORDINATES IN THE DATASECTION
  	
	ldr r5,=BUNNY_X
	ldrh r0,[r5]
	ldr r6,=BUNNY_Y
	ldrh r12,[r6]
	ADD r11,r0,#15
	STRH R11,[R5]
	bl Draw_Bunny
    B ENDRIGHTFUNCTION2
	
DRAWSBR2
     ldr r7,=BUNNY_X
	 ldrh r11,[r7]
	 ldr r8,=BUNNY_Y
	 ldrh r12,[r8]
	 bl Draw_Bunny
      

	
ENDRIGHTFUNCTION2
	POP{R0-R12,PC}
	ENDFUNC	
	
	

	
DRAW_LANE1_MOVING  FUNCTION
	;THIS FUNCTION ONLY TAKES THE LEVEL AS AN INPUT IN REGISTER R0 (R0=1 LEVEL 1 , R0=2,LEVEL 2)
	PUSH{R0-R12,LR}
	CMP R0,#2
	BEQ lANE1_TO_LEVEL_2
	;THIS CODE IS FOR LEVEL 1
	

	
	;THIS PART IS TO REDRAW LOG 1
	

	LDR R5,=STARTING_X_LOG1_L1
	LDR R8,=STARTING_X_LOG2_L1
    LDR R6,=LOG1_LENGTH_L1
	LDR R7,=SPEED_L1
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#82
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#112
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L1_1
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L1_1

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#82
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#112
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L1
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#82
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#112  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L1_1
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L1_1

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#82
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#112
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

	

    
   b END_OF_DRAWING_L1_1
	
	
lANE1_TO_LEVEL_2

  B HAMADA_YESHRAB
   LTORG
HAMADA_YESHRAB 

	
	 

	
	

	
	;THIS PART IS TO REDRAW LOG 1
	

	LDR R5,=STARTING_X_LOG1_L1
	LDR R8,=STARTING_X_LOG2_L1
    LDR R6,=LOG1_LENGTH_L1
	LDR R7,=SPEED_L1
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#81
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#99
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L1_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L1_2

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#81
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#99
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L1
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#81
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#99  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L1_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L1_2

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#81
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#99
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED
	    
	
END_OF_DRAWING_L1_1



	POP{R0-R12,PC}
	ENDFUNC	
	
	
	
	
	
	
DRAW_LANE2_MOVING  FUNCTION
	;THIS FUNCTION ONLY TAKES THE LEVEL AS AN INPUT IN REGISTER R0 (R0=1 LEVEL 1 , R0=2,LEVEL 2)
	PUSH{R0-R12,LR}
	CMP R0,#2
	BEQ lANE2_TO_LEVEL_2
	;THIS CODE IS FOR LEVEL 1
	
	

	
	;THIS PART IS TO REDRAW LOG 1
	
    LDR R5,=STARTING_X_LOG1_L2
	LDR R8,=STARTING_X_LOG2_L2
    LDR R6,=LOG1_LENGTH_L2
	LDR R7,=SPEED_L2
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#115
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#145
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L2_1
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L2_1

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#115
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#145
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L2
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#115
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#145  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L2_1
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L2_1

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#115
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#145
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED


    
   b END_OF_DRAWING_L2_1
	
	
lANE2_TO_LEVEL_2



	
    LDR R5,=STARTING_X_LOG1_L2
	LDR R8,=STARTING_X_LOG2_L2
    LDR R6,=LOG1_LENGTH_L2
	LDR R7,=SPEED_L2
    
      B HAMADA_YESHRAB_2
   LTORG
HAMADA_YESHRAB_2
		
    LDR R5,=STARTING_X_LOG1_L2
	LDR R8,=STARTING_X_LOG2_L2
    LDR R6,=LOG1_LENGTH_L2
	LDR R7,=SPEED_L2
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#101
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#119
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L2_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L2_2

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#101
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#119
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L2
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#101
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#119  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L2_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L2_2

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#101
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#119
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED
	
END_OF_DRAWING_L2_1



	POP{R0-R12,PC}
	ENDFUNC	
	
  B YARAB1
   LTORG
YARAB1
	
	
DRAW_LANE3_MOVING  FUNCTION
	;THIS FUNCTION ONLY TAKES THE LEVEL AS AN INPUT IN REGISTER R0 (R0=1 LEVEL 1 , R0=2,LEVEL 2)
	PUSH{R0-R12,LR}
	CMP R0,#2
	BEQ lANE3_TO_LEVEL_2
	;THIS CODE IS FOR LEVEL 1
	

	
	;THIS PART IS TO REDRAW LOG 1
	
	LDR R5,=STARTING_X_LOG1_L3
	LDR R8,=STARTING_X_LOG2_L3
    LDR R6,=LOG1_LENGTH_L3
	LDR R7,=SPEED_L3
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#148
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#178
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L3_1
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L3_1

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#148
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#178
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L3
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#148
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#178  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L3_1
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L3_1

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#148
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#178
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    
   b END_OF_DRAWING_L3_1
	
	
lANE3_TO_LEVEL_2


	 
	
    LDR R5,=STARTING_X_LOG1_L3
	LDR R8,=STARTING_X_LOG2_L3
    LDR R6,=LOG1_LENGTH_L3
	LDR R7,=SPEED_L3
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#121
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#139
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L3_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L3_2

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#121
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#139
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L3
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#121
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#139  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L3_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L3_2

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#121
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#139
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

END_OF_DRAWING_L3_1

	POP{R0-R12,PC}
	ENDFUNC	
	
	
  B YARAB2
   LTORG
YARAB2	
	
	
DRAW_LANE4_MOVING  FUNCTION
	;THIS FUNCTION ONLY TAKES THE LEVEL AS AN INPUT IN REGISTER R0 (R0=1 LEVEL 1 , R0=2,LEVEL 2)
	PUSH{R0-R12,LR}
	CMP R0,#1
	BEQ END_OF_DRAWING_L4_1
	
	

;THIS PART IS TO REDRAW LOG 1
	
 LDR R5,=STARTING_X_LOG1_L4
	LDR R8,=STARTING_X_LOG2_L4
    LDR R6,=LOG1_LENGTH_L4
	LDR R7,=SPEED_L4
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#141
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#159
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L4_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L4_2

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#141
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#159
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L4
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#141
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#159  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L4_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L4_2

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#141
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#159
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED
	
END_OF_DRAWING_L4_1



	POP{R0-R12,PC}
	ENDFUNC	
	
	
	
	
DRAW_LANE5_MOVING  FUNCTION
	;THIS FUNCTION ONLY TAKES THE LEVEL AS AN INPUT IN REGISTER R0 (R0=1 LEVEL 1 , R0=2,LEVEL 2)
	PUSH{R0-R12,LR}
	CMP R0,#1
	BEQ END_OF_DRAWING_L5_1




	
    LDR R5,=STARTING_X_LOG1_L5
	LDR R8,=STARTING_X_LOG2_L5
    LDR R6,=LOG1_LENGTH_L5
	LDR R7,=SPEED_L5
    
    
		
    ;;GETTING THE ADDRESS OF THE OF THE STARTING X AND THE LENGTH OF THE WOOD AND THE SPEED
    LDRH R0,[R5] ;SETTING X1 OF THE LOG 1
	LDRH R11,[R8] ;SETTING X1 OF THE LOG 2
    LDRH R2,[R6] ;HAVING THE LENGTH OF THE FIRST LOG
	LDRH R9,[R7] ;HAVING THE SPEED OF THE LOG IN THIS LANE
    ;NOW DRAW THE LOG 1 AFTER MOVING
	
    MOV R12,R0 ;HAVE THE PERVIOUS STARTING X
	
    ADD R0,R0,R9  ;STORE THE NEW STARTING X AFTER MOVING IN R0
    MOV R1,#161
    ADD R3,R0,R2; GET X2 BY ADDING THE NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#179
    LDR R10,=BROWN
    BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG1_L5_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG1_L5_2

	STRH R4,[R5];STORE THE NEW STARTING X IN IT'S VARIBLE
	
	;REMOVE THE END OF THE LOG
	MOV R0,R12 ;STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#161
    ADD R3,R0,R9 ;THE ENDING X OF THE REMOVED PART IS = STARTING X OF THE REMOVED PART + THE SPEED OR THE MOVED PART
    MOV R4,#179
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED

    LDR R6,=LOG2_LENGTH_L5
	LDRH R2,[R6] ;HAVING THE LENGTH OF THE SECOND LOG
     
	MOV R0,R11 ; STARTING X OF LOG 2
    ;NOW DRAW THE LOG 2 AFTER MOVING
    ADD R0,R0,R9     ;THE NEW STARTING X IS THE STARTING X OF LOG 2
    MOV R1,#161
    ADD R3,R0,R2      ;THE NEW ENDING X = NEW STARTING X + THE LENGTH OF THE LOG
    MOV R4,#179  
    LDR R10,=BROWN
	BL DRAW_RECTANGLE_FILLED
	
	MOV R4,R0
	CMP R4,#320
	BLT SKIP_CHANGING_IN_STARTING_X_LOG2_L5_2
	SUB R4,#320
SKIP_CHANGING_IN_STARTING_X_LOG2_L5_2

    STRH R4,[R8];STORE THE NEW STARTING X OF LOG2
	
	;REMOVE THE END OF THE LOG
	MOV R0,R11 ; STORED VALUE OF THE PERVIOUS STARTING X
    MOV R1,#161
    ADD R3,R0,R9 ; THE ENDING X OF THE REMOVED PART IS = THE STARTING X OF THE REMOVED PART + THE LENGTH THE LOG HAVE MOVED(SPEED)
    MOV R4,#179
    LDR R10,=CYAN
    BL DRAW_RECTANGLE_FILLED
	
END_OF_DRAWING_L5_1



	POP{R0-R12,PC}
	ENDFUNC	

;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FUNCTIONS' DEFINITIONS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@







  B YARAB3
   LTORG
YARAB3




;#####################################################################################################################################################################



INITIALIZE_VARIABLES2	FUNCTION
	PUSH{R0-R12,LR}
	;THIS FUNCTION JUST INITIALIZES ANY VARIABLE IN THE DATASECTION TO ITS INITIAL VALUES
	;ALTHOUGH WE SPECIFIED SOME VALUES IN THE DATA AREA, BUT THEIR VALUES MIGHT BE ALTERED DURING BOOT TIME.
	;SO WE NEED TO IMPLEMENT THIS FUNCTION THAT REINITIALIZES ALL VARIABLES
	
	;TODO: INITIALIZE STARTING_X TO 150, NOTICE THAT STARTING_X IS DECLARED AS 16-BITS
	ldr r0,=BUNNY_X
	mov r2,#200
	strh r2,[r0]
	
	
	;TODO: INITIALIZE STARTING_Y TO 170, NOTICE THAT STARTING_Y IS DECLARED AS 16-BITS
	ldr r0,=BUNNY_Y
	mov r2,#183
	strh r2,[r0]
	
	ldr r12,=JUMPFRD
	mov r11,#0
	strh r11,[r12]
	
	
	;RIVER
	
	;TODO:INITIALIZE STARTING_X AND THE LENGTH AND SPEED OF LOG IN LANE 1 (FORWARD)
	 LDR R0,=STARTING_X_LOG1_L1
	 MOV R2,#10
	 STRH R2,[R0]
	;STARTING_X_LOG1_L1
	
	 LDR R0,=STARTING_X_LOG2_L1
	 MOV R2,#200
	 STRH R2,[R0]
	;STARTING_X_LOG2_L1 
	
	 LDR R0,=SPEED_L1
	 MOV R2,#10
	 STRH R2,[R0]
     ;SPEED_L1
	 
	 LDR R0,=LOG1_LENGTH_L1
	 MOV R2,#100
	 STRH R2,[R0]
	 ;LOG1_LENGTH_L1      
	 
	 LDR R0,=LOG2_LENGTH_L1
	 MOV R2,#100
	 STRH R2,[R0]
	 ;LOG2_LENGTH_L1      


	;TODO:INITIALIZE STARTING_X AND THE LENGTH AND SPEED OF LOG IN LANE 2  (BACKWARD)
	 LDR R0,=STARTING_X_LOG1_L2
	 MOV R2,#20
	 STRH R2,[R0]
	;STARTING_X_LOG1_L2
	
	 LDR R0,=STARTING_X_LOG2_L2
	 MOV R2,#210
	 STRH R2,[R0]
	;STARTING_X_LOG2_L2 
	
	 LDR R0,=SPEED_L2
	 MOV R2,#15
	 STRH R2,[R0]
     ;SPEED_L2
	 
	 LDR R0,=LOG1_LENGTH_L2
	 MOV R2,#120
	 STRH R2,[R0]
	 ;LOG1_LENGTH_L2      
	 
	 LDR R0,=LOG2_LENGTH_L2
	 MOV R2,#120
	 STRH R2,[R0]
	 ;LOG2_LENGTH_L2 
	 
	 
	 
	 ;TODO:INITIALIZE STARTING_X AND THE LENGTH AND SPEED OF LOG IN LANE 3  (FORWARD)
	 LDR R0,=STARTING_X_LOG1_L3
	 MOV R2,#40
	 STRH R2,[R0]
	;STARTING_X_LOG1_L3
	
	 LDR R0,=STARTING_X_LOG2_L3
	 MOV R2,#170
	 STRH R2,[R0]
	;STARTING_X_LOG2_L3 
	
	 LDR R0,=SPEED_L3
	 MOV R2,#10
	 STRH R2,[R0]
     ;SPEED_L3
	 
	 LDR R0,=LOG1_LENGTH_L3
	 MOV R2,#90
	 STRH R2,[R0]
	 ;LOG1_LENGTH_L3      
	 
	 LDR R0,=LOG2_LENGTH_L3
	 MOV R2,#90
	 STRH R2,[R0]
	 ;LOG2_LENGTH_L3 
	 
	 
	 
	 ;TODO:INITIALIZE STARTING_X AND THE LENGTH AND SPEED OF LOG IN LANE 4  (BACKWARD) IN LEVEL 2
	 LDR R0,=STARTING_X_LOG1_L4
	 MOV R2,#50
	 STRH R2,[R0]
	;STARTING_X_LOG1_L4
	
	 LDR R0,=STARTING_X_LOG2_L4
	 MOV R2,#160
	 STRH R2,[R0]
	;STARTING_X_LOG2_L4
	
	 LDR R0,=SPEED_L4
	 MOV R2,#15
	 STRH R2,[R0]
     ;SPEED_L4
	 
	 LDR R0,=LOG1_LENGTH_L4
	 MOV R2,#120
	 STRH R2,[R0]
	 ;LOG1_LENGTH_L4   
	 
	 LDR R0,=LOG2_LENGTH_L4
	 MOV R2,#120
	 STRH R2,[R0]
	 ;LOG2_LENGTH_L4
	 
	 
	 
	 ;TODO:INITIALIZE STARTING_X AND THE LENGTH AND SPEED OF LOG IN LANE 5  (FORWARD) IN LEVEL 2
	 LDR R0,=STARTING_X_LOG1_L5
	 MOV R2,#20
	 STRH R2,[R0]
	;STARTING_X_LOG1_L5
	
	 LDR R0,=STARTING_X_LOG2_L5
	 MOV R2,#180
	 STRH R2,[R0]
	;STARTING_X_LOG2_L5
	
	 LDR R0,=SPEED_L5
	 MOV R2,#10
	 STRH R2,[R0]
     ;SPEED_L5
	 
	 LDR R0,=LOG1_LENGTH_L5
	 MOV R2,#100
	 STRH R2,[R0]
	 ;LOG1_LENGTH_L5
	 
	 LDR R0,=LOG2_LENGTH_L5
	 MOV R2,#100
	 STRH R2,[R0]
	 ;LOG2_LENGTH_L5
	 
	 
	 
	 

	
	
	
	
	
	POP{R0-R12,PC}
	ENDFUNC










;#####################################################################################################################################################################
       
DRAW_TRIANGLE_FILLED FUNCTION

;This function takes the point above the lower left point of the trianlge by 2 pixels
;X =[] R8
;Y= [] R9
;Color = [] R10

	PUSH {R0-R12, LR}
	;First drawing the base rectangle of width 60 and hieght 2
	;The triangle will be of base 60 and hieght 30
	MOV R0, R8      ;X1 = R8
	MOV R1, R9      ;Y1 = R9
	ADD R5, R8, #60 ;X2 = R5
	ADD R6, R9, #2  ;Y2 = R6
	MOV R3, R5
	MOV R4, R6
	BL DRAW_RECTANGLE_FILLED
	
Tri_Loop
    
	ADD R0, R0, #2
	SUBS R3, R3, #2
	SUBS R1, R1, #2
	SUBS R4, R4, #2
	BL DRAW_RECTANGLE_FILLED
	CMP R0, R3
	BNE Tri_Loop
	
END_Tri_Loop
	POP {R0-R12, PC}


	ENDFUNC




DRAW_RIVER FUNCTION
;THIS FUNCTION TAKES NO PARAMETERS THEY ARE GIVEN THIER VALUE INSIDE IT READY MADE FUNCTION
;WE WILL CALL FUNCTION DRAW RECTANGLE AS A RIVER WITH BLUE COLOR
;DRAW RECTANGLE TAKES 5 PARAMETERS WHICH ARE :
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3
	;Y2 = [] r4
	;COLOR = [] r10
	PUSH{R0-R12,LR}
        ;SETTING THE REGISTERS THAT DRAW RECTANGLE TAKES
    MOV R0,#0     ;SETTING THE VALUE OF X1
	MOV R1,#80    ;SETTING THE VALUE OF Y1
	MOV R3,#320   ;SETTING THE VALUE OF X2
	MOV R4,#180   ;SETTING THE VALUE OF Y2
	LDR R10,=CYAN ;SETTING THE COLOR 
    BL DRAW_RECTANGLE_FILLED


    POP{R0-R12,PC}
	ENDFUNC
;##########################################################################################################################################


DRAW_WOOD FUNCTION
    ;THIS FUNCTION TAKES PARAMETERS:
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3 
    ; THE LENGTH OF THE WOOD IS X1-X2

    PUSH{R0-R12,LR}

	;DRAW RECTANGLE TAKES 5 PARAMETERS WHICH ARE :
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3
	;Y2 = [] r4
	;COLOR = [] r10
    ADD R4,R1,#19    ;SETTING Y2 AS ALWAYS A VALUE FROM Y1
	ADD R1,R1,#2     ;SUBTRACTING FROM Y1 1 PIXEL TO KEEP A SPACE BETWEEN EVERY WOOD AND WOOD 2 PIXELS
	

	LDR R10,=BROWN


	BL DRAW_RECTANGLE_FILLED
	POP{R0-R12,PC}
	ENDFUNC

;############################################################################################################################################
 






	END
