Class {
	#name : #BioNCBIChromosome,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIChromosome class >> dbName [

	^ 'chromosome'
]

{ #category : #accessing }
BioNCBIChromosome class >> description [

	^ 'NCBI Genomes: ' , self dbName
]
