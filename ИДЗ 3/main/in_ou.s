#input and output functions of all types

.include "macro_functs.s"
.include "macro_tools.s"
.include "macro_in_ou.s"

# Read integer
.globl readInt
readInt:
	push(ra)
	li 	a7 5
	ecall	
	pop(ra)
	ret

# Print integer
.globl printInt
printInt:
	push(ra)
	li 	a7 1
	ecall
	pop(ra)
	ret

# Prints char
.globl printChar
printChar:
	push(ra)
	li 	a7 11
	ecall	
	pop(ra)
	ret

# Reads a string and putting '0' in the end.
.globl readStr
readStr:
	push(ra)
	mv 	t1 a1
	li      a7 54
    	ecall
    
   	# return if empty.
    	li 	t2 -2
    	beq 	a1 t2 rStrReturn
    	li 	t2 -3
    	beq 	a1 t2 rStrReturn
    
    	li	t0 '\n'
rStrLoop:
	lb	t2  (t1)
	beq 	t0 t2 rStrReplace
	beq 	zero t2	rStrReplace
	addi 	t1 t1 1
	b	rStrLoop
	    
	rStrReplace:
    	sb	zero (t1)
	
	rStrReturn:
	pop(ra)
	ret

# Prints string.
.globl printStr
printStr:
	push(ra)
	li 	a7 4
	ecall
	pop(ra)
	ret
	

# =============== Files ===============	


# Opens file.
.globl openFile
openFile:
	push(ra)
    	li   	a7 1024
    	ecall  
    	pop(ra)
    	ret      
    
# Closes file.
.globl closeFile
closeFile:
	push(ra)
	li   	a7 57
	ecall
	pop(ra)
	ret    
	

.globl readFile
# Reads file content
readFile:
	push(ra)
	# Open the file.
	mv 	t1 a1	# The size of chunk.
	li 	a1 0
	jal 	openFile
	mv 	t0 a0 	# File descriptor.
	li 	t6 -1
	beq 	t6 t0 readFileError
	
	# Reading file
	alloc_reg(t1)
	mv 	t2 a0 	# Save start.
	mv 	t3 a0
	mv 	t4 zero # Length of read.
readFile_loop:
	mv 	a0 t0
	mv 	a1 t3
	mv 	a2 t1
	li 	a7 63
	ecall
	
	li 	t6 -1
	mv 	t5 a0 	# Save number of symbols read.
	beq 	t5 t6 readFileError
	
	add 	t4 t4 t5
	bne 	t5 t1 readFile_end
	add 	t3 t3 t5
	alloc_reg(t1)
	j readFile_loop
		
	readFile_end:
    	mv 	a0 t0
    	jal 	closeFile

    	# Putting zero after the string.
    	add 	t3 t3 t5	
    	addi 	t3 t3 1	
    	sb	zero (t3)	
	
	mv 	a0 t2
	pop(ra)
	ret
	
	readFileError:
	li 	a0 -1
	pop(ra)
	ret
	
# Write str in the file
.globl writeFile
writeFile:	
    	push(ra)
    	li 	a1 1
    	jal	openFile
    	
	mv 	t4 a0	
	mv 	a1 s0
	mv 	a2 t3

	li 	a7 64
	ecall
	mv 	a0 t4
	jal 	closeFile
    	pop(ra)
    	ret

# Prints double.
.global printDouble
printDouble:
	push(ra)
	li a7 3
	ecall
	pop(ra)
	ret
	
# New line.
.globl newLine
newLine:
	push(ra)
	li      a7 11 
	li      a0 10
	ecall
	pop(ra)
	ret

# Shows a dialog with text.
.globl messageBox
messageBox:
	push(ra)
	li a7 55
	ecall
	pop(ra)
	ret
