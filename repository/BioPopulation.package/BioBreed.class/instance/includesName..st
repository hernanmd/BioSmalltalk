testing
includesName: aString
	"Answer whether the receiver contains a sequence named aString."

	| lcs allNames allSyns |
	lcs := aString asLowercase trimBoth. 
	allNames := self names asLowercase trimBoth.
	allSyns := self synonyms asLowercase trimBoth.
	^ (allNames includes: lcs) or: [ allSyns includes: lcs ]