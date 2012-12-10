arithmetic
reciprocal

	^self collect: [ :each | each isZero ifTrue: [ each ] ifFalse: [ each reciprocal ] ].