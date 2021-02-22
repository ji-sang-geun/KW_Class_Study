	AREA ARMex, CODE, READONLY
	ENTRY
		
start ; use second operand
	ldr r0, tempaddr ; tempaddr means address to store value
	mov r1, #10 ; Assign 10 decimal to register r1
	add r2, r1, r1, lsl #3 ; r2 = r1 + (r1 * 8) == (r1 * 9)
	add r3, r2, lsl #3 ; r3 = (r2 * 8)
	add r4, r3, r3, lsl #2 ; r4 = r3 + (r3 * 4) == (r3 * 5) 
	add r4, r4, r3, lsl #1 ; r4 = r4 + (r3 * 2) == (r3 * 7)
	add r5, r4, lsl #2 ; r5 = (r4 * 4)
	add r5, r5, r4, lsl #1 ; r5 = r5 + (r4 * 2) == (r4 * 6)
	add r6, r5, r5, lsl #2 ; r6 = r5 + (r5 * 4) == (r5 * 5)
	add r7, r6, lsl #2 ; r7 = (r6 * 4)
	add r8, r7, r7, lsl #1 ; r8 = r7 + (r7 * 2) == (r7 * 3)
	add r9, r8, lsl #1 ; r9 = (r8 * 2)
	
	str r1, [r0], #4 ; Mem[r0] = r1, r0 = r0 + 4 (store the r1's data) == 10 
	str r2, [r0], #4 ; Mem[r0] = r2, r0 = r0 + 4 (store the r2's data) == 90
	str r3, [r0], #4 ; Mem[r0] = r3, r0 = r0 + 4 (store the r3's data) == 720
	str r4, [r0], #4 ; Mem[r0] = r4, r0 = r0 + 4 (store the r4's data) == 5040
	str r5, [r0], #4 ; Mem[r0] = r5, r0 = r0 + 4 (store the r5's data) == 30240
	str r6, [r0], #4 ; Mem[r0] = r6, r0 = r0 + 4 (store the r6's data) == 151200
	str r7, [r0], #4 ; Mem[r0] = r7, r0 = r0 + 4 (store the r7's data) == 604800
	str r8, [r0], #4 ; Mem[r0] = r8, r0 = r0 + 4 (store the r8's data) == 1814400
	str r9, [r0] ; Mem[r0] = r9 (store the r9's data) == 3628800
	
	mov pc, lr ; Store lr in pc == return
	
tempaddr & &40000 ; tempaddr's address is  0x00040000
	
	end ; End of Program