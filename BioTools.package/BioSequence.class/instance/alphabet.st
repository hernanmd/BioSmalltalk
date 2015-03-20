accessing
alphabet
	" Answer a <BioAlphabet> representing the receiver's sequence alphabet "

	^ alphabet
		ifNil: [ alphabet := self defaultAlphabetClass new ]