accessing
at: keyString put: valueString

	^ self iniFile 
		section: self label 
			at: (keyString isVariableBinding ifTrue: [ keyString key ] ifFalse: [ keyString ])
			put: valueString