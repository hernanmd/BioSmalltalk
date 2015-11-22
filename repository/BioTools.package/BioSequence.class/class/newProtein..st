instance creation - protein
newProtein: aString
	" Answer a new instance of the receiver with aString as its protein sequence string "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACProtein new