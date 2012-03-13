accessing
at: keyString

	^ self 
		at: ( keyString isVariableBinding ifTrue: [ keyString key ] ifFalse: [ keyString ] )
	 	ifAbsent: [self error: 'No value specified for key in section']