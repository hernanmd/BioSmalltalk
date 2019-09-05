"
BioDuplicateObject should not be used directly. The exception should be raised for handling duplications and in the following way:

self signalDuplicateObject: 'message' , ex messageText.
"
Class {
	#name : #BioDuplicatedObject,
	#superclass : #BioException,
	#category : #'BioTools-Exceptions'
}

{ #category : #accessing }
BioDuplicatedObject >> messageText [

	^ String streamContents: [ :stream |
		messageText ifNotNil: [ stream nextPutAll: messageText; space ].
		stream nextPutAll: ' already exists' translated ]
]
