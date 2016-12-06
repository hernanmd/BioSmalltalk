instance creation
newLocus: aBioMicrosatelliteLocus markers: anObject
	" Answer a new object representing a Microsatellite marker "
	
	^ self new
		locus: aBioMicrosatelliteLocus;
		positions: anObject;
		yourself