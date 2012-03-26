accessing
alphabet: aBioAlphabetClass
	" Set the receiver's fasta records alphabet to aBioAlphabetClass "
	
	^ self records do: [: record | record alphabet: aBioAlphabetClass ]
