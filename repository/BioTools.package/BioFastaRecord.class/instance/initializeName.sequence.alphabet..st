initialize-release
initializeName: aNameString sequence: aString alphabet: anAlphabet
	" Private - Initialize the receiver's name, sequence and alphabet "
	
	self name: aNameString.
	self sequence: (aString asSequenceForAlphabet: anAlphabet).