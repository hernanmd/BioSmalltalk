private
validatePosition: anObject
	" Answer a <Number> matching aString "

	anObject isNumber 
		ifTrue: [ ^ anObject ].
	^ (anObject notNil and: [ anObject isAllDigits ])
		ifFalse: [ self nullValue negated ]
		ifTrue: [ anObject asNumber ]