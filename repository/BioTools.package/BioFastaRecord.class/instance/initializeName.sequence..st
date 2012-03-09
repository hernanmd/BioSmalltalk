initialize-release
initializeName: aNameString sequence: aString
	" Private - Initialize the receiver "
	
	self name: aNameString.
	self sequence: ( aString asSequenceForAlphabet: BioNullAlphabet ).