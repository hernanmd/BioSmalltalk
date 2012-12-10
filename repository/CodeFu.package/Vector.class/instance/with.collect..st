enumerating
with: vector collect: aBlock

	| newVector |
	(vector hasSize: self size) ifFalse: [ ^self noMatchError ].
	newVector := self species new: self size.
	1 to: self size do: [ :index |
		newVector at: index put: (aBlock value: (self at: index) value: (vector at: index))
	].
	^newVector