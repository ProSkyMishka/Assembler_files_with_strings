# check the path
.macro checkStrSize %path, %codeRegister
	mv a0 %path
	mv a1 %codeRegister
	jal checkStrSize
.end_macro

# Checks if file exists.
.macro checkFile %file
	mv a0 %file
	jal checkFile
.end_macro
