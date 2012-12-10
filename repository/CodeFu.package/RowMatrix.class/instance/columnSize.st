accessing
columnSize

	^rows isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ rows first size ]