instance creation
forDataTypeDistance
	" Answer a new instance configured for containing nucleotide sequence data "
	
	^ self new 
		formatType: 'Distance';
		yourself