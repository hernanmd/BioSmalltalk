"
Represents the Patents database in the NCBI system.
"
Class {
	#name : 'BioNCBIPat',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIPat class >> dbName [

	^ 'pat'
]

{ #category : 'accessing' }
BioNCBIPat class >> description [

	^ 'Patent sequences: ' , self dbName
]
