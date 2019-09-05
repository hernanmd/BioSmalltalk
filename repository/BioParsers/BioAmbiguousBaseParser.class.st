"
This class supports parsing DNA sequences with degenerate bases as sent from Illumina, i.e. of the form : 'A[A/C]CTG' or 'AT[A/C]TA[C/A]'.
"
Class {
	#name : #BioAmbiguousBaseParser,
	#superclass : #BioAbstractTextParser,
	#instVars : [
		'ambParser'
	],
	#category : 'BioParsers-Core'
}

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> ambParser [
		
	^ ambParser 
]

{ #category : #accessing }
BioAmbiguousBaseParser >> buildResults: aCollection [
	" Set the receiver's results using aCollection "
	
	^ BioSequence
		newWith: aCollection
		alphabet: BioIUPACAmbiguousDNA

]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> convertAmbiguousToSingleBase: ambTokens [
	" Take a String of the form '[A/C]' and convert it to 
	a single base letter as specified by the IUPAC nomenclature.
	Answer a String "
	
	| amb |

	amb := ambTokens allButFirst allButLast.
	" Is using internal delimiters? /, |, etc? "
	^ amb size = 1
		ifTrue: [ self convertContinuousAmbiguousToSingleBase: amb anyOne ]
		ifFalse: [ self convertDelimitedAmbiguousToSingleBase: amb ].
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> convertContinuousAmbiguousToSingleBase: ambTokens [

	| motif |
	
	motif := ambTokens joinUsing: String empty.
	^ BioIUPACAmbiguousDNA ambiguousLettersMap at: motif
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> convertDelimitedAmbiguousToSingleBase: ambTokens [

	| motif |
	
	motif := ambTokens selectAtOddPositions joinUsing: String empty.
	^ BioIUPACAmbiguousDNA ambiguousLettersMap at: motif
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> delimiter [
	" Answer the Character used to delimit degenerate bases "
	
	^ $/
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> parseWithSeparators [
	
	ambParser := self parserForAmbiguityDelimited.
	parser := self parserForAmbiguousBase.	
	^ self parse
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> parseWithoutSeparators [
	
	ambParser := self parserForAmbiguity.
	parser := self parserForAmbiguousBase.	
	^ self parse
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> parserForAmbiguity [
	" Answer a parser for parsing a sequence variation of the type [AC] or [CT], etc.  "

	| open close letters |
	
	open := $[ asParser.
	close := $] asParser.
	letters := #dnaLetter asParser min: 2.

	^ ( open , letters , close ) ==> [: ambTokens | self convertAmbiguousToSingleBase: ambTokens ]
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> parserForAmbiguityDelimited [
	" Answer a parser for parsing a sequence variation of the type [A/C] or [C/T], etc.  "

	| open close separator letter |
	
	open := $[ asParser.
	close := $] asParser.
	separator := self delimiter asParser.
	letter := #dnaLetter asParser.

	^ (open , letter , separator , letter , close) ==> [ : ambTokens | self convertAmbiguousToSingleBase: ambTokens ]
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> parserForAmbiguousBase [
	" Answer a parser for parsing degenerate base symbols "

	| dnaSeq |
	
	dnaSeq := #dnaLetter asParser plus flatten.
	^ (dnaSeq / self ambParser) plus ==> [ : nodes | (nodes joinUsing: Array empty) joinUsing: String empty ]
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> tokenizeWithSeparators [
	
	ambParser := self parserForAmbiguityDelimited.
	parser := self parserForAmbiguousBase.	
	^ self tokenize
]

{ #category : #'accessing-parsers' }
BioAmbiguousBaseParser >> tokenizeWithoutSeparators [
	
	ambParser := self parserForAmbiguity.
	parser := self parserForAmbiguousBase.	
	^ self tokenize
]
