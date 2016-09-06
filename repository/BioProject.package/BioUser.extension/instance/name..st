accessing
name: aStringName

	aStringName isString
		ifTrue: [ name := aStringName ]
		ifFalse: [ self signalInvalidObject: aStringName ]