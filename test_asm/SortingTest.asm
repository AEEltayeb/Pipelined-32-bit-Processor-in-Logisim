bubble_sort:
addi R12,R0,8
addi R1,R0, 0  #i                          

loop1:

addi R1,R1,1                      
blt R12,R1,end     # R12 is size "n" 
addi R0,R0, 0  
          
addi R2,R12, 0   # t1 is also since n, used for loop2

loop2:

beq R1,R2,loop1                  
addi R0,R0, 0

addi R15,R0, 1

sub R2,R2, R15    
                  
sll R5, R2, R15   
                  
sub R4, R5, R15 
                   
addi R11,R0, 0
add R5,R5,R11   # a0 is array address           
add R4,R4,R11  
                   
lw R6,0(R5)
lw R7,0(R4)

swap:
blt R7,R6,loop2     
addi R0,R0, 0     
         
sw R6,0(R4)                       
sw R7,0(R5)
jalr R0,R0,loop2

end:
