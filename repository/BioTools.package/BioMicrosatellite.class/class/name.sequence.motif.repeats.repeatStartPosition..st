instance creation
name: nameString sequence: seqString motif: motifString repeats: repNumber repeatStartPosition: repStartNumber
	" Answer a new object representing a Microsatellite marker "
	
	^ (self newAmbiguousDNA: seqString named: nameString)
		motif: motifString;
		repeats: repNumber;
		repeatStartPosition: repStartNumber;
		yourself