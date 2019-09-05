"
BioInteractorEngine abstracts different types of dispatchers for UI requests. 

To access an engine use:

BioInteractorEngine adapter.

Depending on your execution environment, you could have different implementations:

-Pharo currently uses ""UIManager"" or one of its subclasses.
-Squeak uses ""OSProcess""
"
Class {
	#name : #BioInteractorEngine,
	#superclass : #BioAbstractAdapter,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioInteractorEngine class >> request: aString [
	" Request and answer the string the user accepts. Answer an empty string if the user cancels."

	^ self adapterClass
		request: aString
		yourself
]
