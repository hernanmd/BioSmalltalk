initialize-release
initializeWith: aString alphabet: anAlphabet
	" Private - Initialize the receiver's sequence to be aString
	and anAlphabet. Notice the receiver knows how to
	instantiate the alphabet "
	
	seq := aString.
	alphabet := anAlphabet