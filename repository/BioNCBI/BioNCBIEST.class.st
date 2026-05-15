"
Represents the EST (Expressed Sequence Tags) database in the NCBI system.
"
Class {
	#name : 'BioNCBIEST',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIEST class >> dbName [

	^ 'est'
]

{ #category : 'accessing' }
BioNCBIEST class >> description [

	^ 'Expressed sequence tags: ' , self dbName
]
