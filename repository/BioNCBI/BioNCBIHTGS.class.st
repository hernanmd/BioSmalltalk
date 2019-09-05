Class {
	#name : #BioNCBIHTGS,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIHTGS class >> dbName [

	^ 'htgs'
]

{ #category : #accessing }
BioNCBIHTGS class >> description [

	^ 'High throughput genomic sequences: ' , self dbName
]
