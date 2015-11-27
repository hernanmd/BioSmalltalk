accessing
at: anInteger put: aLetter
	" Store aLetter in the position of the receiver indicated by the anInteger. Answer the receiver "
	
	self signalInvalidObject: 'Sequence is read-only. Use #asMutable to enable modifications it then #asSequence' 