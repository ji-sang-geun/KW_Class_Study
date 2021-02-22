	AREA ARMex, CODE, READONLY
		ENTRY

Main
	MOV r4, #1 ; Assgin 1 to Register r4
	LSL r5, r4, #1 ; The value of r4 is shifted left one space and assigned to r5.
	LSL r6, r4, #3 ; The value of r4 is shifted left three space and assigned to r6.
	ADD r6, r6, r5 ; r6 = r6 + r5
	ADD r6, r6, r4 ; r6 = r6 + r4
	
	LDR r0, Address1 ; Load data of Address1 to register r0
	LDR r1, =Values1 ; Load data of values1 to register r1
	LDR r2, =Values2 ; Load data of values1 to register r2
	LDR r3, =Values3 ; Load data of values1 to register r3
	MOV r11, #3 ; Assgin 3 to Register r11 it means, 3 time loop
	
Loop
	LDR r7, [r1], #4 ; Load r1's data in register r7 and then, r1 = r1 + 4
	LDR r8, [r2], #4 ; Load r2's data in register r8 and then, r2 = r2 + 4
	LDR r9, [r3], #4 ; Load r3's data in register r9 and then, r3 = r3 + 4
	ADD r6, r6, r7 ; r6 = r6 + r7
	ADD r6, r6, r8 ; r6 = r6 + r8
	ADD r6, r6, r9 ; r6 = r6 + r9
	
	ADD r10, r10, #1 ; r10 = r10 + 1, loop 
	CMP r10, r11 ; Compare (r10 - r11)
	
	BEQ Endline ; If (r10 - r11)'s value == 0 Goto Endline branch
	B Loop ; Goto Loop branch

Endline 
	STR r6, [r0] ; Store r6's data in r0's address
	MOV pc, lr ; Store lr in pc == return
	
Address1 DCD &00004000 ; Address1's Address is 00004000
	
Values1 DCD 13,15,17 ; Defined by dividing the given array into 3 types
Values2 DCD 19,21,23 ; Defined by dividing the given array into 3 types
Values3 DCD 25,27,29 ; Defined by dividing the given array into 3 types
	END ; End of Program