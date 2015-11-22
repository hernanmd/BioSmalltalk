instance creation
newWith: aString
	" Answer a new instance of the receiver using aString as sequence. Alphabet is guessed "
	
	^ self new initializeWith: aString