accessing
at: keyString put: valueString
	" Specialized to support non-unique entries in a section "

	| properKey |
	
	properKey := keyString isVariableBinding ifTrue: [ keyString key ] ifFalse: [ keyString ].
	^ self iniFile 
			section: self sampleKeyNumber
			at: properKey
			put: valueString			
