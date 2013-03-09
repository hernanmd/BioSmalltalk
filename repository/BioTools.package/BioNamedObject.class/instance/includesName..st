testing
includesName: aString
	" Answer <true> if receiver contains aString in any of its names "

	^ (self names collect: #asLowercase) includes: aString asLowercase