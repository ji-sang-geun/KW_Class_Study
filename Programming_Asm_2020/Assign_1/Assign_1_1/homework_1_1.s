	AREA ARMex, CODE, READONLY
	ENTRY
		
start
 	MOV R0,	#15 ; higher than 0x0A == 10, Store integer 15 in R0
	MOV R1, #5 ; lower than 0x0A, Store integer 5 in R1
	MOV R2, #10 ; same value with 0x0A, Store integer 10 in R2
	
	LDR R5, TEMP1 ; Read data at TEMP1's address and Copy to R5 
	STRB R0, [R5], #1 ; R0's data write at R5 and then, Move one space sideways
	STRB R1, [R5], #1 ; R1's data write at R5 and then, Move one space sideways
	STRB R2, [R5] ; R2's data write at R5 
	
	LDR R5, TEMP1 ; Read data at Temp's address and Copy to R5
	
	CMP R0, #10 ; compare(R0 - 10) 
	MOVMI R0, #0 ; if R0 < 10, Store integer 0 in R0
	MOVGT R0, #1 ; if R0 > 10, Store integer 1 in R0
	MOVEQ R0, #2 ; if R0 == 10, Store integer 2 in R0
	STRB R0, [R5], #1 ; R0's data write at R5 and then, Move one space sideways
   
	CMP R1, #10 ; compare(R1 - 10)
	MOVMI R1, #0 ; if R1 < 10, Store integer 0 in R1
	MOVGT R1, #1 ; if R1 > 10, Store integer 1 in R1
	MOVEQ R1, #2 ; if R1 == 10, Store integer 2 in R1
	STRB R1, [R5], #1 ; R1's data write at R5 and then, Move one space sideways
	
	CMP R2, #10 ; compare(R2 - 10)
	MOVMI R2, #0 ; if R2 < 10, Store integer 0 in R2
	MOVGT R2, #1 ; if R2 > 10, Store integer 1 in R2
	MOVEQ R2, #2 ; if R2 == 10, Store integer 2 in R2
	STRB R2, [R5] ; R2's data write at R5
	
TEMP1	&	&00001000 ; TEMP1's address == 0x00001000 
	
	MOV pc, lr ; Store lr in pc == return
	END ; Mark End Of File