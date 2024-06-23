	AREA MYDATA, DATA, READONLY

	
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
BLUE	EQU  	0xF8B2
YELLOW2   	EQU 	0x4000
GREEN 	EQU  	0x07E0
CYAN  	EQU  	0xFFE0
MAGENTA EQU 	0xF81F
RED	EQU  	0x001F
WHITE 	EQU  	0xFFFF
GREEN2 	EQU 	0x2FA4
	 
FIREBRICK EQU 0X001F	 ; BODY OF GHOST
DARKORCHID EQU 0X7B5D    ; PANTS OF GHOST
NAVAJOWHITE EQU 0XEFFF   ; FACE AND ARMS OF GHOST
	
Pink    EQU     0xF81F

BROWN EQU     0X1234
SEALBROWN        EQU      0x5921
DARKBLUE   EQU     0xF8B2   ;TESTED
DARKGREEN   EQU  0X1240  ;TESTED
LIGHTBLUE 	EQU  	0xFFF9  ;TESTED
GOLD     EQU     0x07FF     ;TESTED
BLUE2   EQU     0xFFD9      ;TESTED
LIGHTGREEN EQU 0x07F0      ;TESTED
YELLOW  EQU 0xEFFF
	

	EXPORT __main
	
	

	AREA	MYCODE, CODE, READONLY
	ENTRY
	
__main FUNCTION

	;This is the main funcion


	; CALL FUNCTION SETUP
	BL SETUP


	; DRAW THE ENTIRE SCREEN WITH A CERTAIN COLOR
	MOV R0, #0
	MOV R1, #0
	MOV R3, #320
	MOV R4, #240
	LDR R10, =WHITE
	BL DRAW_RECTANGLE_FILLED
	
	
	BL DRAW_RIVER
	;DRAW_WOOD
    ;THIS FUNCTION TAKES PARAMETERS:
	;X1 = [] r0
	;Y1 = [] r1
	;X2 = [] r3 
    ; THE LENGTH OF THE WOOD IS X1-X2
	MOV R0,40
	MOV R1,80
	MOV R3,180
	BL DRAW_WOOD

	MOV R0,20
	MOV R1,100
	MOV R3,120
	BL DRAW_WOOD
	
	MOV R0,230
	MOV R1,100
	MOV R3,320
	BL DRAW_WOOD
		
	MOV R0,270
	MOV R1,120
	MOV R3,320
	BL DRAW_WOOD

	MOV R0,140
	MOV R1,120
	MOV R3,220
	BL DRAW_WOOD

	MOV R0,220
	MOV R1,140
	MOV R3,300
	BL DRAW_WOOD

	MOV R0,0
	MOV R1,140
	MOV R3,120
	BL DRAW_WOOD

	MOV R0,60
	MOV R1,160
	MOV R3,180
	BL DRAW_WOOD

	MOV R0,230
	MOV R1,160
	MOV R3,310
	BL DRAW_WOOD
	


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
	
	ENDFUNC











;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ FUNCTIONS' DEFINITIONS @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@







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












;#####################################################################################################################################################################
SETUP FUNCTION
	;THIS FUNCTION ENABLES PORT E, MARKS IT AS OUTPUT, CONFIGURES SOME GPIO
	;THEN FINALLY IT CALLS LCD_INIT (HINT, USE THIS SETUP FUNCTION DIRECTLY IN THE MAIN)
	PUSH {R0-R12, LR}

	  LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #2        ; Set bit 2 to enable GPIOA clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
    ; Configure PORT A AS OUTPUT (LOWER 8 PINS)
    LDR R0, =GPIOA_CRL     
    MOV R1, #0x33333333     ;ALL 8 LOWER PINS OF PORT A AS OUTPUT WITH MAX SPEED OF 50 MHZ
    STR R1, [R0]

    ; Configure PORT A AS OUTPUT (HIGHER 8 PINS)
    LDR R0, =GPIOA_CRH           ; Address of GPIOC_CRH register
    MOV R1, #0x33333333     ;ALL 8 LOWER PINS OF PORT A AS OUTPUT WITH MAX SPEED OF 50 MHZ
    STR R1, [R0]                 ; Write the updated value back to GPIOC_CRH
	



    ; Enable GPIOC clock
    LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #4        ; Set bit 4 to enable GPIOC clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
    ; Configure PC13 as output push-pull 
    LDR R0, =GPIOC_CRH           ; Address of GPIOC_CRH register
    MOV R1, #0x33333333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
    STR R1, [R0]                 ; Write the updated value back to GPIOC_CRH

    ; Configure PC13 as output push-pull 
    LDR R0, =GPIOC_CRL           ; Address of GPIOC_CRH register
    MOV R1, #0x33333333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
    STR R1, [R0]   
	


    ; Enable GPIOB clock
    LDR R0, =RCC_APB2ENR         ; Address of RCC_APB2ENR register
    LDR R1, [R0]                 ; Read the current value of RCC_APB2ENR
	MOV R2, #1
    ORR R1, R1, R2, LSL #3        ; Set bit 3 to enable GPIOB clock
    STR R1, [R0]                 ; Write the updated value back to RCC_APB2ENR
    
    
    LDR R0, =GPIOB_CRL           ; Address of GPIOC_CRL register
    MOV R1, #0x33333333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
    STR R1, [R0]                 ; Write the updated value back to GPIOC_CRH


    LDR R0, =GPIOB_CRH           ; Address of GPIOC_CRL register
    MOV R1, #0x33333333      ; Set mode bits for pin 13 (output mode, max speed 50 MHz)
    STR R1, [R0] 



	BL LCD_INIT

	POP {R0-R12, PC}
;#####################################################################################################################################################################

   ENDFUNC




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
  
 ;##########################################################################################################################################
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

;##########################################################################################################################################


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
   B SKIPPED
   LTORG
SKIPPED   

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


	END