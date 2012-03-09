instance creation - rna
newAmbiguousRNA: aString
	" Answer a new instance of the receiver with aString as the sequence string "
	
	^ super new 
		initializeWith: aString
		alphabet: BioIUPACAmbiguousRNA new