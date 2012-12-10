accessing
getV

	self isDecomposed not ifTrue: [ self decompose ].
	^V