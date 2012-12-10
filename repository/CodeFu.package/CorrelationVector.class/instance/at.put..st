accessing
at: anIndex put: aNumber
	"Store a number between 1.0 and -1.0 at the given index.
	The number is stores as 16-bit integer; nil is stored as zero."

	self unsignedShortAt: (anIndex << 1) - 1 put: (
		nil == aNumber ifTrue: [ 0 ] ifFalse: [ (aNumber * 16r7FFF + 16r8000) truncated ]).
	^aNumber