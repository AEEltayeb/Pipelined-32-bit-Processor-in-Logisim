addi R3, R0, 127 
addi R31,R0,31
addi R1,R0,1
addi R5,R0,R0
 
loop: #4 
beq R5,R31, exit #if r = 32 exit

andi R7,R3,R1
sra R3,R3,1
 
bne R7, R1, exit1
 
addi R6,R6,1 #count
 
exit1:
addi R5,R5,1 #9
jalr R0,R0,loop
 
exit:
