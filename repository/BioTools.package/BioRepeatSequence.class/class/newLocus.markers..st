instance creation
newLocus: aBioLocus markers: anObject
	" Answer a new object representing a Microsatellite marker "
	
	^ self new
		locus: aBioLocus;
		positions: anObject;
		yourself