Class {
	#name : #BioNCBIGSS,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIGSS class >> dbName [

	^ 'gss'
]

{ #category : #accessing }
BioNCBIGSS class >> description [

	^ 'Genomic survey sequences: ' , self dbName
]
