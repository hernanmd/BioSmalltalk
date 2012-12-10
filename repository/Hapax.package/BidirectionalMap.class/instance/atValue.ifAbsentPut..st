accessing
atValue: value ifAbsentPut: keyBlock

	| key |
	key := self atValue: value.
	key == nil ifTrue: [ self at: (key := keyBlock value) put: value ].
	^key