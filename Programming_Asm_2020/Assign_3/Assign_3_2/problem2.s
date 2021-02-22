	AREA ARMex, CODE, READONLY
	ENTRY
	
start ; use Multiplication operation
	ldr r0, tempaddr ; tempaddr means address to store value
	mov r1, #10 ; Assign 10 decimal to register r1
	mov r11, #9 ; Assgin 9 decimal to register r11
	mul r2, r1, r11 ; r2 = r1 * 9 
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 8
	mul r3, r2, r11 ; r3 = r2 * 8
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 7
	mul r4, r3, r11 ; r4 = r3 * 7
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 6
	mul r5, r4, r11 ; r5 = r4 * 6
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 5
	mul r6, r5, r11 ; r6 = r5 * 5
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 4
	mul r7, r6, r11 ; r7 = r6 * 4
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 3
	mul r8, r7, r11 ; r8 = r7 * 3
	sub r11, r11, #1 ; Decrease the value of register r11 by 1 == 2
	mul r9, r8, r11 ; r9 = r8 * 2
	
	str r1, [r0], #4 ; Mem[r0] = r1, r0 = r0 + 4 (store the r1's data) == 10 
	str r2, [r0], #4 ; Mem[r0] = r2, r0 = r0 + 4 (store the r2's data) == 90
	str r3, [r0], #4 ; Mem[r0] = r3, r0 = r0 + 4 (store the r3's data) == 720
	str r4, [r0], #4 ; Mem[r0] = r4, r0 = r0 + 4 (store the r4's data) == 5040
	str r5, [r0], #4 ; Mem[r0] = r5, r0 = r0 + 4 (store the r5's data) == 30240
	str r6, [r0], #4 ; Mem[r0] = r6, r0 = r0 + 4 (store the r6's data) == 151200
	str r7, [r0], #4 ; Mem[r0] = r7, r0 = r0 + 4 (store the r7's data) == 604800
	str r8, [r0], #4 ; Mem[r0] = r8, r0 = r0 + 4 (store the r8's data) == 1814400
	str r9, [r0], #4 ; Mem[r0] = r9 (store the r9's data) == 3628800

	mov pc, lr ; Store lr in pc == return
	
tempaddr & &40000 ; tempaddr's address is  0x00040000
	
	end ; End of Program