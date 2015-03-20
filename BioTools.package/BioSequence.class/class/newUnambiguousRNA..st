instance creation - rna
newUnambiguousRNA: aString
	" Answer a new instance of the receiver with aString as the sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACUnambiguousRNA new