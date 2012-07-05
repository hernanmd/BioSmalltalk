testing
includesName: aString
	" Answer <true> if the receiver includes aString in its names "

	| breedName |
	
	breedName := aString copyUpToStartParenthesis asLowercase.
	^ ( self names asLowercase includes: breedName  )
		or: [ self synonyms asLowercase includes: breedName ]