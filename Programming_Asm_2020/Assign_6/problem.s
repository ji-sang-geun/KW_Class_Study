cr equ 0x00 ; define cr = 0x00
	
	AREA strcpy, CODE, READONLY
		ENTRY
		
Main ; Main branch
	LDR r0, =String ; load the address of the String
	LDR r1, Address1 ; Address1 means address to store value
	
Loop ; Loop branch
	LDRB r2, [r0], #1 ; load the first byte into r2 and then, r0 = r0+1;
	cmp r2, #cr ; compare r2 and #cr it means compare r2 and 0x00
	STRBNE r2, [r1], #1 ; if Not Equal store r2 in the first byre of r1, and then r1 = r1 + 1
	BEQ Done ; if Equal, goto Done branch
	
	BAL Loop ; AL means always so, goto Loop branch 
	
Done ; Done branch
	MOV pc, #0 ; finish
	
	; Data area
	AREA Data, DATA
		
String 
	ALIGN
	DCB "Hello, World", cr ; Today's example Hello, world

Address1 DCD &00004000 ; Address1's address is 0x40000000
	END ; end of program