Class {
	#name : #BioNCBIRefSeqGenomic,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIRefSeqGenomic class >> dbName [

	^ 'refseq_genomic'
]

{ #category : #accessing }
BioNCBIRefSeqGenomic class >> description [

	^ 'Reference genomic sequences: ' , self dbName
]
