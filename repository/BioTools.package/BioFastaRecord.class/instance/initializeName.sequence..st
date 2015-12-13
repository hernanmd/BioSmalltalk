initialize-release
initializeName: aNameString sequence: aString
	" Private - Initialize the receiver's name and sequence "
	
	self name: aNameString.
	self sequence: (aString asSequenceForAlphabet: BioNullAlphabet).