testing
includesName: aString
	"Answer whether the receiver contains a sequence named aString."

	^ (self names asLowercase includes: aString asLowercase) 
		or: [self synonyms asLowercase includes: aString asLowercase]