Class {
	#name : #BioNCBIDelete,
	#superclass : #BioNCBICommand,
	#category : 'BioNCBI-Commands'
}

{ #category : #'accessing private' }
BioNCBIDelete >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Delete'
]
