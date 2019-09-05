Class {
	#name : #BioNCBIWGS,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIWGS class >> dbName [

	^ 'wgs'
]

{ #category : #accessing }
BioNCBIWGS class >> description [

	^ 'Whole-genome shotgun reads: ' , self dbName
]
