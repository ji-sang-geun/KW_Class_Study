	AREA ARMex,CODE ,READONLY
		ENTRY
Main
	MOV r1, #1 ; Assgin 1 to Register r1
	LSL r2, r1, #3 ; The value of r1 is shifted left three space and assigned to r2.
	LSL r3, r1, #1 ; The value of r1 is shifted left one space and assigned to r3.
	ADD r3, r3, r2 ; r3 = r3 + r2
	
	LDR r0, Address1 ; Load the value of address1 into r0
	
Loop
	ADD r5, r4, r3 ; r5 = r4 + r3
	MUL r6, r5, r4 ; Multiple, r6 = r5 * r4
	
	CMP r4, r3 ; Compare (r4 - r3)
	ADD r4, r4, #1 ; r4 = r4 + 1
	BEQ Endline ; If (r4 - r3)'s value == 0, Goto Endline branch
	B Loop ; Goto Loop branch
	
Endline
	STR r6, [r0] ; Store r6's data in r0's address
	MOV pc, lr ; Store lr in pc == return

Address1 DCD &00004000 ; Address1's Address is 00004000
	END ; End of Program