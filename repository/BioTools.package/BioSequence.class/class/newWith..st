instance creation
newWith: aString
	" Answer a new instance of the receiver using aString as sequence and guessing the alphabet "
	
	^ self new initializeWith: aString