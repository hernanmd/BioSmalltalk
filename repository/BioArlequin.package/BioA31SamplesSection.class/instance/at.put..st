accessing
at: keyString put: valueString
	" Specialized to support non-unique entries in a section "

	| properKey |
	
	" Esto es porque se indexa cada sample con un número, SampleName es el comienzo de otro sample "
	self halt.
	properKey := keyString isVariableBinding ifTrue: [ keyString key ] ifFalse: [ keyString ].
	^ self iniFile 
			section: self sampleKeyNumber
			at: properKey
			put: valueString			
