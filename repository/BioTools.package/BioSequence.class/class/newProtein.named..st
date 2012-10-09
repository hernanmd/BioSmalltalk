instance creation - protein
newProtein: aString named: aName
	" Answer a new instance of the receiver with aString as the sequence "
	
	^ self new 
		name: aName;
		initializeWith: aString
		alphabet: BioIUPACProteinExtended new