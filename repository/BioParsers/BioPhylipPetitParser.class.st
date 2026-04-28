"
Documentation taken from http://bioweb2.pasteur.fr/docs/phylip/doc/main.html#inputfiles

"
Class {
	#name : 'BioPhylipPetitParser',
	#superclass : 'BioAbstractTextParser',
	#category : 'BioParsers-Core',
	#package : 'BioParsers',
	#tag : 'Core'
}

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> buildDNAResults: aCollection [
	" Answer an identified object for the receiver's parsing output "

	| tokenized sequences |
	
	tokenized := self buildTokens: aCollection.
	sequences := tokenized third 
			with: tokenized fourth 
			do: [: first : snd | BioSequence newAmbiguousDNA: snd named: first ].
	^ BioPhylip new
		numberOfTaxa: tokenized first;
		numberOfCharacters: tokenized second;
		sequences: sequences.
]

{ #category : 'accessing-protein' }
BioPhylipPetitParser >> buildProteinResults: aCollection [
	" Answer an identified object for the receiver's parsing output "

	| tokenized sequences |
	
	tokenized := self buildTokens: aCollection.
	sequences := tokenized third 
			with: tokenized fourth 
			do: [: first : snd | BioSequence newProtein: snd named: first ].
	^ BioPhylip new
		numberOfTaxa: tokenized first;
		numberOfCharacters: tokenized second;
		sequences: sequences.
]

{ #category : 'accessing' }
BioPhylipPetitParser >> buildTokens: aCollection [
	" Answer a tokenized <Collection> parsing aCollection "

	^ Array 
		with: (self taxaNumberFrom: aCollection)
		with: (aCollection first second asNumber)
		with: (aCollection second collect: #first)
		with: (self buildTokensFrom: aCollection).
	

]

{ #category : 'accessing-private' }
BioPhylipPetitParser >> buildTokensBlock [ 

	^ [: node | 
		OrderedCollection
			with: node first
			with: (node second collect: #allButLast) 
			with: (((node third reject: [: line | line first isEmpty ]) collect: #first) collect: #withoutBlanks ) ]
]

{ #category : 'accessing' }
BioPhylipPetitParser >> buildTokensFrom: aCollection [

	| taxaNumber collection seqIndex seqBlock |

	taxaNumber := self taxaNumberFrom: aCollection.
	collection := self buildTokensFromFirstBlock: aCollection.
	seqIndex := 1.
	(seqBlock := aCollection third) doWithIndex: [:seq :index | 
			seqIndex = (taxaNumber + 1)
				ifTrue: [seqIndex := 1].
			index <= seqBlock size
				ifFalse: [ ^ collection ].
			collection
				at: seqIndex
				put: (String
						streamContents: [:str | str
								nextPutAll: (collection at: seqIndex);
								nextPutAll: (seqBlock at: index)]).
			seqIndex := seqIndex + 1].
	^ collection

]

{ #category : 'accessing' }
BioPhylipPetitParser >> buildTokensFromFirstBlock: aCollection [

	^ aCollection second collect: [: seq | seq second withoutBlanks ]
]

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> dnaInterleaveLineTokenizer [

	^ (self dnaInterleaveSequenceTokenizer , #newline asPParser) star
]

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> dnaInterleaveSequenceTokenizer [

	^ #dnaLetter asPParser trimBlanks star flatten
]

{ #category : 'accessing-private' }
BioPhylipPetitParser >> firstLineTokenizer [
	" Answer a Parser for parsing the first line of the format "
	
	^ (#number asPParser / self parserForAnyButNumber) ,
		(self parserForAnyButNumber) ,
		#blank asPParser plus optional flatten ,
		#newline asPParser ==> [ : node | 
			node asOrderedCollection 
				removeAllSuchThat: [ : elem  | elem allSatisfy: [ : e | e = Character space ] ];
				copyWithoutAll: {
				Character lf asString .
				Character cr asString } ]
]

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> parseInterleavedDNA: aString [
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	| parseResults |
	
	parseResults := self parseString: aString.
	^ self isSuccess
		ifTrue: [ results := self buildDNAResults: parseResults ]
		ifFalse: [ self signalInvalidObject: parseResults ].
]

{ #category : 'accessing-protein' }
BioPhylipPetitParser >> parseInterleavedProtein: aString [
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	| parseResults |
	
	parseResults := self parseString: aString.
	^ self isSuccess
		ifTrue: [ results := self buildProteinResults: parseResults ]
		ifFalse: [ self signalInvalidObject: parseResults ].
]

{ #category : 'accessing-private' }
BioPhylipPetitParser >> parserForAnyButNumber [

	^ #digit asPParser negate plus , #number asPParser ==> [: n | n second ] 
]

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> speciesDNALineTokenizer [
	" Answer a Parser for parsing the species names line "
	
	^ ((PP2PredicateObjectNode noneOf: self speciesFobiddenNames) times: 10) flatten ,
		self dnaInterleaveSequenceTokenizer
]

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> speciesDNANamedBlockTokenizer [
	" Answer a Parser for parsing the sequence blocks "
	
	^ (self speciesDNALineTokenizer , #newline asPParser flatten) star
]

{ #category : 'accessing-private' }
BioPhylipPetitParser >> speciesFobiddenNames [
	" Private - Answer a <Collection> with receiver's not allowed Characters in a species name "
	
	^ OrderedCollection new
		add: Character cr;
		add: Character lf;
		add: $[;
		add: $];
		add: $(;
		add: $);
		add: $:;
		add: $;;
		add: $,;
		yourself
]

{ #category : 'accessing' }
BioPhylipPetitParser >> taxaNumberFrom: aCollection [

	^ aCollection first first asNumber
]

{ #category : 'accessing-dna' }
BioPhylipPetitParser >> tokenizeInterleavedDNA [
	" Private - Tokenize the receiver's epression as DNA data "

	parser := 
		( self firstLineTokenizer ,
		self speciesDNANamedBlockTokenizer ,
		self dnaInterleaveLineTokenizer ) ==> self buildTokensBlock.
	^ self tokenize.
	
	
]

{ #category : 'accessing-protein' }
BioPhylipPetitParser >> tokenizeInterleavedProtein [
	" Private - Tokenize the receiver's epression as Protein data "

	parser := 
		self firstLineTokenizer ,
		(((PP2PredicateObjectNode noneOf: self speciesFobiddenNames) times: 10) flatten ,
		#proteinLetterGapped asPParser trimBlanks star flatten , 
		#newline asPParser) star ,
			(#proteinLetterGapped asPParser trimBlanks star flatten , #newline asPParser) star ==> self buildTokensBlock.
	^ self tokenize.
	
]
