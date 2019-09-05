"
UIManager is a dispatcher used in Pharo for UI interactivity with users.
"
Class {
	#name : #BioUIManagerEngine,
	#superclass : #BioInteractorEngine,
	#category : 'BioTools-Adapters'
}

{ #category : #accessing }
BioUIManagerEngine class >> providerClass [
	" See superimplementor's comment "

	^ #UIManager
]

{ #category : #accessing }
BioUIManagerEngine class >> request: aString [
	" Request and answer the string the user accepts. Answer an empty string if the user cancels."

	^ (self classFor: self providerClass) 
		request: aString
		yourself

]

{ #category : #accessing }
BioUIManagerEngine >> request: aString [
	" Refer to comment in #request: "

	^ self providerClass default request: aString
]
