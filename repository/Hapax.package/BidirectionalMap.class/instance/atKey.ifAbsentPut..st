accessing
atKey: key ifAbsentPut: valueBlock

	| value |
	value := self atKey: key.
	value == nil ifTrue: [ value := self at: key put: valueBlock value	].
	^value