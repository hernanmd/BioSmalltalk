private
validatePosition: aString 
	" Answer a <Number> matching aString "

	^ (aString notNil and: [ aString isAllDigits ])
		ifFalse: [ self nullValue negated ]
		ifTrue: [ aString asNumber ]