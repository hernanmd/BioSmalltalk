instance creation
newNamed: aString
	" Answer a new instance of the receiver named aNameString. "
	
	^ self new 
		name: aString;
		yourself