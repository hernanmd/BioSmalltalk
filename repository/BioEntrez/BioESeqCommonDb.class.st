"
Abstract class for grouping querying properties.



"
Class {
	#name : #BioESeqCommonDb,
	#superclass : #BioESeqDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #'accessing public' }
BioESeqCommonDb >> setFasta [
	" Set the receiver's retrieval type to FASTA format "
	
	self retrievalType: 'fasta'
]

{ #category : #'accessing public' }
BioESeqCommonDb >> setSeqId [
	" Set the receiver's retrieval type to seqid format "
	
	self retrievalType: 'seqid'
]
