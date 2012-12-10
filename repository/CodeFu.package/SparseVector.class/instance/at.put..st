accessing
at: anIndex put: aNumber

	aNumber isZero
		ifTrue: [ self removeValueAt: anIndex ]
		ifFalse: [ self setValue: aNumber at: anIndex ].
	^aNumber