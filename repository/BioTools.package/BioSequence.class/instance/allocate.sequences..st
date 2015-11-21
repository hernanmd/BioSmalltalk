accessing
allocate: count sequences: sequenceCollection
	" Create new count empty mutable sequences in sequenceCollection "
	
	count timesRepeat: [ sequenceCollection add: (BioMutableSeq newUnambiguousDNA: String empty) ]