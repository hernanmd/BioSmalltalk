initialize-release
initializeWith: aString
	" Private - Initialize the receiver's sequence to be aString "
	
	seq := aString.
	self initializeAlphabetFrom: aString.
