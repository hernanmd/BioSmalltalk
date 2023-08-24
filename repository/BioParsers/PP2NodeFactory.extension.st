Extension { #name : #PP2NodeFactory }

{ #category : #'*BioParsers' }
PP2NodeFactory >> dnaLetter [
	"Answer a parse to parse any uppercased or lowercased DNA nucleotide letter"

	^ PP2PredicateObjectNode anyOf: (String streamContents: [ : stream |
		stream 
			<< 	BioIUPACUnambiguousDNA uppercaseCodes;
			<< 	BioIUPACUnambiguousDNA lowercaseCodes ])
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> dnaSequence [
	" Answer a parser for a DNA sequence, using unambiguous IUPAC nomenclature "
	
	^ self dnaLetter plus flatten end
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> number [

	^ PP2ExpressionGrammar new number
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> proteinLetter [
	" Answer a parser for a protein letter, using extended IUPAC nomenclature "
	
	^ PP2PredicateObjectNode anyOf: (String streamContents: [ : stream |
		stream
			<< 	BioIUPACProteinExtended codes asUppercase;
			<< BioIUPACProteinExtended codes asLowercase;
			<< 	'?-' ])
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> proteinSequence [
	" Answer a parser for Protein sequences, using IUPAC nomenclature "
	
	^ self proteinLetter plus flatten end
]

{ #category : #'*BioParsers' }
PP2NodeFactory >> punctuation [
	^ PP2PredicateObjectNode new
		predicate: (PP2CharSetPredicate on: [ :char | '.,"''?!;:#$%&()*+-/<>=@[]\^_{}|~' includes: char ]);
		predicateMessage: 'punctuation expected';
		negated: (PP2CharSetPredicate on: [ :char | ('.,"''?!;:#$%&()*+-/<>=@[]\^_{}|~' includes: char) not ]);
		negatedMessage: 'punctuation not expected';
		yourself
]
