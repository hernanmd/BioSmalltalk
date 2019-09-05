"
Abstract parser grouping behavior for Accession and Locus description

gb|accession|locus
emb|accession|locus
dbj|accession|locus

"
Class {
	#name : #BioAbstractALParser,
	#superclass : #BioNCBILocusParser,
	#category : 'BioParsers-Core'
}

{ #category : #'initialize-release' }
BioAbstractALParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
		self parserForAccession , 
		self parserForLocus optional
]
