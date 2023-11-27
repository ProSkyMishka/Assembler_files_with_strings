.include "macro_functs.s"
.include "macro_in_ou.s"
.include "macro_check.s"
.include "macro_tools.s"

.eqv 	p_count 256
.eqv 	b_size 512

.data
yes:		.asciz 	"Yes"
no:		.asciz 	"No"
in_path: 	.space p_count
ou_path: 	.space p_count
buffer: 	.space 13
answer: 	.space 2
.text

.globl main
main:
	push(ra)
read_input_file:
	# read the reading file path
	readString(in_path, p_count, "Enter the path of your file:")
	la t0 in_path
		
	# checking it
	checkStrSize(t0, a1)
	bnez a0 end
	
	# checking our file
	checkFile(t0)
	bnez a0 end
read_output_file:
	# read the result file path
	readString(ou_path, p_count, "Enter the path of result file:")
	la t0 ou_path
	
	# checking it	
	checkStrSize(t0, a1)
	bnez a0 end
	
	# get the text from file
	readFile(in_path, b_size)
	mv s0 a0

	# check if the string is palindrom
	checkingPalind(s0)
	
	# if it is true, set string Yes in a0, if not - set No
	li	t3 3
	beqz 	a0 ye
	la	a0 no
	j	cont
ye:	la	a0 yes
	addi	t3 t3 1
cont:	mv 	s0 a0

	# write the result of checking in the result file
	writeToFile(ou_path, s0, t3)
	
	# ask user if he/she wants to print the result of checkig to console
	readString(answer, 2, "Would you like to show the result at the console (Y/N): ")
	la 	s2 answer
	lb 	s3 (s2)
	# if user agreed and pressed Y key, the program shows result
	li 	s2 'Y'
	bne 	s2 s3 main_return
	printString_register(s0)
	
	# if user doesn't want it^ the program would stop
	main_return:
	pop(ra)
end:	exit
