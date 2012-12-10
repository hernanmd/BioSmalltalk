testing
includes: aString

	| size |
	aString ifNil: [^false].
	size := aString size.
	^((size > 0) and: [ size <= array size ]) and: [ (array at: size) includes: aString ].