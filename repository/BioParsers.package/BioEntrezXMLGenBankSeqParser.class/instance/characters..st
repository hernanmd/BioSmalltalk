accessing
characters: arg1
	catchNodes
		ifTrue: [ self newERecordValue: arg1 ].
	self catchOff