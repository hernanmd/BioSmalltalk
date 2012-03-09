accessing
alphabet

	^ alphabet
		ifNil: [ alphabet := self defaultAlphabetClass new ]