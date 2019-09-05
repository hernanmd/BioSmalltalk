"
A remote command includes an URL and provides behavior for handling parameters.

"
Class {
	#name : #BioRemoteCommandObject,
	#superclass : #BioCommandObject,
	#category : #'BioTools-Core'
}

{ #category : #'instance creation' }
BioRemoteCommandObject class >> for: aBioObject [
	" Answer a new instance of the receiver, initializing receiver's status and setting aBioObject as its client "
	
	^ self basicNew 
		client: aBioObject;
		initialize;
		yourself
]

{ #category : #'instance creation' }
BioRemoteCommandObject class >> on: aBioObject [
	" Answer a new instance of the receiver setting aBioObject as its client "
	
	^ self basicNew initializeOn: aBioObject
]

{ #category : #'accessing private' }
BioRemoteCommandObject >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self client baseUrl
]

{ #category : #accessing }
BioRemoteCommandObject >> tokenizeParameters [
	" Answer a <Collection> with each item being a receiver's parameter "

	^ self client downloadUrl substrings: '&'
]
