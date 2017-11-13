instance creation
fromSpacedAlleles: aString
	" Answer a new instance of the receiver using a space tokenized <String> as input as contents "
	
	^ self new
		initializeFromSpacedAlleles: aString;
		yourself