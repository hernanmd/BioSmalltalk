accessing
getU

	self isDecomposed not ifTrue: [ self decompose ].
	^U