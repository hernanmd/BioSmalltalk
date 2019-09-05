"
This is the fetch operation for NCBI WWW QBlast, this is NOT an operation supported by the QBlast system but an operation class used as a Command object to support internal logging of operations and notifications.
"
Class {
	#name : #BioNCBIFetch,
	#superclass : #BioNCBICommand,
	#category : 'BioNCBI-Commands'
}

{ #category : #testing }
BioNCBIFetch >> checkParameters [
	" Answer <true> if the receiver supports client parameters "
	
	^ (self client rawUrl notNil
			and: [ self client rawGetUrl notNil ])
			and: [ self client getUrl rid notEmpty ]
]
