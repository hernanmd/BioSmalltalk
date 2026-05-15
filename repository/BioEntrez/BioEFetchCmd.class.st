"
Represents the EFetch command for NCBI Entrez. Retrieves records from an Entrez database in a specified format.
"
Class {
	#name : 'BioEFetchCmd',
	#superclass : 'BioEWebEnvCmd',
	#category : 'BioEntrez-Commands',
	#package : 'BioEntrez',
	#tag : 'Commands'
}

{ #category : 'accessing private' }
BioEFetchCmd class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ 'efetch.fcgi'
]

{ #category : 'testing' }
BioEFetchCmd class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('db' 'id')
]
