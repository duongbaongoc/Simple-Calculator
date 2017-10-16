.data
        first_number:   .asciiz "Enter the first number: "
        second_number:  .asciiz "\nEnter the second number: "
        operator:       .asciiz "\nEnter the operation type \n(0 == +/1 == -/2 == .) : "
        result:         .asciiz "\nThe result is "

.text

main:     

########GET THE FIRST NUMBER#####################################
        ##display "Enter the first number: "
        li $v0, 4               #waiting to accept a string to print
        la $a0, first_number    #load addr of first_number to $a0
        syscall                 #print out string at $a0

        ##get an int from user to $v0
        li $v0, 5               #waiting to get an int fron user
        syscall                 #get an int and store in $v0

        ##save the int for long term use
        move $s0, $v0           #$s0 stores the first number

#########GET THE SECOND NUMBER#####################################
        ##display "Enter the second number: "
        li $v0, 4               #waiting to accept a string to print
        la $a0, second_number   #load addr of second_number to $a0
        syscall                 #print out string at $a0

        ##get an int from user to $v0
        li $v0, 5               #waiting to get an int from user
        syscall                 #get an int and store in $v0

        ##save the int for long term use
        move $s1, $v0           #$s1 stores the second number

#########GET THE OPERATOR###########################################
        ##display "Enter the operation type: "
        li $v0, 4               #waiting to accept a string to print
        la $a0, operator        #load addr of operator to $a0
        syscall                 #print out string at $a0

        ##get an int from user to $v0
        li $v0, 5               #waiting to get an int from user
        syscall                 #get a character and store in $v0

        ##save the character for long term use
        move $s2, $v0    #$s2 stores the int representing the operator

#########CALCULATE THE RESULT#######################################
        li $t0, 0
        beq $s2, $t0, addition              #operator == plus then do addition
        j compare_sub                 
addition: add $s3, $s0, $s1                  #$s3 stores the sum
        j Exit
compare_sub: li $t0, 1
        beq $s2, $t0, subtraction     #operator == minus then do subtraction
        j compare_mul
subtraction: sub $s3, $s0, $s1               #$s3 stores the difference
        j Exit
compare_mul: li $t0, 2
        beq $s2, $t0, multiplication  #operator == multi then do multiplication
multiplication: mul $s3, $s0, $s1            #$s3 stores the product
   
#########DISPLAY THE RESULT#######################################
Exit:   li $v0, 4
        la $a0, result
        syscall     #display "The result is " 

        li $v0, 1
        move $a0, $s3
        syscall     #display the result


        li $v0, 10
        syscall     #terminate the program


