"
pat|country|number

"
Class {
	#name : #BioPatentsParser,
	#superclass : #BioNCBIIdParser,
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioPatentsParser class >> identifier [
	" See superimplementor's comment "

	^ 'pat|'
]

{ #category : #'initialize-release' }
BioPatentsParser >> countryParser [

	^ self parserForNonFastaString
]

{ #category : #initialization }
BioPatentsParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asPParser , 
			self countryParser , 
			$| asPParser , 
			#number asPParser.
]
