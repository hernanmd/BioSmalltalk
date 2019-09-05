Class {
	#name : #BioEWebEnvCmd,
	#superclass : #BioEntrezCommand,
	#category : 'BioEntrez-Commands'
}

{ #category : #testing }
BioEWebEnvCmd class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('WebEnv' 'query_key')
]

{ #category : #testing }
BioEWebEnvCmd >> validParameters [
	" Private - See superimplementor´s comment "

	^ super validParameters , #( 'webEnv' 'query_key' )
]
