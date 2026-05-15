"
Represents an NCBI chromosome database entry. Provides access to chromosome-specific records from the NCBI databases.
"
Class {
	#name : 'BioNCBIChromosome',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIChromosome class >> dbName [

	^ 'chromosome'
]

{ #category : 'accessing' }
BioNCBIChromosome class >> description [

	^ 'NCBI Genomes: ' , self dbName
]
