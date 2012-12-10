instance creation
withDiagonal: vector

	| newMatrix |
	newMatrix := self new: vector size.
	1 to: vector size do: [ :index |
		newMatrix at: index and: index put: (vector at: index)
	].
	^newMatrix