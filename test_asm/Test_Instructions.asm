main:

i:
addi R1, R0, 8 
addi R8, R0, 15 
addi R30,R0, 1
slli R2, R1, 1 #R2=16 
srli R3, R8, 1 #R3= 7 
srai R4, R8, 1 #R4= 7 
rori R5, R8, 1 #R5= 7
slti R6, R8, 12 #R6= 0
sltiu R7, R1, 10 #R7= 1
xori R8, R8, 2 #R8= 1101 = 13
ori R9, R1, 2 #R9= 10
andi R10, R1, 8 #R10 = 8
nori R11,R1, 1 #R11 = 
lui R12, 13 # R12= 1101 0000 0000 0000 0000 .... .....
sw R2,9(R0)
lw R14,0(R0)
jalr R0,R0,r

r:

add R1, R30, R30 #R1 = 2
add R7, R1, R1 #R7= 4
sll R2, R1, R1 #R2= 8
srl R3, R1, R30 #R3= 1
sra R4,R1, R30 #R4= 1
ror R5,R1, R1 #R5= 1000 0000 0000
sub R6,R7,R1 #R6= 2 
slt R7, R1,R7 #R7= 1
sltu R8, R6,R7 #R8= 0
xor R9, R1, R2 #R9= 10 
or R10, R1, R2 #R10= 10
and R11, R2, R1 #R11= 0
nor R12,R1,R2 #R12=  0101
mul R13, R1,R1 #R13= 4

sb:

lw R1,9(R0) #R1 =16
lw R7,0(R0) #R7 = 9
beq R1,R7,next

addi R1,R7,1 #R1= a , 10

next:


lw R7,1(R0) #R7 = 8
bne R1,R7,next1

addi R1,R7,1 #R1= a 

next1:

lw R7,2(R0) #R7 = 7
blt R1,R7,next2

addi R1,R7,1 #R1= 8 

next2:


lw R7,3(R0) #R7 = 6
bge R1,R7,next3

addi R1,R7,1 #R1= 8

next3:


lw R7,4(R0) #R7 = 5
bltu R1,R7,next4

addi R1,R7,1 #R1= 6

next4:


lw R7,5(R0) #R7 = 4
bgeu R1,R7,exit

addi R1,R7,1

exit:
