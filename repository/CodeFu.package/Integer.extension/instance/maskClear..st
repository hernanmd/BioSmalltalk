*codefu
maskClear: mask 
	"Treat the argument as a bit mask.  Answer a copy of the receiver with the
	corresponding bits turned off."

	^self bitAnd: (mask bitInvert)