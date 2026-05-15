"
Represents the HTGS (High Throughput Genomic Sequences) database in the NCBI system.
"
Class {
	#name : 'BioNCBIHTGS',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIHTGS class >> dbName [

	^ 'htgs'
]

{ #category : 'accessing' }
BioNCBIHTGS class >> description [

	^ 'High throughput genomic sequences: ' , self dbName
]
