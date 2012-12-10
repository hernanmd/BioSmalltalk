enumerating
with: vector affect: aBlock

	(vector hasSize: self size) ifFalse: [ ^self noMatchError ].
	1 to: self size do: [ :index |
		self at: index put: (aBlock value: (self at: index) value: (vector at: index))
	].
	^self