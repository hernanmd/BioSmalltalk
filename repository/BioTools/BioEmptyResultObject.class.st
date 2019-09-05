"
Serves as a Null Object for empty or missing results.
"
Class {
	#name : #BioEmptyResultObject,
	#superclass : #BioResultObject,
	#category : 'BioTools-Query'
}

{ #category : #accessing }
BioEmptyResultObject >> collect: aBlock [ 

	^ Array empty
]

{ #category : #accessing }
BioEmptyResultObject >> detectMax: aBlock [ 

	^ nil
]

{ #category : #testing }
BioEmptyResultObject >> isEmpty [
	"Answer whether the receiver contains any elements."
		
	^ true
]

{ #category : #testing }
BioEmptyResultObject >> notEmpty [

	^ false
]

{ #category : #accessing }
BioEmptyResultObject >> result [

	^ self
]

{ #category : #accessing }
BioEmptyResultObject >> size [
	"Answer how many elements the receiver contains."
	
	^  0
]
