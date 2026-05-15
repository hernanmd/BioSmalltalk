"
Represents the RefSeq RNA database in the NCBI system.
"
Class {
	#name : 'BioNCBIRefSeqRNA',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBIRefSeqRNA class >> dbName [

	^ 'refseq_rna'
]

{ #category : 'accessing' }
BioNCBIRefSeqRNA class >> description [

	^ 'Reference mRNA sequences: ' , self dbName
]
