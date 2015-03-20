testing
isStartCodon: aCodon
	" Answer <true> if aCodon is a start codon in the receiver "
	
	^ self startCodons includes: aCodon asUppercase