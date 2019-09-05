"
prf||name

"
Class {
	#name : #BioProtResParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioProtResParser class >> identifier [
	" See superimplementor's comment "

	^ 'prf'
]

{ #category : #'initialize-release' }
BioProtResParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
			( $| asParser times: 2 ) , 
			self nameParser.
]

{ #category : #'initialize-release' }
BioProtResParser >> nameParser [

	^ self parserForNonFastaString
]
