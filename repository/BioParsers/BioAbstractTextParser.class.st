"
BioAbstractTextParser is an abstract class which groups common behavior for subclasses. Mostly related with parsing of structured text.
"
Class {
	#name : #BioAbstractTextParser,
	#superclass : #BioAbstractParser,
	#category : #'BioParsers-Core'
}

{ #category : #'accessing private' }
BioAbstractTextParser >> accessionFrom: aCollection [
	" Answer a new accession object using aCollection.
	Assume aCollection contains two elements, 
	first element is a String with the accession name
	second element is a String with the version number or nil "
	
	| version |
	version := aCollection size = 2 ifFalse: [ nil ] ifTrue: [ aCollection second ].
	^ results := BioAccession new 
		name: aCollection first; 
		version: version;
		yourself
]

{ #category : #'accessing private' }
BioAbstractTextParser >> alphabetClass [
	" Private - Let the proper sequence class guess the alphabet from the sequence String "
	
	^ BioNullAlphabet
	
]

{ #category : #'accessing-parsers' }
BioAbstractTextParser >> noneOf: aCollection [
	" Answer a parser for parsing any kind of description text in a FASTA sequence "

	^ PP2PredicateObjectNode noneOf: aCollection
]

{ #category : #'accessing-parsers' }
BioAbstractTextParser >> parserForAccession [
	" Answer a parser for parsing exactly aCollection "

	| accessionCharacters accession versionNumber |
	accessionCharacters := self noneOf: self specialFastaChars , {$.}.
	accession := accessionCharacters plus flatten.
	versionNumber := ($. asPParser , #digit asPParser plus flatten) optional.
	^ (accession , versionNumber) flatten ==> [ :a | (a substrings: '.') asArray ]
]

{ #category : #'accessing-parsers' }
BioAbstractTextParser >> parserForDNAAlignment [
	" Answer a parser for alignments, meaning sequences containing gaps "

	^ #dnaAmbiguousLetterGapped asPParser 
]

{ #category : #'accessing-parsers' }
BioAbstractTextParser >> parserForExactly: aCollection [
	" Answer a parser for parsing exactly aCollection "

	^ aCollection asPParser negate plus , aCollection asPParser.
]

{ #category : #'accessing-parsers' }
BioAbstractTextParser >> parserForNonBreakingString [
	
	^ (self noneOf: (Array with: Character cr with: Character lf)) plus flatten		

]
