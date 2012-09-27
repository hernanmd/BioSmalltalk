accessing
characters: aString
	" See superimplementor´s comment "

	catchNodes
		ifFalse: [ ^ self ].
	self saveERecordValue: aString.
	self catchOff

		

