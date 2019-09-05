Class {
	#name : #BioEFetchCmd,
	#superclass : #BioEWebEnvCmd,
	#category : 'BioEntrez-Commands'
}

{ #category : #'accessing private' }
BioEFetchCmd class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ 'efetch.fcgi'
]

{ #category : #testing }
BioEFetchCmd class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('db' 'id')
]
