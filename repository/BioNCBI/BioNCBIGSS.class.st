"
Represents the GSS (Genome Survey Sequences) database in the NCBI system.
"
Class {
	#name : 'BioNCBIGSS',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIGSS class >> dbName [

	^ 'gss'
]

{ #category : 'accessing' }
BioNCBIGSS class >> description [

	^ 'Genomic survey sequences: ' , self dbName
]
