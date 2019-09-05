"
BioNotFoundObject should not be used directly. 
Should be raised when a requested resource is not available

and in the following way:

self signalNotFound: 'message' , ex messageText.
"
Class {
	#name : #BioNotFoundObject,
	#superclass : #BioException,
	#category : #'BioTools-Exceptions'
}

{ #category : #accessing }
BioNotFoundObject >> messageText [

	^ String streamContents: [ :stream |
		messageText ifNotNil: [ stream nextPutAll: messageText; space ].
		stream nextPutAll: ' not found' translated ]
]
