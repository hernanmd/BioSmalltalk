writing
writeQuoted: assoc on: aStream

	( self shouldQuote: assoc key )
		ifTrue: [ 
			aStream
				nextPutAll: ( assoc value ifNil: [''] ) between: $" -> $" ]
		ifFalse: [
			aStream
				nextPutAll: ( assoc value ifNil: [''] ) ].
	aStream cr