instance creation
named: aBioObject sequence: aSequence
	" Answer a new instance of the receiver with header line aNameString and aSeqString as sequence "
	
	^ self new
			initializeName: aBioObject asString 
			sequence: aSequence;
			yourself