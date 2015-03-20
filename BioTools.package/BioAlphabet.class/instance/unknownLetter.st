accessing
unknownLetter
	" Answer a Character representative when a letter in the receiver is unknown "

	^ unknownElement
		ifNil: [ unknownElement := self defaultUnknownElement ]