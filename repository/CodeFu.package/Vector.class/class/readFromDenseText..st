instance creation
readFromDenseText: aStream

	| size vector |
	size := Integer readFrom: aStream skipSeparators.
	vector := self new: size.
	1 to: size do: [ :index |
		vector at: index put: (Number readFrom: aStream skipSeparators).
	].
	^vector