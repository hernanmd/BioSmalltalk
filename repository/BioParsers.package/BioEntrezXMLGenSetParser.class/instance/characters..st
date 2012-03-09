accessing
characters: aString
	" See superimplementor´s comment "

	catchNodes
		ifTrue: [ 
			self saveERecordValue: aString.
			self catchOff ].

		

