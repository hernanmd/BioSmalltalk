instance creation
for: aString
	" Answer a new instance of the receiver using the
	sequence aString "
	
	^ (self guessAlphabetFrom: aString) new