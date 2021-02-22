	AREA ARMex,CODE,READONLY
		ENTRY

start
	LDR r0, Tempaddr1 ; Tempaddr1 means address to store value
	LDR r10, =Float1 ; Float1 means 0x3Fc00000
	LDR r11, =Float2 ; Float2 means 0x40500000
	
	LDR r2,[r10] ; Register r2 = mem[r10] (load the data)
	CMP r2, #0x80000000 ; To find plus or minus
	MOVLS r3, #0 ; sign == plus	
	MOVHI r3, #1 ; sign == minus 
	
	ROR r2, r2, #23	; Rotate r2 to the right 23 times (for bit clear)
	BIC r4, r2, #0xFFFFFF00	; Bit clear 0xFFFFFF00 for exponent
	
	LSR r5, r2, #9	; The value of r5 is shifted left 9 space and assigned to r2.
	ROR r2, r2, #9	; Rotate r2 to the right 9 times
	
	LDR r6,[r11] ; ; Register r6 = mem[r11] (load the data)			
	CMP r6,#0x80000000 ; To find plus or minus
	MOVLS r7, #0 ; sign == plus			
	MOVHI r7, #1 ; sign == minus
	
	ROR r6, r6 ,#23	; Rotate r6 to the right 23 times (for bit clear)
	BIC r8, r6, #0xFFFFFF00	; Bit clear 0xFFFFFF00 for exponent
	
	LSR r9, r6, #9	; The value of r9 is shifted left 9 space and assigned to r6.		
	ROR r6, r6, #9	; Rotate r2 to the right 9 times
	
	CMP r3, r7 
	BEQ Same ; If (r3 - r7)'s value == 0, Goto Same branch. it means same sign
	BNE Wrong ; If (r4 - r3)'s value != 0, Goto Wrong branch. it means wrong sign
	
Same
	ADD r5, r5, #0x00800000 ; Put a 1 in front of the Mantissa form
	ADD r9, r9, #0x00800000	; Put a 1 in front of the Mantissa form
	
	CMP r4, r8 ; Finding the difference between the exponents of two floating points
	SUBGT r10, r4, r8 ; Subtract the smaller value from the larger value
	SUBGT r13, r4, #0x0000007F ; Normalize result exponent + 127
	LSRGT r11, r9, r10 ; Shift the mantissa value of the small exponent value to the right by shift num
	ADDGT r12, r5, r11 ; Add each mantissa value
	
	SUBLT r10, r8, r4 ; Subtract the smaller value from the larger value.			
	SUBLT r13, r8, #0x0000007F ; exponent + 127
	LSRLT r11, r5, r10 ; Shift the mantissa value of the small exponent value to the right by shift num	
	ADDLT r12, r9, r11 ; Add each mantissa value	
	
	CMP r12, #0x01000000 ; Compare Mantissa to 1 		
	LSRHS r12, r12, #1 ; Normalize Mantissa value 
	ADDHS r13, r13, #1 ; Exponent value modification			
	
	MOV r2, #0 ; Assign 0 to initialize r2 				
	ROR r3, r3, #1 ; rotate right once 		
	ADD r2, r2, r3 ; r2 = r2 + sign bit			
	LSL r12, r12, #9 
	LSR r12, r12, #9
	ADD r2, r2, r12	; Using Shift, Adding the mantissa value			
	ADD r13, r13, #0x000007F ; Normalize result exponent + 127
	ROR r13, r13, #9 ; Rotate 9 times to the right to move the value to the place in charge of exponent
	ADD r2, r2, r13 ; r2 = r2 + exponent part			
	
	B Endline ; goto Endline branch

Wrong
	CMP r5, r9 ; if r5 - r9
	MOVLS r1, #0 ; r5 - r9 > 0 sign bit is 0
	MOVHI r1, #1 ; r5 - r9 < 0 sign bit is 1
	
	ADD r5, r5, #0x00800000 ; Put a 1 in front of the Mantissa form
	ADD r9, r9, #0x00800000	; Put a 1 in front of the Mantissa form
	
	; If only the sign is different and the same size is subtracted
	CMP r5, r9 ; if r5 - r9
	CMPEQ r4, r8 ; if r5 == 59 Compare exponents
	MOVEQ r2, #0 ;If r4 == r8 Substitute 0 into r2
	BEQ Endline ; If r2 == 0 Goto Endline branch
	
	CMP r4, r8 ; Finding the difference between exponents of two floating points 					
	SUBGT r10, r4, r8 ; if r4 > r8, r10 = r4 - r8
	SUBGT r13, r4, #0x0000007F ; Substitute the value of r4 - 127 into r13 
	LSRGT r9, r9, r10 ; Shift the mantissa value of the small exponent value by shift num to the right
	
	SUBLE r10, r8, r4 ; if r8 > r4, r10 = r8 - r4
	SUBLE r13, r8, #0x0000007F ; Substitute the value of r8 - 127 into r13
	LSRLE r5, r5, r10 ; Shift the mantissa value of the small exponent value by shift num to the right		
		
	CMP r1, #1 ; if sign bit is 1 			
	SUBEQ r12, r5, r9 ; r12 = r5 - r9
	SUBNE r12, r9, r5 ;	r12 = r9 - r5	

Loop
	CMP r12, #0x00800000 ; Compare Mantissa to 1
	LSLLS r12, r12, #1 ; If it is small, shift Mantissa to the left once
	SUBLS r13, r13, #1 ; If it is small, subtract 1 from exponent
	CMP r12, #0x00800000 ; Compare Mantissa to 1
	BHS Amend ; If greater than 1, go to Amend branch
	B Loop ; Repeat if r12 is less than 1					

Amend
	MOV r2, #0 ; Assign 0 to initialize r2 				
	CMP r1, #1 ; Compare r1 and 1 (sign(+/-) check)		
	ROREQ r3, r3, #1 ; If r1 == 1, rotate right once
	RORNE r7, r7, #1 ; If r1 != 1, rotate right once
	ADDEQ r2, r2, r3 ; If r1 == 1, r2 = r2 + r3
	ADDNE r2, r2, r7 ; If r1 != 1, r2 = r2 + r7
	LSL r12, r12, #9 
	LSR r12, r12, #9 
	ADD r2, r2, r12	; Using Shift, Adding the mantissa value
	ADD r13, r13, #0x000007F ; Normalize result exponent + 127
	ROR r13, r13, #9 ; Rotate 9 times to the right to move the value to the place in charge of exponent
	ADD r2, r2, r13	; r2 = r2 + exponent part

Endline
	STR r2, [r0] ; Mem[r0] = r2  
	
	MOV pc,lr ; Store lr in pc == return
	
Float1 & 0x3FC00000 ; 0 | 0111 1111 | 100 0000 0000 0000 0000 0000, S = 1, E = 127, F = 1.1
Float2 & 0x40500000 ; 0 | 1000 0000 | 101 0000 0000 0000 0000 0000, S = 0, E = 128, F = 1.101
Tempaddr1 DCD &40000000 ; Tempaddr1's address is 0x40000000
	END ; end of program