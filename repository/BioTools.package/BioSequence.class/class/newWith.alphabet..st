instance creation
newWith: aString alphabet: anAlphabet
	" Answer a new instance of the receiver with aString as the sequence and anAlphabet as the alphabet for the sequence "
	
	^ anAlphabet isBehavior
		ifTrue: [ 
			self new 
				initializeWith: aString
				alphabet: anAlphabet new ]
		ifFalse: [
			self new 
				initializeWith: aString
				alphabet: anAlphabet ]