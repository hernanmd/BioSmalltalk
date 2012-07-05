testing
includesName: aString

	^ ( self names asLowercase includes: aString asLowercase ) 
		or: [ self synonyms asLowercase includes: aString asLowercase ]