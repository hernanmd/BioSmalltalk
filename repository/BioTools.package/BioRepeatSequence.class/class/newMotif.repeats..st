instance creation
newMotif: motifString repeats: repNumber
	" Answer a new object representing a tandem repeat sequence "
	
	^ self new
		motif: motifString;
		repeats: repNumber;
		yourself