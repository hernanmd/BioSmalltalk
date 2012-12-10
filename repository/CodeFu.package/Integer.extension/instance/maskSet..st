*codefu
maskSet: mask 
	"Treat the argument as a bit mask.  Answer a copy of the receiver with the
	corresponding bits turned on."

	^self bitOr: mask