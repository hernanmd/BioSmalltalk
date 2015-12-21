initialize-release
initializeWith: aString
	" Private - Initialize the receiver's sequence to be aString "
	
	size := aString size.
	alphabet := self defaultAlphabetClass new.