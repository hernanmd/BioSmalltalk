"
prf||name

"
Class {
	#name : #BioProtResParser,
	#superclass : #BioNCBIIdParser,
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioProtResParser class >> identifier [
	" See superimplementor's comment "

	^ 'prf'
]

{ #category : #initialization }
BioProtResParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
			($| asPParser times: 2) , 
			self nameParser.
]

{ #category : #'initialize-release' }
BioProtResParser >> nameParser [

	^ self parserForNonFastaString
]
