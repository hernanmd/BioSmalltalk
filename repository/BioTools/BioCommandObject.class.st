"
Provides general methods for external command execution


    Instance Variables
	client:		<Object>


    Implementation Points
"
Class {
	#name : #BioCommandObject,
	#superclass : #BioPropertyObject,
	#instVars : [
		'client'
	],
	#category : #'BioTools-Core'
}

{ #category : #'instance creation' }
BioCommandObject class >> on: aBioObject [
	" Answer a new instance of the receiver setting aBioObject as its client "
	
	^ self basicNew initializeOn: aBioObject
]

{ #category : #accessing }
BioCommandObject >> client [
	^ client
]

{ #category : #accessing }
BioCommandObject >> client: anObject [
	client := anObject
]

{ #category : #'initialize-release' }
BioCommandObject >> initializeOn: aBioClientObject [
	" Private - Set the receiver's client to aBioClientObject "
	
	self client: aBioClientObject.
	self initialize
]
