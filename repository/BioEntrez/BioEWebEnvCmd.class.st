"
Represents a command using the WebEnv parameter for NCBI Entrez queries. Supports WebEnv-based query sessions that allow retrieval of search results using stored web environment values.
"
Class {
	#name : 'BioEWebEnvCmd',
	#superclass : 'BioEntrezCommand',
	#category : 'BioEntrez-Commands',
	#package : 'BioEntrez',
	#tag : 'Commands'
}

{ #category : 'testing' }
BioEWebEnvCmd class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('WebEnv' 'query_key')
]

{ #category : 'testing' }
BioEWebEnvCmd >> validParameters [
	" Private - See superimplementor´s comment "

	^ super validParameters , #( 'webEnv' 'query_key' )
]
