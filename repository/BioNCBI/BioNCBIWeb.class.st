Class {
	#name : #BioNCBIWeb,
	#superclass : #BioNCBICommand,
	#category : 'BioNCBI-Commands'
}

{ #category : #'accessing private' }
BioNCBIWeb >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Web'
]
