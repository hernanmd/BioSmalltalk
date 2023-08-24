"
gnl|database|identifier

"
Class {
	#name : #BioNCBIGenericIdParser,
	#superclass : #BioNCBIIdParser,
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioNCBIGenericIdParser class >> identifier [
	" See superimplementor's comment "

	^ 'gnl|'
]

{ #category : #'initialize-release' }
BioNCBIGenericIdParser >> databaseParser [

	^ self parserForNonFastaString
]

{ #category : #initialization }
BioNCBIGenericIdParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asPParser , 
			self databaseParser ,
			$| asPParser ,
			self localIdParser
]
