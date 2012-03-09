testing
isStopCodon: aCodon
	" Answer <true> if aCodon is a stop codon in the receiver "
	
	^ self stopCodons includes: aCodon asUppercase