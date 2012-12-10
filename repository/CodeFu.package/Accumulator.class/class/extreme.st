instance creation
extreme

	^self value: 0 using: [ :extreme :each | 
		extreme abs > each abs 
			ifTrue: [ extreme ]
			ifFalse: [ each ]
	]