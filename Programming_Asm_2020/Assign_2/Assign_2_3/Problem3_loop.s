	AREA ARMex, CODE, READONLY
		ENTRY
Main
	MOV r2, #1 ; Assign 1 to register r2
	LSL r3, r2, #1 ; The value of r2 is shifted left one space and assigned to r3.
	LSL r4, r2, #3 ; The value of r2 is shifted left three space and assigned to r3.
	ADD r5, r4, r3 ; Register r5 = r4 + r3
	ADD r5, r5, r2 ; Register r5 = r5 + r2
	
	LDR r0, =Values ; Values means array with attributes 13,15,17,19,21,23,25,27,29
	LDR r1, Address1 ; Load the value of address1 into r1
	MOV r9, #9 ; Represents the number of remaining numbers after subtracting 11

Loop
	LDR r6, [r0], #4 ; Load r6's data from r0's address and then r0 = r0 + 4
	ADD r5, r6, r5 ; r5 = r5 + r6
	
	ADD r8, r8, #1 ; r8 = r8 + 1
	CMP r8,	r9 ; Compare (r8 - r9)
	BEQ Endline ; If (r8 - r9) == 0 Goto Endline branch
	B Loop ; Goto Loop branch
	
	
Endline
	STR r5, [r1] ; Store r5's data in r1's address
	MOV pc, lr ; Store lr in pc == return
	
Values DCD 13, 15, 17, 19, 21, 23, 25, 27, 29 ; Given array definition

Address1 DCD &00004000 ; Address1's Address is 00004000
	END ; End of Program
	