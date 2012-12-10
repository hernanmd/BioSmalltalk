accessing
at: name ifPresent: unaryBlock

	^unaryBlock value: (self at: name 
		ifAbsent: [ ^self ]).