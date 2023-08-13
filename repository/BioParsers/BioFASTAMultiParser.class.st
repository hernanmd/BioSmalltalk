"
Parser for a FASTA file with several sequences. This class is not intended to be used directly. See BioParser for details parsing FASTA files.
"
Class {
	#name : #BioFASTAMultiParser,
	#superclass : #BioFASTABasicParser,
	#category : #'BioParsers-Core'
}

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
