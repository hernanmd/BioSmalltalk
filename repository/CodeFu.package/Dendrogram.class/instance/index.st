accessing
index

	^self isRoot
		ifTrue: [ 1 ]
		ifFalse: [ self isLeft
			ifTrue: [ self parent index ]
			ifFalse: [ self parent index + self parent left size ]]