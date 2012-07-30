initialize-release
initializeAlphabetFrom: aString
	" Private - Set the receiver's alphabet guessing from aString
	or assigning a default if not possible "

	alphabet :=
	 	[ ( BioAlphabet guessAlphabetFrom: aString ) new ]
		on: BioErrorSpecificationObject
		do: [: ex | 
				self bioLog: ex messageText.
				self defaultAlphabetClass new ]