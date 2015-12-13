accessing
reverseComplement
	" Answer a copy of the receiver's sequence complemented and with element order reversed. "
	
	| newInstance |
	
	newInstance := self class basicNew.
	^ newInstance 
		initializeName: self sequenceName
		sequence: self sequence reverseComplement
		alphabet: self sequence alphabet;
		yourself