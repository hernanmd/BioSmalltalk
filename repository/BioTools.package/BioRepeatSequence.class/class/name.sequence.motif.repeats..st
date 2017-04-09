instance creation
name: nameString sequence: seqString motif: motifString repeats: repNumber
	" Answer a new object representing a tandem repeat sequence "
	
	^ (self newAmbiguousDNA: seqString named: nameString)
		motif: motifString;
		repeats: repNumber;
		yourself