initialize-release
initializeName: aNameString sequence: aString alphabet: anAlphabet
	" Private - Initialize the receiver "
	
	self name: aNameString.
	self sequence: (aString asSequenceForAlphabet: anAlphabet).