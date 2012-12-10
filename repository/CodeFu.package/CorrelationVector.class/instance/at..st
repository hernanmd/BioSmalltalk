accessing
at: anIndex
	"Answer a number between 1.0 and -1.0 at the given index.
	The numbers are internally stored as 16-bit integer; and nil as zero."

	| short |
	short := self unsignedShortAt: (anIndex << 1) - 1.
	^0 == short
		ifTrue: [ nil ]
		ifFalse: [ (short - 16r8000) asFloat / 16r7FFF ]