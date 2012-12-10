accessing
getS

	self isDecomposed not ifTrue: [ self decompose ].
	^S