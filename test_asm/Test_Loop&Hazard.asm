addi R1,R0,0
addi R2,R0,0
addi R3,R0,9

loop:
beq R1,R3,exit

addi R1,R1,1
add R2,R1,R2

jalr R0,R0,loop

exit:




