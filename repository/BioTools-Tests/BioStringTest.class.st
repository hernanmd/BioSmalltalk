Class {
	#name : #BioStringTest,
	#superclass : #BioAbstractTest,
	#category : #'BioTools-Tests-Biological'
}

{ #category : #testing }
BioStringTest >> testAddToAlignment [

	| align1 |
	
	align1 := BioAlignment new.
	'ACGT' addToAlignment: align1.
	
	self assert: (align1 isKindOf: BioAlignment).
	self deny: align1 isEmpty.
	self assert: (align1 sequenceStrings includes: 'ACGT')

]

{ #category : #testing }
BioStringTest >> testAsAminoacidLetter [

	self assert: 'A' asAminoacidLetter = $A.

	self should: [ 'AG' asAminoacidLetter ] 			raise: BioException.
	self should: [ String empty asAminoacidLetter ] 	raise: BioException	
]

{ #category : #testing }
BioStringTest >> testAsLowercase [

	self assert: (#('HOLA') asLowercase bioHasEqualElements: #('hola')).
	self assert: (#('FIRST' 'Second' 'third') asLowercase bioHasEqualElements: #('first' 'second' 'third')).
	self assert: (#(#BORGES 'ALVAREZ') asLowercase bioHasEqualElements:  #('borges' 'alvarez')).

	self should: [ #(1 30 'BORGES') asLowercase ] raise: Exception.

	
]

{ #category : #testing }
BioStringTest >> testAsSequenceString [

	self assert: '    ACTG ' asCondensedString = 'ACTG'.
	self assert: String empty asCondensedString = String empty.
	self assert: 'AC TG' asCondensedString = 'ACTG'.
	self assert: ' A C T G ' asCondensedString = 'ACTG'.
	
	
	self assert: 'ACTG
' asCondensedString = 'ACTG'.
	self assert: '

ACTG

' asCondensedString = 'ACTG'
	
]

{ #category : #testing }
BioStringTest >> testCopyUpToStartParenthesis [

	self assert: 'this is a (test)' copyUpToStartParenthesis = 'this is a'.
	self assert: 'this is another (test) (with several) parenthesis' copyUpToStartParenthesis = 'this is another'.
	self assert: 'string without parenthesis' copyUpToStartParenthesis = 'string without parenthesis'.
	self assert: String empty copyUpToStartParenthesis = String empty.

]

{ #category : #testing }
BioStringTest >> testForAlphabet [

	| seq1 seq2 seq3 |
	
	seq1 := '    ACTG ' asSequenceForAlphabet: BioNullAlphabet.
	self assert: ( seq1 isKindOf: BioSequence ).
	self assert: seq1 asString = 'ACTG'.
	self assert: ( seq1 alphabet isKindOf: BioNullAlphabet ).
	
	seq2 := 'ACNNNNTG' asSequenceForAlphabet: BioNullAlphabet.
	self assert: ( seq2 isKindOf: BioSequence ).
	self assert: seq2 asString = 'ACNNNNTG'.
	self assert: ( seq2 alphabet isKindOf: BioNullAlphabet ).	

	seq3 := 'TCAGTTACACACATCTGTCGAGACGTAAATTACGGATGAGTTATTCGCTACCTACATGCAAACGGAGCATCCATGTTCTTTATT' asSequenceForAlphabet: BioIUPACUnambiguousDNA.
	self assert: ( seq3 isKindOf: BioSequence ).
	self assert: seq3 asString = 'TCAGTTACACACATCTGTCGAGACGTAAATTACGGATGAGTTATTCGCTACCTACATGCAAACGGAGCATCCATGTTCTTTATT'. 
	self assert: ( seq3 alphabet isKindOf: BioIUPACUnambiguousDNA ).

]

{ #category : #testing }
BioStringTest >> testHasAmbiguousBases [

	self assert: 'atgCtgAccR' hasAmbiguousDNABases.
	self deny: 'attcggaggat' hasAmbiguousDNABases.
	
	self deny: 'ACGU' hasAmbiguousRNABases.
	self assert: 'AUGCAUCAGRYAUCUGU' hasAmbiguousRNABases.
]

{ #category : #testing }
BioStringTest >> testIncludesBeginWith [

	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWith: 'the').
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWith: 'money').
	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWith: String empty).

	self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWith: Array empty ] raise: MessageNotUnderstood.
	self should: [ 'the quick brown fox jums over the lazy dog' includesBeginWith: nil ] raise: MessageNotUnderstood.

]

{ #category : #testing }
BioStringTest >> testIncludesBeginWithAnyOf [

	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('the') ).
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('money') ).
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('money' 'casino') ).	
	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('ove' 'money') ).
	self assert: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #('money' 'lazy') ).
	self deny: ('the quick brown fox jums over the lazy dog' includesBeginWithAnyOf: #() ).


]

{ #category : #testing }
BioStringTest >> testIncludesLike [

	| testString01 |
	
	testString01 := 'hola buenos dias' findTokens: Character space.
	self assert: ( testString01 includesLike: 'hole' ).
	self assert: ( testString01 includesLike: 'holas' ).
	self assert: ( testString01 includesLike: 'bueno' ).
	self assert: ( testString01 includesLike: 'buenas' ).	



]

{ #category : #testing }
BioStringTest >> testIndicesOfAscii [

	| ind1 ind2 |
	
	ind1 := 'AC  NNTG' indicesOfCharacter: Character space.
	self assert: (ind1 isKindOf: Collection).
	self assert: ind1 first equals: 3.
	self assert: ind1 second equals: 4.
	
	ind2 := 'A--CT--TG' indicesOfCharacter: $-.
	self assert: (ind2 isKindOf: Collection).
	self assert: ind2 asArray equals: #(2 3 6 7).
	
	self assert: ('' indicesOfCharacter: $-) isEmpty.
]

{ #category : #testing }
BioStringTest >> testIsAllLetters [

	self assert: 'AATGATCGATGCTAGTCGACA' isAllLetters.
	self assert: 'gtacgatagcatgcatgc' isAllLetters.
	self deny: String empty isAllLetters.
	self deny: 'ACAGTAC-ACACATGA' isAllLetters.
	self deny: 'TWOJCPOWC9CIC' isAllLetters.

]

{ #category : #testing }
BioStringTest >> testIsNumeric [

	self assert: '123' isNumeric.
	self assert: '123.45' isNumeric.
	self assert: '.45' isNumeric.
	self assert: '+123.45' isNumeric.
	self assert: '-123.45' isNumeric.
	self deny: '12.3.45' isNumeric.
	self assert: '123.45e100' isNumeric.
	self assert: '123.45e-100' isNumeric.
	self assert: '5.23e-6' isNumeric.
	self deny: '5.23e-6e' isNumeric.
]

{ #category : #testing }
BioStringTest >> testStringAsFloat [

	self assert: '123' asFloat isFloat.
	self assert: '123.45' asFloat isFloat.
	self assert: '-123.45' asFloat isFloat.
	self assert: '12.3.45' asFloat isFloat.
	self assert: '123.45e100' asFloat isFloat.
	self assert: '123.45e-100' asFloat isFloat.
	self assert: '5.23e-6' asFloat isFloat.
	self assert: '5.23e-6e' asFloat isFloat.
]
