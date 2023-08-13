Extension { #name : #PPPredicateObjectParser }

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> dnaAmbiguousLetter [
	" Answer a parser for a DNA letter, using ambiguous IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACAmbiguousDNA codes asUppercase , 
		BioIUPACAmbiguousDNA codes asLowercase
		
]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> dnaAmbiguousLetterGapped [
	" Answer a parser for a DNA letter, using ambiguous IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACAmbiguousDNA codes asUppercase , 
		BioIUPACAmbiguousDNA codes asLowercase ,
		'-'
		
]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> dnaLetter [
	" Answer a parser for a DNA letter, using unambiguous IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACUnambiguousDNA codes asUppercase , 
		BioIUPACUnambiguousDNA codes asLowercase
		
]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> dnaLetterAllowingMissing [
	" Answer a parser for a DNA letter, using unambiguous IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACUnambiguousDNA codes asUppercase , 
		BioIUPACUnambiguousDNA codes asLowercase ,
		'-'
		
]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> dnaSequence [
	" Answer a parser for a DNA sequence, using unambiguous IUPAC nomenclature "
	
	^ self dnaLetter plus flatten end
		
]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> number [
	" Answer a parser for parsing any sequence of digits "
	
	^ #digit asParser plus flatten

]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> proteinLetter [
	" Answer a parser for a protein letter, using extended IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACProteinExtended codes asUppercase , 
		BioIUPACProteinExtended codes asLowercase ,
		'?-'
]

{ #category : #'*BioParsers' }
PPPredicateObjectParser class >> proteinSequence [
	" Answer a parser for Protein sequences, using IUPAC nomenclature "
	
	^ self proteinLetter plus flatten end
		
]
