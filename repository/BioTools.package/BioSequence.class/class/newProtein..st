instance creation - protein
newProtein: aString
	" Answer a new instance of the receiver with aString as the protein sequence string "
	
	^ super new 
		initializeWith: aString
		alphabet: BioIUPACProtein new