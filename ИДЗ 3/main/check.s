.include "macro_functs.s"
.include "macro_in_ou.s"

# Makes sure the string is neither empty no too long.
.globl checkStrSize
checkStrSize:
	push(ra)
	bnez a1 incorrect_str
	li a0 0
	pop(ra)
	ret
	
	incorrect_str:
	mv t0 a1
	
	# Checking path
	# if it is empty
	li t1 -2
	beq t0 t1 empty_str
	
	li t1 -3
	beq t0 t1 empty_str
	
	# if it is too long.
	li t1 -4
	beq t0 t1 long_str
	
	# Empty error.
	empty_str:
	messageBox("It can't be empty", 0)
	li a0 1
	pop(ra)
	ret
	
	# Too long path error.
	long_str:
	messageBox("Make it shorter", 0)
	li a0 1
	pop(ra)
	ret
	
# Checks if file exists.
.globl checkFile
checkFile:
	push(ra)
	# opening file
	openFile(a0, 0)
	mv t2 a0 # save file descr
	li t1 -1
	beq t2 t1 error
	# closing file
	closeFile(t2)
	li a0 0
	pop(ra)
	ret
	
	# file is not exist or some other problems
	error:
	messageBox("Can't find and open this file!", 0)
	li a0 1
	pop(ra)
	ret
	
