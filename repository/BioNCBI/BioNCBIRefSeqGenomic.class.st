"
Represents the RefSeq Genomic database in the NCBI system.
"
Class {
	#name : 'BioNCBIRefSeqGenomic',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIRefSeqGenomic class >> dbName [

	^ 'refseq_genomic'
]

{ #category : 'accessing' }
BioNCBIRefSeqGenomic class >> description [

	^ 'Reference genomic sequences: ' , self dbName
]
