	AREA ARMex, CODE, READONLY
	ENTRY
	
start
	MOV r0, #1 ; r0 == 1
	MOV r1, #2 ; r1 == 2
	MOV r2, #3 ; r2 == 3
	MOV r3, #4 ; r3 == 4
	MOV r4, #5 ; r4 == 5
	MOV r5, #6 ; r5 == 6
	MOV r6, #7 ; r6 == 7
	MOV r7, #8 ; r7 == 8
	
	LDR r8, Tempaddr1 ; load r8 0x00040000
	
	STMIA r8!, {r0-r7} ; store multiple register increase after 
	LDR r8, Tempaddr1 ; load r8 0x00040000
	LDMIA r8!, {r1} ; load memory pointed by case register to r1 increase after 
	LDMIA r8!, {r6} ; load memory pointed by case register to r6 increase after
	LDMIA r8!, {r0} ; load memory pointed by case register to r0 register increase after
	LDMIA r8!, {r2} ; load memory pointed by case register to r2 increase after
	LDMIA r8!, {r7} ; load memory pointed by case register to r7 increase after
	LDMIA r8!, {r3-r5} ; load memory pointed by case register to r3 ~ r5 increase after

	MOV pc, #0 ; program counter == 0
	
Tempaddr1 & &00040000 ; Tempaddr1's address is 0x00040000
	END ; end of program