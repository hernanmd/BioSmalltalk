Class {
	#name : #BioNCBILocusParser,
	#superclass : #BioAccessionParser,
	#category : #'BioParsers-Core'
}

{ #category : #initialize }
BioNCBILocusParser >> initialize [

	super initialize.
	parser := self parserForLocus
]

{ #category : #accessing }
BioNCBILocusParser >> parserForLocus [
	" Answer a parser for parsing locus identifiers "

	^ $| asPParser optional , self parserForNonFastaString plus flatten
]

{ #category : #accessing }
BioNCBILocusParser >> tokenizeLocus [
	" Extract the locus name from the receiver's expression "
	
	^ self tokenize third
]

{ #category : #accessing }
BioNCBILocusParser >> tokenizeLocus: aString [
	" Refer to comment in class side "
	
	^ self class tokenizeLocus: aString
]
