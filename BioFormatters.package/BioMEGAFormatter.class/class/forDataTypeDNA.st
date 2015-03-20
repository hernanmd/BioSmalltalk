instance creation
forDataTypeDNA
	" Answer a new instance configured for containing nucleotide sequence data "
	
	^ self new 
		formatType: 'DNA';
		yourself