accessing
sortedCodes
	" Answer a <String> with the receiver's allowed letters sorted lexicographically "

	^ self codes asSortedCollection joinUsing: ''