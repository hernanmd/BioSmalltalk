removing
removeValue: value ifAbsent: exceptionBlock

	| key |
	key := backwards removeKey: value ifAbsent: exceptionBlock.
	forwards removeKey: key.
	[ self checkInvariant ] assert.
	^key