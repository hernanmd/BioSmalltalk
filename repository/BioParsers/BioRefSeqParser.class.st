"
ref|accession|locus

"
Class {
	#name : #BioRefSeqParser,
	#superclass : #BioAbstractALParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioRefSeqParser class >> identifier [
	" See superimplementor's comment "

	^ 'ref'
]

{ #category : #'initialize-release' }
BioRefSeqParser >> initialize [

	super initialize.
	parser := 
		self parserForAccession , 
		self parserForLocus
]
