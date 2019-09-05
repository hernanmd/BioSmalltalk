Class {
	#name : #BioNCBIPat,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIPat class >> dbName [

	^ 'pat'
]

{ #category : #accessing }
BioNCBIPat class >> description [

	^ 'Patent sequences: ' , self dbName
]
