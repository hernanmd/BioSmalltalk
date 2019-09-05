"
gnl|database|identifier

"
Class {
	#name : #BioGeneralParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioGeneralParser class >> identifier [
	" See superimplementor's comment "

	^ 'gnl|'
]

{ #category : #'initialize-release' }
BioGeneralParser >> databaseParser [

	^ self parserForNonFastaString
]

{ #category : #'initialize-release' }
BioGeneralParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asParser , 
			self databaseParser ,
			$| asParser ,
			self localIdParser
]
