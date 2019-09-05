"
pat|country|number

"
Class {
	#name : #BioPatentsParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
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

{ #category : #'initialize-release' }
BioPatentsParser >> initialize [

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asParser , 
			self countryParser , 
			$| asParser , 
			#number asParser.
]
