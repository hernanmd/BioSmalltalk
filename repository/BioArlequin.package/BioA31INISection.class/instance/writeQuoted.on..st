writing
writeQuoted: assoc on: aStream

	(self shouldQuote: assoc key)
		ifTrue: [ aStream nextPutAll: (assoc value ifNil: [ '' ]) between: $" and: $" ]
		ifFalse: [ aStream nextPutAll: (assoc value ifNil: [ '' ]) ].
	aStream nextPutTerminator