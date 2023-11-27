# macrolib

# Reads integer and stores it into the given register.
.macro readInt_reg %destinationRegister
	jal readInt
	# Save the received value into the given register.
	mv %destinationRegister a0
.end_macro 

# Reads integer and stores it into the data segment with address, stored in a given register.
.macro readInt_address %address
	jal readIntegerFunction
	# Save the received value into the given address.
	lw a0 (%address)
.end_macro 

# Prints immediate integer.
.macro printInt_immediate %number
	# Pass the given number as a parameter.
	li a0 %number
	jal printIntegerFunction
.end_macro

# Prints integer from an address.
.macro printInt_address %address
	# Pass the given number as a parameter.
	sw a0 (%address)
	jal printIntegerFunction
.end_macro

# Prints integer from a register.
.macro printInt_register %reg
	# Pass the given number as a parameter.
	mv a0 %reg
	jal printIntegerFunction
.end_macro

# Reads a string of the given size to the given buffer, putting '0' as an end identifier.
.macro readString %buffer %size %user_hint
	.data
		hint_value: .asciz %user_hint
	
	.text
	la a0 hint_value
	la a1 %buffer
	li a2 %size
	
	jal readStr
.end_macro 


# Prints given string, given as an immediate.
.macro printString_immediate %text
	.data
		text_value: .asciz %text
	.text
		# Pass the value stored in the label as a parameter.
		la a0 text_value
		jal printStringFunction
.end_macro 

# Prints the string stored in the given address.
.macro printString_label %label
	# Pass the value stored in label as a parameter.
	la a0 %label
	jal printStringFunction
.end_macro

# Prints the string with the address stored in the given register.
.macro printString_register %register
	mv a0 %register
	jal printStr
.end_macro

# Prints the given char.
.macro printChar(%x)
	# Save the value to print into argument register.
   	li a0 %x
	jal printCharFunction
.end_macro

# Opens a file.
.macro openFile(%n, %opt)
	mv a0 %n
	li a1 %opt
	jal openFile
.end_macro

# Closes a file.
.macro closeFile(%d)
    mv   a0 %d
    jal closeFile
.end_macro

# Write to file macro
.macro writeToFile(%p, %b, %s)
	la a0 %p
	mv a2 %b
	mv a3 %s
	jal writeFile
.end_macro 	
	
# Macro of reading file
.macro readFile(%path, %s)
	la a0 %path
	li a1 %s
	jal readFile
.end_macro 

# Prints double.
.macro printDouble %register
	fmv.d fa0 %register
	jal printDoubleFunction
.end_macro 

# Creates a message box with text.
.macro messageBox %text %type
	.data
	message_text: .asciz %text
	.text 
	la a0 message_text
	li a1 %type
	jal messageBox
.end_macro 

# New line in the output.
.macro newline
	jal newLineFunction
.end_macro
