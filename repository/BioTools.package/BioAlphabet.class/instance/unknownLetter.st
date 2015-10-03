accessing
unknownLetter
	" Answer a representative <Character> when a letter in the receiver is unknown "

	^ unknownElement
		ifNil: [ unknownElement := self defaultUnknownElement ]