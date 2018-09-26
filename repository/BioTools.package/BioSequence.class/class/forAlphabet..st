instance creation - dna
forAlphabet: aBioAlphabetClass
	" Answer a new instance of the receiver with aBioAlphabetClass as its alphabet "
	
	^ self new 
		alphabet: aBioAlphabetClass new;
		yourself