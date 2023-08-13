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
					add: (BioSequence joinString: (self sequenceCollectionFrom: aCollection last)) ]
		ifFalse: [ aCollection do: [ : seq | self buildTokens: seq ] ].
	^ self results		
]

{ #category : #initialization }
BioFASTABasicParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := ( 
		self parserForNonBreakingString , 
		#newline asParser ,
		self parserForSequence) plus end 
		

]

{ #category : #'accessing-parsers' }
BioFASTABasicParser >> parserForSequence [
	" Answer a parser for parsing sequences as usually found in FASTA formatted files "

	^ (#word asParser plus flatten , 
		#newline asParser plus optional ==> [ :nodes | (nodes copyWithout: Character cr) ]) 
			min: 1
]

{ #category : #'accessing private' }
BioFASTABasicParser >> seqFrom: aCollection [
	" Answer a new sequence object from aCollection using the receiver's alphabet class "
	
	^ self sequenceClass
		newWith: (BioSequence joinString: (self sequenceCollectionFrom: aCollection))
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

{ #category : #initialization }
BioFASTABasicParser >> setParserForDNAAlignment [
	" Configure the receiver's parser to parse DNA alignment (gaps are allowed) "

	self parser: self parserForDNAAlignment
]

{ #category : #initialization }
BioFASTABasicParser >> setParserForDNASequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are allowed) "

	self parser: self parserForSequence
]

{ #category : #accessing }
BioFASTABasicParser >> tokenize [
	" Private - Answer a String with the receiver's expression tokenized "
	
	^ super tokenize pairsCollect: [: one : two | Array with: one with: two ]
]
