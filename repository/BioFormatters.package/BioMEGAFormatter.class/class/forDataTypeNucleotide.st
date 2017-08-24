instance creation
forDataTypeNucleotide
	" Answer a new instance configured for containing nucleotide sequence data "
	
	^ self new 
		formatType: 'Nucleotide';
		yourself