instance creation - dna
newAmbiguousDNA: aString named: aName
	" Answer a new instance of the receiver with aString as the sequence "
	
	^ self new 
		name: aName;
		initializeWith: aString
		alphabet: BioIUPACAmbiguousDNA new