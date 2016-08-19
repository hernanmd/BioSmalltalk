accessing
characters: aString
	" See superimplementor´s comment "

	catchNodes 
		ifTrue: [ self newERecordValue: aString ].
	self catchOff
		

