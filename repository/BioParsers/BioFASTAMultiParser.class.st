"
Parser for a FASTA file with several sequences. This class is not intended to be used directly. See BioParser for details parsing FASTA files.
"
Class {
	#name : #BioFASTAMultiParser,
	#superclass : #BioFASTABasicParser,
	#category : #'BioParsers-Core'
}

{ #category : #'instance creation' }
BioFASTAMultiParser class >> onAmbigousGapped: anExpressionString [

	^ self basicNew
		fastaSequenceParser: #parserForAmbibuousGappedSequence;
		initializeWith: anExpressionString;
		yourself
]

{ #category : #'instance creation' }
BioFASTAMultiParser class >> onUnambigousGapped: anExpressionString [

	^ self basicNew
		fastaSequenceParser: #parserForUnambibuousGappedSequence;
		initializeWith: anExpressionString;
		yourself
]

{ #category : #'accessing private' }
BioFASTAMultiParser >> buildResults: aCollection [
	" Answer an identified object for the receiver's parsing output "

	aCollection first isString
		ifTrue: [ 
			self resultsForParse addFastaRecord: (BioFastaRecord 
					named: aCollection first
					sequence: (self seqFrom: aCollection last)) ]
		ifFalse: [ aCollection do: [ : seq | self buildResults: seq ] ].
	^ self results
]

{ #category : #'accessing private' }
BioFASTAMultiParser >> parseResultClass [
	" Answer the class used for maintaining succesfully parse results "
	
	^ BioFastaMultiRecord
]

{ #category : #'accessing-parsers' }
BioFASTAMultiParser >> parserForAmbibuousGappedSequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are allowed) "

	^ (
			(
			#dnaAmbiguousLetterGapped asPParser plus flatten , 
			self newLineParser
			) ==> self removeNewlinesBlock
		)  min: 1

]

{ #category : #'accessing-parsers' }
BioFASTAMultiParser >> parserForAmbibuousSequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are NOT allowed) "

	^ (
		#dnaAmbiguousLetter asPParser plus flatten , 
		self newLineParser
		) min: 1

]

{ #category : #'accessing-parsers' }
BioFASTAMultiParser >> parserForUnambibuousGappedSequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are allowed) "

	^ (
		#dnaUnambiguousLetterGapped asPParser plus flatten , 
		self newLineParser
		) min: 1

]

{ #category : #'accessing-parsers' }
BioFASTAMultiParser >> parserForUnambibuousSequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are NOT allowed) "

	^ (
		#dnaSequence asPParser plus flatten ,
		self newLineParser
		) min: 1

]
