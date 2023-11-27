# macrolib

# Store into stack.
.macro push(%x)
	addi	sp, sp, -4
	sw	%x, (sp)
.end_macro

# Pop the value from the stack.
.macro pop(%x)
	lw	%x, (sp)
	addi	sp, sp, 4
.end_macro

# Stop program
.macro exit
    li a7, 10
    ecall
.end_macro
