	AREA ARMex, CODE, READONLY
		ENTRY
		
start
	MOV R0, #1 ; Store integer 1 in R0
	MOV R1, #2 ; Store integer 2 in R1
	MOV R3, #3 ; Store integer 3 in R3
	MOV R4, #4 ; Store integer 4 in R4
		
	LDR R5, TEMP1 ; Read data at TEMP1's address and Copy to R5 
	LDR R6, TEMP2 ; Read data at TEMP2's address and Copy to R6
		
	STRB R0, [R5], #1 ; R0's data write at R5 and then, Move one space sideways
	STRB R1, [R5], #1 ; R1's data write at R5 and then, Move one space sideways
	STRB R3, [R5], #1 ; R3's data write at R5 and then, Move one space sideways
	STRB R4, [R5], #1 ; R4's data write at R5 and then, Move one space sideways
	
	STRB R0, [R6], #1 ; R0's data write at R6 and then, Move one space sideways
	STRB R1, [R6], #1 ; R1's data write at R6 and then, Move one space sideways
	STRB R3, [R6], #1 ; R3's data write at R6 and then, Move one space sideways
	STRB R4, [R6], #1 ; R4's data wirte at R6 and then, Move one space sideways
		
TEMP1 & &04030201 ; Temp1's address == 0x04030201
TEMP2 &	&01020304 ; Temp2's address == 0x01020304

	MOV pc, lr ; Store lr in pc == return
	END ; Mark End Of File
		
		