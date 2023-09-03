"
This class is not intended to be used directly
"
Class {
	#name : #BioFASTABasicParser,
	#superclass : #BioIDParser,
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
			self parserForDescriptionString , 
			(
				(
					(
						$> asPParser not , 
						(#newline asPParser / #endOfLine asPParser negate plus) flatten ==> #second
					)
				) plus ==> self removeNewLinesAndJoinBlock
			)
		) plus
]

{ #category : #'initialize-release' }
BioFASTABasicParser >> initializeWith: aString [
	" Private - See superimplementor's comment "

	super initializeWith: aString.
	parser := self fastaParser.

]

{ #category : #'accessing-parsers' }
BioFASTABasicParser >> newLineParser [

	^ #newline asPParser
]

{ #category : #initialization }
BioFASTABasicParser >> removeNewLinesAndJoinBlock [

	^ [ : nodes | (nodes reject: [ : line | line = Character cr asString or: [ line = Character lf asString ]]) joinUsing: '' ]
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
