.include "macro_functs.s"

# Allocates new memory in heap.
.globl alloc
alloc:
	push(ra)
	li a7, 9
    ecall
    pop(ra)
    ret
		
# Check if string is palindrom
.globl palindrom
palindrom:
	li a1 1
	mv 	t0 a0 	# t0 - current string address from the end
	mv 	t1 a0 	# t1 - current string address from the beginning
	li 	a0 0
	
loop:	lb 	t2 (t0) # make t0 adress of the fin element
	beqz	t2 fin
	addi	t0 t0 1
	b	loop
fin:	addi	t0 t0 -1 # as we don't consider fin elemenet, we have to sub 0ne from t0
loop_1:	beq 	t0 t1 return	# if t0 and t1 are equal, we finish our checking
	lb	t2 (t1)
	lb	t3 (t0)
	bne 	t2 t3 not_eq	# if two elements are not equal, our string is not palindrom
	addi	t1 t1 1
	beq 	t0 t1 return
	addi	t0 t0 -1
	b	loop_1
return:	ret
not_eq:	li	a0 1	# if string is palindrom a0 = 0, if not - a0 = 1
	ret
	

	
