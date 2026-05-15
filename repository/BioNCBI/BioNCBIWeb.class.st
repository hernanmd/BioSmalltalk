"
Represents a WEB command for NCBI BLAST. Handles private access parameters for web-based BLAST queries.
"
Class {
	#name : 'BioNCBIWeb',
	#superclass : 'BioNCBICommand',
	#category : 'BioNCBI-Commands',
	#package : 'BioNCBI',
	#tag : 'Commands'
}

{ #category : 'accessing private' }
BioNCBIWeb >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Web'
]
