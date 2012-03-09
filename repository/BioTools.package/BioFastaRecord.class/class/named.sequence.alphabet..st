instance creation
named: aNameString sequence: aSequence alphabet: anAlphabetString
	" Answer a new instance of the receiver with header line
	aNameString and aSeqString as sequence "
	
	^ self new
			initializeName: aNameString 
			sequence: aSequence 
			alphabet: anAlphabetString;
			yourself