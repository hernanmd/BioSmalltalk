instance creation
named: aBioObject sequence: aSequence alphabet: anAlphabetString
	" Answer a new instance of the receiver with header line
	aNameString and aSeqString as sequence "
	
	^ self new
			initializeName: aBioObject asString 
			sequence: aSequence 
			alphabet: anAlphabetString;
			yourself