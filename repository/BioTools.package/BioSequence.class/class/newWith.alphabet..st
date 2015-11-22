instance creation
newWith: aString alphabet: aBioAlphabet
	" Answer a new instance of the receiver with aString as the sequence and anAlphabet as the alphabet for the sequence "
	
	^ aBioAlphabet isBehavior
		ifTrue: [ 
			self new 
				initializeWith: aString
				alphabet: aBioAlphabet new ]
		ifFalse: [
			self new 
				initializeWith: aString
				alphabet: aBioAlphabet ]