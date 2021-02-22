   AREA ARMex, CODE, READONLY
      ENTRY
start
   MOV r0, #10 ; r0 == 10
   MOV r1, #11 ; r1 == 11
   MOV r2, #12 ; r2 == 12
   MOV r3, #13 ; r3 == 13
   MOV r4, #14 ; r4 == 14
   MOV r5, #15 ; r5 == 15
   MOV r6, #16 ; r6 == 16
   MOV r7, #17 ; r7 == 17
   
   MOV r9, #160 ; r9 == 160
   
   LDR r10, Tempaddr1 ; load r10 = 0x00040000
   STMFA r10!, {r0-r7} ; store multiple register full ascending 
   BL doRegister ; goto doRegister
   
doRegister ; doRegister branch
   add r0, r0, #0 ; r0 = r0 + 0
   add r1, r1, #1 ; r1 = r1 + 1
   add r2, r2, #2 ; r2 = r2 + 2
   add r3, r3, #3 ; r3 = r3 + 3
   add r4, r4, #4 ; r4 = r4 + 4
   add r5, r5, #5 ; r5 = r5 + 5
   add r6, r6, #6 ; r6 = r6 + 6
   add r7, r7, #7 ; r7 = r7 + 7
   
   add r8, r8, r0 ; r8 = r8 + r0
   add r8, r8, r1 ; r8 = r8 + r1
   add r8, r8, r2 ; r8 = r8 + r2
   add r8, r8, r3 ; r8 = r8 + r3
   add r8, r8, r4 ; r8 = r8 + r4
   add r8, r8, r5 ; r8 = r8 + r5
   add r8, r8, r6 ; r8 = r8 + r6
   add r8, r8, r7 ; r8 = r8 + r7

doGCD ; doGCD branch
   CMP r8, r9 ; if (r8 - r9)
   SUBGT r8, r8, r9; Signed >
   SUBLE r9, r9, r8; Signed <=
   
   BEQ stop ; if (r8 - r9) == 0 goto stop branch
   B doGCD ; else goto doGCD branch
   
stop ; stop branch
   LDR r10, Tempaddr1 ; load r10 = 0x00040000
   str r8, [r10], #4 ; store r8's data in r10 and then, next memory address value +4

   ldr r11, [r10]
   add r0, r0, r11 ; add r0 + r11 == 10 + 10
   str r0, [r10], #4 ; store r0's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r1, r1, r11 ; add r1 + r11 == 11 + 12
   str r1, [r10], #4 ; store r1's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r2, r2, r11 ; add r2 + r11 == 12 + 14
   str r2, [r10], #4 ; store r2's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r3, r3, r11 ; add r3 + r11 == 13 + 16
   str r3, [r10], #4 ; store r3's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r4, r4, r11 ; add r4 + r11 == 14 + 18
   str r4, [r10], #4 ; store r4's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r5, r5, r11 ; add r5 + r11 == 15 + 20
   str r5, [r10], #4 ; store r5's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r6, r6, r11 ; add r6 + r11 == 16 + 22
   str r6, [r10], #4 ; store r6's data in r10 and then, next memory address value +4
   ldr r11, [r10]
   add r7, r7, r11 ; add r7 + r11 == 17 + 24
   str r7, [r10], #4 ; store r7's data in r10 and then, next memory address value +4
   
   mov pc, #0 ; program counter == 0
   
Tempaddr1 & &00040000 ; Tempaddr1's address is 0x00040000
   end ; end of program