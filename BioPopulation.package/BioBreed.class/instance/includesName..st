testing
includesName: aString
	"Answer whether the receiver contains a sequence named aString."

	| lcs |
	lcs := aString asLowercase.
	^ (self names asLowercase includes: lcs) or: [ self synonyms asLowercase includes: lcs ]