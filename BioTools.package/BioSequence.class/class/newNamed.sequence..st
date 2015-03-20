instance creation
newNamed: aNameString sequence: aSeqString
	" Answer a new instance of the receiver using aString as sequence and guessing the alphabet "
	
	^ self new 
		initializeWith: aSeqString;
		name: aNameString;
		yourself