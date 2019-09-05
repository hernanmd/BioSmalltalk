Class {
	#name : #BioEFetchRetCmd,
	#superclass : #BioEFetchCmd,
	#category : 'BioEntrez-Commands'
}

{ #category : #testing }
BioEFetchRetCmd class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('retstart' 'retmax' 'retmode' 'rettype')
]
