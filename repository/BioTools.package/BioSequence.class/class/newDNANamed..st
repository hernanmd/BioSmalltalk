instance creation - dna
newDNANamed: aString
	" Answer a new instance of the receiver with aString as its name "
	
	^ self new
		name: aString;
		alphabet: BioIUPACAmbiguousDNA new		
		yourself