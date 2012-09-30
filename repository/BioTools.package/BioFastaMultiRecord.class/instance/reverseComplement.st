accessing
reverseComplement
	" Answer a copy of the receiver's sequence complemented and with element order reversed. "
	
	^ self class basicNew 
			initializeWith: (self sequences collect: #reverseComplement)
