testing
validate: anObject
	" Answer true if the receiver may accept
	anObject as a valid value "
	
	^ self range isNil
		ifFalse: [ self range includes: anObject ]
		ifTrue: [ self defaultValue isKindOf: anObject class ]