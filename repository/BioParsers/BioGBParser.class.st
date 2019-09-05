"
gb|accession|locus

"
Class {
	#name : #BioGBParser,
	#superclass : #BioAbstractALParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioGBParser class >> identifier [
	" See superimplementor's comment "

	^ 'gb|'
]

{ #category : #'initialize-release' }
BioGBParser >> initialize [
	" Private - See superimplementor's comment "
	
	super initialize.
	parser := 
		self parserForIdentifier , 
		self parserForAccession ,
		( self parserForLocus ==> [: r | r allButFirst anyOne ] ).
]
