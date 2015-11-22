instance creation
newNamed: aNameString sequence: aSeqString
	" Answer a new instance of the receiver using aString as sequence. Alphabet is guessed from aSeqString "
	
	^ self new 
		initializeWith: aSeqString;
		name: aNameString;
		yourself