arithmetic
roundTo: aNumber

	^self collect: [ :each | each roundTo: aNumber ].