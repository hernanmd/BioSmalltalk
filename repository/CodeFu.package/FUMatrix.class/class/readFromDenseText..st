instance creation
readFromDenseText: aStream

	| m n matrix |
	m := Integer readFrom: aStream skipSeparators.
	n := Integer readFrom: aStream skipSeparators.
	matrix := self rows: m columns: n.
	1 to: m do: [ :row |
		1 to: n do: [ :column |
			matrix at: row and: column put: (Number readFrom: aStream skipSeparators).
		]
	].
	^matrix