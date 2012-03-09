instance creation - dna
newUnambiguousDNA: aString
	" Answer a new instance of the receiver with aString
	as the sequence "
	
	^ super new 
		initializeWith: aString
		alphabet: BioIUPACUnambiguousDNA new