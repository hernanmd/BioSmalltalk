instance creation
readFromSparseText: aStream

	| m n matrix |
	m := Integer readFrom: aStream skipSeparators.
	n := Integer readFrom: aStream skipSeparators.
	Integer readFrom: aStream skipSeparators.
	matrix := self rows: m columns: n withAll: Number zero.
	1 to: n do: [ :column |
		1 to: (Integer readFrom: aStream skipSeparators) do: [ :unused |
			matrix at: (Integer readFrom: aStream skipSeparators) + 1 and: column put: (Number readFrom: aStream skipSeparators).
		]
	].
	^matrix