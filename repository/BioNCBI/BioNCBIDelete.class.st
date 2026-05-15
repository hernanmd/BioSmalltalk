"
Represents a DELETE command for NCBI BLAST. Handles private access parameters for deleting BLAST queries.
"
Class {
	#name : 'BioNCBIDelete',
	#superclass : 'BioNCBICommand',
	#category : 'BioNCBI-Commands',
	#package : 'BioNCBI',
	#tag : 'Commands'
}

{ #category : 'accessing private' }
BioNCBIDelete >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Delete'
]
