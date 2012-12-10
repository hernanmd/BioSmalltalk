vector functions
unitVector
	"comment stating purpose of message"

	self isZero ifTrue: [ ^self ].
	^self / self length