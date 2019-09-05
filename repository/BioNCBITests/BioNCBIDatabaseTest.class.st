Class {
	#name : #BioNCBIDatabaseTest,
	#superclass : #BioAbstractTest,
	#category : 'BioNCBITests-Core'
}

{ #category : #testing }
BioNCBIDatabaseTest >> testDatabaseList [

	| dbList |
	
	dbList := BioNCBIDatabase databaseList.
	
	self assert: ( dbList isKindOf: Collection ).
	self deny: dbList isEmpty.
	

]

{ #category : #testing }
BioNCBIDatabaseTest >> testDescriptionAt [

	| description |
	
	description := BioNCBIDatabase descriptionAt: 'nr'.
	
	self assert: ( description isKindOf: String ).
	self deny: description isEmpty.
	self assert: description = 'Nucleotide collection (nr/nt)'.

	description := BioNCBIDatabase descriptionAt: 'est'.
	
	self assert: description =  'Expressed sequence tags: est'.

]
