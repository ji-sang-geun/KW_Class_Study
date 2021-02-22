	AREA ARMex, CODE, READONLY
		ENTRY
	
Main
	LDR r0, =Cstring ; Load Cstring containing Hello_world into register r0
	LDR r1, =CMPstring ; Load CMPstring containing Hello_world into register r1
	LDR r2, Address1 ; Address1 means Address to store value
	
Loop
	LDRB r3, [r0], #1 ; Load byte into register r3 and then, r0 = r0+1
	LDRB r4, [r1], #1 ; Load byte into register r4 and then, r1 = r1+1
	
	CMP r3, r4 ; Compare (r3 - r4) 
	BNE Wrong ; If (r3 - r4)'s value != 0 
	BEQ True ; If (r3 - r4)'s value == 0
	B Finish ; Goto Finish branch
	
Wrong
	MOV r5, #0x0B ; Substituting 0x0B for r5
	B Endline ; Goto Endline branch
	
True
	MOV r5, #0x0A ; Substituting 0x0A for r5
	CMP r3, #0 ; Compare (r3 - 0)	
	BEQ Endline ; If(r3 - 0)'s value == 0 Goto Endline branch
	
Finish
	B Loop ; Goto Loop branch
	
Endline
	STR r5, [r2] ; Store r5's data in r2's address
	MOV pc, lr ; Store lr in pc == return
	
Cstring DCB "Hello_world",0 ; String definition
CMPstring DCB "Hello_world",0 ; String definition

Address1 DCD &00004000 ; Address1's Address
	END ; End of Program