instance creation - protein
newProtein: aString
	" Answer a new instance of the receiver with aString as the protein sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACProtein new