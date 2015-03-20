accessing
isStopCodon: aCodon
	" Answer <true> if aCodon is a stop codon in the receiver "
	
	^ self currentCodonTable isStopCodon: aCodon