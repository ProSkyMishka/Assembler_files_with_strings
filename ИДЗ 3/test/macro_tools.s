# Allocates new memory in heap.
.macro alloc_im %bytesSize
	li a0 %bytesSize
	jal alloc
.end_macro 

# Allocates new memory in heap.
.macro alloc_reg %reg
	mv a0 %reg
	jal alloc
.end_macro 

# Check if string is palindrom
.macro checkingPalind %x
	mv a0 %x
	jal palindrom
.end_macro
