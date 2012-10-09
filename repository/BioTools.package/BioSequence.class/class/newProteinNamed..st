instance creation - protein
newProteinNamed: aString
	" Answer a new instance of the receiver with aString as its name "
	
	^ self new
		name: aString;
		alphabet: BioIUPACProtein new		
		yourself