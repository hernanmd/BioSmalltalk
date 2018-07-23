accessing
occurrencesOfLetters
	" Answer a <Dictionary> of occurrence mappings for the receiver "
	
	| occurrences |
	
	occurrences := Dictionary new.
	self do: [ : each | 
		occurrences 
			at: each asUppercase 
			put: (occurrences at: each asUppercase ifAbsentPut: [ 0 ]) + 1 ].
	^ occurrences