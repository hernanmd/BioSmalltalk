instance creation
fromTabbedAlleles: aString
	" Answer a new instance of the receiver using a space tokenized <String> as input as contents "
	
	^ self new
		initializeFromTabbedAlleles: aString;
		yourself