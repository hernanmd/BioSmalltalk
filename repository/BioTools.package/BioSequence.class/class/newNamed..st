instance creation
newNamed: aNameString
	" Answer a new instance of the receiver named aNameString. No alphabet is guessed "
	
	^ self new 
		name: aNameString;
		yourself