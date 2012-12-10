private
setValue: aNumber at: anIndex

	| spot |
	spot := self internalIndexOf: anIndex.
	spot > 0
		ifTrue: [ (contents at: spot) value: aNumber ]
		ifFalse: [ contents add: anIndex -> aNumber beforeIndex: spot negated ]