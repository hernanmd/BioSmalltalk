Class {
	#name : #BioNCBIEST,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIEST class >> dbName [

	^ 'est'
]

{ #category : #accessing }
BioNCBIEST class >> description [

	^ 'Expressed sequence tags: ' , self dbName
]
