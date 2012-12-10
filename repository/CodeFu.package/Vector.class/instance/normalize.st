vector functions
normalize
	"comment stating purpose of message"

	| len |
	len := self length.
	len isZero
		ifTrue: [ self atAllPut: len ]
		ifFalse: [ self /= self length ].
	^self