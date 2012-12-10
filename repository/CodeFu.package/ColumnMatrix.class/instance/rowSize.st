accessing
rowSize

	^columns isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ columns last size ]