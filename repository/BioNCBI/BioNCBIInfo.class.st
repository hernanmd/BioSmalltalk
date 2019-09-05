Class {
	#name : #BioNCBIInfo,
	#superclass : #BioNCBICommand,
	#category : 'BioNCBI-Commands'
}

{ #category : #'accessing private' }
BioNCBIInfo >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self cmdString , '=Info'
]

{ #category : #accessing }
BioNCBIInfo >> targetDatabases [
	" Sets target for the Info command "
	
	self client queryAt: 'TARGET' put: 'databases'
]

{ #category : #accessing }
BioNCBIInfo >> targetQBlast [
	" Sets target for the Info command "
	
	self client queryAt: 'TARGET' put: 'QBlast'
]
