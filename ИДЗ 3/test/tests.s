.include "macro_functs.s"
.include "macro_in_ou.s"
.include "macro_tools.s"

.eqv 	b_size 512

.data
	yes:		.asciz 	"Yes"
	no:		.asciz 	"No"

	input1: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/input1.txt"
	result1: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/result1.txt"
	
	input2: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/input2.txt"
	result2: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/result2.txt"
	
	input3: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/input3.txt"
	result3: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/result3.txt"
	
	input4: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/input4.txt"
	result4: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/result4.txt"
	
	input5: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/input5.txt"
	result5: .asciz "/Users/mihailprozorskij/АВС/ИДЗ 3/test/tests/result5.txt"
	
.text

main:
	push(ra)
	
Test1:
	readFile(input1, b_size)
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
	writeToFile(result1, s0, t3)

Test2:
	readFile(input2, b_size)
	mv s0 a0
	# check if the string is palindrom
	checkingPalind(s0)
	
	# if it is true, set string Yes in a0, if not - set No
	li	t3 3
	beqz 	a0 ye2
	la	a0 no
	j	cont2
	
ye2:	la	a0 yes
	addi	t3 t3 1
	
cont2:	mv 	s0 a0

	# write the result of checking in the result file
	writeToFile(result2, s0, t3)
	
Test3:
	readFile(input3, b_size)
	mv s0 a0
	# check if the string is palindrom
	checkingPalind(s0)
	
	# if it is true, set string Yes in a0, if not - set No
	li	t3 3
	beqz 	a0 ye3
	la	a0 no
	j	cont3
	
ye3:	la	a0 yes
	addi	t3 t3 1
	
cont3:	mv 	s0 a0

	# write the result of checking in the result file
	writeToFile(result3, s0, t3)
	
Test4:
	readFile(input4, b_size)
	mv s0 a0
	# check if the string is palindrom
	checkingPalind(s0)
	
	# if it is true, set string Yes in a0, if not - set No
	li	t3 3
	beqz 	a0 ye4
	la	a0 no
	j	cont4
	
ye4:	la	a0 yes
	addi	t3 t3 1
	
cont4:	mv 	s0 a0

	# write the result of checking in the result file
	writeToFile(result4, s0, t3)
	
Test5:
	readFile(input5, b_size)
	mv s0 a0
	# check if the string is palindrom
	checkingPalind(s0)
	
	# if it is true, set string Yes in a0, if not - set No
	li	t3 3
	beqz 	a0 ye5
	la	a0 no
	j	cont5
	
ye5:	la	a0 yes
	addi	t3 t3 1
	
cont5:	mv 	s0 a0

	# write the result of checking in the result file
	writeToFile(result5, s0, t3)
	
exit
