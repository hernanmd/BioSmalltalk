"
This class is not intended to be used directly
"
Class {
	#name : #BioFASTABasicParser,
	#superclass : #BioIDParser,
	#instVars : [
		'fastaSequenceParser'
	],
	#category : #'BioParsers-Core'
}

{ #category : #'accessing private' }
BioFASTABasicParser >> buildFastaRecord: aCollection [

	^ BioFastaRecord 
		named: aCollection first
		sequence: (self seqFrom: aCollection last) 
]

{ #category : #'accessing private' }
BioFASTABasicParser >> buildResults: aCollection [
	" Answer an identified object for the receiver's parsing output "

	^ (aCollection first isString or: [ aCollection size <= 3 ])
		ifTrue: [ self buildFastaRecord: aCollection first ]
		ifFalse: [ aCollection collect: [ : seq | self buildResults: seq ] ]
]

{ #category : #accessing }
BioFASTABasicParser >> buildTokens: aCollection [
	" Answer an identified object for the receiver's parsing output "

	aCollection first isString
		ifTrue: [ 
			self resultsForTokenize
					add: aCollection first;
					add: aCollection last ]
		ifFalse: [ aCollection do: [ : seq | self buildTokens: seq ] ].
	^ self results		
]

{ #category : #initialization }
BioFASTABasicParser >> fastaParser [

	^ ( 
		$> asPParser ,
		(self noneOf: (Array with: Character cr with: Character lf)) plus flatten , 
		#newline asPParser ,
			(
				(self noneOf: (Array with: Character cr with: Character lf)) plus flatten , 
				#newline asPParser star ==> [ :nodes | nodes copyWithoutAll: { Character cr asString . Character lf asString } ]
			) plus
		) plus end
]

{ #category : #initialization }
BioFASTABasicParser >> fastaSequenceParser [

	^ fastaSequenceParser 		

]

{ #category : #accessing }
BioFASTABasicParser >> fastaSequenceParser: anObject [

	fastaSequenceParser := anObject
]

{ #category : #'initialize-release' }
BioFASTABasicParser >> initializeWith: aString [
	" Private - See superimplementor's comment "

	super initializeWith: aString.
	self fastaSequenceParser: #parserForSingleSequence.
	parser := self fastaParser.

]

{ #category : #'accessing-parsers' }
BioFASTABasicParser >> newLineParser [

	^ #newline asPParser
]

{ #category : #initialization }
BioFASTABasicParser >> parserForAnyCharacter [

	^ #any asPParser negate star flatten , #any asPParser plus
]

{ #category : #'accessing-parsers' }
BioFASTABasicParser >> parserForSingleSequence [
	" Answer a parser for parsing sequences as usually found in FASTA formatted files "

	^ (
			(
			#dnaAmbiguousLetterGapped asPParser plus flatten , 
			self newLineParser optional
			) plus
		)
]

{ #category : #removing }
BioFASTABasicParser >> removeNewlinesBlock [

	^ [ :nodes | nodes copyWithoutAll: { Character cr asString . Character lf asString } ]
]

{ #category : #'accessing private' }
BioFASTABasicParser >> seqFrom: aCollection [
	" Answer a new sequence object from aCollection using the receiver's alphabet class "
	
	^ self sequenceClass
		newWith: aCollection
		alphabet: self alphabetClass
]

{ #category : #'accessing private' }
BioFASTABasicParser >> sequenceClass [
	" Answer a <Class> used to represent biological sequences "
	
	^ BioSequence
]

{ #category : #'accessing private' }
BioFASTABasicParser >> sequenceCollectionFrom: aCollection [

	^ aCollection copy
]

{ #category : #'accessing-public' }
BioFASTABasicParser >> sequenceInfo [
	" Answer a <String> with the receiver's parsed information or description found in the header "

	self parse.
	^ self results sequenceName
]

{ #category : #accessing }
BioFASTABasicParser >> tokenize [
	" Private - Answer a String with the receiver's expression tokenized "
	
	^ super tokenize pairsCollect: [: one : two | Array with: one with: two ]
]
