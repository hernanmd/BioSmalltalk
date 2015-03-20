testing
includesExtension: aString
	" Answer <true> if receiver is represented as file with extension aString "

	^ (self extensions collect: #asLowercase) includes: aString asLowercase