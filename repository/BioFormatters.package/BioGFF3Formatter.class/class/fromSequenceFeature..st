instance creation
fromSequenceFeature: aBioSequenceFeature
	" Answer a new instance of the receiver using information from aBioSequenceFeature "
	
	^ self new 
		sequenceFeature: aBioSequenceFeature;
		yourself