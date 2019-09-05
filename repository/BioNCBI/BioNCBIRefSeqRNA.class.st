Class {
	#name : #BioNCBIRefSeqRNA,
	#superclass : #BioNCBIDatabase,
	#category : 'BioNCBI-Databases'
}

{ #category : #accessing }
BioNCBIRefSeqRNA class >> dbName [

	^ 'refseq_rna'
]

{ #category : #accessing }
BioNCBIRefSeqRNA class >> description [

	^ 'Reference mRNA sequences: ' , self dbName
]
