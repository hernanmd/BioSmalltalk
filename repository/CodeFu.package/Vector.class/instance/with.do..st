enumerating
with: vector do: aBlock

	(vector hasSize: self size) ifFalse: [ ^self noMatchError ].
	1 to: self size do: [ :index |
		aBlock value: (self at: index) value: (vector at: index)
	].
	^self