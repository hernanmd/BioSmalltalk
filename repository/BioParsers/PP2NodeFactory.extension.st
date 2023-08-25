Extension { #name : #PP2NodeFactory }

{ #category : #'*BioParsers' }
PP2NodeFactory >> dnaAmbiguousLetterGapped [
	" Answer a parser for a DNA letter, using ambiguous IUPAC nomenclature "
	
	^ PP2PredicateObjectNode anyOf: BioIUPACAmbiguousDNA lowercaseAndUppercaseCodesWithGap
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> dnaLetter [
	"Answer a parse to parse any uppercased or lowercased DNA nucleotide letter"

	^ PP2PredicateObjectNode anyOf: BioIUPACUnambiguousDNA lowercaseAndUppercaseCodes
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> dnaSequence [
	" Answer a parser for a DNA sequence, using unambiguous IUPAC nomenclature "
	
	^ self dnaLetter plus flatten end
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> dnaUnambiguousLetterGapped [
	" Answer a parser for a DNA letter, using ambiguous IUPAC nomenclature "
	
	^ PP2PredicateObjectNode anyOf: BioIUPACUnambiguousDNA lowercaseAndUppercaseCodesWithGap
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> number [

	^ PP2ExpressionGrammar new number
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> proteinLetterGapped [
	" Answer a parser for a protein letter, using extended IUPAC nomenclature "
	
	^ PP2PredicateObjectNode anyOf: BioIUPACProteinExtended lowercaseAndUppercaseCodesWithGap
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> punctuation [

	^ PP2PredicateObjectNode new
		  predicate: (PP2CharSetPredicate on: [ :char |
					   self punctuationCharacters includes: char ]);
		  predicateMessage: 'punctuation expected';
		  negated: (PP2CharSetPredicate on: [ :char |
					   (self punctuationCharacters includes: char) not ]);
		  negatedMessage: 'punctuation not expected';
		  yourself
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> punctuationCharacters [

	^ '.,"''?!;:#$%&()*+-/<>=@[]\^_{}|~'
]
