instance creation - protein
newProteinExtended: aString
	" Answer a new instance of the receiver with aString as the protein sequence string "
	
	^ super new 
		initializeWith: aString
		alphabet: BioIUPACProteinExtended new