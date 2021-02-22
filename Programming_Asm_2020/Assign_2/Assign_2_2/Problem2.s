	AREA ARMex, CODE, READONLY
		ENTRY
		
Main ; 
	LDR r0, =Values ; Values means array with attributes 10,9,8,7,6,5,4,3,2,1
	LDR r1, Address1 ; 	Address1 means Address to store value
	MOV r6, #10		; The number of input value	
	
Loop 
	LDR r2, [r0], #4 ; Register r2 = mem[r0], r0 = r0+4 (load the data)
	STR r2, [r1], #-4 ; Mem[r1] = r2, r1 = r1-4 (store the data)

	ADD r5, r5, #1 ; Add 1 to R5 to mean one turn has passed
	CMP r5, r6 ; Compare r5 and r6, Calculate loop time 
	
	BEQ Endline ; If r5 and r6 are same it moves Endline
	B Loop ; If r5 and r6 are not same it moves Loop

Endline
	MOV pc,	lr ; Store lr in pc == return

Values DCD 10,9,8,7,6,5,4,3,2,1 ; Given array definition
	
Address1 DCD &00004024 ; Address 00004024 means Used because -4 bytes should be printed in reverse order.
	END ; End of Program
	