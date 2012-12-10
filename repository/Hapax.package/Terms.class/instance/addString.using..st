adding
addString: string using: scannerClass

	| scanner |
	scanner := scannerClass new.
	scanner onString: string.
	[ scanner atEnd ] whileFalse: [ self add: scanner next ].