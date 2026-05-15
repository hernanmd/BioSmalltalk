"
Represents the EFetch retrieval command with specific retrieval parameters for NCBI Entrez. Supports rettype and retmode parameters for controlling output format.
"
Class {
	#name : 'BioEFetchRetCmd',
	#superclass : 'BioEFetchCmd',
	#category : 'BioEntrez-Commands',
	#package : 'BioEntrez',
	#tag : 'Commands'
}

{ #category : 'testing' }
BioEFetchRetCmd class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('retstart' 'retmax' 'retmode' 'rettype')
]
