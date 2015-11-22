instance creation - dna
newAmbiguousDNA: aString
	" Answer a new instance of the receiver with aString as its sequence "
	
	^ self new 
		initializeWith: aString
		alphabet: BioIUPACAmbiguousDNA new