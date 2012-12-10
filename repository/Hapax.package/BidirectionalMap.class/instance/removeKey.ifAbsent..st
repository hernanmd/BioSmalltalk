removing
removeKey: key ifAbsent: exceptionBlock

	| value |
	value := forwards removeKey: key ifAbsent: exceptionBlock.
	backwards removeKey: value.
	[ self checkInvariant ] assert.
	^value