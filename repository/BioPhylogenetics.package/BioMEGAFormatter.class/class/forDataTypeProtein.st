instance creation
forDataTypeProtein
	" Answer a new instance configured for containing Protein sequence data "
	
	^ self new 
		formatType: 'Protein';
		yourself