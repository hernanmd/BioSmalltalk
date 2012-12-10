accessing
at: anIndex

	| spot |
	spot := self internalIndexOf: anIndex.
	^spot > 0
		ifTrue: [ (contents at: spot) value ]
		ifFalse: [ 0 ]