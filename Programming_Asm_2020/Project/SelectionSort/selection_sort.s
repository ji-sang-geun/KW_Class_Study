	AREA Selection_Sort,CODE,READONLY ; Selection Sorting Program
		ENTRY
Conversion_Main ; floating point conversion
	LDR R10, =Data ; load the address of Data
	LDR R11, Float_result ; Float_result means address to store value
	MOV R6, #0 ; define Register 6 is 0
	
Conversion
	LDR R1, [R10], #4 ; load the first data into r1 and then, r10 = r10 + 4
	CMP R1, #0x80000000 ; To find plus or minus
	MOVLO R2, #0 ; sign == plus	
	MOVHS R2, #1 ; sign == minus

	ROR R1, R1, #23 ; Rotate r1 to the right 23 times (for bit clear)
	BIC R3, R1, #0xFFFFFF00 ; Bit clear 0xFFFFFF00 for exponent
	
	LSR R4, R1, #9 ; The value of r4 is shifted right 9 space and assigned to r1.
	ROR R1, R1, #9 ; Rotate r1 to the right 9 times
	
	MOV R5, #0 ; Initialize R5 to 0
	ROR R2, R2, #1 ; rotate right once
	ADD R5, R5, R2 ; R5 = R5 + R2 (sign)
	
	ADD R5, R5, R4 ; R5 = R5 + R4 (Mantissa)
	
	ROR R3, R3, #9 ; Rotate 9 times to the right to move the value to the place in charge of exponent
	ADD R5, R5, R3 ; R5 = R5 + R3 (exponent)
	
	STR R5, [R11], #4 ; Mem[R11] = R5 and then, R11 = R11 + 4;
	
	CMP R5, #0x00000000 ; Compared to 0x00000000 to determine if the given data is the end or not
	ADDNE R6, R6, #1 ; If not, add 1 to R6
	BNE Conversion ; If not, go to Conversion
	
Main ; Sorting Start
	LDR R12, Float_result ; Float_result means address to store Float value
	LDR R13, Sort_result ; Sort_result means address to store Sort value
	
	MOV R0, #0 ; Initialize R0 to 0
	MOV R1, #0 ; Initialize R1 to 0
	MOV R2, #0 ; Initialize R2 to 0
	MOV R3, #0 ; Initialize R3 to 0
	MOV R4, #0 ; Initialize R4 to 1
	MOV R5, #0 ; Initialize R5 to 0
	
	MOV R0, R12 ; Define R0 is R12 (it means Current Float)
	SUB R6, R6, #1 ; R6 = R6 - 1 (To adjust the number of cycles)
Loop
	ADD R1, R0, #4 ; R1 = R0 + 4 (it means Current Float's next)
	
Small_loop
		LDR R2, [R0] ; load the first data into r2 
		LDR R3, [R1] ; load the first data into r3
		
		CMP R3, #0x00000000 ; To find end of floating point
		BEQ Loop_cycle ; if equal, go to Loop_cycle
		
		CMP R2, #0x80000000 ; To find R2 plus or minus
		BLO Plus ; sign == plus	
		BHS Minus ; sign == minus
		
Plus
	CMP R3, #0x80000000 ; To find R3 plus or minus
	BHS Change ; if R3's sign == minus goto Change
	CMPLO R2, R3 ; if R3's sign == plus, Compare R2 and R3
	STRGE R2, [R1] ; if R2 >= R3, Mem[r1] = r2
	STRGE R3, [R0] ; if R2 >= R3, Mem[r0] = r3

	ADD R1, R1, #4 ; R1 = R1 + 4 (it means next R3's address)
	B Small_loop ; goto Small_loop
	
Minus
	CMP R3, #0x80000000 ; To find R3 plus or minus
	CMPHS R2, R3 ; if R3's sign == minus, Compare R2 and R3
	STRLT R2, [R1] ; if R2 < R3, Mem[r1] = r2
	STRLT R3, [R0] ; if R2 < R3, Mem[r0] = r3
	
	ADD R1, R1, #4 ; R1 = R1 + 4 (it means next R3's address)
	B Small_loop ; goto Small_loop

Loop_cycle
	ADD R0, R0, #4 ; R0 = R0 + 4 (it means next R2's address)
	SUB R6, R6, #1 ; R6 = R6 - 1 (R6 means Number of float points)
	
	CMP R6, #0 ; Compare R6 and 0
	BEQ Store ; if equal, go to Store
	BNE Loop ; if not equal, go to Loop

Change
	STR R2, [R1] ; Mem[r1] = r2
	STR R3, [R0] ; Mem[r0] = r3
	ADD R1, R1, #4 ; R1 = R1 + 4 (it means next R3's address)
	
	B Small_loop ; goto Small_loop
	
Store
	LDR R2, [R12], #4 ; load the first data into r2 and then, r12 = r12 + 4;
	
	CMP R2, #0x00000000 ; Compare R2 and end of Float point 
	STRNE R2, [R13], #4 ; if not equal, Mem[r13] = r2 and then, R13 = R13 + 4;
	BNE Store ; if not equal, go to Store

Endline
	MOV pc, lr ; Store lr in pc == return

Data
	dcd 0x80000000, 0x7fffffff, 0xcd673e3b, 0xb362cba6, 0x8fe19e57, 0x22e18fb1, 0xf5b96847, 0xbf80d69d, 0x55d32a7f, 0x10437074, 0x6d4fada7, 0x1c9843d9, 0x3a1bf32e, 0x419f0dfa, 0x44bc2b18, 0x61fd6527, 0xc4ea9f92, 0xe353198d, 0x24df1a8e, 0xd8e33020, 0x97e74f5b, 0xe3386941, 0x94664b52, 0x53ba154, 0x16f0ed45, 0xe2eaff07, 0xd7e52a41, 0x786f1e1f, 0x7d26fcbb, 0x6f50bc67, 0x20608c4a, 0xe49ddb52, 0x2e891632, 0x6dff3d3e, 0xd60b3c7, 0x4ff4416d, 0xc4d40344, 0x9ea55b38, 0xdf8ded46, 0x4d5ec942, 0xb911d0ca, 0x7463103c, 0xafbab3c7, 0xb8e81f0f, 0xe4018378, 0xd066e80, 0xb1731768, 0xb836fb33, 0x1c64a8ba, 0xb7836282, 0x61ffbc10, 0x8d267963, 0x1f5198ed, 0x8be76673, 0xc0cc6724, 0x1ada78ab, 0xae0fe980, 0x77a711be, 0x50ffe226, 0x8a8afe35, 0xb9b1f44e, 0x6219001c, 0x450bff7, 0x882bd4f5, 0x4bc245c, 0x51f03ae5, 0x19b22bf8, 0x5014c8dd, 0x859d0e1, 0x9596a914, 0x83684997, 0x1f43748a, 0x62b3ce4, 0x510aa77a, 0x6558b34a, 0x66f80604, 0x45184050, 0x4400d69, 0x9f733564, 0x9433075, 0xcbbe5010, 0x47144155, 0x1cad93d8, 0xcae00d8f, 0x39e43000, 0x770d27be, 0xf6a7c535, 0x1ff06b7, 0x44e46ad9, 0x91e2afb6, 0xb10ebb2e, 0x191736bd, 0xed05a74, 0x70f88b77, 0xcffcc11, 0x60ce6508, 0xf8e3c509, 0x11e37c6c, 0x4ab8f910, 0xc0bf0055, 0x9d8100be, 0x77309a5f, 0x2e69eeb6, 0xcd71fc22, 0xdcc1e55f, 0x89bc64c3, 0xd81e12eb, 0x2d01a47d, 0xf313a93a, 0xce9da625, 0x86e5b017, 0x7d64abd8, 0xea4dac2c, 0xfbc8b85b, 0x6c17606d, 0x6e4b9b8e, 0x97593f84, 0xfea593d7, 0xd0abd23e, 0xd70b3817, 0x72c7729, 0x70cdb01e, 0xd3fbdf83, 0xe7bd7cc7, 0xf2ec2107, 0xe03c6f80, 0x842e7e1f, 0x98f94c63, 0x98d6c153, 0xebdd2156, 0x314d7c14, 0x46b23743, 0x56006327, 0xaa448950, 0xeca05dbf, 0xeadf0124, 0x594945c8, 0x25afa67d, 0xbfa8247, 0x8425ad7f, 0xdaa68631, 0x27c88377, 0x3a2d0908, 0x86d07ab5, 0x9806a9ef, 0x890a5b57, 0x649264fb, 0x84404aa4, 0xd61505c5, 0x4368fcb7, 0x644f2577, 0x7d530014, 0xcbfe4bc3, 0x8b4ebe7e, 0xcd38d28e, 0xa3b275c3, 0x4e65c8c6, 0x2f2640e3, 0x566d9b5b, 0x4f94d2ba, 0x226042c3, 0x52fc1526, 0xcfb32576, 0x47818b, 0x8789f12a, 0xe7c2c68e, 0xe657ce68, 0x9706e0ab, 0x4a703e6, 0x5856625c, 0x81e435b8, 0x96a0ca2a, 0x4662fa26, 0x62eab29d, 0x5abe9fc2, 0x3d9fecd, 0xa1ac2271, 0x55a5adcb, 0xc9a4facb, 0x683f52a2, 0xd39b5303, 0x1519bf20, 0x6814497f, 0x5c26d381, 0x7fe32253, 0x65ed8726, 0x4558ac4a, 0xc8e2c85e, 0x8af80e0e, 0xeffdfec3, 0x771ab240, 0xca6090f4, 0x79a78602, 0xfcd18f45, 0xb3d82428, 0xb0b3f240, 0x2e0ad995, 0x8e95f4fe, 0xf720dab4, 0xadaa577c
    dcd 0x6b8643ff, 0x5fcf610a, 0x3a6bcbfa, 0xf19a6b96, 0xbef0741f, 0xf3cf918e, 0x85009223, 0x332d6871, 0x34bbaed3, 0xe207be9, 0x46448270, 0xbf19242, 0xf914dd03, 0x11865c1b, 0x4d2cf712, 0x3f7161ef, 0xace6e0dc, 0xff139866, 0x385d04bd, 0x9ba2e0b6, 0xde2d1d7d, 0x3d84714, 0x8373e52, 0x79c8a1b5, 0xcc14e773, 0x28db562b, 0xdfd19164, 0xeb8d6db3, 0x3a64c53f, 0x418ab40b, 0xe6049c25, 0xa474f10, 0x9b17a469, 0x1a3b7795, 0xe6098324, 0x66f12950, 0x59f6dce, 0x5a556981, 0x9b23a2a3, 0xb95a7b08, 0x5a7e7a2d, 0xb84f2a35, 0x4b5b08b, 0x5135780b, 0x1c6ed2d6, 0xfddd14d8, 0x54433537, 0xe886b2db, 0x84530d8d, 0x64f8ad2b, 0x45328318, 0x1751a550, 0x4ef8335a, 0x70f98054, 0x4d9529d8, 0xe6940d6f, 0x9d611ac5, 0xe631d981, 0x6359db44, 0x2b2db279, 0x9b4f1ce6, 0x81ce9b45, 0xbd6432cb, 0x15e3bd57, 0x4ebe7b8e, 0x8e93dee1, 0x9a1bef7a, 0x65f425cf, 0x940a8252, 0xbac51373, 0xd86e846c, 0xf2b798cb, 0x5603139f, 0x715dfd, 0x90c768da, 0x4e86b969, 0x22d43647, 0x7b6ffc25, 0x2b967d44, 0x99f8e62a, 0x4b68994a, 0x78578970, 0xcca9e38d, 0x4cf4cb87, 0x42146a72, 0x3cfda9c, 0x55e5e2b4, 0x7d0abe5e, 0xdfb6a3d1, 0x2671bec9, 0xea79b5ef, 0xfdf10aab, 0x3c017960, 0x17cb7d89, 0x34e027fe, 0x91ee460f, 0x3c564584, 0x372c8fe0, 0x12ae5a82, 0x41f8b98f, 0x71fcf84a, 0x19517fdc, 0xc92d5e63, 0x28a593fd, 0x272677c2, 0x322d8fa0, 0x4fa05a57, 0xb23fe9f5, 0xe7ca0810, 0x646de316, 0x37e7b43, 0x2742b973, 0xa3e0cee8, 0x12f11141, 0xa83f88f8, 0x7fb939b, 0x8910e9bf, 0xfc47dab7, 0xfde6ff9e, 0x72f13d4c, 0x2f134277, 0x2a397502, 0xad1bbb14, 0xffea63, 0x49585d7d, 0x13d8270e, 0xa1c0a80d, 0xf75e871e, 0x19d1fc46, 0xab292895, 0x4af5010, 0x2730fbd2, 0x810ff15d, 0xb01624b5, 0x96816762, 0xed9ee9a4, 0x5ce57d3, 0xe04be979, 0x812c6654, 0x4f715c8c, 0x85d81e4c, 0xed1dfd54, 0x6e3bea53, 0x6b95f3e0, 0x90f220e3, 0x89f906b0, 0x9fcacb55, 0x2307b673, 0x5413c0d0, 0xd251a821, 0xde3d9cc9, 0xd2c3a43, 0x8c34eb68, 0x452c1a4a, 0x1a3b8fae, 0x763856a, 0xdefde547, 0xc8db65c4, 0x2fbf3ac1, 0x69f52d49, 0xc0c81204, 0xed851758, 0x4ba03fc, 0x75f0a0f2, 0x144d580a, 0x24fecbe5, 0x31e9861c, 0x7c28d935, 0x11695d8b, 0xf4de9083, 0x1379e3a9, 0xe1a8427e, 0x78d25ce9, 0xf1ebb09a, 0x989d7446, 0xe8b103a6, 0xa68b9679, 0x1b65feb6, 0xb809fca0, 0xaab08ab8, 0xaf30911d, 0xd235599d, 0xac9e59b4, 0x9c4cd2d7, 0x6ada7666, 0x33d099f8, 0x9675ff78, 0x18ad50bc, 0x4cb956e8, 0x16ad71b7, 0x54da4527, 0x6ac01345, 0xc7a9baa9, 0x4a785d2a, 0xf226edb3, 0xd2c27d7b, 0x44af3250, 0xaa7a403, 0xa9b31df9, 0x64c8f49e
    dcd 0x45c5be03, 0xbc8dbdaa, 0x8e7794e, 0x23b79b64, 0xa82c8d9a, 0x57a6c389, 0xf924a451, 0x490741cf, 0x34387ac2, 0x69f5df70, 0xda00edc2, 0xdadfeafa, 0x92c95578, 0xd8cf86bf, 0xfcd6ef1a, 0xc301672c, 0xb4318242, 0xfe8e4744, 0x48bacc7c, 0x692fb6ca, 0xa7a89a72, 0x82a9f501, 0xca9fb8f0, 0xda15fc5e, 0xe7046a3a, 0x19c563dc, 0x92a02eae, 0x85bda9ba, 0xe12c38a9, 0xcf4be876, 0x412097b, 0xd20f90be, 0x375f01d2, 0xc46ce9b7, 0x25cd36fa, 0xb3e3d013, 0x52aa2cd5, 0x7fee1977, 0x455f83cc, 0x7089c1, 0xbaa00b9f, 0x9b66b50e, 0x28fe4138, 0x20f79ab, 0xdf8ee874, 0x28640729, 0xd44c9db, 0xae294d9a, 0x94965f72, 0x9fc5c904, 0xb603c802, 0xaee54020, 0x26f49efa, 0x791d83a6, 0x857632af, 0xb50257da, 0xad02fa08, 0xe1900635, 0xb24ccdc5, 0x883ce528, 0x575f3298, 0xa2de66c2, 0xeb0fa3aa, 0x4f019d41, 0xd03e5b25, 0x994f05e, 0x2fe1115c, 0x37ce8b3, 0x6528f2c0, 0x4b756769, 0xdea958ee, 0xed61b554, 0x683629, 0x95826ff3, 0x9ad6ae6b, 0x5007e84c, 0x38421339, 0xe561e728, 0x226d5b12, 0x7600394a, 0x4ece7d91, 0xea9f6c50, 0xc4a1bf1, 0xdc2a0bbd, 0x859e58ad, 0xf7ac1deb, 0x4d97371, 0x65f77e62, 0x99567aee, 0x312895ca, 0xef63b96e, 0x9e1f0137, 0x59f52b68, 0x69457a63, 0xf0f14285, 0xf90953fe, 0x655e1ec3, 0xe2c33d07, 0x9ee7ef14, 0x144aacac, 0x00000000

Float_result DCD &20000000 ; Float_result's Address is 0x20000000

Sort_result DCD &40000000 ; Sort_result's Address is 0x40000000	
		END ; end of program